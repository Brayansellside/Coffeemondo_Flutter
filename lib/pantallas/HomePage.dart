// ignore_for_file: file_names, avoid_print

import 'package:coffeemondo/pantallas/Login_Registro/CambiarContrasena.dart';
import 'package:coffeemondo/pantallas/Login_Registro/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Autenticacion.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  

  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {

  Future<void> cerrarSesion() async {
    await Auth().signOut();
    print('Usuario ha cerrado sesion');
  }


  Widget botonCerrarSesion() {
    // Widget ElevatedButton para cerrar sesion
    return ElevatedButton(
      // Al presionar este ejecuta el cierre de sesion Auth().signOut()
      onPressed: () => [cerrarSesion(),Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  const LoginPage()))],
      child: const Text('Cerrar sesion'),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Cierra la aplicación
        SystemNavigator.pop();
        return false;
      },
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Menu'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              botonCerrarSesion()
            ],
          ),
        ),
    ));
  }
}

// IMPLEMENTAR BOTON DE CERRAR SESION
// IMPLEMENTAR BOTON DE CERRAR SESION
// IMPLEMENTAR BOTON DE CERRAR SESION
// IMPLEMENTAR BOTON DE CERRAR SESION
// IMPLEMENTAR BOTON DE CERRAR SESION
// IMPLEMENTAR BOTON DE CERRAR SESION
// IMPLEMENTAR BOTON DE CERRAR SESION
// IMPLEMENTAR BOTON DE CERRAR SESION



