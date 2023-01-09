// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Si existe un usuario logeado, este asigna a currentUser la propiedad currentUser del Auth de FIREBASE
  User? get currentUser => _firebaseAuth.currentUser;

  // Metodo que devuelve un flujo de usuarios autenticados, escucha los cambios en el estado de autenticación del usuario en la app.
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Recuperar contrasena, tarea aun no implementada
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // Iniciar sesion con firebase
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // registrar con firebase
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Cerrar sesion
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
