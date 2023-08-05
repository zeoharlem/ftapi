/*
  Warnings:

  - The values [male,female] on the enum `Users_gender` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterTable
ALTER TABLE `Users` MODIFY `gender` ENUM('MALE', 'FEMALE') NOT NULL;
