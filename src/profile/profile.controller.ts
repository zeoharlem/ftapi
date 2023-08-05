import { Controller, Get, Patch, UseGuards } from '@nestjs/common';
import { User } from '@prisma/client';
import { GetUser } from 'src/auth/decorator';
import { JwtGuard } from 'src/auth/guard';

@UseGuards(JwtGuard)
@Controller('profile')
export class ProfileController {
  @Get('me')
  getMyProfile(@GetUser() user: User) {
    return user;
  }

  @Patch()
  editMyProfile() {}
}
