// ignore_for_file: use_build_context_synchronously, avoid_print, file_names
import 'package:coffeemondo/pantallas/HomePage.dart';
import 'package:coffeemondo/pantallas/Login_Registro/RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Autenticacion.dart';


class RestablecerPage extends StatefulWidget {
  const RestablecerPage({Key? key}) : super(key: key);

  @override
  State<RestablecerPage> createState() => _RestablecerPageState();
}

class _RestablecerPageState extends State<RestablecerPage> {
  String? errorMessage = '';
  bool isLogin = true;
  String correoElectronico = '';

  final TextEditingController _controladoremail = TextEditingController();
  

  Widget _correoElectronico(
    TextEditingController controller,
  ) {
    return TextField(
      onChanged: (value) {
        setState(() {
          correoElectronico = value;
        });
      },
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

  Widget botonRestablecer() {
    return ElevatedButton(
        onPressed: () async {
          //Enviar solicitud de restablecimiento
          await FirebaseAuth.instance.sendPasswordResetEmail(email: correoElectronico);
          Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(
            backgroundColor: Colors.purple, foregroundColor: Colors.white),
        child: const Text('Restablecer'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Restablecer Contraseña'),
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
              botonRestablecer(),
            ],
          ),
        ));
  }
}
