import { Component } from '@angular/core';

@Component({
  selector: 'app-sign',
  templateUrl: './sign.component.html',
  styleUrl: './sign.component.css'
})
export class SignComponent {
  image= "C:\Users\GIGABYTE\Desktop\mon-projet\projet\src\assets\images\pr.jpeg";
 user: any= {
cin :"",
nom :"",
prenom :"",
email :"",
classes :"choose option",
filiere :"choose option"
  };
emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
password: string = '';
submitted= false;
  color: any = {
    nom: '',
    prenom: '',
    cin: '',
    email: '',
    password :'',
    classes : '',
    filiere :'',
  };
      update(form:any) {
    this.color.nom = this.user.nom ? 'success' : 'error';
    this.color.prenom = this.user.prenom ? 'success' : 'error';
    this.color.cin = this.user.cin.length >= 8 ? 'success' : 'error';
    this.color.email = this.user.email.includes('@') && this.user.email.includes('.') ? 'success' : 'error';
    this.color.password = this.password && this.password.match(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/) ? 'success' : 'error';
    this.color.classes = this.user.classes && this.user.classes !== 'choose option' ? 'success' : 'error';
    this.color.filiere = this.user.filiere && this.user.filiere !== 'choose option' ? 'success' : 'error';
  }

  getColor(control: string): string {
    return this.color[control] || '';
  
}

onSubmit(form: any) {
  if (form.valid) {
    this.submitted = true;

  } else {
    this.submitted = false;

}


}
}
