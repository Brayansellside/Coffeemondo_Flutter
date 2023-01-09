import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  bool _obscureText = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login de Usuario'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/usuario.png'),
                ),
              )),
          Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Usuario',
                    hintText: 'Escriba su nombre de Usuario'),
              )),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Contraseña',
                hintText: 'Escriba su Contraseña',
              ),
              obscureText: _obscureText,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 50, right: 10),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
                child: Text('Ingresar'),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
