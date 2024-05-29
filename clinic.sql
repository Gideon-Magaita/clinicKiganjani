-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 12:36 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('10e78fadf693f815ad7a60460668f35522f3f111', '2024-05-28 09:16:35.340360', 4),
('19f2560d2a05e9828527d526e8e5853fd1f4f7f4', '2024-05-29 07:02:17.159317', 6),
('9e66a8116926d2b6678be0dd813219814178269b', '2024-05-28 09:17:07.354563', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add education', 7, 'add_education'),
(26, 'Can change education', 7, 'change_education'),
(27, 'Can delete education', 7, 'delete_education'),
(28, 'Can view education', 7, 'view_education'),
(29, 'Can add vaccine', 8, 'add_vaccine'),
(30, 'Can change vaccine', 8, 'change_vaccine'),
(31, 'Can delete vaccine', 8, 'delete_vaccine'),
(32, 'Can view vaccine', 8, 'view_vaccine'),
(33, 'Can add immunity', 9, 'add_immunity'),
(34, 'Can change immunity', 9, 'change_immunity'),
(35, 'Can delete immunity', 9, 'delete_immunity'),
(36, 'Can view immunity', 9, 'view_immunity'),
(37, 'Can add health', 10, 'add_health'),
(38, 'Can change health', 10, 'change_health'),
(39, 'Can delete health', 10, 'delete_health'),
(40, 'Can view health', 10, 'view_health'),
(41, 'Can add clinic card', 11, 'add_cliniccard'),
(42, 'Can change clinic card', 11, 'change_cliniccard'),
(43, 'Can delete clinic card', 11, 'delete_cliniccard'),
(44, 'Can view clinic card', 11, 'view_cliniccard'),
(45, 'Can add Token', 12, 'add_token'),
(46, 'Can change Token', 12, 'change_token'),
(47, 'Can delete Token', 12, 'delete_token'),
(48, 'Can view Token', 12, 'view_token'),
(49, 'Can add token', 13, 'add_tokenproxy'),
(50, 'Can change token', 13, 'change_tokenproxy'),
(51, 'Can delete token', 13, 'delete_tokenproxy'),
(52, 'Can view token', 13, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-05-28 08:57:23.716837', '1', 'users', 1, '[{\"added\": {}}]', 3, 1),
(2, '2024-05-28 09:05:57.413369', '2', '8fb72a5e9d0584e99018521009dc3df61d1abb28', 3, '', 13, 1),
(3, '2024-05-28 09:06:53.407870', '3', 'parent', 1, '[{\"added\": {}}]', 6, 1),
(4, '2024-05-28 09:08:25.780450', '3', 'parent', 2, '[]', 6, 1),
(5, '2024-05-28 09:08:33.411412', '3', 'parent', 2, '[]', 6, 1),
(6, '2024-05-28 09:08:37.014534', '3', '51f621fc1d11ec013e2a4968a828d08378a59f34', 1, '[{\"added\": {}}]', 13, 1),
(7, '2024-05-28 09:10:16.452188', '4', 'Parent1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(8, '2024-05-29 06:58:21.483854', '2', 'User1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(9, '2024-05-29 06:58:31.973112', '2', 'User1', 2, '[]', 6, 1),
(10, '2024-05-29 07:01:15.126913', '5', 'f836c94a08b24c805d3171166a1136ca62ff5992', 3, '', 13, 1),
(11, '2024-05-29 07:01:18.939797', '3', '51f621fc1d11ec013e2a4968a828d08378a59f34', 3, '', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(12, 'authtoken', 'token'),
(13, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(11, 'mainapp', 'cliniccard'),
(6, 'mainapp', 'customuser'),
(7, 'mainapp', 'education'),
(10, 'mainapp', 'health'),
(9, 'mainapp', 'immunity'),
(8, 'mainapp', 'vaccine'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-28 08:36:38.668128'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-05-28 08:36:39.357927'),
(3, 'auth', '0001_initial', '2024-05-28 08:36:43.678536'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-05-28 08:36:45.024505'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-05-28 08:36:45.070505'),
(6, 'auth', '0004_alter_user_username_opts', '2024-05-28 08:36:45.104504'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-05-28 08:36:45.138259'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-05-28 08:36:45.168622'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-05-28 08:36:45.207988'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-05-28 08:36:45.243800'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-05-28 08:36:45.278673'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-05-28 08:36:45.468920'),
(13, 'auth', '0011_update_proxy_permissions', '2024-05-28 08:36:45.529954'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-05-28 08:36:45.563921'),
(15, 'mainapp', '0001_initial', '2024-05-28 08:37:02.180343'),
(16, 'admin', '0001_initial', '2024-05-28 08:37:04.804792'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-05-28 08:37:04.888792'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-28 08:37:05.023791'),
(19, 'authtoken', '0001_initial', '2024-05-28 08:37:06.327755'),
(20, 'authtoken', '0002_auto_20160226_1747', '2024-05-28 08:37:06.479635'),
(21, 'authtoken', '0003_tokenproxy', '2024-05-28 08:37:06.538670'),
(22, 'sessions', '0001_initial', '2024-05-28 08:37:07.308073'),
(23, 'mainapp', '0002_remove_vaccine_user', '2024-05-28 09:14:05.166417');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hzvo93k58jm0oagvrp8pzlyjwbkw59qp', '.eJxVjMsOwiAQRf-FtSEDgzxcuu83EB6DVA0kpV0Z_12bdKHbe865L-bDtla_DVr8nNmFaXb63WJID2o7yPfQbp2n3tZljnxX-EEHn3qm5_Vw_w5qGPVbYwENFlIAMK5oiYHQKieJEIyKSPacwWhRwBEqqbVV0VmhSEiXSRT2_gC5cza9:1sCFJ2:jaDiOWZbbyl5C73YvKpIs1a2sLX5Q9-pRJdUSvdcPnY', '2024-06-12 09:09:12.402070'),
('r4uf6x4a4bpqasaskusmpv1wlfpq5gjb', '.eJxVjEEOwiAURO_C2hCU_21x6d4zkIEPUjU0Ke3KeHfbpAvdzntv3spjmYtfWpr8IOqiSB1-t4D4THUD8kC9jzqOdZ6GoDdF77Tp2yjpdd3dv4OCVtY6ZhMBK5xNEiEjfXCODdE5dpId-ERHONuTo7w6sGBiA3Kd5QiC-nwB_l03_g:1sBym0:G_cBb8h1efpGA0eykBrKBg_hwaT5k2IvjKtDUzfb3JE', '2024-06-11 15:30:00.464784');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_cliniccard`
--

CREATE TABLE `mainapp_cliniccard` (
  `id` bigint(20) NOT NULL,
  `jina_la_clinic` varchar(200) NOT NULL,
  `jina_la_mama` varchar(200) NOT NULL,
  `umri_wa_mama` int(11) NOT NULL,
  `elimu_ya_mama` varchar(200) NOT NULL,
  `kazi_ya_mama` varchar(200) NOT NULL,
  `urefu_wa_mama` decimal(10,1) NOT NULL,
  `mimba_ya_ngapi` varchar(200) NOT NULL,
  `amezaa_mara_ngapi` varchar(200) NOT NULL,
  `watoto_walio_hai` varchar(200) NOT NULL,
  `jina_la_mume` varchar(200) NOT NULL,
  `umri_wa_mume` varchar(200) NOT NULL,
  `elimu_ya_mume` varchar(200) NOT NULL,
  `urefu_wa_mume` decimal(10,1) NOT NULL,
  `kazi_ya_mume` varchar(200) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_cliniccard`
--

INSERT INTO `mainapp_cliniccard` (`id`, `jina_la_clinic`, `jina_la_mama`, `umri_wa_mama`, `elimu_ya_mama`, `kazi_ya_mama`, `urefu_wa_mama`, `mimba_ya_ngapi`, `amezaa_mara_ngapi`, `watoto_walio_hai`, `jina_la_mume`, `umri_wa_mume`, `elimu_ya_mume`, `urefu_wa_mume`, `kazi_ya_mume`, `user_id`) VALUES
(1, 'Mloganzila', 'Ashura', 20, 'secondary', 'Mama wa nyumbani', '5.5', '1', '0', '0', 'Shaban', '32', 'secondary', '5.6', 'Programmer', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_customuser`
--

CREATE TABLE `mainapp_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_customuser`
--

INSERT INTO `mainapp_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$OEqkY0ZNG0Avx8kyh4B4R7$o/XUh19BLV82GmwC3S4e/Lfm1moRUxMMn8nrTNCcs+Y=', '2024-05-29 07:25:43.903011', 1, 'admin', '', '', '', 1, 1, '2024-05-28 08:37:33.033913'),
(2, 'pbkdf2_sha256$390000$zERuBcK0GLnUPVOU1dNjr1$ZLKv3xxVlwtLolb7f2Cf4y6Fi61R0jzw02PL2xRGHR4=', '2024-05-29 06:58:51.778577', 0, 'User1', '', '', '', 0, 1, '2024-05-28 08:42:09.000000'),
(3, '12345', '2024-05-28 09:06:18.000000', 0, 'parent', '', '', '', 0, 1, '2024-05-28 09:06:02.000000'),
(4, 'pbkdf2_sha256$390000$dJBxbJE6F4UZJ0VNUro2vK$Sg1dzZPacABOF1d6HFxJ2sCaoqHC32MJexI84/gRGws=', '2024-05-29 07:27:17.968338', 0, 'Parent1', '', '', '', 0, 1, '2024-05-28 09:09:41.000000'),
(5, 'pbkdf2_sha256$390000$i0HgKavzy6zC0VdWikq94d$HOHLh0Ziowq/U1bLc41YvXCslG4NWp3Uoiq+LLbcw8Y=', '2024-05-28 12:17:29.923531', 0, 'Username', '', '', '', 0, 1, '2024-05-28 12:10:57.202933'),
(6, 'pbkdf2_sha256$390000$xYvtTuIOgXZ5etV4sy2X6r$kXYlcJBuddJmHGgQg6hIJjNnxR64Lv+sg98bAzho3po=', '2024-05-29 09:09:11.879316', 0, 'User2', '', '', '', 0, 1, '2024-05-29 07:01:44.358533');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_customuser_groups`
--

CREATE TABLE `mainapp_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_customuser_groups`
--

INSERT INTO `mainapp_customuser_groups` (`id`, `customuser_id`, `group_id`) VALUES
(4, 2, 1),
(1, 3, 1),
(2, 4, 1),
(3, 5, 1),
(5, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_customuser_user_permissions`
--

CREATE TABLE `mainapp_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_education`
--

CREATE TABLE `mainapp_education` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_education`
--

INSERT INTO `mainapp_education` (`id`, `title`, `file`, `message`, `date`) VALUES
(1, 'UMUHIMU WA CHANJO KWA MTOTO', 'images/Fever_Hero.png_dCjyRAP.png', 'Fahamu umuhimu wa chanjo kwa mtoto pamoja na madhara ya kutopata chanjo kwa mtoto mchanga.', '2024-05-28'),
(2, 'Kutoa Huduma ya Utunzaji Maalum katika Ujauzito', 'images/operation-1807543_1920.jpg', 'Katika sehemu ya 1 ya Moduli Utunzaji katika Ujauzito, umejifunza kimsingi kuhusu muundo wa kimaumbile wa mfumo wa uzazi wa mwanadamu na jinsi unavyofanya kazi, awamu za kawaida za ujauzito na mabadiliko ya kuwezesha kubeba mimba, uchunguzi wa kijumla kuhusu jinsi mimba inavyoendelea na jinsi ya kutambua matatizo madogo.', '2024-05-29'),
(3, 'Dhana na kanuni za utunzaji maalum katika ujauzito', 'images/breadcrumb_0Tw1Usp.png', 'Kusudi la utunzaji maalum katika ujauzito ni kukuza afya ya kina mama na watoto wao kupitia ukaguzi uliolengwa kwa wanawake wajawazito ili kusaidia', '2024-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_health`
--

CREATE TABLE `mainapp_health` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `mothers_weight` double NOT NULL,
  `pregnant_status` varchar(200) NOT NULL,
  `pregnant_duration` varchar(200) NOT NULL,
  `blood_preasure` varchar(200) NOT NULL,
  `child_position` varchar(200) NOT NULL,
  `other` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_health`
--

INSERT INTO `mainapp_health` (`id`, `full_name`, `mothers_weight`, `pregnant_status`, `pregnant_duration`, `blood_preasure`, `child_position`, `other`, `user_id`) VALUES
(1, 'Daudi Mwanihima', 89, 'good', '8months', '10/bdp', 'vertically aligned', 'No other commentss', 4),
(2, 'sample name', 40, 'Well and Good', '2 weeks', '7/bpf', 'Horizontally Positioned', 'No comment', 6);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_immunity`
--

CREATE TABLE `mainapp_immunity` (
  `id` bigint(20) NOT NULL,
  `hospital_name` varchar(200) NOT NULL,
  `childs_name` varchar(200) NOT NULL,
  `vaccine_date` date NOT NULL,
  `return_date` date NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `vaccine_name_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_immunity`
--

INSERT INTO `mainapp_immunity` (`id`, `hospital_name`, `childs_name`, `vaccine_date`, `return_date`, `comment`, `user_id`, `vaccine_name_id`) VALUES
(1, 'Mhimbili', 'child', '2024-05-28', '2024-05-28', 'No commentsss', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_vaccine`
--

CREATE TABLE `mainapp_vaccine` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_vaccine`
--

INSERT INTO `mainapp_vaccine` (`id`, `name`) VALUES
(1, 'polio'),
(2, 'Pepopunda');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_mainapp_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mainapp_cliniccard`
--
ALTER TABLE `mainapp_cliniccard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_cliniccard_user_id_2d0541fd_fk_mainapp_customuser_id` (`user_id`);

--
-- Indexes for table `mainapp_customuser`
--
ALTER TABLE `mainapp_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `mainapp_customuser_groups`
--
ALTER TABLE `mainapp_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mainapp_customuser_groups_customuser_id_group_id_fe5f27ce_uniq` (`customuser_id`,`group_id`),
  ADD KEY `mainapp_customuser_groups_group_id_9be036b5_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `mainapp_customuser_user_permissions`
--
ALTER TABLE `mainapp_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mainapp_customuser_user__customuser_id_permission_a60f8d1e_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `mainapp_customuser_u_permission_id_e9e26072_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `mainapp_education`
--
ALTER TABLE `mainapp_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mainapp_health`
--
ALTER TABLE `mainapp_health`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_health_user_id_901d8052_fk_mainapp_customuser_id` (`user_id`);

--
-- Indexes for table `mainapp_immunity`
--
ALTER TABLE `mainapp_immunity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_immunity_user_id_da9a306e_fk_mainapp_customuser_id` (`user_id`),
  ADD KEY `mainapp_immunity_vaccine_name_id_d9b3fb43_fk_mainapp_vaccine_id` (`vaccine_name_id`);

--
-- Indexes for table `mainapp_vaccine`
--
ALTER TABLE `mainapp_vaccine`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `mainapp_cliniccard`
--
ALTER TABLE `mainapp_cliniccard`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mainapp_customuser`
--
ALTER TABLE `mainapp_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mainapp_customuser_groups`
--
ALTER TABLE `mainapp_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mainapp_customuser_user_permissions`
--
ALTER TABLE `mainapp_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mainapp_education`
--
ALTER TABLE `mainapp_education`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mainapp_health`
--
ALTER TABLE `mainapp_health`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mainapp_immunity`
--
ALTER TABLE `mainapp_immunity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mainapp_vaccine`
--
ALTER TABLE `mainapp_vaccine`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_mainapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `mainapp_customuser` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_mainapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `mainapp_customuser` (`id`);

--
-- Constraints for table `mainapp_cliniccard`
--
ALTER TABLE `mainapp_cliniccard`
  ADD CONSTRAINT `mainapp_cliniccard_user_id_2d0541fd_fk_mainapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `mainapp_customuser` (`id`);

--
-- Constraints for table `mainapp_customuser_groups`
--
ALTER TABLE `mainapp_customuser_groups`
  ADD CONSTRAINT `mainapp_customuser_g_customuser_id_64c78a74_fk_mainapp_c` FOREIGN KEY (`customuser_id`) REFERENCES `mainapp_customuser` (`id`),
  ADD CONSTRAINT `mainapp_customuser_groups_group_id_9be036b5_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `mainapp_customuser_user_permissions`
--
ALTER TABLE `mainapp_customuser_user_permissions`
  ADD CONSTRAINT `mainapp_customuser_u_customuser_id_5f3b32d3_fk_mainapp_c` FOREIGN KEY (`customuser_id`) REFERENCES `mainapp_customuser` (`id`),
  ADD CONSTRAINT `mainapp_customuser_u_permission_id_e9e26072_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `mainapp_health`
--
ALTER TABLE `mainapp_health`
  ADD CONSTRAINT `mainapp_health_user_id_901d8052_fk_mainapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `mainapp_customuser` (`id`);

--
-- Constraints for table `mainapp_immunity`
--
ALTER TABLE `mainapp_immunity`
  ADD CONSTRAINT `mainapp_immunity_user_id_da9a306e_fk_mainapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `mainapp_customuser` (`id`),
  ADD CONSTRAINT `mainapp_immunity_vaccine_name_id_d9b3fb43_fk_mainapp_vaccine_id` FOREIGN KEY (`vaccine_name_id`) REFERENCES `mainapp_vaccine` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
