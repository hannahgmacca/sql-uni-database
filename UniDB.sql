-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2020 at 01:31 PM
-- Server version: 5.1.73
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hmcdon24A2`
--

-- --------------------------------------------------------

--
-- Table structure for table `ACADEMIC_SCHOOL`
--

CREATE TABLE IF NOT EXISTS `ACADEMIC_SCHOOL` (
  `SchoolTitle` varchar(200) NOT NULL,
  PRIMARY KEY (`SchoolTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ACADEMIC_SCHOOL`
--

INSERT INTO `ACADEMIC_SCHOOL` (`SchoolTitle`) VALUES
('Creative Arts'),
('Engineering'),
('Health and Science'),
('School of Business and Tourism'),
('School of Environmental Science');

-- --------------------------------------------------------

--
-- Table structure for table `ASSESSMENT`
--

CREATE TABLE IF NOT EXISTS `ASSESSMENT` (
  `AssessmentID` int(8) NOT NULL AUTO_INCREMENT,
  `UnitOfferingID` int(6) NOT NULL,
  `AssessmentName` varchar(35) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PossibleMarks` int(3) DEFAULT NULL,
  PRIMARY KEY (`AssessmentID`,`UnitOfferingID`),
  KEY `UnitOfferingID` (`UnitOfferingID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99123917 ;

--
-- Dumping data for table `ASSESSMENT`
--

INSERT INTO `ASSESSMENT` (`AssessmentID`, `UnitOfferingID`, `AssessmentName`, `Description`, `DueDate`, `PossibleMarks`) VALUES
(99123901, 4, 'Quiz 1', NULL, '2019-08-05', 5),
(99123902, 4, 'Report A', 'Evaluative Report', '2019-08-20', 10),
(99123903, 4, 'Report B', NULL, '2019-09-16', 35),
(99123904, 4, 'Final Exam', NULL, '2019-10-16', 50),
(99123905, 5, 'Practical skills', NULL, '2019-04-29', 40),
(99123906, 5, 'Exam', NULL, '2019-05-31', 60),
(99123907, 6, 'Quiz', NULL, '2019-08-14', 10),
(99123908, 6, 'Essay', NULL, '2019-10-18', 40),
(99123909, 6, 'Analysis Report', NULL, '2019-10-01', 60),
(99123910, 7, 'Interview', NULL, '2019-03-19', 20),
(99123911, 7, '', NULL, '2019-06-11', 30),
(99123912, 7, 'Exam', NULL, '2019-07-06', 50),
(99123913, 11, 'Clinical Skills A', 'Lab skills', '2019-08-14', 25),
(99123914, 11, 'Clinical Skills B', NULL, '2019-09-10', 35),
(99123915, 11, 'Exam', NULL, '2019-11-13', 40),
(99123916, 12, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BUILDING`
--

CREATE TABLE IF NOT EXISTS `BUILDING` (
  `BuildingCode` varchar(5) NOT NULL,
  `BuildingName` varchar(20) DEFAULT 'Unnamed',
  `Campus` varchar(50) NOT NULL,
  PRIMARY KEY (`BuildingCode`),
  KEY `Campus` (`Campus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BUILDING`
--

INSERT INTO `BUILDING` (`BuildingCode`, `BuildingName`, `Campus`) VALUES
('CFED', 'Education Block', 'Coffs Harbour'),
('CFO', NULL, 'Coffs Harbour'),
('GCA', 'Building A', 'Gold Coast'),
('GCB', 'Building B', 'Gold Coast'),
('GCC', 'Building C', 'Gold Coast'),
('GCH', 'Health and Science B', 'Gold Coast'),
('LISD', 'Building D', 'Lismore'),
('LISE', 'Education Building', 'Lismore'),
('LISH', 'Health and Science B', 'Lismore'),
('LISO', 'Building O', 'Lismore');

-- --------------------------------------------------------

--
-- Table structure for table `CAMPUS`
--

CREATE TABLE IF NOT EXISTS `CAMPUS` (
  `CampusName` varchar(50) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(4) NOT NULL,
  `Postcode` int(4) NOT NULL,
  PRIMARY KEY (`CampusName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CAMPUS`
--

INSERT INTO `CAMPUS` (`CampusName`, `Address`, `City`, `State`, `Postcode`) VALUES
('Coffs Harbour', 'Hogbin Drive', 'Coffs Harbour', 'NSW', 2450),
('Gold Coast', 'Gold Coast Airport, Terminal Dr', 'Bilinga', 'QLD', 4225),
('Lismore', 'Military Rd', 'East Lismore', 'NSW', 2480);

-- --------------------------------------------------------

--
-- Table structure for table `CLASSROOM`
--

CREATE TABLE IF NOT EXISTS `CLASSROOM` (
  `ClassroomName` varchar(10) NOT NULL,
  `Building` varchar(5) NOT NULL,
  `Campus` varchar(50) NOT NULL,
  `Type` varchar(20) DEFAULT 'Unknown',
  PRIMARY KEY (`ClassroomName`),
  KEY `Building` (`Building`,`Campus`),
  KEY `Campus` (`Campus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CLASSROOM`
--

INSERT INTO `CLASSROOM` (`ClassroomName`, `Building`, `Campus`, `Type`) VALUES
('Hall 1', 'CFO', 'Coffs Harbour', 'Unknown'),
('Hall 3', 'LISE', 'Lismore', 'Lecture Hall'),
('Room A', 'CFED', 'Coffs Harbour', 'General'),
('Room A.1', 'LISO', 'Lismore', 'Auditorium'),
('Room A.123', 'GCA', 'Gold Coast', 'Computer Lab'),
('Room B', 'CFED', 'Coffs Harbour', 'Computer Lab'),
('Room B.203', 'GCB', 'Gold Coast', 'General'),
('Room C.234', 'GCC', 'Gold Coast', 'Computer Lab'),
('Room E.001', 'LISE', 'Lismore', 'General'),
('Room H.30', 'LISH', 'Lismore', 'Science Lab'),
('Room H.54', 'LISH', 'Lismore', 'Science Lab');

-- --------------------------------------------------------

--
-- Table structure for table `COURSE`
--

CREATE TABLE IF NOT EXISTS `COURSE` (
  `CourseCode` int(7) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(100) DEFAULT NULL,
  `CreditPoints` int(3) DEFAULT NULL,
  `Notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CourseCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3002122 ;

--
-- Dumping data for table `COURSE`
--

INSERT INTO `COURSE` (`CourseCode`, `CourseName`, `CreditPoints`, `Notes`) VALUES
(2202321, 'Associate Degree of Information Technology', 192, 'First 2 years of B InfTech'),
(2202322, 'Associate Degree of Information Technology', 192, NULL),
(3002111, 'Bachelor of Information Technology', 288, NULL),
(3002116, 'Bachelor of Applied Computing', 288, 'Entry pathways from TAFE'),
(3002117, 'Bachelor of Technology Education', 384, NULL),
(3002121, 'Bachelor of Education', 288, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `COURSE_ENROLLMENT`
--

CREATE TABLE IF NOT EXISTS `COURSE_ENROLLMENT` (
  `StudentID` int(8) NOT NULL,
  `CourseCode` int(7) NOT NULL,
  `EnrollmentDate` date DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`CourseCode`),
  KEY `CourseCode` (`CourseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COURSE_ENROLLMENT`
--

INSERT INTO `COURSE_ENROLLMENT` (`StudentID`, `CourseCode`, `EnrollmentDate`, `Status`) VALUES
(232411001, 3002111, '2017-04-11', 'Complete'),
(232411002, 2202321, '2019-04-15', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `OFFICE`
--

CREATE TABLE IF NOT EXISTS `OFFICE` (
  `OfficeName` varchar(10) NOT NULL,
  `Building` varchar(5) DEFAULT NULL,
  `Campus` varchar(50) NOT NULL,
  PRIMARY KEY (`OfficeName`),
  KEY `Building` (`Building`),
  KEY `Campus` (`Campus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OFFICE`
--

INSERT INTO `OFFICE` (`OfficeName`, `Building`, `Campus`) VALUES
('A3.02', 'LISE', 'Lismore'),
('A3.03', 'LISD', 'Lismore'),
('A3.06', 'LISD', 'Lismore'),
('M.G.31', 'GCC', 'Gold Coast'),
('M.G.32', 'GCC', 'Gold Coast'),
('M.G.33', 'GCC', 'Gold Coast');

-- --------------------------------------------------------

--
-- Table structure for table `STAFF`
--

CREATE TABLE IF NOT EXISTS `STAFF` (
  `StaffID` int(8) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(35) DEFAULT NULL,
  `LastName` varchar(35) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Campus` varchar(50) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Office` varchar(10) DEFAULT NULL,
  `isATeacher` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `Campus` (`Campus`,`Office`),
  KEY `Office` (`Office`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23259012 ;

--
-- Dumping data for table `STAFF`
--

INSERT INTO `STAFF` (`StaffID`, `FirstName`, `LastName`, `Email`, `Campus`, `Phone`, `Office`, `isATeacher`) VALUES
(1, 'Michelle', 'Kennedy', 'alex.hendry@scu.edu.au', 'Gold Coast', '66203118', NULL, 1),
(23259000, 'Graham', 'Cooper', 'coopertrooper@outlook.com', 'Coffs Harbour', '0477233213', 'A3.03', 1),
(23259001, 'Bruce', 'Armstrong', 'bruce_armm@gmail.com', 'Coffs Harbour', '0498236614', 'M.G.31', 1),
(23259002, 'Michelle', 'Kennedy', 'michelle.kennedy@scu.edu.au', 'Gold Coast', NULL, NULL, 1),
(23259003, 'Alex', 'Hendry', 'alex.hendry@scu.edu.au', 'Gold Coast', NULL, NULL, 1),
(23259004, 'Nicola', 'Jayne', 'nicola.jayne@scu.edu.au', 'Lismore', '66203118', NULL, 1),
(23259005, 'Raina', 'Mason', 'raina.mason@scu.edu.au', 'Gold Coast', '755893194', 'A3.03', 1),
(23259006, 'Carolyn', 'Setan', 'carolyn.seton@scu.edu.au', 'Gold Coast', 'TBA', 'M.G.32', 1),
(23259007, 'Bill', 'Smart', 'bill.smart@scu.edu.au', 'Gold Coast', '07 55893121', 'M.G.33', 1),
(23259008, 'Golam', 'Sorwar', 'golam.sorwar@scu.edu.au', 'Gold Coast', NULL, 'M.G.31', 1),
(23259009, 'Barry', 'Wilks', 'barry.wilks@scu.edu.au', 'Coffs Harbour', '66593002', NULL, 1),
(23259010, 'Gao', 'Xiangzhu', 'xgao@scu.edu.au', 'Lismore', '66203860', 'A3.06', 1),
(23259011, 'Elizabeth', 'Yuwono', 'elizabeth.yuwono@scu.edu.au', 'Gold Coast', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `STUDENT`
--

CREATE TABLE IF NOT EXISTS `STUDENT` (
  `StudentID` int(8) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(35) NOT NULL,
  `LastName` varchar(35) NOT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(4) DEFAULT NULL,
  `Postcode` int(4) DEFAULT NULL,
  `PhoneNumber` varchar(12) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=232411018 ;

--
-- Dumping data for table `STUDENT`
--

INSERT INTO `STUDENT` (`StudentID`, `FirstName`, `LastName`, `Address`, `City`, `State`, `Postcode`, `PhoneNumber`, `Email`) VALUES
(232411001, 'Hannah', 'McDonald', '13 Camelot Rd', 'Goonellabah', 'NSW', 2480, '+(61) 478961', 'Hannahgmacca@gmail.com'),
(232411002, 'David', 'Jones', '12 Bruxner Highway', 'Lismore', 'NSW', 2480, '+(61) 499961', 'DJ98@optusnet.com.au'),
(232411004, 'Ella', 'Scott', '34 Gardenview Dr', 'Robina', 'QLD', 4221, '0478610090', 'ScottEj@gmail.com'),
(232411005, 'Stacey', 'Schwenk', '9/43 Elizabeth Crt', 'Alstonville', 'NSW', 2477, '0464610350', 'SS2_fish@hotmail.com'),
(232411006, 'Nicholas', 'Hodge', '12 Green St', 'Alstonville', 'NSW', 2477, '0487232499', 'Nicccccc23@gmail.com'),
(232411007, 'Lochie', 'Keir', '7 Clare St', 'Alstonville', 'NSW', 2477, '0489232490', 'Bigdawg_lk@hotmail.com'),
(232411008, 'Melodie', 'Santiago', '57 Cowell Dr', 'Burleigh Heads', 'QLD', 4220, '0498761445', 'Mel_san3@gmail.com'),
(232411009, 'Oliver', 'Baker', '9 Kortum Dr', 'Burleigh Heads', 'QLD', 4220, '046582948', 'Ob_jj2@outlook.com'),
(232411010, 'William', 'Shark', '2 Nearview Dr', 'Tugun', 'QLD', 4219, '0491223486', 'Williamshark929@gmail.com'),
(232411011, 'Ryan', 'Atwood', '42 California Crt', 'Coffs Harbour', 'NSW', 2450, '0488782551', 'Atty_Ryan@outlook.com'),
(232411012, 'Heath', 'McDonald', '12 Kerrabee Crt', 'Litwood', 'NSW', 2471, '0478900258', 'Heath_macca_98@gmail.com'),
(232411013, 'Jennifer', 'Eden', '93 Jay St', 'Bayview', 'VIC', 2910, '048294223', 'J_eden@outlook.com'),
(232411014, 'Jasmin', 'Henry', '14 Executive Dr', 'Palm Waters', 'QLD', 4218, NULL, 'J_Henry@outlook.com'),
(232411015, 'Mika', 'Gerrish', '', '', '', 0, '0493874334', 'Mikahoney42@gmail.com'),
(232411016, 'Seth', 'Cohen', '20 Pixen Dr', NULL, 'VIC', NULL, NULL, 'Dr_danger@hotmail.com'),
(232411017, 'Sandy', 'Grey', NULL, 'Robina', 'QLD', 4221, '0423665453', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `STUDENT_ASSESSMENT`
--

CREATE TABLE IF NOT EXISTS `STUDENT_ASSESSMENT` (
  `AssessmentID` int(8) NOT NULL,
  `StudentID` int(8) NOT NULL,
  `SubmissionAttempt` int(1) NOT NULL DEFAULT '1',
  `DateSubmitted` date DEFAULT NULL,
  `DaysExtension` int(3) DEFAULT NULL,
  `MarksAwarded` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`AssessmentID`,`StudentID`,`SubmissionAttempt`),
  KEY `StudentID` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STUDENT_ASSESSMENT`
--

INSERT INTO `STUDENT_ASSESSMENT` (`AssessmentID`, `StudentID`, `SubmissionAttempt`, `DateSubmitted`, `DaysExtension`, `MarksAwarded`) VALUES
(99123901, 232411001, 1, '2019-08-04', NULL, '4.50'),
(99123901, 232411002, 2, '2019-08-05', NULL, '3.50'),
(99123902, 232411001, 1, '2019-08-20', NULL, '10.00'),
(99123902, 232411002, 1, '2019-08-18', NULL, NULL),
(99123902, 232411004, 1, '2019-08-20', 1, '7.00'),
(99123902, 232411005, 1, '2019-08-05', NULL, '5.00'),
(99123902, 232411006, 1, '2019-08-15', NULL, '5.50'),
(99123902, 232411006, 3, '2019-08-05', NULL, '4.50'),
(99123902, 232411007, 1, '2019-08-20', NULL, '10.00'),
(99123903, 232411001, 2, '2019-09-18', 2, '30.00'),
(99123903, 232411004, 3, '2019-08-05', NULL, '4.00'),
(99123903, 232411006, 1, '2019-09-16', NULL, '31.50'),
(99123903, 232411007, 1, '2019-09-15', NULL, '33.00'),
(99123903, 232411008, 2, '2019-09-18', 2, '29.00'),
(99123903, 232411009, 1, '2019-09-16', NULL, '32.50'),
(99123903, 232411009, 3, '2019-09-19', 3, '15.00'),
(99123903, 232411010, 1, '2019-09-15', NULL, '34.50'),
(99123904, 232411001, 1, '2019-10-16', NULL, '42.50'),
(99123906, 232411012, 1, '2019-05-31', NULL, '43.50'),
(99123906, 232411013, 1, '2019-05-31', NULL, '39.00'),
(99123906, 232411014, 1, '2019-05-31', NULL, '54.50'),
(99123906, 232411015, 1, '2019-05-31', NULL, '28.00'),
(99123906, 232411016, 1, '2019-05-31', NULL, '32.50'),
(99123906, 232411017, 1, '2019-05-31', NULL, '45.00'),
(99123907, 232411007, 2, '2019-08-10', NULL, '8.00'),
(99123907, 232411008, 2, '2019-08-12', NULL, '7.50'),
(99123907, 232411009, 3, '2019-08-14', NULL, '10.00'),
(99123907, 232411010, 1, '2019-08-13', NULL, '7.50'),
(99123907, 232411011, 1, '2019-08-14', NULL, '6.00'),
(99123907, 232411012, 2, '2019-08-13', NULL, '7.50'),
(99123913, 232411004, 1, NULL, NULL, '21.00'),
(99123913, 232411005, 1, '2019-08-14', NULL, NULL),
(99123913, 232411007, 1, NULL, NULL, '24.50'),
(99123913, 232411008, 1, NULL, NULL, '20.00'),
(99123913, 232411011, 1, '2019-08-14', NULL, NULL),
(99123913, 232411012, 1, '2019-08-14', NULL, '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `TUTOR`
--

CREATE TABLE IF NOT EXISTS `TUTOR` (
  `StaffID` int(8) NOT NULL,
  `TutorID` int(6) NOT NULL,
  `AcademicSchool` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE KEY `TutorID` (`TutorID`),
  KEY `AcademicSchool` (`AcademicSchool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TUTOR`
--

INSERT INTO `TUTOR` (`StaffID`, `TutorID`, `AcademicSchool`) VALUES
(23259000, 1, 'Engineering'),
(23259001, 2, 'Health and Science'),
(23259003, 3, 'School of Business and Tourism'),
(23259004, 4, 'Health and Science'),
(23259005, 5, 'Engineering'),
(23259006, 6, 'Engineering'),
(23259007, 7, 'School of Environmental Science'),
(23259008, 8, NULL),
(23259009, 9, 'Engineering'),
(23259011, 11, 'Creative Arts');

-- --------------------------------------------------------

--
-- Table structure for table `UNIT`
--

CREATE TABLE IF NOT EXISTS `UNIT` (
  `UnitCode` char(9) NOT NULL,
  `UnitName` varchar(150) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Prerequisites` varchar(200) DEFAULT 'None',
  `AcademicSchool` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`UnitCode`),
  KEY `AcademicSchool` (`AcademicSchool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UNIT`
--

INSERT INTO `UNIT` (`UnitCode`, `UnitName`, `Description`, `Prerequisites`, `AcademicSchool`) VALUES
('AAD71102', 'Painting Essentials', NULL, 'None', 'Creative Arts'),
('AAD71103', 'Photography and Digital Imaging', 'Advanced photographing skills and techniques.', 'AAD71105', 'Creative Arts'),
('AAD78801', 'Advanced Studio Practice', NULL, 'None', 'Creative Arts'),
('ARG00214', 'Soil Processes', NULL, 'BIO00201', 'School of Environmental Science'),
('BIO00201', 'Biology', NULL, 'None', 'School of Environmental Science'),
('BIO10187', 'Global Environmental Issues', 'Issues regarding climate change and more.', 'None', 'School of Environmental Science'),
('COM002007', 'Communication in Organisations', NULL, 'None', 'School of Business and Tourism'),
('CSC00240', 'Data Communications and Networks', 'How data is communicated in everyday technology.', 'None', 'School of Business and Tourism'),
('CSC071001', 'Programming 1', 'Javascript fundamental', 'None', 'School of Business and Tourism'),
('CSC10210', 'Object Oriented Program Development', NULL, 'ISY00245', 'School of Business and Tourism'),
('CSC10214', 'Designing the User Experience', NULL, 'ISY10209', 'School of Business and Tourism'),
('CSC72001', 'Database Systems', NULL, 'ISY00243', 'School of Business and Tourism'),
('ISY10221', 'Computing Project I: Analysis and Design', NULL, 'ISY00243 AND CSC00228 AND EITHER CSC00235 OR ISY00245 ', 'School of Business and Tourism'),
('NRS10731', 'Discipline of Nursing', NULL, 'None', 'Health and Science'),
('NRS71001', 'Lifespan', NULL, 'BIO71003', 'Health and Science'),
('NRS72005', 'Clinical Assessment', NULL, 'NRS71001', 'Health and Science');

-- --------------------------------------------------------

--
-- Table structure for table `UNIT_ASSESSOR`
--

CREATE TABLE IF NOT EXISTS `UNIT_ASSESSOR` (
  `StaffID` int(8) NOT NULL,
  `UnitAssessorID` int(5) NOT NULL,
  `AcademicSchool` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE KEY `UnitAssessorID` (`UnitAssessorID`),
  KEY `AcademicSchool` (`AcademicSchool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UNIT_ASSESSOR`
--

INSERT INTO `UNIT_ASSESSOR` (`StaffID`, `UnitAssessorID`, `AcademicSchool`) VALUES
(23259000, 1, 'School of Business and Tourism'),
(23259001, 2, 'School of Business and Tourism'),
(23259002, 3, 'Health and Science'),
(23259003, 4, 'Engineering'),
(23259004, 5, 'School of Business and Tourism'),
(23259005, 6, 'Creative Arts'),
(23259006, 11, 'Creative Arts'),
(23259007, 32, 'School of Business and Tourism'),
(23259008, 10, 'Engineering'),
(23259010, 56, 'Health and Science');

-- --------------------------------------------------------

--
-- Table structure for table `UNIT_ENROLLMENT`
--

CREATE TABLE IF NOT EXISTS `UNIT_ENROLLMENT` (
  `UnitEnrollmentID` int(6) NOT NULL,
  `UnitOfferingID` int(6) NOT NULL,
  `StudentID` int(8) NOT NULL,
  `EnrollmentType` varchar(15) DEFAULT 'Unknown',
  `FinalGrade` varchar(20) DEFAULT 'TBA',
  PRIMARY KEY (`UnitEnrollmentID`,`UnitOfferingID`,`StudentID`),
  KEY `StudentID` (`StudentID`),
  KEY `UnitOfferingID` (`UnitOfferingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UNIT_ENROLLMENT`
--

INSERT INTO `UNIT_ENROLLMENT` (`UnitEnrollmentID`, `UnitOfferingID`, `StudentID`, `EnrollmentType`, `FinalGrade`) VALUES
(1, 4, 232411001, 'On-campus', 'High Distinction'),
(2, 1, 232411001, 'On-campus', 'Distinction'),
(3, 3, 232411001, 'External', 'High Distinction'),
(4, 4, 232411001, 'On-campus', 'Credit'),
(5, 3, 232411002, '', 'Credit'),
(6, 5, 232411002, 'External', 'TBA'),
(12, 12, 232411016, 'External', 'Fail'),
(13, 17, 232411016, 'External', 'Fail'),
(23, 9, 232411016, 'Unknown', 'Pass'),
(24, 9, 232411011, 'Unknown', 'Incomplete'),
(45, 12, 232411014, 'External', 'TBA'),
(46, 17, 232411014, 'External', 'TBA'),
(581, 4, 232411015, 'On-campus', 'TBA'),
(583, 5, 232411015, 'On-campus', 'Pass');

-- --------------------------------------------------------

--
-- Table structure for table `UNIT_OFFERING`
--

CREATE TABLE IF NOT EXISTS `UNIT_OFFERING` (
  `UnitOfferingID` int(6) NOT NULL AUTO_INCREMENT,
  `UnitCode` char(9) NOT NULL,
  `Year` year(4) DEFAULT NULL,
  `Session` int(1) DEFAULT NULL,
  `UnitAssessorID` int(5) NOT NULL,
  `Campus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UnitOfferingID`,`UnitCode`),
  KEY `UnitAssessorID` (`UnitAssessorID`),
  KEY `UnitCode` (`UnitCode`),
  KEY `Campus` (`Campus`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `UNIT_OFFERING`
--

INSERT INTO `UNIT_OFFERING` (`UnitOfferingID`, `UnitCode`, `Year`, `Session`, `UnitAssessorID`, `Campus`) VALUES
(1, 'AAD71103', 2018, 3, 10, 'Gold Coast'),
(2, 'BIO10187', 2020, 1, 1, 'Lismore'),
(3, 'AAD71103', 2020, 1, 1, 'Coffs Harbour'),
(4, 'AAD78801', 2019, 2, 1, 'Coffs Harbour'),
(5, 'CSC00240', 2019, 1, 3, 'Gold Coast'),
(6, 'CSC00240', 2019, 2, 3, 'Gold Coast'),
(7, 'CSC72001', 2019, 1, 3, 'Gold Coast'),
(8, 'CSC10214', 2019, 1, 4, 'Lismore'),
(8, 'CSC72001', 2019, 3, 3, 'Gold Coast'),
(9, 'COM002007', 2017, 2, 6, 'Lismore'),
(11, 'NRS10731', 2019, 2, 32, 'Lismore'),
(12, 'NRS10731', 2019, 2, 32, 'Lismore'),
(17, 'NRS72005', 2020, 1, 56, 'Lismore'),
(18, 'NRS10731', 2020, 1, 56, 'Lismore'),
(19, 'AAD78801', 2019, 3, 6, 'Coffs Harbour'),
(20, 'ARG00214', 2019, 3, 2, 'Gold Coast'),
(20, 'ISY10221', 2019, 3, 2, NULL),
(21, 'ARG00214', 2019, 3, 10, 'Lismore'),
(22, 'ARG00214', 2019, 1, 10, 'Lismore'),
(25, 'NRS10731', 2019, 3, 32, 'Lismore'),
(26, 'NRS71001', 2019, 3, 32, 'Lismore'),
(29, 'CSC72001', NULL, NULL, 2, 'Coffs Harbour'),
(46, 'NRS72005', 2019, 3, 11, 'Gold Coast'),
(47, 'NRS10731', 2019, 3, 11, 'Gold Coast'),
(71, 'CSC00240', 2019, NULL, 6, NULL),
(72, 'CSC10210', 2019, NULL, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `WORKSHOP`
--

CREATE TABLE IF NOT EXISTS `WORKSHOP` (
  `WorkshopID` int(6) NOT NULL AUTO_INCREMENT,
  `UnitOfferingID` int(6) NOT NULL,
  `Classroom` varchar(10) DEFAULT NULL,
  `TutorID` int(6) NOT NULL,
  `Weekday` varchar(10) DEFAULT NULL,
  `ClassTimes` char(11) DEFAULT NULL,
  PRIMARY KEY (`WorkshopID`,`UnitOfferingID`),
  KEY `Campus` (`Classroom`,`TutorID`),
  KEY `TutorID` (`TutorID`),
  KEY `UnitOfferingID` (`UnitOfferingID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=526670 ;

--
-- Dumping data for table `WORKSHOP`
--

INSERT INTO `WORKSHOP` (`WorkshopID`, `UnitOfferingID`, `Classroom`, `TutorID`, `Weekday`, `ClassTimes`) VALUES
(526601, 1, 'Room A.123', 1, 'Tuesday', '11:00-13:00'),
(526602, 1, 'Room A.123', 1, 'Tuesday', '14:00-16:00'),
(526603, 1, 'Room A.123', 2, 'Wednesday', '09:00-10:00'),
(526603, 2, 'Room B.203', 2, 'Monday', '13:00-15:00'),
(526604, 3, 'Hall 1', 8, 'Monday', '08:00-12:00'),
(526605, 3, 'Hall 1', 8, 'Monday', '13:00-16:00'),
(526607, 6, 'Room B', 6, 'Thursday', '09:00-11:00'),
(526608, 6, 'Room B', 6, 'Wednesday', NULL),
(526610, 25, 'Room E.001', 4, 'Monday', NULL),
(526611, 46, 'Room H.30', 6, 'Monday', '08:00-10:00'),
(526612, 20, 'Room H.30', 8, 'Friday', '14:00-16:00'),
(526613, 8, 'Room H.54', 4, 'Wednesday', '12:00-14:00'),
(526614, 8, NULL, 4, 'Wednesday', '14:00-16:00'),
(526615, 20, 'Room H.30', 8, 'Friday', '16:00-18:00'),
(526666, 72, 'Hall 1', 1, 'Monday', '12:00-13:00'),
(526667, 71, 'Room B', 1, 'Tuesday', '08:00-10:00'),
(526668, 46, NULL, 1, 'Thursday', NULL),
(526669, 26, 'Room B', 8, 'Thursday', '9:00-13:00');

-- --------------------------------------------------------

--
-- Table structure for table `WORKSHOP_ENROLLMENT`
--

CREATE TABLE IF NOT EXISTS `WORKSHOP_ENROLLMENT` (
  `StudentID` int(8) NOT NULL,
  `WorkshopID` int(6) NOT NULL,
  PRIMARY KEY (`StudentID`,`WorkshopID`),
  KEY `WorkshopID` (`WorkshopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `WORKSHOP_ENROLLMENT`
--

INSERT INTO `WORKSHOP_ENROLLMENT` (`StudentID`, `WorkshopID`) VALUES
(232411006, 526601),
(232411006, 526602),
(232411001, 526603),
(232411001, 526605),
(232411004, 526607),
(232411005, 526607),
(232411008, 526607),
(232411016, 526607),
(232411017, 526607),
(232411005, 526608),
(232411007, 526608),
(232411016, 526608),
(232411002, 526610),
(232411004, 526610),
(232411009, 526610),
(232411013, 526610),
(232411014, 526610),
(232411002, 526611),
(232411008, 526611),
(232411001, 526612),
(232411005, 526612),
(232411013, 526612),
(232411002, 526613),
(232411004, 526613),
(232411006, 526613),
(232411009, 526613),
(232411013, 526613),
(232411002, 526614),
(232411006, 526614),
(232411008, 526614),
(232411001, 526615),
(232411005, 526615),
(232411013, 526615),
(232411001, 526666),
(232411002, 526666),
(232411012, 526666),
(232411016, 526666),
(232411005, 526667),
(232411006, 526667),
(232411008, 526667),
(232411009, 526667),
(232411013, 526667),
(232411014, 526667),
(232411001, 526668),
(232411004, 526668),
(232411005, 526668),
(232411007, 526668),
(232411009, 526668),
(232411001, 526669),
(232411002, 526669),
(232411005, 526669),
(232411009, 526669),
(232411010, 526669),
(232411013, 526669),
(232411014, 526669),
(232411015, 526669),
(232411016, 526669),
(232411017, 526669);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ASSESSMENT`
--
ALTER TABLE `ASSESSMENT`
  ADD CONSTRAINT `ASSESSMENT_ibfk_1` FOREIGN KEY (`UnitOfferingID`) REFERENCES `UNIT_OFFERING` (`UnitOfferingID`) ON UPDATE CASCADE;

--
-- Constraints for table `BUILDING`
--
ALTER TABLE `BUILDING`
  ADD CONSTRAINT `BUILDING_ibfk_1` FOREIGN KEY (`Campus`) REFERENCES `CAMPUS` (`CampusName`) ON UPDATE CASCADE;

--
-- Constraints for table `CLASSROOM`
--
ALTER TABLE `CLASSROOM`
  ADD CONSTRAINT `CLASSROOM_ibfk_1` FOREIGN KEY (`Building`) REFERENCES `BUILDING` (`BuildingCode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CLASSROOM_ibfk_2` FOREIGN KEY (`Campus`) REFERENCES `CAMPUS` (`CampusName`) ON UPDATE CASCADE;

--
-- Constraints for table `COURSE_ENROLLMENT`
--
ALTER TABLE `COURSE_ENROLLMENT`
  ADD CONSTRAINT `COURSE_ENROLLMENT_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `STUDENT` (`StudentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `COURSE_ENROLLMENT_ibfk_2` FOREIGN KEY (`CourseCode`) REFERENCES `COURSE` (`CourseCode`);

--
-- Constraints for table `OFFICE`
--
ALTER TABLE `OFFICE`
  ADD CONSTRAINT `OFFICE_ibfk_1` FOREIGN KEY (`Building`) REFERENCES `BUILDING` (`BuildingCode`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `OFFICE_ibfk_2` FOREIGN KEY (`Campus`) REFERENCES `CAMPUS` (`CampusName`) ON UPDATE CASCADE;

--
-- Constraints for table `STAFF`
--
ALTER TABLE `STAFF`
  ADD CONSTRAINT `STAFF_ibfk_1` FOREIGN KEY (`Campus`) REFERENCES `CAMPUS` (`CampusName`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `STAFF_ibfk_2` FOREIGN KEY (`Office`) REFERENCES `OFFICE` (`OfficeName`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `STUDENT_ASSESSMENT`
--
ALTER TABLE `STUDENT_ASSESSMENT`
  ADD CONSTRAINT `STUDENT_ASSESSMENT_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `STUDENT` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `STUDENT_ASSESSMENT_ibfk_2` FOREIGN KEY (`AssessmentID`) REFERENCES `ASSESSMENT` (`AssessmentID`) ON UPDATE CASCADE;

--
-- Constraints for table `TUTOR`
--
ALTER TABLE `TUTOR`
  ADD CONSTRAINT `TUTOR_ibfk_1` FOREIGN KEY (`AcademicSchool`) REFERENCES `ACADEMIC_SCHOOL` (`SchoolTitle`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `TUTOR_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `STAFF` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UNIT`
--
ALTER TABLE `UNIT`
  ADD CONSTRAINT `UNIT_ibfk_1` FOREIGN KEY (`AcademicSchool`) REFERENCES `ACADEMIC_SCHOOL` (`SchoolTitle`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `UNIT_ASSESSOR`
--
ALTER TABLE `UNIT_ASSESSOR`
  ADD CONSTRAINT `UNIT_ASSESSOR_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `STAFF` (`StaffID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `UNIT_ASSESSOR_ibfk_2` FOREIGN KEY (`AcademicSchool`) REFERENCES `ACADEMIC_SCHOOL` (`SchoolTitle`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `UNIT_ENROLLMENT`
--
ALTER TABLE `UNIT_ENROLLMENT`
  ADD CONSTRAINT `UNIT_ENROLLMENT_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `STUDENT` (`StudentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `UNIT_ENROLLMENT_ibfk_3` FOREIGN KEY (`UnitOfferingID`) REFERENCES `UNIT_OFFERING` (`UnitOfferingID`) ON UPDATE CASCADE;

--
-- Constraints for table `UNIT_OFFERING`
--
ALTER TABLE `UNIT_OFFERING`
  ADD CONSTRAINT `UNIT_OFFERING_ibfk_1` FOREIGN KEY (`UnitCode`) REFERENCES `UNIT` (`UnitCode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `UNIT_OFFERING_ibfk_3` FOREIGN KEY (`UnitAssessorID`) REFERENCES `UNIT_ASSESSOR` (`UnitAssessorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `UNIT_OFFERING_ibfk_4` FOREIGN KEY (`Campus`) REFERENCES `CAMPUS` (`CampusName`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `WORKSHOP`
--
ALTER TABLE `WORKSHOP`
  ADD CONSTRAINT `WORKSHOP_ibfk_2` FOREIGN KEY (`UnitOfferingID`) REFERENCES `UNIT_OFFERING` (`UnitOfferingID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `WORKSHOP_ibfk_3` FOREIGN KEY (`TutorID`) REFERENCES `TUTOR` (`TutorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `WRKSHP_CLSS_FK` FOREIGN KEY (`Classroom`) REFERENCES `CLASSROOM` (`ClassroomName`) ON UPDATE CASCADE;

--
-- Constraints for table `WORKSHOP_ENROLLMENT`
--
ALTER TABLE `WORKSHOP_ENROLLMENT`
  ADD CONSTRAINT `WORKSHOP_ENROLLMENT_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `STUDENT` (`StudentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `WORKSHOP_ENROLLMENT_ibfk_2` FOREIGN KEY (`WorkshopID`) REFERENCES `WORKSHOP` (`WorkshopID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
