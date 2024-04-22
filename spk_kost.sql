/*
 Navicat Premium Data Transfer

 Source Server         : localhost_mysql
 Source Server Type    : MySQL
 Source Server Version : 100425
 Source Host           : localhost:3306
 Source Schema         : spk_kost

 Target Server Type    : MySQL
 Target Server Version : 100425
 File Encoding         : 65001

 Date: 01/03/2024 10:39:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alternatifs
-- ----------------------------
DROP TABLE IF EXISTS `alternatifs`;
CREATE TABLE `alternatifs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternatif` int NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alternatifs
-- ----------------------------
INSERT INTO `alternatifs` VALUES (24, '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', 1, 'Al Husna', '2024-02-22 03:56:57', '2024-02-22 03:56:57');
INSERT INTO `alternatifs` VALUES (25, '9b64d81c-641a-4468-8c3f-3652d5df711c', 2, 'Jl.Kp.Kokol Sukamulya', '2024-02-22 03:57:27', '2024-02-22 03:57:27');
INSERT INTO `alternatifs` VALUES (26, '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', 3, 'Jl.Kp.Tugu', '2024-02-22 03:57:49', '2024-02-22 03:57:49');
INSERT INTO `alternatifs` VALUES (27, '9b64d85e-822b-43ac-b515-f10f15999d2f', 4, 'Zaivera Kos', '2024-02-22 03:58:11', '2024-02-22 03:58:11');
INSERT INTO `alternatifs` VALUES (28, '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', 5, 'Jl.K.H.Uwoh Saripudin', '2024-02-22 03:58:40', '2024-02-22 03:58:40');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for kriterias
-- ----------------------------
DROP TABLE IF EXISTS `kriterias`;
CREATE TABLE `kriterias`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` int NOT NULL,
  `kriteria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `atribut` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` double(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kriterias
-- ----------------------------
INSERT INTO `kriterias` VALUES (22, '9b64d5d8-a3d5-4e1d-915d-2b73037f144b', 1, 'Harga', 'COST', 0.20, '2024-02-22 03:51:07', '2024-02-22 03:51:07');
INSERT INTO `kriterias` VALUES (23, '9b64d695-22be-48ea-8b4f-428fdfff9369', 2, 'Jenis Kost', 'BENEFIT', 0.10, '2024-02-22 03:53:11', '2024-02-22 03:53:11');
INSERT INTO `kriterias` VALUES (24, '9b64d6bd-0fce-4e0e-8eed-12c0d386ebfe', 3, 'Tipe Kamar', 'COST', 0.20, '2024-02-22 03:53:37', '2024-02-22 03:53:37');
INSERT INTO `kriterias` VALUES (25, '9b64d70c-4ad1-4d17-89f2-3c6777d5786c', 4, 'Fasilitas Umum', 'BENEFIT', 0.10, '2024-02-22 03:54:29', '2024-02-22 03:54:29');
INSERT INTO `kriterias` VALUES (26, '9b64d74d-affa-4104-9b3e-4be4720028e4', 5, 'Fasilitas Kamar', 'BENEFIT', 0.10, '2024-02-22 03:55:12', '2024-02-22 03:55:12');
INSERT INTO `kriterias` VALUES (27, '9b64d773-18b9-432d-8cc5-32a8d66c84be', 6, 'Fasilitas Parkir', 'BENEFIT', 0.10, '2024-02-22 03:55:36', '2024-02-22 03:55:36');
INSERT INTO `kriterias` VALUES (28, '9b64d79e-d60d-44ee-8433-acaf4f51819c', 7, 'Lokasi', 'BENEFIT', 0.10, '2024-02-22 03:56:05', '2024-02-22 03:56:05');
INSERT INTO `kriterias` VALUES (29, '9b64d7bd-9599-4015-a7ae-b511937f01bb', 8, 'Keamanan', 'BENEFIT', 0.10, '2024-02-22 03:56:25', '2024-02-22 03:56:25');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for perhitungan_mooras
-- ----------------------------
DROP TABLE IF EXISTS `perhitungan_mooras`;
CREATE TABLE `perhitungan_mooras`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternatif_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kriteria_uuid` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `perhitungan_mooras_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 175 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of perhitungan_mooras
-- ----------------------------
INSERT INTO `perhitungan_mooras` VALUES (135, '9b64d8a0-0813-4830-825d-5a989d133757', '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', '9b64d5d8-a3d5-4e1d-915d-2b73037f144b', '3', '2024-02-22 03:58:54', '2024-02-22 04:04:27');
INSERT INTO `perhitungan_mooras` VALUES (136, '9b64d8a0-0af5-49f5-bf46-ed082ef6ab7f', '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', '9b64d695-22be-48ea-8b4f-428fdfff9369', '4', '2024-02-22 03:58:54', '2024-02-22 04:04:32');
INSERT INTO `perhitungan_mooras` VALUES (137, '9b64d8a0-0b59-40a8-b66f-44f1edb33606', '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', '9b64d6bd-0fce-4e0e-8eed-12c0d386ebfe', '4', '2024-02-22 03:58:54', '2024-02-22 04:04:38');
INSERT INTO `perhitungan_mooras` VALUES (138, '9b64d8a0-0baa-487b-86c8-eda1b566dfce', '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', '9b64d70c-4ad1-4d17-89f2-3c6777d5786c', '4', '2024-02-22 03:58:54', '2024-02-22 04:04:46');
INSERT INTO `perhitungan_mooras` VALUES (139, '9b64d8a0-0c09-4114-9723-9f97a437a9b4', '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', '9b64d74d-affa-4104-9b3e-4be4720028e4', '4', '2024-02-22 03:58:54', '2024-02-22 04:04:52');
INSERT INTO `perhitungan_mooras` VALUES (140, '9b64d8a0-0c51-4f50-8af3-d6e84ac95418', '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', '9b64d773-18b9-432d-8cc5-32a8d66c84be', '2', '2024-02-22 03:58:54', '2024-02-22 04:05:23');
INSERT INTO `perhitungan_mooras` VALUES (141, '9b64d8a0-0ca2-4630-afae-447f55d62031', '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', '9b64d79e-d60d-44ee-8433-acaf4f51819c', '2', '2024-02-22 03:58:54', '2024-02-22 04:07:31');
INSERT INTO `perhitungan_mooras` VALUES (142, '9b64d8a0-0ce2-46b8-8bb3-c4fa6bb59c4b', '9b64d7ed-805d-43f6-a7e2-e4d9d34f3f9a', '9b64d7bd-9599-4015-a7ae-b511937f01bb', '2', '2024-02-22 03:58:54', '2024-02-22 04:07:58');
INSERT INTO `perhitungan_mooras` VALUES (143, '9b64d8a0-0d1f-444a-a927-1310297b8cfe', '9b64d81c-641a-4468-8c3f-3652d5df711c', '9b64d5d8-a3d5-4e1d-915d-2b73037f144b', '3', '2024-02-22 03:58:54', '2024-02-22 04:05:28');
INSERT INTO `perhitungan_mooras` VALUES (144, '9b64d8a0-0d5e-4244-a984-5c4c0d3f5b0b', '9b64d81c-641a-4468-8c3f-3652d5df711c', '9b64d695-22be-48ea-8b4f-428fdfff9369', '3', '2024-02-22 03:58:54', '2024-02-22 04:05:31');
INSERT INTO `perhitungan_mooras` VALUES (145, '9b64d8a0-0d9a-434d-89ab-f92ce46de162', '9b64d81c-641a-4468-8c3f-3652d5df711c', '9b64d6bd-0fce-4e0e-8eed-12c0d386ebfe', '4', '2024-02-22 03:58:54', '2024-02-22 04:05:35');
INSERT INTO `perhitungan_mooras` VALUES (146, '9b64d8a0-0dd7-45ef-b813-226c94784057', '9b64d81c-641a-4468-8c3f-3652d5df711c', '9b64d70c-4ad1-4d17-89f2-3c6777d5786c', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:25');
INSERT INTO `perhitungan_mooras` VALUES (147, '9b64d8a0-0e15-4602-8d02-b98340c93f32', '9b64d81c-641a-4468-8c3f-3652d5df711c', '9b64d74d-affa-4104-9b3e-4be4720028e4', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:44');
INSERT INTO `perhitungan_mooras` VALUES (148, '9b64d8a0-0e53-48cf-80a5-b4c2cc1100f9', '9b64d81c-641a-4468-8c3f-3652d5df711c', '9b64d773-18b9-432d-8cc5-32a8d66c84be', '2', '2024-02-22 03:58:54', '2024-02-22 04:07:01');
INSERT INTO `perhitungan_mooras` VALUES (149, '9b64d8a0-0e90-42b5-aae7-da54b2817613', '9b64d81c-641a-4468-8c3f-3652d5df711c', '9b64d79e-d60d-44ee-8433-acaf4f51819c', '1', '2024-02-22 03:58:54', '2024-02-22 04:07:35');
INSERT INTO `perhitungan_mooras` VALUES (150, '9b64d8a0-0ece-426b-8a6d-e788e85291da', '9b64d81c-641a-4468-8c3f-3652d5df711c', '9b64d7bd-9599-4015-a7ae-b511937f01bb', '2', '2024-02-22 03:58:54', '2024-02-22 04:08:02');
INSERT INTO `perhitungan_mooras` VALUES (151, '9b64d8a0-0f0c-4763-9c56-7f9a1b70c926', '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', '9b64d5d8-a3d5-4e1d-915d-2b73037f144b', '4', '2024-02-22 03:58:54', '2024-02-22 04:05:41');
INSERT INTO `perhitungan_mooras` VALUES (152, '9b64d8a0-0f4a-4150-b2e0-8334d199a191', '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', '9b64d695-22be-48ea-8b4f-428fdfff9369', '1', '2024-02-22 03:58:54', '2024-02-22 04:05:44');
INSERT INTO `perhitungan_mooras` VALUES (153, '9b64d8a0-0f87-4958-aa12-823061334235', '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', '9b64d6bd-0fce-4e0e-8eed-12c0d386ebfe', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:19');
INSERT INTO `perhitungan_mooras` VALUES (154, '9b64d8a0-0fc4-48bb-b255-b312164b22f4', '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', '9b64d70c-4ad1-4d17-89f2-3c6777d5786c', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:30');
INSERT INTO `perhitungan_mooras` VALUES (155, '9b64d8a0-1000-4b41-b7f3-d4f610200d39', '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', '9b64d74d-affa-4104-9b3e-4be4720028e4', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:48');
INSERT INTO `perhitungan_mooras` VALUES (156, '9b64d8a0-103a-4a93-bbb9-e69cfde17c37', '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', '9b64d773-18b9-432d-8cc5-32a8d66c84be', '2', '2024-02-22 03:58:54', '2024-02-22 04:07:03');
INSERT INTO `perhitungan_mooras` VALUES (157, '9b64d8a0-1077-49fa-a7ae-9b2bb654bf1f', '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', '9b64d79e-d60d-44ee-8433-acaf4f51819c', '2', '2024-02-22 03:58:54', '2024-02-22 04:07:38');
INSERT INTO `perhitungan_mooras` VALUES (158, '9b64d8a0-10b1-4b38-b11f-f3bc5435bed9', '9b64d83d-ac4d-4ed2-90f5-e40f06fcb17c', '9b64d7bd-9599-4015-a7ae-b511937f01bb', '2', '2024-02-22 03:58:54', '2024-02-22 04:08:05');
INSERT INTO `perhitungan_mooras` VALUES (159, '9b64d8a0-10ed-49b9-8f9d-6fc54088b5be', '9b64d85e-822b-43ac-b515-f10f15999d2f', '9b64d5d8-a3d5-4e1d-915d-2b73037f144b', '3', '2024-02-22 03:58:54', '2024-02-22 04:05:49');
INSERT INTO `perhitungan_mooras` VALUES (160, '9b64d8a0-1126-485b-b61b-1002f077977e', '9b64d85e-822b-43ac-b515-f10f15999d2f', '9b64d695-22be-48ea-8b4f-428fdfff9369', '3', '2024-02-22 03:58:54', '2024-02-22 04:05:58');
INSERT INTO `perhitungan_mooras` VALUES (161, '9b64d8a0-1162-43e4-af42-7b5f9469dde8', '9b64d85e-822b-43ac-b515-f10f15999d2f', '9b64d6bd-0fce-4e0e-8eed-12c0d386ebfe', '4', '2024-02-22 03:58:54', '2024-02-22 04:06:15');
INSERT INTO `perhitungan_mooras` VALUES (162, '9b64d8a0-119d-4767-a089-ee4b961892fd', '9b64d85e-822b-43ac-b515-f10f15999d2f', '9b64d70c-4ad1-4d17-89f2-3c6777d5786c', '3', '2024-02-22 03:58:54', '2024-02-22 04:12:42');
INSERT INTO `perhitungan_mooras` VALUES (163, '9b64d8a0-11d9-488b-b0e0-d05fe3d7efb6', '9b64d85e-822b-43ac-b515-f10f15999d2f', '9b64d74d-affa-4104-9b3e-4be4720028e4', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:52');
INSERT INTO `perhitungan_mooras` VALUES (164, '9b64d8a0-1213-4cce-ac59-4e8744879f0b', '9b64d85e-822b-43ac-b515-f10f15999d2f', '9b64d773-18b9-432d-8cc5-32a8d66c84be', '2', '2024-02-22 03:58:54', '2024-02-22 04:07:06');
INSERT INTO `perhitungan_mooras` VALUES (165, '9b64d8a0-124c-486e-bc6d-ed56589be4c1', '9b64d85e-822b-43ac-b515-f10f15999d2f', '9b64d79e-d60d-44ee-8433-acaf4f51819c', '2', '2024-02-22 03:58:54', '2024-02-22 04:07:41');
INSERT INTO `perhitungan_mooras` VALUES (166, '9b64d8a0-128a-4095-9edf-e67ee13d0958', '9b64d85e-822b-43ac-b515-f10f15999d2f', '9b64d7bd-9599-4015-a7ae-b511937f01bb', '2', '2024-02-22 03:58:54', '2024-02-22 04:08:08');
INSERT INTO `perhitungan_mooras` VALUES (167, '9b64d8a0-12c6-4f6f-8df2-a7446c606660', '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', '9b64d5d8-a3d5-4e1d-915d-2b73037f144b', '4', '2024-02-22 03:58:54', '2024-02-22 04:05:54');
INSERT INTO `perhitungan_mooras` VALUES (168, '9b64d8a0-1302-4917-96a3-5c3407517c78', '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', '9b64d695-22be-48ea-8b4f-428fdfff9369', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:03');
INSERT INTO `perhitungan_mooras` VALUES (169, '9b64d8a0-133e-4810-8588-71610fadf7f1', '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', '9b64d6bd-0fce-4e0e-8eed-12c0d386ebfe', '5', '2024-02-22 03:58:54', '2024-02-22 04:06:08');
INSERT INTO `perhitungan_mooras` VALUES (170, '9b64d8a0-137a-430a-a09f-00de0a28fd68', '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', '9b64d70c-4ad1-4d17-89f2-3c6777d5786c', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:38');
INSERT INTO `perhitungan_mooras` VALUES (171, '9b64d8a0-13b6-41ac-b8ac-4896b5f0dde1', '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', '9b64d74d-affa-4104-9b3e-4be4720028e4', '3', '2024-02-22 03:58:54', '2024-02-22 04:06:55');
INSERT INTO `perhitungan_mooras` VALUES (172, '9b64d8a0-13f1-4f3b-8a35-cdd6548dde9d', '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', '9b64d773-18b9-432d-8cc5-32a8d66c84be', '2', '2024-02-22 03:58:54', '2024-02-22 04:07:09');
INSERT INTO `perhitungan_mooras` VALUES (173, '9b64d8a0-142e-477d-a055-9f6a8567c1fe', '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', '9b64d79e-d60d-44ee-8433-acaf4f51819c', '1', '2024-02-22 03:58:54', '2024-02-22 04:07:44');
INSERT INTO `perhitungan_mooras` VALUES (174, '9b64d8a0-1469-43de-8cf9-09753ed5c057', '9b64d88b-ea31-4cf8-ac67-bc69bd9bf4a7', '9b64d7bd-9599-4015-a7ae-b511937f01bb', '2', '2024-02-22 03:58:54', '2024-02-22 04:08:11');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for sub_kriterias
-- ----------------------------
DROP TABLE IF EXISTS `sub_kriterias`;
CREATE TABLE `sub_kriterias`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kriteria_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_kriteria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sub_kriterias
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'Gian Sonia', 'giansonia', NULL, NULL, '$2y$12$bkpIeW1XwPQQf/DaG3BkIOG/T5oDDOPECyVDlAuatBDm8lK1PgXiK', 'ADMIN', NULL, '2024-01-26 17:47:46', '2024-01-26 17:47:46');
INSERT INTO `users` VALUES (3, 'Sipa Mawrah', 'sipaadmin', NULL, NULL, '$2y$12$BBv.FwluVorDq803.EI62uQiIfcic7GCn2EGPAYaD1LbZ1VFhKGmS', 'ADMIN', NULL, '2024-01-28 04:16:43', '2024-01-28 04:16:43');
INSERT INTO `users` VALUES (4, 'Dewi Septiani', 'dewi009', NULL, NULL, '$2y$12$T4VvKyzwINow/WkPFftw9uRDmmu/sURjnXG5u79q0nJ5nK/KxmN6u', 'USER', NULL, '2024-03-01 03:36:55', '2024-03-01 03:36:55');

SET FOREIGN_KEY_CHECKS = 1;
