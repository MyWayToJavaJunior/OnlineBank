import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';


@Injectable()
export class UserService {

  constructor (private http: HttpClient) {}

  getUsers() {
    const url = 'http://localhost:8080/api/user/all';
    return this.http.get(url, { withCredentials: true });
  }

   getPrimaryTransactionList(username: string) {
    const url = 'http://localhost:8080/api/user/primary/transaction?username=' + username;
    return this.http.get(url, { withCredentials: true });
   }

   getSavingsTransactionList(username: string) {
    const url = 'http://localhost:8080/api/user/savings/transaction?username=' + username;
    return this.http.get(url, { withCredentials: true });
   }

   enableUser (username: string) {
     const url = 'http://localhost:8080/api/user/' + username + '/enable';
     return this.http.get(url, { withCredentials: true });
   }

   disableUser (username: string) {
     const url = 'http://localhost:8080/api/user/' + username + '/disable';
     return this.http.get(url, { withCredentials: true });
   }

}
