-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2020 at 01:12 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `Name` text NOT NULL,
  `phone_nos` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `Name`, `phone_nos`, `message`, `date`, `email`) VALUES
(1, 'rishi', '9212290136', 'hii', '2020-07-02 09:39:03', 'rishijha@gmail.com'),
(5, 'Divya kuntal', '7011467943', 'hii', '2020-07-02 14:02:08', 'divs@gmail.com'),
(6, 'risi', '12234', 'hello', '2020-07-02 14:02:31', 'kdjkaj@gmail.com'),
(7, 'rishi', '1123', 'sdkajs', '2020-07-02 16:28:26', 'hi@gmail.com'),
(8, 'rishi', '1123', 'sdkajs', '2020-07-02 16:35:46', 'hi@gmail.com'),
(9, 'rishi', '1123', 'sdkajs', '2020-07-02 16:40:08', 'hi@gmail.com'),
(10, 'rishi', '1123', 'sdkajs', '2020-07-02 16:41:26', 'hi@gmail.com'),
(11, 'nishi', '32341', 'hii', '2020-07-02 16:59:44', 'riaakj@gmail.com'),
(12, 'nishi', '32341', 'hii', '2020-07-02 17:01:55', 'riaakj@gmail.com'),
(13, 'nishi', '32341', 'hii', '2020-07-02 17:02:54', 'riaakj@gmail.com'),
(14, 'nishi', '32341', 'hii', '2020-07-02 17:03:14', 'riaakj@gmail.com'),
(15, 'nishi', '32341', 'hii', '2020-07-02 17:04:20', 'riaakj@gmail.com'),
(16, 'rishi', '65324', 'kjjhh', '2020-07-03 08:34:46', 'this@gmail.com'),
(17, 'hllo', '123456789', 'sdfghjkertyui', '2020-07-13 09:30:45', 'rishi@gmail.com'),
(18, 'rishi jha', '123456789', 'njknccecnej', '2020-07-14 08:55:03', 'rishi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `content`, `slug`, `img_file`, `date`) VALUES
(1, 'Covid-19', 'corona virus', 'The COVID-19 pandemic in India is part of the worldwide pandemic of coronavirus disease 2019 (COVID-19) caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2). The first case of COVID-19 in India, which originated from China, was reported on 30 January 2020. As of 7 July 2020, the Ministry of Health and Family Welfare (MoHFW) has confirmed a total of 719,665 cases, 439,947 recoveries (including 1 migration) and 20,160 deaths in the country.[5] India currently has the largest number of confirmed cases in Asia,[8] and has the third highest number of confirmed cases in the world after United States and Brazil[9] with the number of total confirmed cases breaching the 100,000 mark on 19 May and 200,000 on 3 June. India\'s case fatality rate is relatively lower at 2.80%, against the global 4.7%, as of 6 July.Six cities account for around half of all reported cases in the country – Mumbai, Delhi, Ahmedabad, Chennai, Pune and Kolkata. As of 24 May 2020, Lakshadweep is the only region which has not reported a case. On 10 June, India\'s recoveries exceeded active cases for the first time reducing 49% of total infections followed by recovery rate crossing 60% till early July. Although, active have continued to increase persistently.', 'first', 'sars-cov-19.jpg', '2020-07-07 17:06:37'),
(2, 'China vs india', 'war on economic front', 'This is not the first China-India border conflict. In 2017, both sides confronted each other in Doklam Plateau — a tri-border area between India, China and Bhutan — for two months, almost triggering an armed conflict. Such tensions between the two countries have existed for over seven decades. They triggered the Sino-Indian War in 1962. Today, China claims and refers to the Indian state of Arunachal Pradesh as Southern Tibet. On the other hand, India sees the China-controlled Aksai Chin as its territory. Since 1962, both sides have signed a series of agreements and agreed to respect the Line of Actual Control that separates the countries.', 'second', 'china,jpg', '2020-07-08 13:47:26'),
(3, 'New pandemic from china : Bubonic plague', 'pandemic', 'Bubonic Plague Latest News: At a time when countries across the world are battling to find a solution to combat COVID-19 or coronavirus pandemic, which has killed over 5 lakh people globally so far, China has sounded an alert for another disease can kill an adult in less than 24 hours. That bacterial disease is known as bubonic plague. It is a bacterial disease that is spread by fleas living on wild rodents such as marmots. Also Read - German Court Lifts COVID-19 Lockdown Near Meat Plant\r\n\r\nThe news of bubonic plague came after Chinese researchers issued an early warning over another potential pandemic caused by an influenza virus in pigs. The suspected bubonic plague case was reported on Saturday by a hospital in Bayannur. The local health authority announced that the warning period will continue until the end of 2020.', 'third', 'bubon.jpg', '2020-07-08 13:51:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
