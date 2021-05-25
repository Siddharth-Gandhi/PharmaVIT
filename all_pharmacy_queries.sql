-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2021 at 09:46 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_1`
--

CREATE TABLE `bill_1` (
  `bill_no` int(11) NOT NULL,
  `payment_mode` varchar(25) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `pat_id` int(11) NOT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `bill_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_1`
--

INSERT INTO `bill_1` (`bill_no`, `payment_mode`, `discount`, `pat_id`, `total_cost`, `bill_date`) VALUES
(15, 'Cash', 0, 37, 1260, '2021-02-22'),
(16, 'Cash', 10, 37, 2858, '2021-02-22'),
(18, 'Cash', 0, 32, 420, '2021-02-22'),
(19, 'Cash', 0, 1, 1608, '2021-02-23'),
(21, 'Cash', 0, 32, 1344, '2021-02-23'),
(22, 'Cash', 12, 61, 2856, '2021-02-23'),
(23, 'Debit Card', 2, 32, 418, '2021-05-21'),
(24, 'Debit Card', 0, 37, 360, '2021-05-22'),
(25, 'Credit Card', 50, 1, 2362, '2021-05-22'),
(26, 'Cash', 0, 67, 46, '2021-05-22'),
(27, 'Online', 10, 68, 90, '2021-05-22'),
(28, 'Credit Card', 5, 68, 85, '2021-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `bill_2`
--

CREATE TABLE `bill_2` (
  `bill_no` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `med_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_2`
--

INSERT INTO `bill_2` (`bill_no`, `quantity`, `med_id`) VALUES
(15, 3, 8),
(16, 3, 8),
(16, 1, 9),
(18, 1, 8),
(19, 2, 9),
(21, 1, 8),
(21, 1, 9),
(21, 1, 14),
(22, 3, 8),
(22, 2, 9),
(23, 1, 8),
(24, 3, 14),
(25, 3, 9),
(26, 2, 30),
(27, 5, 32),
(28, 3, 33);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_1`
--

CREATE TABLE `doctor_1` (
  `doc_id` int(11) NOT NULL,
  `doc_name` varchar(45) NOT NULL,
  `contact` varchar(13) DEFAULT NULL,
  `specialization` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_1`
--

INSERT INTO `doctor_1` (`doc_id`, `doc_name`, `contact`, `specialization`) VALUES
(1, 'Abhishek Ramgirkar', '1234567890', 'Cardiology'),
(2, 'Ranjit Gandhi', '4567890123', 'Radiology'),
(3, 'Siddharth Modi', '1237890456', 'Opthalmology'),
(4, 'Kamla Harris', '1278903456', 'Oncology'),
(5, 'Rahul Gandhi', '5678901234', 'Neurology'),
(6, 'Doc-1', '2345678', 'Urology'),
(7, 'Doctor K', '90804201', 'ENT'),
(8, 'Doc X', '99821800218', 'Physiology'),
(9, 'Doctor A', '912308098', 'Nephrology'),
(10, 'Doctor B', '902810', 'Spec');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_2`
--

CREATE TABLE `doctor_2` (
  `doc_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_2`
--

INSERT INTO `doctor_2` (`doc_id`, `med_id`) VALUES
(1, 2),
(1, 3),
(1, 5),
(2, 5),
(2, 11),
(3, 2),
(4, 2),
(4, 4),
(5, 2),
(5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `drug_manufacturer`
--

CREATE TABLE `drug_manufacturer` (
  `company_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `contact` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drug_manufacturer`
--

INSERT INTO `drug_manufacturer` (`company_id`, `name`, `contact`) VALUES
(1, 'Ranbaxy', '6029111180'),
(2, 'Sun Pharmaceutical', '7873274667'),
(3, 'Cipla Limited', '9375326206'),
(4, 'Abbott', '3436587348'),
(5, 'Dr. Reddy’s Laboratories', '8116889621'),
(6, 'Cadila Healthcare', '8738706469'),
(7, 'Biocon Limited', '5192738457');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(40) NOT NULL,
  `contact` varchar(13) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `contact`, `address`, `dob`, `login_id`) VALUES
(1, 'temp', '987654323', 'Thane, Maharashtra', '2020-11-12', 6),
(9, 'Xyz', '1234567', 'Kandivali, Mumbai', '2020-10-14', 12),
(11, 'Darth Vader', '112233', 'Darth Nagar, Death Star', '1991-06-13', 66),
(15, 'Tony', '2424113000', 'Stark Tower', '1998-06-10', 74),
(17, 'Eren Y', '90081244', '20/32 Shiganshina, Paradis', '1993-06-10', 76),
(19, 'trialone', '9049230', 'Stark Tower', '1991-07-11', 78),
(29, 'trialtwo', '9049230', 'Stark Tower', '1991-07-11', 78),
(30, 'LightY', '909310290', 'Main Street', '1970-09-02', 80);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `stock_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `total_number` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`stock_id`, `med_id`, `expiry_date`, `total_number`, `emp_id`) VALUES
(4, 8, '2025-06-21', 38, 1),
(7, 9, '2028-11-24', 44, 1),
(11, 8, '2025-06-21', 43, 1),
(14, 9, '2028-11-24', 46, 1),
(16, 14, '2024-04-06', 5, 1),
(17, 14, '2023-11-17', 18, 11),
(18, 27, '2021-05-31', 42, 11),
(19, 28, '2021-06-03', 32, 15),
(20, 29, '2021-06-06', 23, 1),
(21, 30, '2021-06-11', 21, 11),
(22, 31, '2021-06-05', 29, 30),
(23, 29, '2021-10-14', 23, 9),
(24, 32, '2021-08-06', 5, 1),
(25, 33, '2021-09-30', 47, 1);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `username`, `password`, `role`) VALUES
(1, 'Neww', '$2a$10$TH0mE1yK3ZPnunKSN2ObGebLHf2GhU1RS', 'Admin'),
(2, 'abcd', '$2a$10$UbYRXwTI6e3Qvw7tSLRmK.5V25y74jZZu', 'Admin'),
(3, 'test', '$2a$10$imLlRSUw524dI3.mFdXrQugsY3miYCYl.', 'Admin'),
(6, 'newtester ', 'tester', 'Admin'),
(12, 'xyz  ', '12345', 'Cashier'),
(13, 'Abhi', 'Abhi123', 'Admin'),
(14, 'Gato', 'Gato123', 'Cashier'),
(15, 'Sid', 'Sid123', 'Cashier'),
(19, 'Steve', '23232414', 'Patient'),
(23, 'Super Steve  ', '22334455', 'Patient'),
(25, 'Steve1', 'Captain', 'Patient'),
(62, 'Tony1', '22334455', 'Patient'),
(63, 'ben10', 'brofist', 'Patient'),
(65, 'Pat', 'patient', 'Patient'),
(66, 'vader', 'darth', 'Admin'),
(73, 'Pbj', 'prabal2', 'Patient'),
(74, 'tony', 'iamironman', 'Manager'),
(76, 'eren', 'tatakae', 'Cashier'),
(80, 'light01', 'iamkira01', 'Admin'),
(81, 'New pat', 'iamnew2', 'Patient'),
(84, 'Pewds', 'pewdiepie', 'Patient'),
(85, 'Naren Jha', 'naren@jha', 'Patient'),
(87, 'bob', 'ababab1', 'Patient');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `med_id` int(11) NOT NULL,
  `med_name` varchar(45) NOT NULL,
  `mrp` int(11) NOT NULL,
  `primary_drug` varchar(45) DEFAULT NULL,
  `dosage` varchar(45) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`med_id`, `med_name`, `mrp`, `primary_drug`, `dosage`, `company_id`) VALUES
(3, 'Hydrochlorothiazide', 56, 'Myalept', '3 tablets per day', 2),
(4, 'Benzonatate', 60, 'Ravicti', '2 tablets per day', 3),
(5, 'Coronil', 2040, 'Mavenclad', '5ml per day', 4),
(6, 'Xanax', 904, 'Actimmune', '10ml per day', 5),
(7, 'Wellbutrin', 4096, 'Oxervate', '5 tablets per week', 6),
(8, 'Viagra', 420, 'Takhzyro', '1 tablet per month', 7),
(9, 'Metoprolol', 804, 'Daraprim', '1 tablet per day', 4),
(10, 'Kevzara', 36, 'Juxtapid', '3 tablets per week', 2),
(11, 'Metformin', 1118, 'Cinryze', '10ml per month', 3),
(12, 'Gilenya', 917, 'Clindamycin', '1 tablet per month', 7),
(13, 'Metkevenya', 320, 'Juxinycin', '4 tablet per week', 2),
(14, 'Lansoprazole', 120, 'Amoxicillin', '2 tablets per day', 1),
(16, 'Benzonatate', 60, 'Ravicti', '2 tablets per day', 3),
(17, 'Coronil', 2040, 'Mavenclad', '5ml per day', 4),
(18, 'Xanax', 904, 'Actimmune', '10ml per day', 5),
(19, 'Wellbutrin', 4096, 'Oxervate', '5 tablets per week', 6),
(20, 'Viagra', 420, 'Takhzyro', '1 tablet per month', 7),
(21, 'Metoprolol', 804, 'Daraprim', '1 tablet per day', 4),
(22, 'Kevzara', 36, 'Juxtapid', '3 tablets per week', 2),
(23, 'Metformin', 1118, 'Cinryze', '10ml per month', 3),
(24, 'Gilenya', 917, 'Clindamycin', '1 tablet per month', 7),
(25, 'Metkevenya', 320, 'Juxinycin', '4 tablet per week', 2),
(26, 'New drug', 420, 'Drug', '1 tablet per day', 4),
(27, 'New drug', 420, 'Drug', '1 tablet per day', 1),
(28, 'Novo', 2069, 'Penicilin', '1 tablet before waking up and 1 after sleepin', 3),
(29, 'Novo-o', 131, 'Abacavir', '2 times a day', 2),
(30, 'Novo-o1', 23, 'dsa', '1 tablet before waking up and 1 after sleepin', 5),
(31, 'Novo01', 201, 'Novos', '2 times a week', 7),
(32, 'New drugs', 20, 'Drud', '2 pills a day', 3),
(33, 'Chericoff', 30, 'Random', '1 tablet before waking up and 1 after sleepin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(100) NOT NULL DEFAULT 'Request awaiting confirmation',
  `imgsrc` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `pat_id`, `message`, `date`, `Status`, `imgsrc`) VALUES
(52, 60, 'Thyronorm 100mg needed', '2021-02-26 10:21:04', 'Request awaiting confirmation', 'imgs/41fa4430-781c-11eb-ac36-b719c7ab9dd7-sample image.jfif.jfif'),
(53, 60, 'Send meds', '2021-02-26 10:22:25', 'Request awaiting confirmation', 'imgs/7a5b8e10-781c-11eb-90b2-cd310736387d-OS-PROJECT-REVIEW-2.pdf.pdf'),
(54, 60, 'Thyronorm 200mg needed', '2021-02-26 17:17:58', 'Approved', 'imgs/72da1eb0-7856-11eb-8efa-8b563de723b4-hostel.pdf.pdf'),
(55, 64, 'abcd needed', '2021-02-26 17:20:23', 'Request awaiting confirmation', 'imgs/72da1eb0-7856-11eb-8efa-8b563de723b4-Death Note - Ls Theme.mp3.mp3'),
(56, 60, 'Abc', '2021-02-26 17:23:38', 'Request awaiting confirmation', 'imgs/4a14ff30-7857-11eb-a791-d31027bd575c-crypto lab da1-f.pdf.pdf'),
(57, 37, 'Need more', '2021-02-26 17:24:56', 'Request awaiting confirmation', 'imgs/4a14ff30-7857-11eb-a791-d31027bd575c-crypto lab da1.docx.docx'),
(58, 60, 'Thyronorm 50mg needed', '2021-02-28 09:18:21', 'Request awaiting confirmation', 'imgs/90893d10-79a5-11eb-8b0f-ff04a68e6e51-DBMS_REVIEW_2_PPT.pdf.pdf'),
(59, 60, 'Need the medicines', '2021-04-13 05:21:01', 'Request awaiting confirmation', 'imgs/d7287ae0-9c16-11eb-9428-3dc8bf769458-prescription.png.png'),
(60, 60, 'new e', '2021-05-21 15:09:04', 'Approved', 'imgs/66631a60-ba46-11eb-89a3-c37d5b94ef50-submitted.jpg.jpg'),
(61, 60, 'No message', '2021-05-21 17:39:10', 'Approved', 'imgs/155a45c0-ba5b-11eb-b1de-09d2753fbea2-Scan005.jpg.jpg'),
(62, 60, 'new', '2021-05-22 07:22:23', 'Request awaiting confirmation', 'imgs/049b2d80-bace-11eb-9073-1f6bef8fc567-gordon2018.pdf.pdf'),
(63, 37, 'Need meds', '2021-05-22 08:04:26', 'Request awaiting confirmation', 'imgs/7cdb1ab0-bad0-11eb-8b66-67e7f8f51a44-prescription.png.png'),
(64, 66, 'Thyronorm 100mg needed', '2021-05-22 08:07:59', 'Not aproved', 'imgs/8aee2cb0-bad4-11eb-8466-29b4715d0726-prescription.png.png'),
(65, 68, 'Please send the medicines', '2021-05-22 09:51:21', 'Approved', 'imgs/0c773900-bae1-11eb-8e0a-5b6e9fea4c44-prescription.png.png'),
(66, 68, 'some presc', '2021-05-22 12:02:06', 'approved', 'imgs/3e2f0eb0-baf4-11eb-940e-f1b6e8f700c0-prescription.png.png'),
(67, 68, 'abcd', '2021-05-22 12:21:32', 'Approved', 'imgs/79be86b0-baf7-11eb-a045-6953410f028c-prescription.png.png');

-- --------------------------------------------------------

--
-- Table structure for table `patient_1`
--

CREATE TABLE `patient_1` (
  `pat_id` int(11) NOT NULL,
  `pat_name` varchar(45) NOT NULL,
  `contact` varchar(13) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `insurance_id` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_1`
--

INSERT INTO `patient_1` (`pat_id`, `pat_name`, `contact`, `gender`, `insurance_id`, `age`, `address`, `login_id`) VALUES
(1, 'Steve', '23232414', 'Male', 'csaweqdas', 33, 'Cape road', 19),
(29, 'Tony', '533252352', 'Male', 'Starkk01', 324, 'Stark Tower', 20),
(32, 'Steve1', '23232414', 'Male', 'CAPAM02', 122, 'adsdsada', 21),
(37, 'Super Steve', '423232425', 'Male', 'Starkk01', 421, 'Cape road', 23),
(59, 'Tony1', '22334455', 'Male', 'fesafas', 33, 'Cape road', 62),
(60, 'Pewdiepie', '9840282033', 'Male', 'Edgahhh01', 31, 'benten', 63),
(61, 'Pat', '290432', 'Female', 'ewaarw2', 22, 'Pat-1', 65),
(64, 'Pbj', '22115599', 'Male', 'tonystark', 19, 'abn', 73),
(65, 'New patient', '901233412', 'Male', 'uwffuew', 23, 'Live in 200', 81),
(66, 'Pewds', '2901282980', 'Male', 'brofist', 23, 'adsdsada', 84),
(67, 'Naren Jha', '89891420', 'Male', 'mi0oidas', 34, 'Jha-pur, Jharkhand', 85),
(68, 'ba', '819284901', 'Female', 'alphabet', 42, 'abcd', 87);

-- --------------------------------------------------------

--
-- Table structure for table `patient_2`
--

CREATE TABLE `patient_2` (
  `pat_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_2`
--

INSERT INTO `patient_2` (`pat_id`, `doc_id`) VALUES
(1, 1),
(29, 1),
(32, 1),
(37, 1),
(59, 3),
(60, 1),
(61, 5),
(64, 6),
(65, 7),
(66, 6),
(67, 8),
(68, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_1`
--
ALTER TABLE `bill_1`
  ADD PRIMARY KEY (`bill_no`),
  ADD KEY `bill_1_fk_pat_id_idx` (`pat_id`);

--
-- Indexes for table `bill_2`
--
ALTER TABLE `bill_2`
  ADD PRIMARY KEY (`bill_no`,`med_id`);

--
-- Indexes for table `doctor_1`
--
ALTER TABLE `doctor_1`
  ADD PRIMARY KEY (`doc_id`),
  ADD UNIQUE KEY `contact_UNIQUE` (`contact`);

--
-- Indexes for table `doctor_2`
--
ALTER TABLE `doctor_2`
  ADD PRIMARY KEY (`doc_id`,`med_id`);

--
-- Indexes for table `drug_manufacturer`
--
ALTER TABLE `drug_manufacturer`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `inventory_fk_med_id_idx` (`med_id`),
  ADD KEY `inventory_fk_emp_id_idx` (`emp_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`med_id`),
  ADD KEY `medicine_fk_company_id_idx` (`company_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `patient_1`
--
ALTER TABLE `patient_1`
  ADD PRIMARY KEY (`pat_id`);

--
-- Indexes for table `patient_2`
--
ALTER TABLE `patient_2`
  ADD PRIMARY KEY (`pat_id`,`doc_id`),
  ADD KEY `patient_2_fk_doc_id_idx` (`doc_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_1`
--
ALTER TABLE `bill_1`
  MODIFY `bill_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `doctor_1`
--
ALTER TABLE `doctor_1`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `drug_manufacturer`
--
ALTER TABLE `drug_manufacturer`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `med_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `patient_1`
--
ALTER TABLE `patient_1`
  MODIFY `pat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_1`
--
ALTER TABLE `bill_1`
  ADD CONSTRAINT `bill_1_fk_pat_id` FOREIGN KEY (`pat_id`) REFERENCES `patient_1` (`pat_id`);

--
-- Constraints for table `bill_2`
--
ALTER TABLE `bill_2`
  ADD CONSTRAINT `bill_2_1_fk_bill_no` FOREIGN KEY (`bill_no`) REFERENCES `bill_1` (`bill_no`);

--
-- Constraints for table `doctor_2`
--
ALTER TABLE `doctor_2`
  ADD CONSTRAINT `doctor_2_fk_doc_id` FOREIGN KEY (`doc_id`) REFERENCES `doctor_1` (`doc_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_fk_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `inventory_fk_med_id` FOREIGN KEY (`med_id`) REFERENCES `medicine` (`med_id`);

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `medicine_fk_company_id` FOREIGN KEY (`company_id`) REFERENCES `drug_manufacturer` (`company_id`);

--
-- Constraints for table `patient_2`
--
ALTER TABLE `patient_2`
  ADD CONSTRAINT `patient_2_fk_doc_id` FOREIGN KEY (`doc_id`) REFERENCES `doctor_1` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_2_fk_pat_id` FOREIGN KEY (`pat_id`) REFERENCES `patient_1` (`pat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
