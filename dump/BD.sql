-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-12-2023 a las 11:49:49
-- Versión del servidor: 8.0.35-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `redsocial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231102111524', '2023-11-02 12:15:31', 140),
('DoctrineMigrations\\Version20231108105704', '2023-11-08 11:58:36', 29),
('DoctrineMigrations\\Version20231129093421', '2023-11-29 10:34:58', 2062),
('DoctrineMigrations\\Version20231129103911', '2023-11-29 11:39:18', 1396),
('DoctrineMigrations\\Version20231129110339', '2023-11-29 12:03:43', 184),
('DoctrineMigrations\\Version20231130105506', '2023-11-30 11:55:39', 1416),
('DoctrineMigrations\\Version20231207120348', '2023-12-07 13:03:54', 46),
('DoctrineMigrations\\Version20231207121841', '2023-12-07 13:18:45', 149);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `like`
--

CREATE TABLE `like` (
  `id` int NOT NULL,
  `tweet_id` int NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `like`
--

INSERT INTO `like` (`id`, `tweet_id`, `date`, `user_id`) VALUES
(8, 1, '2023-11-29 12:20:57', 1),
(10, 2, '2023-11-29 12:23:17', 1),
(11, 3, '2023-11-29 12:23:36', 1),
(12, 4, '2023-11-29 12:39:38', 2),
(13, 5, '2023-11-29 12:47:08', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tweet`
--

CREATE TABLE `tweet` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `likes` int NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tweet`
--

INSERT INTO `tweet` (`id`, `user_id`, `content`, `image`, `likes`, `date`) VALUES
(1, 2, 'dfggdhf', 'landscape-654b70bb98b6d.jpg', 1, NULL),
(2, 2, '#hashtag hola adiós #has', NULL, 1, NULL),
(3, 2, '@mention\r\n[n](url) ##hashtag2', NULL, 1, NULL),
(4, 1, '@@mention\r\n[n](url) #hashtag', NULL, 1, NULL),
(5, 1, '@mention\r\n[n](url) #hashtag2 hola', NULL, 1, NULL),
(6, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras semper justo at nisl iaculis, nec luctus magna pharetra. Aliquam egestas lobortis erat. Nullam a lacinia orci. Vestibulum quis quam eget ipsum laoreet molestie quis ac mi. Donec ullamcorper quam leo, vitae egestas elit mattis eget. Donec mauris neque, sollicitudin a ex ac, sodales vestibulum elit. Nunc eleifend ullamcorper arcu, sit amet varius ligula. Sed vitae orci ultricies, ullamcorper ante in, feugiat felis. Curabitur est lorem, consectetur et rutrum vel, convallis ac nulla. Vivamus cursus quam augue, quis mattis nisi luctus blandit.\r\n\r\nAliquam erat volutpat. Quisque sed massa orci. Cras elementum nisi molestie pulvinar egestas. Duis consequat quam magna, non lobortis velit condimentum sit amet. Suspendisse in ornare libero, elementum tincidunt lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin vehicula tempus enim et porttitor. Vivamus sem justo, dictum eget volutpat vitae, malesuada imperdiet lacus. Duis ullamcorper aliquet risus vitae dignissim. Praesent viverra sodales lectus, sed molestie nunc volutpat non. Nullam maximus purus sit amet orci pellentesque, id commodo nisi vehicula. Ut ipsum justo, egestas id suscipit dictum, tempor eu nunc. Donec dictum finibus metus, sed convallis mauris finibus dictum. Morbi ornare ligula eget risus aliquam, quis condimentum tortor bibendum. Mauris nec justo eget nulla euismod malesuada ut sed mi.', 'landscape-6555fe34e5890.jpg', 1, NULL),
(7, 1, '@hola #txt #text2 @lucia', NULL, 3, NULL),
(8, 1, '[sdfds](sdfdvf)sfdsf[adf](sdf)', NULL, 0, NULL),
(9, 1, '[sdfds](sdfdvf)sfdsf[adf](sdf)', NULL, 2, NULL),
(16, 11, 'nuevo hola', NULL, 1, NULL),
(17, 11, 'lsvñlvfñl', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `email`, `avatar`, `full_name`) VALUES
(1, 'victor', '[]', '$2y$13$qzesFKpxLgohlb1r0FydM.k.MrOP986XOb.jOZRiX8IVlIryNRf3S', 'v@v.com', 'sdcfd', 'Víctor P.'),
(2, 'pepe', '[]', '$2y$13$Kou8GjuEdLc956JQel7n.ureQFlYlhBT9nfhdBrgGTvIsAjAaV3Yu', 'v2@v.com', 'landscape-654b66891fbaa.jpg', 'Pepe Pig'),
(11, 'v3', '[]', '$2y$13$CzMSqgszGhOVdFpJNL0fCOUbuDUfEGbwGtUZwKiurCTjthwQZSgIi', 'v3@v.com', '', 'Versión 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_user`
--

CREATE TABLE `user_user` (
  `user_source` int NOT NULL,
  `user_target` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_user`
--

INSERT INTO `user_user` (`user_source`, `user_target`) VALUES
(1, 2),
(2, 1),
(11, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AC6340B31041E39B` (`tweet_id`),
  ADD KEY `IDX_AC6340B3A76ED395` (`user_id`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indices de la tabla `tweet`
--
ALTER TABLE `tweet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3D660A3BA76ED395` (`user_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- Indices de la tabla `user_user`
--
ALTER TABLE `user_user`
  ADD PRIMARY KEY (`user_source`,`user_target`),
  ADD KEY `IDX_F7129A803AD8644E` (`user_source`),
  ADD KEY `IDX_F7129A80233D34C1` (`user_target`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `like`
--
ALTER TABLE `like`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tweet`
--
ALTER TABLE `tweet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `FK_AC6340B31041E39B` FOREIGN KEY (`tweet_id`) REFERENCES `tweet` (`id`),
  ADD CONSTRAINT `FK_AC6340B3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `tweet`
--
ALTER TABLE `tweet`
  ADD CONSTRAINT `FK_3D660A3BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user_user`
--
ALTER TABLE `user_user`
  ADD CONSTRAINT `FK_F7129A80233D34C1` FOREIGN KEY (`user_target`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F7129A803AD8644E` FOREIGN KEY (`user_source`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
