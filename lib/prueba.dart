import 'package:flutter/material.dart';

class PruebaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: BackgroundAppBar(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(BackgroundAppBar oldClipper) => oldClipper != this;
}

class BackgroundButton extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(BackgroundAppBar oldClipper) => oldClipper != this;
}
