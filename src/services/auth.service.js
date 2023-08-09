import axios from "axios";
const API_URL = "http://127.0.0.1:8080/api/user";

class AuthService {
  login() {}
  logout() {}
  register(username, email, password, role) {
    return axios.post(API_URL + "/register", {
      username,
      email,
      password,
      role,
    });
  }
}

export default new AuthService();
