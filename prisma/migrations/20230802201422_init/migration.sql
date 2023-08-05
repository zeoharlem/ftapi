/*
  Warnings:

  - You are about to drop the column `type` on the `SubCategory` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[title]` on the table `SubCategory` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `title` to the `SubCategory` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `SubCategory_type_key` ON `SubCategory`;

-- AlterTable
ALTER TABLE `SubCategory` DROP COLUMN `type`,
    ADD COLUMN `title` VARCHAR(255) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `SubCategory_title_key` ON `SubCategory`(`title`);
