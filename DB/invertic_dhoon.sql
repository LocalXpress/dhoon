-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 20, 2017 at 12:22 AM
-- Server version: 5.6.33
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `invertic_dhoon`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(24) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99');

-- --------------------------------------------------------

--
-- Table structure for table `blocked`
--

CREATE TABLE IF NOT EXISTS `blocked` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(21, 'Classical'),
(22, 'Country'),
(23, 'Electronic'),
(25, 'Hip-Hop'),
(26, 'Jazz'),
(27, 'Metal'),
(28, 'Pop'),
(29, 'Reggae'),
(30, 'World'),
(31, 'Business'),
(32, 'Comedy'),
(33, 'Entertainment'),
(34, 'Learning');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `uid`, `tid`, `message`, `time`) VALUES
(1, 6, 2, 'Bhalo', '2016-06-20 07:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE IF NOT EXISTS `downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `track`, `by`, `time`) VALUES
(1, 1, 6, '2016-06-13 06:02:09'),
(2, 2, 6, '2016-06-16 13:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `from`, `to`, `parent`, `child`, `type`, `read`, `time`) VALUES
(1, 6, 3, 1, 0, 2, 0, '2016-06-13 06:02:09'),
(2, 6, 7, 2, 0, 2, 0, '2016-06-16 13:28:52'),
(3, 6, 7, 0, 0, 4, 0, '2016-06-17 15:21:06'),
(4, 6, 7, 2, 1, 1, 0, '2016-06-20 07:43:04'),
(5, 8, 7, 0, 0, 4, 0, '2016-06-22 12:17:38'),
(6, 8, 6, 0, 0, 4, 0, '2016-06-22 12:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by` int(11) NOT NULL,
  `payer_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `payer_first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_last_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_country` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `valid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `playlistentries`
--

CREATE TABLE IF NOT EXISTS `playlistentries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `public` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE IF NOT EXISTS `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leader` int(11) NOT NULL,
  `subscriber` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `leader`, `subscriber`, `time`) VALUES
(1, 7, 6, '2016-06-17 15:21:06'),
(2, 7, 8, '2016-06-22 12:17:37'),
(3, 6, 8, '2016-06-22 12:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `track` varchar(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `content` text NOT NULL,
  `type` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `perpage` int(11) NOT NULL,
  `volume` varchar(4) NOT NULL,
  `captcha` int(11) NOT NULL,
  `intervaln` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `format` varchar(256) NOT NULL,
  `mail` int(11) NOT NULL,
  `artsize` int(11) NOT NULL,
  `artformat` varchar(256) NOT NULL,
  `tracksize` int(11) NOT NULL,
  `trackformat` varchar(128) NOT NULL,
  `tracksizetotal` bigint(12) NOT NULL,
  `cperpage` int(11) NOT NULL,
  `ilimit` int(11) NOT NULL,
  `mlimit` int(11) NOT NULL,
  `rperpage` int(11) NOT NULL,
  `sperpage` int(11) NOT NULL,
  `nperpage` tinyint(4) NOT NULL,
  `nperwidget` tinyint(4) NOT NULL,
  `lperpost` int(11) NOT NULL,
  `aperip` int(11) NOT NULL,
  `conline` int(4) NOT NULL,
  `ronline` tinyint(4) NOT NULL,
  `mperpage` tinyint(4) NOT NULL,
  `chatr` int(11) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `smiles` tinyint(4) NOT NULL,
  `fbapp` int(11) NOT NULL,
  `fbappid` varchar(128) NOT NULL,
  `fbappsecret` varchar(128) NOT NULL,
  `smtp_email` int(11) NOT NULL,
  `smtp_host` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_auth` int(11) NOT NULL,
  `smtp_username` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `smtp_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalapp` int(11) NOT NULL,
  `paypaluser` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalpass` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalsign` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalsand` int(11) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `promonth` decimal(6,2) NOT NULL,
  `proyear` decimal(6,2) NOT NULL,
  `protracksize` int(11) NOT NULL,
  `protracktotal` bigint(12) NOT NULL,
  `ad1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad4` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad5` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad6` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad7` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tracking_code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`title`, `theme`, `perpage`, `volume`, `captcha`, `intervaln`, `time`, `size`, `format`, `mail`, `artsize`, `artformat`, `tracksize`, `trackformat`, `tracksizetotal`, `cperpage`, `ilimit`, `mlimit`, `rperpage`, `sperpage`, `nperpage`, `nperwidget`, `lperpost`, `aperip`, `conline`, `ronline`, `mperpage`, `chatr`, `email_comment`, `email_like`, `email_new_friend`, `smiles`, `fbapp`, `fbappid`, `fbappsecret`, `smtp_email`, `smtp_host`, `smtp_port`, `smtp_auth`, `smtp_username`, `smtp_password`, `paypalapp`, `paypaluser`, `paypalpass`, `paypalsign`, `paypalsand`, `currency`, `promonth`, `proyear`, `protracksize`, `protracktotal`, `ad1`, `ad2`, `ad3`, `ad4`, `ad5`, `ad6`, `ad7`, `tracking_code`) VALUES
('Sound', 'sound', 10, '0.80', 1, 60000, 0, 2097152, 'png,jpg,gif,jpeg', 1, 2097152, 'png,jpg,gif,jpeg', 15728640, 'mp3,m4a,mp4', 20971520, 10, 9, 1000, 20, 10, 100, 30, 5, 0, 600, 7, 10, 30, 1, 1, 1, 1, 0, '', '', 0, '', 0, 0, '', '', 0, '', '', '', 0, 'USD', '3.00', '29.00', 52428800, 536870912, 'test ad', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `art` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `buy` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `record` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `release` date NOT NULL,
  `license` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `download` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `public` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `downloads` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `pick_of_day` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`id`, `uid`, `title`, `description`, `name`, `tag`, `art`, `buy`, `record`, `release`, `license`, `size`, `download`, `time`, `public`, `likes`, `downloads`, `views`, `pick_of_day`) VALUES
(1, 3, 'Baby Ko Bass Pasand Hai - Sultan', '', '1458232725_1471497590_401615053.mp3', 'hindi,', 'default.png', '', '', '0000-00-00', 0, 10212879, 0, '2016-06-12 21:45:24', 1, 1, 0, 9, 0),
(2, 7, 'Aigiri(Strotram)', '', '452754838_1938842971_1145387572.mp3', 'aigiri,', 'default.png', '', '', '0000-00-00', 0, 6672420, 0, '2016-06-13 14:55:16', 1, 1, 0, 16, 0),
(3, 9, 'Rude   Magic Lyrics', 'THIS IS  A TEST MUSIC', '675406965_596372179_872841707.mp3', 'pop,spanish,', '1814902095_308338735_361339223.jpg', '', '', '0000-00-00', 0, 3618428, 0, '2016-08-27 13:34:28', 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idu` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(64) NOT NULL,
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(128) NOT NULL,
  `description` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `facebook` varchar(256) NOT NULL,
  `twitter` varchar(128) NOT NULL,
  `gplus` varchar(256) NOT NULL,
  `youtube` varchar(128) NOT NULL,
  `vimeo` varchar(128) NOT NULL,
  `tumblr` varchar(128) NOT NULL,
  `soundcloud` varchar(128) NOT NULL,
  `myspace` varchar(128) NOT NULL,
  `lastfm` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `private` int(11) NOT NULL,
  `suspended` int(11) NOT NULL,
  `salted` varchar(256) NOT NULL,
  `cover` varchar(128) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `online` int(11) NOT NULL,
  `offline` tinyint(4) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `notificationl` tinyint(4) NOT NULL,
  `notificationc` tinyint(4) NOT NULL,
  `notificationd` tinyint(4) NOT NULL,
  `notificationf` tinyint(4) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`idu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idu`, `username`, `password`, `email`, `first_name`, `last_name`, `country`, `city`, `website`, `description`, `date`, `facebook`, `twitter`, `gplus`, `youtube`, `vimeo`, `tumblr`, `soundcloud`, `myspace`, `lastfm`, `image`, `private`, `suspended`, `salted`, `cover`, `gender`, `online`, `offline`, `ip`, `notificationl`, `notificationc`, `notificationd`, `notificationf`, `email_comment`, `email_like`, `email_new_friend`, `verified`) VALUES
(3, 'souvikhazra', 'e10adc3949ba59abbe56e057f20f883e', 'souvik.babanhazra@gmail.com', '', '', '', '', '', '', '2016-06-13', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1472305577, 0, '45.112.70.106', 0, 0, 0, 0, 1, 1, 1, 1),
(5, 'souvikhazra2', 'e10adc3949ba59abbe56e057f20f883e', 'souvik.baban.hazra@gmail.com', '', '', '', '', '', '', '2016-06-13', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1465769401, 0, '45.112.70.106', 0, 0, 0, 0, 1, 1, 1, 0),
(6, 'dhoon', 'd4c278a0abfb9d81bc3f66b2304debd1', 'kaushikdhoon@gmail.com', 'Kaushik', 'Som', 'India', 'Kolkata', '', '', '2016-06-13', '', '', '', '', '', '', '', '', '', '215253095_1788554091_210656487.jpg', 0, 0, '', '11033886_334023635_1527612759.jpg', 0, 1468140017, 0, '45.112.71.214', 0, 0, 0, 0, 1, 1, 1, 1),
(7, 'babanmusic', 'a6079a7b91513ad09f3c48df8a19f10b', 'utpalendu.mazumder@gmail.com', '', '', '', '', '', '', '2016-06-13', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1465832400, 0, '115.187.50.227', 0, 0, 0, 0, 1, 1, 1, 1),
(8, 'binayak', 'de85a3962b2238023a8d5577c5bfa60c', 'binayak.majumdr@gmail.com', 'Binayak', 'Majumdar', 'India', 'Kolkata', '', '', '2016-06-22', '', '', '', '', '', '', '', '', '', '165120996_155884018_1509503414.jpg', 0, 0, '', '1884322071_1458337088_1217384730.png', 0, 1466598502, 0, '45.250.247.11', 1, 1, 1, 1, 1, 1, 1, 1),
(9, 'sujoy', 'e10adc3949ba59abbe56e057f20f883e', 'sujoy.mitra.prospects@gmail.com', '', '', '', '', '', '', '2016-08-27', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1472316681, 0, '117.194.228.92', 0, 0, 0, 0, 1, 1, 1, 1),
(10, 'ayideep', 'b06febcfbc00db4f67aed9234e3e52b0', 'ayideep@yahoo.co.in', '', '', '', '', '', '', '2016-09-14', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1473831830, 0, '45.250.247.152', 0, 0, 0, 0, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE IF NOT EXISTS `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `by`, `track`, `time`) VALUES
(1, 6, 1, '2016-06-13 05:58:08'),
(2, 6, 1, '2016-06-13 06:01:50'),
(3, 7, 2, '2016-06-13 14:55:30'),
(4, 7, 1, '2016-06-13 14:55:51'),
(5, 7, 2, '2016-06-13 14:56:52'),
(6, 7, 2, '2016-06-13 14:57:25'),
(7, 7, 2, '2016-06-13 15:36:03'),
(8, 6, 2, '2016-06-16 13:28:33'),
(9, 6, 1, '2016-06-16 13:29:25'),
(10, 6, 2, '2016-06-17 15:21:11'),
(11, 6, 1, '2016-06-20 07:40:33'),
(12, 6, 2, '2016-06-20 07:41:26'),
(13, 8, 2, '2016-06-22 12:18:09'),
(14, 6, 1, '2016-06-24 08:05:14'),
(15, 6, 1, '2016-06-24 08:06:55'),
(16, 6, 2, '2016-07-06 17:35:36'),
(17, 6, 2, '2016-07-06 17:37:31'),
(18, 6, 2, '2016-07-10 08:35:00'),
(19, 6, 2, '2016-07-10 08:40:20'),
(20, 9, 1, '2016-08-27 13:28:25'),
(21, 9, 2, '2016-08-27 13:28:48'),
(22, 9, 3, '2016-08-27 13:34:44'),
(23, 3, 1, '2016-08-27 13:44:46'),
(24, 9, 2, '2016-08-27 13:52:01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
