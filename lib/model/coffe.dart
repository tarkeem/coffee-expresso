import 'dart:math';

class coffee {
  String name;
  int price;
  String image;
  coffee(this.name, this.image, this.price);
}

List coffee_Names = [
  'Caramel Macchiato',
  'Milk Matcha',
  'Caramel Cold Drink',
  'Iced Coffe Mocha',
  'Caramelized Pecan Latte',
  'Toffee Nut Latte',
  'Capuchino',
  'Toffee Nut Iced Latte',
  'Americano',
  'Vietnamese',
  'Style_Iced Coffee',
  'Vodka',
  'Fresh Apple Juice',
  'Fresh Mango juice',
  'Pink Coctail',
  'Coca',
  'Chrismas Coctail',
  'De Vo Coctail',
  'La Pra Coctail',
  'lU Coctail',
  'Rain Coctail',
  'Rob Coctail',
];

List coffees = List.generate(
    coffee_Names.length,
    (index) => coffee(
        coffee_Names[index],
        'assets/images/coffeImage/${index + 1}.png',
        Random().nextInt(50) + 20));
