import { Controller, Get } from '@nestjs/common';

@Controller()
export class AppController {
  @Get()
  getEnv(): string {
    return `Desplegado en entorno: ${process.env.NEST_ENV || 'no definido'}`;
  }
}
