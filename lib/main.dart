import 'package:coffeemondo/prueba.dart';
import 'package:flutter/material.dart';
import 'package:coffeemondo/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'login app',
        home: Scaffold(
          appBar: AppBarcustom(),
          body: Center(
            child: CustomButton(),
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 50,
          child: CustomPaint(
            painter: BackgroundButton(),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              child: Center(
                child: Text(
                  'Presiona aquí',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundButton extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Color color1 = Color.fromRGBO(81, 0, 155, 1.0);
    Color color2 = Color.fromARGB(255, 43, 0, 83);

    final LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [color1, color2]);

    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    var path = Path();
    path.lineTo(size.width - 290, size.height - 10);
    path.lineTo(size.width - 10, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class AppBarcustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ClipPath(
        clipper: BackgroundAppBar(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 207, 111, 55), Color(0xFFF6EFE9)]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Text('Inicio'),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}

class BackgroundAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(BackgroundAppBar oldClipper) => oldClipper != this;
}
