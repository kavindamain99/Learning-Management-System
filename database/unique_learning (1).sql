-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2021 at 08:38 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unique_learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `studentId_fk` varchar(40) NOT NULL,
  `answer` varchar(40) NOT NULL,
  `submitDate` datetime NOT NULL,
  `examId_fk` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseId` varchar(40) NOT NULL,
  `courseName` varchar(100) NOT NULL,
  `courseCategory` varchar(100) NOT NULL,
  `couseDescription` varchar(2000) NOT NULL,
  `courseDuration` varchar(20) NOT NULL,
  `coverImage` varchar(1000) NOT NULL,
  `teacherId_fk` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `courseName`, `courseCategory`, `couseDescription`, `courseDuration`, `coverImage`, `teacherId_fk`) VALUES
('CD29677', 'Energy and Momentum.', 'Advanced Level', ' Momentum and energy. E = m c2 . It expresses the fact that an object at rest has a large amount of energy as a result of its mass m . This energy is significant in situations where the mass changes, for example in nuclear physics interactions where nuclei are created or destroyed.', '3 Months', 'images.png', '101'),
('CD65368', 'Moving Charges and Magnetism', 'Ordinary Level', ' In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', '3 Months', 'Magnetic-field-of-straight-wire.png', '100'),
('CD66284', 'Linear and Projectile Motion.', 'Certificate', ' Linear motion involves an object moving in a straight line in one dimension, like a car driving on a perfectly straight road, while projectile motion involves two dimensions, like a cannonball firing. Circular motion occurs in a circle, such as when a ball whirls on a string', '6 Months', 'images.jpg', '100'),
('CD72853', 'Electric Charges and Fields', 'Advanced Level', ' sample', '1 Month', 'f3c2369c36d61b592a9f3c29375f6c1d.jpg', '100'),
('CD87027', 'Electromagnetic Induction', 'Certificate', ' Electromagnetic Induction or Induction is a process in which a conductor is put in a particular position and magnetic field keeps varying or magnetic field is stationary and a conductor is moving. This produces a Voltage or EMF (Electromotive Force) across the electrical conductor.', 'Unlimited', 'electro.jpg', '100');

-- --------------------------------------------------------

--
-- Table structure for table `coursevideo`
--

CREATE TABLE `coursevideo` (
  `videoCount` int(11) NOT NULL,
  `courseId_fk` varchar(40) NOT NULL,
  `videoNumber` int(11) NOT NULL,
  `videoTitle` varchar(1000) NOT NULL,
  `courseVideo` varchar(1000) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coursevideo`
--

INSERT INTO `coursevideo` (`videoCount`, `courseId_fk`, `videoNumber`, `videoTitle`, `courseVideo`, `status`) VALUES
(8, 'CD66284', 1, 'linear', 'big_buck_bunny_720p_1mb.mp4', 'COMPLETED'),
(9, 'CD66284', 2, 'projecttitl', 'SampleVideo_1280x720_2mb.mp4', 'ACTIVE'),
(10, 'CD29677', 1, 'energy', 'SampleVideo_1280x720_2mb.mp4', 'COMPLETED');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `enrollId` varchar(40) NOT NULL,
  `endDate` date NOT NULL,
  `startDate` date NOT NULL,
  `studentId_fk` varchar(40) NOT NULL,
  `courseId_fk` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`enrollId`, `endDate`, `startDate`, `studentId_fk`, `courseId_fk`) VALUES
('EN54794', '2021-07-19', '2021-06-19', '101', 'CD72853'),
('EN86623', '2021-12-16', '2021-06-19', '101', 'CD66284'),
('EN61741', '2021-09-17', '2021-06-19', '101', 'CD65368'),
('EN72966', '0000-00-00', '2021-06-19', '101', 'CD87027'),
('EN38075', '2021-09-17', '2021-06-19', '101', 'CD29677');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `examId` varchar(40) NOT NULL,
  `examPaper` varchar(1000) NOT NULL,
  `examDescription` varchar(2000) NOT NULL,
  `Duration` varchar(40) NOT NULL,
  `teacherId_fk` varchar(40) NOT NULL,
  `courseId_fk` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `studentId` varchar(40) NOT NULL,
  `result` varchar(40) NOT NULL,
  `courseId` varchar(40) NOT NULL,
  `teacherId` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentId` varchar(40) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `contactNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `firstName`, `lastName`, `email`, `password`, `contactNumber`) VALUES
('101', 'mazz', 'butt', 'mazz@abc.com', '1234', '0717339068');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherId` varchar(40) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contactNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherId`, `firstName`, `lastName`, `email`, `qualification`, `password`, `contactNumber`) VALUES
('100', 'John', 'wick', 'john@abc.com', 'baechelor', '123', '0717339068');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`examId_fk`,`studentId_fk`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseId`);

--
-- Indexes for table `coursevideo`
--
ALTER TABLE `coursevideo`
  ADD PRIMARY KEY (`videoCount`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`examId`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`studentId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentId`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coursevideo`
--
ALTER TABLE `coursevideo`
  MODIFY `videoCount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
