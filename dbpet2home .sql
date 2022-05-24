-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2022 at 06:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpet2home`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `Id_post` int(11) NOT NULL,
  `Petname` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`Id_post`, `Petname`) VALUES
(1, 'Cats'),
(2, 'Dogs');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `petname` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id_post`, `id_user`, `petname`) VALUES
(1, 0, 'Cats'),
(2, 0, 'Dogs');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id_post` int(11) NOT NULL,
  `id_user` int(15) NOT NULL,
  `id_pets` int(13) NOT NULL,
  `id_contact` int(22) NOT NULL,
  `tittle` varchar(255) NOT NULL,
  `url_avatar` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `log` varchar(255) NOT NULL,
  `desc` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_contacts`
--

CREATE TABLE `post_contacts` (
  `id_contact` int(25) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `whatsapp` varchar(13) NOT NULL,
  `instagram` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_contacts`
--

INSERT INTO `post_contacts` (`id_contact`, `phone_number`, `whatsapp`, `instagram`) VALUES
(1, '085782186940', '085782186940', 'dindafathihah');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `full_name` varchar(32) NOT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(50) NOT NULL,
  `url_avatar` varchar(255) NOT NULL,
  `role` varchar(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email`, `username`, `password`, `phone_number`, `full_name`, `birth_date`, `birth_place`, `url_avatar`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dindafathihah@gmail.com', 'dindaf', 'Dindadddd', '085782186940', 'Dinda Fathihah Sari', '2000-04-08', 'Jakarta', '', '0', '0', '2022-05-23', '0000-00-00'),
(2, 'blablabla@gmail.com', 'ccc73', 'manakutau', '087856804463', 'siapa aja', '2002-06-13', '', '', '', '', '2022-05-24', '0000-00-00'),
(3, 'jihanamylain@gmail.com', 'jihanjihan', 'jihantuin', '085782654339', 'jihana mylain assegaf', '2003-11-18', '', '', '', '', '0000-00-00', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`Id_post`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id_post`);

--
-- Indexes for table `post_contacts`
--
ALTER TABLE `post_contacts`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `Id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_contacts`
--
ALTER TABLE `post_contacts`
  MODIFY `id_contact` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
