import 'package:drinkoo/model/coffe.dart';
import 'package:drinkoo/view/coffeSection.dart';
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
          if (details.primaryDelta! < -10) {
            Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 800),
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
                top: deviceSize.height * 0.3,
                child: Hero(
                  tag: coffees[6].name,
                  child:
                    Image.asset(coffees[6].image,),)),
            Positioned(
                height: deviceSize.height,
                bottom: -deviceSize.height * 0.4,
                width: deviceSize.width*0.9,
                child: Hero(
                  tag:coffees[7].name,
                  child: Image.asset(
                    coffees[7].image,
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
                height: deviceSize.height,
                bottom: -deviceSize.height * 0.8,
                child: Hero(
                  tag: coffees[8].name,
                  child: Image.asset(
                    coffees[8].image,
                    fit: BoxFit.cover,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
