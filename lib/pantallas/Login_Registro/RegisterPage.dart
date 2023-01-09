// ignore_for_file: use_build_context_synchronously, avoid_print, file_names
import 'package:coffeemondo/pantallas/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Autenticacion.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLogin = true;

  // Obtener los strings ingresados por el usuario para verificar su cuenta en firebase
  final TextEditingController _controladoremail = TextEditingController();
  final TextEditingController _controladorcumpleanos = TextEditingController();
  final TextEditingController _controladorcontrasena = TextEditingController();
  final TextEditingController _controladorconfirmarcontrasena = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        // Se utilizan los strings ingresados por el usuario para almacenar su email y contrasena en firebase auth
        email: _controladoremail.text,
        password: _controladorcontrasena.text,
      );
      print('Cuenta de usuario creada en FIREBASE satisfactoriamente.');
      // pushReplacement remplazará la pantalla actual en la pila de navegacion por la nueva pantalla, 
      //lo que significa que el usuario no podra volver a la pantalla anterior al presionar el botón 
      //"Atrás" en su dispositivo.
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Tu contrasena es muy debil.');
      } else if (e.code == 'email-already-in-use') {
        print('Este correo electronico ya esta registrado.');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _correoElectronico(
    // Widget de TextField para correo electronico
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      // Teclado con @ para ingresar correo
      keyboardType: TextInputType.emailAddress,
      // Estilos
      decoration: const InputDecoration(
        labelText: 'Ingresa tu correo electronico',
        labelStyle: TextStyle(color: Color.fromRGBO(121, 4, 211, 1)),
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget _cumpleanos(
    // Widget de TextField para correo electronico
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      // Teclado con @ para ingresar correo
      keyboardType: TextInputType.emailAddress,
      // Estilos
      decoration: const InputDecoration(
        labelText: 'Cumpleaños DD / MM / AA',
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

  Widget _confirmarContrasena(
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
        labelText: 'Ingresa nuevamente tu contrasena',
        labelStyle: TextStyle(color: Color.fromRGBO(121, 4, 211, 1)),
        // Borde de TextField
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget botonRegistrar() {
    return ElevatedButton(
        onPressed: () {
          //VERIFICAR REGISTRO
          createUserWithEmailAndPassword();
        },
        style: TextButton.styleFrom(
            backgroundColor: Colors.purple, foregroundColor: Colors.white),
        child: const Text('REGISTRARME'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrarse'),
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
              _cumpleanos(_controladorcumpleanos),
              _contrasena(_controladorcontrasena),
              _confirmarContrasena(_controladorconfirmarcontrasena),
              botonRegistrar()
            ],
          ),
        ));
  }
}
