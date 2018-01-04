import { HttpHeaders } from '@angular/common/http';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable()
export class LoginService {

  constructor (private http: HttpClient) {}

  sendCredential(username: string, password: string) {
    const url = 'http://localhost:8080/index';
    const params = 'username=' + username + '&password=' + password;
    const headers = new HttpHeaders(
    {
      'Content-Type': 'application/x-www-form-urlencoded'
      // 'Access-Control-Allow-Credentials' : true
    });
    return this.http.post(url, params, {headers: headers, withCredentials : true, responseType: 'text'});
  }

  logout() {
     const url = 'http://localhost:8080/logout';
     return this.http.get(url, { withCredentials: true });
   }

}
