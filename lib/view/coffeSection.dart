import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:coffee_expresso/model/coffe.dart';

class coffeeSc extends StatefulWidget {
  const coffeeSc({super.key});

  @override
  State<coffeeSc> createState() => _coffeeScState();
}

class _coffeeScState extends State<coffeeSc> {
  PageController _pageController = PageController(viewportFraction: 0.30);

  double currentPage = 0.0;
  int currentPageAsInt = 0;
  _coffeListener() {
    setState(() {
      currentPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(_coffeListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.removeListener(_coffeListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 700),
                  transitionBuilder: (child, animation) => FadeTransition(
                      child: child,
                      opacity: animation.drive(Tween(begin: 0.0, end: 1.0))),
                  child: Text(
                    '${coffees[currentPageAsInt].price}\$',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    key: Key('${coffees[currentPageAsInt].price}'),
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 700),
                  transitionBuilder: (child, animation) => FadeTransition(
                      child: child,
                      opacity: animation.drive(Tween(begin: 0.0, end: 1.0))),
                  child: Text(
                    '${coffees[currentPageAsInt].name}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    key: Key('${coffees[currentPageAsInt].name}'),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 400,
              left: 130,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 0,
                          color: Colors.black,
                          blurRadius: 100)
                    ],
                    //color: Colors.red,

                    shape: BoxShape.circle),

                //color: Color.fromARGB(255, 255, 255, 255)ARGB(255, 255, 255, 255),
              )),
          Positioned(
            child: Container(
              //color: Colors.red,
              child: Transform.scale(
                scale: 1.6,
                alignment: Alignment.bottomCenter,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: coffees.length + 1,
                  itemBuilder: (context, index) {
                    currentPageAsInt = index;
                    if (index == 0) {
                      return SizedBox.shrink();
                    }
                    coffee coffeeItem = coffees[index - 1];
                    var res = currentPage - index + 1;
                    var val = -0.4 * res + 1;
                    var opacityVal = val.clamp(0.0, 1.0);
                    return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..translate(
                              0.0,
                              MediaQuery.of(context).size.height /
                                  2.6 *
                                  (1 - val).abs())
                          ..scale(val),
                        child: Opacity(
                            opacity: opacityVal,
                            child: Image.asset(coffeeItem.image)));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
