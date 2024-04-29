import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:drinkoo/main.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:drinkoo/view/widget/orderIcon.dart';
import '../model/coffe.dart';

class coffeeSc extends StatefulWidget {
  const coffeeSc({super.key});

  @override
  State<coffeeSc> createState() => _coffeeScState();
}

double initPage = 8.0;

class _coffeeScState extends State<coffeeSc>with SingleTickerProviderStateMixin {
  PageController _pageController =
      PageController(initialPage: initPage.toInt(), viewportFraction: 0.30);
      late AnimationController _animationController;

  double currentPage = initPage;
  int currentPageAsInt = initPage.toInt();

  get calculateCost {
    int cost = 0;
    orderCoffe.forEach((element) {
      cost += element.price;
    });
    return cost;
  }

  _coffeListener() {
    setState(() {
      currentPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(_coffeListener);
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 5));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.removeListener(_coffeListener);
    super.dispose();
  }

  List<coffee> orderCoffe = [];
  bool isSwaped = false;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.transparent.withOpacity(0)),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: deviceSize.height*0.1),
              child: DrinkInfo()),
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
                  onPageChanged: (value) {
                    if (value < coffee_Names.length) {
                      currentPageAsInt = value;
                    }
                  },
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox.shrink();
                    } else if (index == coffees.length + 1) {
                      return Image.asset(coffees[0].image);
                    } else {
                      coffee coffeeItem = coffees[index - 1];
                      var res = currentPage - index + 1;
                      var val = -0.4 * res + 1;
                      var opacityVal = (val + 0.07).clamp(0.0, 1.0);
                      if(index==10||index==11)
                      {
                         print('index $index res $res val $val  $opacityVal ');
                      }
                     

                      return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.02)
                            ..translate(
                                0.0,
                                (MediaQuery.of(context).size.height /
                                    2.2 *
                                    (1 - val).abs()),
                                0.0)
                            ..scale(val, val, val),
                          child: FittedBox(
                            child: Opacity(
                                opacity: opacityVal,
                                child: Hero(
                                    tag: coffeeItem.name,
                                    child: GestureDetector(
                                      onTap: () {
                                        for (coffee x in coffees) {
                                          print(x.image);
                                        }
                                        print(coffee_Names.length);
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
          AnimatedPositioned(
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 700),
              bottom: 0,
              left: 0,
              right: 0,
              height: isSwaped ? deviceSize.height * 0.6 : kToolbarHeight,
              child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      if (details.primaryDelta! <= 0) {
                        isSwaped = true;
                      } else {
                        isSwaped = false;
                      }
                    });
                  },
                  child: orderBottomBar(deviceSize)))
        ],
      ),
    );
  }

  Container orderBottomBar(Size deviceSize) {
    return Container(
      clipBehavior: Clip.none,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isSwaped) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    'Your Order: ',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'BloodySunday',
                        color: Colors.white),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...orderCoffe
                              .map((e) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      orderCoffe.removeAt(orderCoffe.indexOf(e));
                                    });
                                  },
                                  
                                    child: TweenAnimationBuilder(
                                      curve: Curves.bounceOut,
                                      duration: Duration(milliseconds: 700),
                                      tween: Tween<double>(begin: 1,end: 0),
                                      builder:(context, value, child) =>Transform.translate(
                                        offset: Offset(0, (-deviceSize.height/2)*value),
                                        child: orderIcon(e)))))
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '$calculateCost \$',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'BloodySunday',
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ] else ...[
            Expanded(
                child: ListView.builder(
              itemCount: orderCoffe.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    orderIcon(orderCoffe[index]),
                    Text(
                      '${orderCoffe[index].name}',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'BloodySunday',
                          color: Colors.white),
                    ),
                  ],
                );
              },
            )),
            GestureDetector(
              onTap: () {
                _animationController.forward().whenComplete(() {
                  orderCoffe.clear();
                  setState(() {
                    isSwaped=false;
                  });
                });
              },
              child: SizedBox(
                width: deviceSize.width*0.4,
                child: Lottie.asset('assets/cartbutton.json',controller:_animationController )))
          ],
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          gradient: RadialGradient(
              radius: 4,
              colors: [Color.fromARGB(255, 108, 28, 212), Colors.black])),
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
            key: Key(
                '${coffees[currentPageAsInt.clamp(0, coffees.length)].price}'),
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
            '${coffees[currentPageAsInt.clamp(0, coffees.length)].name}',
            style: TextStyle(
                fontFamily: 'BloodySunday',
                fontSize: 25,
                fontWeight: FontWeight.w700),
            key: Key(
                '${coffees[currentPageAsInt.clamp(0, coffees.length)].name}'),
          ),
        ),
      ],
    );
  }
}
