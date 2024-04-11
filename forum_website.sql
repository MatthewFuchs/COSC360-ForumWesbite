-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 11, 2024 at 10:01 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `name`, `description`) VALUES
(1, 'Web Development', 'All things related to developing websites, including front-end and back-end technologies.');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `CommentID` int(11) NOT NULL,
  `PostID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Content` text,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`CommentID`, `PostID`, `UserID`, `Content`, `CreatedAt`) VALUES
(1, 6, 1, 'This is a test comment.', '2024-04-09 15:01:34'),
(2, 5, 1, 'this is another test comment', '2024-04-09 15:13:07'),
(3, 2, 1, 'hello', '2024-04-09 15:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `latest_discussions`
--

CREATE TABLE `latest_discussions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `latest_discussions`
--

INSERT INTO `latest_discussions` (`id`, `title`, `link`) VALUES
(1, 'Best Practices for Remote Work', '#'),
(2, 'Guide to Effective Team Collaboration', '#'),
(3, 'Emerging Trends in Data Science', '#'),
(4, 'Challenges in Mobile App Development', '#'),
(5, 'Exploring the New Features of CSS4', '#'),
(6, 'Security Concerns in Cloud Computing', '#');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `userID`, `title`, `content`, `created_At`, `categoryID`) VALUES
(2, 1, 'Hello', 'This is a test.', '2024-04-09 00:42:13', 0),
(5, 1, 'Test 2', 'Hello, this is another test', '2024-04-09 00:54:15', 1),
(6, 1, 'Test 3', 'This is another test.', '2024-04-09 14:42:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `PostID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `TagID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `upcoming_events`
--

CREATE TABLE `upcoming_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `event_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upcoming_events`
--

INSERT INTO `upcoming_events` (`id`, `title`, `link`, `event_date`) VALUES
(1, 'TechTalk: The Future of Blockchain', '#', '2024-03-15'),
(2, 'Webinar: Introduction to Docker', '#', '2024-04-22'),
(3, 'Hackathon: AI Solutions', '#', '2024-05-30'),
(4, 'Conference: NextGen Technologies', '#', '2024-06-18'),
(5, 'Workshop: Advanced Python Programming', '#', '2024-07-25'),
(6, 'Seminar: Cybersecurity Trends', '#', '2024-08-05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bio` text,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `role` enum('user','moderator','admin') DEFAULT 'user',
  `status` enum('active','inactive','banned') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `email`, `bio`, `password`, `firstName`, `lastName`, `role`, `status`) VALUES
(1, 'mfuchs', 'matthewfuchs@outlook.com', 'This is a test.', '$2y$10$My/n4nU1sXqxfKgq.J5gD.979BA.b5GWMI8gjun5W4kSsZtDm5v8e', 'Matthew', 'Fuchs', 'admin', 'active'),
(2, 'mfuchs2', 'mfuchs2@outlook.com', NULL, '$2y$10$LmZJRMVC8BDLWwu6vB3AUeyNFsQfGFFnbNQ/PLnGJj3Sp.sRSLEFW', NULL, NULL, 'user', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `latest_discussions`
--
ALTER TABLE `latest_discussions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`PostID`,`TagID`),
  ADD KEY `TagID` (`TagID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`TagID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `upcoming_events`
--
ALTER TABLE `upcoming_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `latest_discussions`
--
ALTER TABLE `latest_discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upcoming_events`
--
ALTER TABLE `upcoming_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `posts` (`postID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `posts` (`postID`),
  ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`TagID`) REFERENCES `tags` (`TagID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
