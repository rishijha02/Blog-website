
from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import json
import math
with open('config.json','r') as c:
	params=json.load(c)["params"]
local_server=True

app=Flask(__name__)

#app.config.update( 
#    MAIL_SERVER = 'smtp.gmail.com',
#   MAIL_PORT = '465',
#    MAIL_USE_SSL = True,  
#    MAIL_USERNAME = params['gmail-user'],
#    MAIL_PASSWORD=  params['gmail-password']
#)
#mail = Mail(app)
app.config['SECRET_KEY'] = '5791628bb0b13ce0c676dfde280ba245'
if(local_server):
	app.config['SQLALCHEMY_DATABASE_URI']=params['local_uri']
else:
	app.config['SQLALCHEMY_DATABASE_URI']=params['prod_uri']

db=SQLAlchemy(app)

class Contacts(db.Model):
	#s.no,name,email,msg,phn_no,date
	sno=db.Column(db.Integer,primary_key=True)
	Name=db.Column(db.String(60),nullable=False)
	phone_nos=db.Column(db.String(12),nullable=False)
	message=db.Column(db.String(120),nullable=False)
	date=db.Column(db.String(12),nullable=True)
	email=db.Column(db.String(20),nullable=False)

class Posts(db.Model):
	sno=db.Column(db.Integer,primary_key=True)
	title=db.Column(db.String(60),nullable=False)
	tagline=db.Column(db.String(60),nullable=False)
	content=db.Column(db.String(20),nullable=False)
	slug=db.Column(db.String(20),nullable=False)
	date=db.Column(db.String(12),nullable=True)
	img_file = db.Column(db.String(12), nullable=True)
	
		

@app.route("/")
@app.route("/index")
def index():
	#pagination logic
	#first
	no=params['no']
	posts=Posts.query.filter_by().all()
	last=math.ceil(len(posts)/no)

	page=request.args.get('page')
	if(not str(page).isnumeric()):
		page=1
	page=int(page)
	posts=posts[(page-1)*no:(page-1)*no+no]
	if page==1:
		prev='#'
		next='/?page='+str(page+1)
	elif (page==last):
		next='#'
		prev='/?page='+str(page-1)
	else:
		prev='/?page='+str(page-1)
		next='/?page='+str(page+1)

	return render_template('index.html',params=params,posts=posts,prev=prev,next=next)


@app.route('/dashboard',methods=['GET','POST'])
def dashboard():
	if ('user'in session and session['user']==params['userid'] ):
		posts=Posts.query.all()
		return render_template('dashboard.html',params=params,posts=posts)
	if request.method=='POST':
		name=request.form.get('userid')
		password=request.form.get('password')
		if name==params['userid'] and password==params['password']:
			flash('success')
			session['user']=name
			posts=Posts.query.all()
			return render_template('dashboard.html',params=params,posts=posts)
	return render_template('login.html',params=params)	



@app.route('/about')
def about():
	about=params['about']
	return render_template('about.html',about=about,params=params)

@app.route('/logout')
def logout():
	session.pop('user')
	return redirect('/dashboard')

@app.route('/delete/<string:sno>',methods=['GET','POST'])
def delete(sno):
	if ( 'user' in session and session['user']==params['userid']):
		post=Posts.query.filter_by(sno=sno).first()
		db.session.delete(post)
		db.session.commit()
	return redirect('/dashboard')


@app.route('/edit/<string:sno>',methods=['GET','POST'])
def edit(sno):
	if ('user'in session and session['user']==params['userid'] ):
		if request.method=='POST':
			title=request.form.get('title')
			tline=request.form.get('tline')
			content=request.form.get('content') 
			slug=request.form.get('slug')
			
			img_file=request.form.get('img')
			if sno=='0':
				post=Posts(title=title,tagline=tline,content=content,slug=slug,date=datetime.now(),img_file=img_file)
				db.session.add(post)
				db.session.commit()
			else:
				post=Posts.query.filter_by(sno=sno).first()
				post.title=title
				post.tagline=tline
				post.content=content
				post.slug=slug
				post.img_file=img_file
				post.date=datetime.now()
				db.session.commit()
				return redirect('/edit/'+sno)
		post=Posts.query.filter_by(sno=sno).first()

		return render_template('edit.html',params=params,post=post)





@app.route('/post/<string:post_slug>',methods=['GET'])
def post_route(post_slug):
	post=Posts.query.filter_by(slug=post_slug).first()
	return render_template('post.html',params=params,post=post)



@app.route('/contact',methods=['GET','POST'])
def contact():
	if(request.method=='POST'):
		#add entry to database
		name=request.form.get('name')
		email=request.form.get('email')
		phone=request.form.get('phone')
		message=request.form.get('message')
		entry=Contacts(Name=name,phone_nos=phone,message=message,date=datetime.now(),email=email)
		db.session.add(entry)
		db.session.commit()
		#mail.send_message(sender=email,recipients=[params['gmail-user']],body=message )
	return render_template('contact.html',params=params)
