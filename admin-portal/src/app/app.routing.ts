import { AppointmentComponent } from './appointment/appointment.component';
import { LoginComponent } from './login/login.component';
import { PrimaryTransactionComponent } from './primary-transaction/primary-transaction.component';
import { SavingsTransactionComponent } from './savings-transaction/savings-transaction.component';
import { UserAccountComponent } from './user-account/user-account.component';
import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const appRoutes: Routes = [
  {
    path: '',
    redirectTo: '/login',
    pathMatch: 'full'
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'userAccount',
    component: UserAccountComponent
  },
  {
    path: 'primaryTransaction',
    component: PrimaryTransactionComponent
  },
  {
    path: 'primaryTransaction/:username',
    component: PrimaryTransactionComponent
  },
  {
    path: 'savingsTransaction/:username',
    component: SavingsTransactionComponent
  },
  {
    path: 'appointment',
    component: AppointmentComponent
  }
];

export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);
