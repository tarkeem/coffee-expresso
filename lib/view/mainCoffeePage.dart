import 'package:coffee_expresso/view/coffeSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class mainCoffeePage extends StatelessWidget {
  const mainCoffeePage({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -20) {
            Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 600),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FadeTransition(
                    child: coffeeSc(),
                      opacity: animation.drive(Tween(begin: 0.0, end: 1.0))),
            ));
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromARGB(255, 202, 164, 114),
                      Colors.white
                    ])),
              ),
            ),
            Positioned(
                height: deviceSize.height * 0.4,
                top: deviceSize.height * 0.15,
                child: Image.asset('assets/images/coffeImage/7.png')),
            Positioned(
                height: deviceSize.height,
                bottom: -deviceSize.height * 0.4,
                child: Image.asset(
                  'assets/images/coffeImage/8.png',
                  fit: BoxFit.cover,
                )),
            Positioned(
                height: deviceSize.height,
                bottom: -deviceSize.height * 0.8,
                child: Image.asset(
                  'assets/images/coffeImage/1.png',
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
  }
}
