import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SignComponent } from './sign/sign.component';
import { YourAbsenceComponent } from './your-absence/your-absence.component';
import { LoginComponent } from './login/login.component';

const routes: Routes = [
  {path :'login',component :LoginComponent},
  {path :'sign', component: SignComponent },
  {path : 'your-absence',component : YourAbsenceComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
