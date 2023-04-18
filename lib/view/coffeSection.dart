import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/view/widget/orderIcon.dart';
import '../model/coffe.dart';

class coffeeSc extends StatefulWidget {
  const coffeeSc({super.key});

  @override
  State<coffeeSc> createState() => _coffeeScState();
}

double initPage = 8.0;

class _coffeeScState extends State<coffeeSc> {
  PageController _pageController =
      PageController(initialPage: initPage.toInt(), viewportFraction: 0.30);

  double currentPage = initPage;
  int currentPageAsInt = initPage.toInt();
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
    super.dispose();
  }

  List<coffee> orderCoffe = [];
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent.withOpacity(0)),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: DrinkInfo(),
          ),
          /*Positioned(
              top: deviceSize.height * 0.7,
              left: deviceSize.width * 0.5 - 125,
              child: shadow()),*/
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
                    currentPageAsInt = index - 2;
                    if (index == 0) {
                      return SizedBox.shrink();
                    } else if (index == coffees.length + 1) {
                      _pageController.animateToPage(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                      return SizedBox.shrink();
                    } else {
                      coffee coffeeItem = coffees[index - 1];
                      var res = currentPage - index + 1;
                      var val = -0.4 * res + 1;
                      var opacityVal = (val + 0.3).clamp(0.0, 1.0);

                      print('$index $res  $val  $opacityVal ');

                      return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(
                                0.0,
                                (MediaQuery.of(context).size.height /
                                    2.6 *
                                    (1 - val).abs()),
                                0.0)
                            ..scale(val, val, val),
                          child: FittedBox(
                            child: Opacity(
                                opacity: opacityVal,
                                child: Hero(
                                    tag: coffeeItem.name,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          orderCoffe
                                              .add(coffees[currentPageAsInt]);
                                        });
                                      },
                                      child: Image.asset(
                                        coffeeItem.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ))),
                          ));
                    }
                  },
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: kToolbarHeight,
              child: Container(
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    Text(
                      'Your Order: ',
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'BloodySunday',color: Colors.white),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...orderCoffe.map((e) => orderIcon(e)).toList()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    gradient: RadialGradient(radius: 4, colors: [
                      Color.fromARGB(255, 108, 28, 212),
                      Colors.black
                    ])),
              ))
        ],
      ),
    );
  }

  Container shadow() {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.normal,
                spreadRadius: 10,
                color: Colors.black,
                blurRadius: 100)
          ],
          //color: Colors.red,

          shape: BoxShape.circle),

      //color: Color.fromARGB(255, 255, 255, 255)ARGB(255, 255, 255, 255),
    );
  }

  Column DrinkInfo() {
    return Column(
      children: [
        AnimatedSwitcher(
          switchInCurve: Curves.decelerate,
          duration: Duration(milliseconds: 700),
          transitionBuilder: (child, animation) => SlideTransition(
              child: child,
              position: animation
                  .drive(Tween(begin: Offset(8, 0), end: Offset(0, 0)))),
          child: Text(
            '${coffees[currentPageAsInt.clamp(0, coffees.length - 1)].price}\$',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                fontFamily: 'BloodySunday'),
            key: Key('${coffees[currentPageAsInt.clamp(0, 12)].price}'),
          ),
        ),
        AnimatedSwitcher(
          switchInCurve: Curves.decelerate,
          duration: Duration(milliseconds: 700),
          transitionBuilder: (child, animation) => SlideTransition(
              child: child,
              position: animation
                  .drive(Tween(begin: Offset(8, 0), end: Offset(0, 0)))),
          child: Text(
            '${coffees[currentPageAsInt.clamp(0, 12)].name}',
            style: TextStyle(fontFamily: 'BloodySunday',fontSize: 25, fontWeight: FontWeight.w700),
            key: Key('${coffees[currentPageAsInt.clamp(0, 12)].name}'),
          ),
        ),
      ],
    );
  }
}
