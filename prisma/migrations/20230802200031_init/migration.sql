-- CreateTable
CREATE TABLE `FieldTypes` (
    `types` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `FieldTypes_types_key`(`types`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FormField` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NOT NULL,
    `value` VARCHAR(191) NULL,
    `title` VARCHAR(191) NOT NULL,
    `group_code` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `FormField_type_key`(`type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NOT NULL,
    `content_desc` TEXT NOT NULL,
    `status` ENUM('active', 'inactive') NOT NULL,
    `code` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Category_type_key`(`type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubCategory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NOT NULL,
    `content_desc` TEXT NULL,
    `status` VARCHAR(191) NOT NULL,
    `category_id` INTEGER NOT NULL,
    `priority` INTEGER NOT NULL,
    `is_optional` ENUM('true', 'false') NOT NULL,
    `group_code` VARCHAR(191) NOT NULL,
    `field_id` INTEGER NOT NULL,
    `cat_code` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `SubCategory_type_key`(`type`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SubCategory` ADD CONSTRAINT `SubCategory_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
