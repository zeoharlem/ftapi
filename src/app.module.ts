import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { FormModule } from './form/form.module';
import { CategoryModule } from './category/category.module';
import { TestsModule } from './tests/tests.module';
import { BookingsModule } from './bookings/bookings.module';
import { ProfileModule } from './profile/profile.module';
import { PrismaModule } from './prisma/prisma.module';
import { UserModule } from './user/user.module';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    AuthModule,
    FormModule,
    CategoryModule,
    TestsModule,
    BookingsModule,
    ProfileModule,
    PrismaModule,
    UserModule,
  ],
})
export class AppModule {}
