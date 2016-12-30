-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2016 at 08:11 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Php Tutorials', NULL, NULL),
(2, 'Ruby on Rails tutorials', NULL, NULL),
(3, 'Marketing tutorials', NULL, NULL),
(4, 'Python tutorials', '2016-11-19 13:21:40', '2016-11-19 13:21:40'),
(5, 'Python tutorials', '2016-11-19 13:22:28', '2016-11-19 13:22:28'),
(6, 'Python tutorials', '2016-11-19 13:22:53', '2016-11-19 13:22:53'),
(7, 'Android tutorials', '2016-11-19 13:23:21', '2016-11-19 13:23:21');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `comment`, `approved`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 'rondbadre', 'abdnorsmi@gmail.com', '36521547984', 1, 1, '2016-11-20 19:18:17', '2016-11-20 19:18:17'),
(2, 'rondbadre', 'abdnorsmi@gmail.com', '36521547984', 1, 1, '2016-11-20 19:18:54', '2016-11-20 19:18:54'),
(3, 'barhon', 'abdnorsmi@gmail.com', 'kiiiiii', 1, 1, '2016-11-20 19:32:32', '2016-11-20 23:12:34'),
(5, 'Abdennour', 'abdnorsmi@gmail.com', 'this is a comment i made to test if the image avatar is working with my email address ', 1, 1, '2016-11-20 21:48:57', '2016-11-20 21:48:57'),
(6, 'hamid', 'hamid@hotmail.com', 'this is master hamid talking to you in this comment', 1, 1, '2016-11-20 22:00:39', '2016-11-20 22:00:39'),
(7, 'hammadi', 'hammadi@gmail.com', 'his name is hammadi master number one ', 1, 1, '2016-11-21 20:31:22', '2016-11-21 20:31:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2014_10_12_000000_create_users_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 1),
(14, '2016_11_14_215227_create_posts_table', 1),
(15, '2016_11_16_174653_add_slug_to_posts', 1),
(16, '2016_11_19_000237_create_categories_table', 2),
(17, '2016_11_19_000836_add_category_id_to_posts', 2),
(20, '2016_11_19_173954_create_tags_table', 3),
(21, '2016_11_19_180718_create_post_tag_table', 3),
(22, '2016_11_20_161209_create_comments_table', 4),
(23, '2016_11_21_194152_add_image_col_to_posts', 5),
(24, '2016_11_21_195856_add_image_column_to_posts', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `slug`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Title number one', '<div>Miley Cyrus, Demi Lovato and Selena Gomez all started out on TV before trading their sitcom scripts for microphones -- and it looks like Modern Family star Sarah Hyland might be following suit. The actress recently revealed her singing<em><strong> chops b</strong></em></div>\r\n<h5><strong>y teaming up with Boyce Avenue for an acoustic rendition of The Chainsmokers'' biggest hit to date "Closer." "Loved working on this cover of ''Closer'' with our friend @Sarah_Hyland," Boyce Avenue tweeted.</strong></h5>\r\n<p><strong> </strong></p>\r\n<ol><li> thisj sjflkdsjqkfljdklsqjfkdljlqjl</li>\r\n<li>dkfjdsjlkfqjdslq</li>\r\n<li>dkfjdsjqfljdslm</li>\r\n<li>dfjfdufijdkjfldfu</li>\r\n<li>find yourself on the top of this is it here i stand am the light of the word i can see</li>\r\n</ol><p> </p>\r\n<p> </p>\r\n<p> </p>', 'one_1', NULL, 1, '2016-11-16 19:12:44', '2016-11-21 17:11:15'),
(2, 'help me', 'ROBYN Love Is Free lyrics\r\n\r\n[Hook]\r\nFree\r\nLove is free, baby\r\nFree\r\nLove is free, baby\r\nBoom boom boom boom boom chica boom\r\nLet me give it to you, baby\r\nChica boom chica boom chica boom\r\nChica boom chica boom chica boom\r\nFree\r\nLove is free, baby\r\nFree\r\nLove is free, baby\r\nBoom boom boom boom boom chica boom\r\nLet me give it to you, baby\r\n\r\n[Verse 1] [x2]\r\nI''ma give it to you, baby\r\nI''ma give it when I''m ready\r\nSome lose, some steady\r\nSome light, some heavy\r\nIt''s all over this city\r\nSometimes in the ugly, sometimes in the pretty\r\nYou never know where you get it cause you can''t control it and you can''t unfold it, slow down\r\n\r\n[Hook]\r\nFree\r\nLove is free, baby\r\nFree\r\nLove is free, baby\r\nBoom boom boom boom boom chica boom\r\nLet me give it to you, baby\r\nYeah! Yeah! Yeah! Yeah!\r\nLove is free, baby\r\nLove is free, baby\r\n\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n[Verse 2] [x2]\r\nI''ma give it to you, baby\r\nI''ma give it like a motha\r\nSafe like a rubber\r\nMutter like a stutter\r\nIt''s all over this city\r\nSometimes in the nitty, sometimes in the gritty\r\nYou know I''ma give it to you better\r\nI''ma give you love forever\r\nNo, you can''t control it, slow down\r\n\r\n[Hook]\r\nFree\r\nLove is free, baby\r\nFree\r\nLove is free, baby\r\nBoom boom boom boom boom chica boom\r\nLet me give it to you, baby\r\nBoom boom boom boom boom\r\nChica boom chica boom chica boom\r\nBoom boom boom boom boom\r\nChica boom chica boom chica boom\r\nFree\r\nLove is free, baby\r\nFree\r\nLove is free, baby\r\n\r\n[Bridge: Mala] [x2]\r\nApréndelo, apréndelo\r\nTe lo digo right now, sólo entiéndelo\r\nApréndelo, apréndelo\r\nTe lo digo right now, sólo entiéndelo\r\nSlow down\r\n\r\n[Verse 1]\r\nI''ma give it to you, baby\r\nI''ma give it when I''m ready\r\nSome lose, some steady\r\nSome light, some heavy\r\nIt''s all over this city\r\nSometimes in the ugly, sometimes in the pretty\r\nYou never know where you get it cause you can''t control it and you can''t unfold it, slow down\r\n\r\n[Outro]\r\nSlow down [x6]\r\nFree\r\nLove is free, baby [x2]\r\nSo free [x4]\r\nYou know\r\nLove is free\r\nSo free\r\nFree – Love is free, baby [x8]\r\nSo free\r\n\r\nSource: http://www.directlyrics.com/robyn-love-is-free-lyrics.html', 'help_me', NULL, 2, '2016-11-16 22:19:00', '2016-11-16 22:19:00'),
(3, 'Abdennour player', 'Abdennour was born in Sousse, Tunisia, and started his career at Étoile Sportive du Sahel in 2008. During his spell there, he was a fan favourite despite being one of the youngest players in the team. In the 2008–09 season he scored five goals for his club, but they missed on the title and finished third.\r\n\r\nOn 14 January 2010, Abdennour signed a half-year loan deal with SV Werder Bremen which initially saw him stay at the club until the end of the 2009–10 season. Bremen had the contract option to sign him permanently.[1] Abdennour made six appearances for Werder Bremen, but they did not take up the option to sign him and he returned to Étoile.', 'Abdennour_player', NULL, 2, '2016-11-16 22:26:17', '2016-11-16 22:26:17'),
(4, 'Barak Obama', 'The Supreme Court rules on some of our country''s most important legal cases. We can''t let the judicial branch be crippled by the same partisan obstruction that''s currently plaguing both houses of Congress.\r\n\r\nLearn why the country''s most important judicial body needs to be at full strength with nine justices, and should not be allowed to sit with a vacancy for more than a single term. \r\n\r\nThen, add your name to an overwhelming majority of Americans who want a fair nomination process.', 'Barak_Obama', NULL, 6, '2016-11-16 22:27:44', '2016-11-19 16:13:27'),
(5, 'Slag_post', '"When it comes to my health, I don''t like to take any chances. Once I became a full-time graduate student, I had to go part-time at my job, and as a result, I got dropped from my insurance plan. Thanks to the Affordable Care Act, though, I didn''t have a lapse of coverage and I was able to hop on my parent''s plan until I was 26. In December, I signed up for health insurance in the new marketplace and the plan I picked provides me with great coverage at an affordable price.', 'slag_post', NULL, 1, '2016-11-16 22:28:43', '2016-11-16 22:28:43'),
(7, 'Abdennour Merghad ', '<p>this is a test for linking the category to the post</p>', 'newest_blog', NULL, 6, '2016-11-19 14:46:29', '2016-11-21 14:18:26'),
(8, 'TYNYMCE', '<ul>\r\n<li><em>.DFSDFQSDFQSD</em></li>\r\n</ul>\r\n<ol>\r\n<li><em>fdgdfgdfgfds</em></li>\r\n</ol>', 'wysiwyg', NULL, 1, '2016-11-21 14:41:28', '2016-11-21 14:41:28'),
(9, 'hjghjghj', '<p>gjhcgjhchgjchcv h jgkjjghhgjghjgh</p>', 'chgchgjcgh', '1479767767.jpg', 1, '2016-11-21 20:20:17', '2016-11-21 22:36:08'),
(10, 'Hatim merghad', '<p>hhhcgh jhnfxjvbn h kgkgcy ruryijy tyu tydi utikdt hjdgj  tuf </p>', 'help-momo', NULL, 1, '2016-11-21 20:33:43', '2016-11-21 20:33:43'),
(11, '454545', '<p>5454545656542531</p>', '45545', '1479760672.jpg', 1, '2016-11-21 20:37:52', '2016-11-21 20:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`) VALUES
(5, 3, 4),
(6, 3, 6),
(8, 1, 4),
(9, 1, 5),
(10, 7, 1),
(11, 7, 3),
(12, 7, 5),
(13, 8, 3),
(14, 8, 4),
(15, 8, 6),
(16, 1, 6),
(17, 9, 4),
(18, 10, 1),
(19, 10, 3),
(20, 10, 4),
(21, 10, 5),
(22, 10, 6),
(25, 11, 3),
(26, 11, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'php', '2016-11-19 19:57:31', '2016-11-19 19:57:31'),
(3, 'Laravel', '2016-11-19 19:59:20', '2016-11-19 19:59:20'),
(4, 'Ruby on Rails Tag', '2016-11-19 19:59:40', '2016-11-20 00:58:14'),
(5, 'mvc', '2016-11-19 19:59:51', '2016-11-19 19:59:51'),
(6, '.Net', '2016-11-19 20:00:05', '2016-11-19 20:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Abdennour', 'abdnorsmi@gmail.com', '$2y$10$nnOgeyLlswwesVFry/2uH.TLyqASCD8/JeUdpyk7MGJdjLZYpWd9O', 'hg5SiRbvsFSpNgEoODX4xSZrtoLZDqLvHAx97Eh6OS4QJzupMq6o26BesSoG', '2016-11-18 01:37:45', '2016-11-20 23:51:50'),
(4, 'rondbadre', 'rondbadre@gmail.com', '$2y$10$bYR5aobWMdf3KunDE4FBAOtHqQLcDX6yZRRR7j7U0FPFGRgXIcGeG', 'KMWcAliB3x8V43BS1yxtKRLZ8Yo7qN9xUsbnq5UFfcu7EfiBZhcU5b405wlB', '2016-11-18 20:25:04', '2016-11-20 21:47:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
