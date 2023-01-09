// ignore_for_file: use_build_context_synchronously, avoid_print, file_names
import 'package:coffeemondo/pantallas/HomePage.dart';
import 'package:coffeemondo/pantallas/Login_Registro/RegisterPage.dart';
import 'package:coffeemondo/pantallas/Login_Registro/Restablecer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controladoremail = TextEditingController();
  final TextEditingController _controladorcontrasena = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _controladoremail.text, password: _controladorcontrasena.text);
      print('Inicio de sesion satisfactorio.');
      // pushReplacement remplazará la pantalla actual en la pila de navegacion por la nueva pantalla,
      //lo que significa que el usuario no podra volver a la pantalla anterior al presionar el botón
      //"Atrás" en su dispositivo.
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No se ha encontrado un usuario asociado a este email.');
      } else if (e.code == 'wrong-password') {
        print('Contrasena incorrecta.');
      }
    }
  }

  Widget _correoElectronico(
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      // Estilos
      decoration: const InputDecoration(
        labelText: 'Ingresa tu correo electronico',
        labelStyle: TextStyle(color: Color.fromRGBO(121, 4, 211, 1)),
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget _contrasena(
    // Widget de TextField para contrasena
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      // Ocultar caracteres para contrasena
      obscureText: true,
      // Estilos
      decoration: const InputDecoration(
        // Placeholder
        labelText: 'Ingresa tu contrasena',
        labelStyle: TextStyle(color: Color.fromRGBO(121, 4, 211, 1)),
        // Borde de TextField
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget botonEntrar() {
    return ElevatedButton(
        onPressed: () {
          //VERIFICAR REGISTRO
          signInWithEmailAndPassword();
        },
        style: TextButton.styleFrom(
            backgroundColor: Colors.purple, foregroundColor: Colors.white),
        child: const Text('ENTRAR'));
  }

  Widget botonRegistrar() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            foregroundColor: Colors.purple),
        child: const Text('SOY NUEVO'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Ingresar'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Campos de correo y contrasena
              _correoElectronico(_controladoremail),
              _contrasena(_controladorcontrasena),
              botonEntrar(),
              botonRegistrar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: Text('Contrasena olvidada?'),
                      onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const RestablecerPage()),
                          ))
                ],
              )
            ],
          ),
        ));
  }
}
