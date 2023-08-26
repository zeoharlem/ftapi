import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthDto } from './dto';
import * as argon from 'argon2';
import { gender } from '@prisma/client';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';
import { LoginDto } from './dto/login.dto';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private jwt: JwtService,
    private config: ConfigService,
  ) {}

  async signup(dto: AuthDto) {
    const genderType = {
      type: dto.gender as gender,
    };

    const password = await argon.hash(dto.password);
    try {
      const user = await this.prisma.user.create({
        data: {
          email: dto.email,
          password,
          firstname: dto.firstname,
          lastname: dto.lastname,
          phone: dto.phone,
          gender: dto.gender,
        },
      });
      return this.generatedSignToken(user.id, user.email);
    } catch (error) {
      if (error instanceof PrismaClientKnownRequestError) {
        if (error.code === 'P2002') {
          throw new ForbiddenException('Credentials Taken');
        }
      }
      throw error;
    }
  }

  async signin(dto: LoginDto) {
    const user = await this.prisma.user.findUnique({
      where: {
        email: dto.email,
      },
    });
    if (!user) throw new ForbiddenException('Email not found');
    const pwMatches = await argon.verify(user.password, dto.password);
    if (!pwMatches) throw new ForbiddenException('Incorrect Password');

    delete user.password;
    return {
      user,
      accessToken: (await this.generatedSignToken(user.id, user.email))
        .accessToken,
    };
  }

  async generatedSignToken(
    userId: number,
    email: string,
  ): Promise<{ accessToken: string }> {
    const payloadData = {
      sub: userId,
      email,
    };

    const token = await this.jwt.signAsync(payloadData, {
      expiresIn: '30m',
      secret: this.config.get('JWT_SECRET'),
    });

    return {
      accessToken: token,
    };
  }
}
