import 'package:flutter/material.dart';
import 'package:tugasakhirssanber/auth/login.dart';
import 'package:tugasakhirssanber/auth/register.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/cat_icon3.png',
                    height: 330.0,
                    color: Colors.green.shade800,
                  ),
                  Text(
                    "CATPEDIA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green.shade800,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(70.0, 20.0, 70.0, 20.0),
                        primary: Colors.green.shade800,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '-or-',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
                        primary: Colors.grey,
                        side:
                            BorderSide(color: Colors.green.shade800, width: 3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/cat_icon2.png',
                  height: 40.0,
                  color: Colors.green.shade800,
                ),
                Image.asset(
                  'assets/img/cat_icon2.png',
                  color: Colors.green.shade800,
                  height: 40.0,
                ),
                Image.asset(
                  'assets/img/cat_icon2.png',
                  color: Colors.green.shade800,
                  height: 40.0,
                ),
                Image.asset(
                  'assets/img/cat_icon2.png',
                  color: Colors.green.shade800,
                  height: 40.0,
                ),
                Image.asset(
                  'assets/img/cat_icon2.png',
                  color: Colors.green.shade800,
                  height: 40.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
