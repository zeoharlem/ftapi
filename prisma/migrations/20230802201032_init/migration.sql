/*
  Warnings:

  - You are about to drop the column `type` on the `Category` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[title]` on the table `Category` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `title` to the `Category` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Category_type_key` ON `Category`;

-- AlterTable
ALTER TABLE `Category` DROP COLUMN `type`,
    ADD COLUMN `title` VARCHAR(255) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Category_title_key` ON `Category`(`title`);
