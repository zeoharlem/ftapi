import { Controller, Get, Req, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { Request } from 'express';
import { JwtGuard } from 'src/auth/guard';

@Controller('category')
export class CategoryController {
  @UseGuards(JwtGuard)
  @Get()
  getCategory(@Req() req: Request) {
    console.log({
      users: req.user,
    });
    return 'list of categories';
  }
}
