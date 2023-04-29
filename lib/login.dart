import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:hub/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  login(BuildContext context, String token) {
    Authentication auth = Authentication.withToken(token);
    GitHub github = GitHub(auth: auth);
    github.users.getCurrentUser().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return HomePage(github: github);
      }));
    }).onError((error, stackTrace) {
      showDialog(
          context: context,
          builder: (ctx) {
            return const AlertDialog(
              backgroundColor: Colors.red,
              title: Center(child: Text("登录失败")),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: 280,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "github token",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 50,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  login(context, password.text);
                },
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  height: 45,
                  child: const Center(
                      child: Text(
                    '登录',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
