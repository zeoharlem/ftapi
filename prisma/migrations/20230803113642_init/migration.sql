/*
  Warnings:

  - The values [active,inactive] on the enum `Category_status` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterTable
ALTER TABLE `Category` MODIFY `status` ENUM('Active', 'Inactive') NOT NULL;
