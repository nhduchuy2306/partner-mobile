class ProductItem {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String imagePath;

  ProductItem({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

var demoItems = [
  ProductItem(
      id: 1,
      name: "Razer Headset",
      description: "Color: Pink",
      price: 4.99,
      imagePath: "assets/images/grocery_images/banana.png"),
  ProductItem(
      id: 2,
      name: "Red Apple",
      description: "1kg, Priceg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/apple.png"),
  ProductItem(
      id: 3,
      name: "Bell Pepper Red",
      description: "1kg, Priceg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/pepper.png"),
  ProductItem(
      id: 4,
      name: "Ginger",
      description: "250gm, Priceg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/ginger.png"),
  ProductItem(
      id: 5,
      name: "Meat",
      description: "250gm, Priceg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/beef.png"),
  ProductItem(
      id: 6,
      name: "Chikken",
      description: "250gm, Priceg",
      price: 4.99,
      imagePath: "assets/images/grocery_images/chicken.png"),
];

var exclusiveOffers = [demoItems[0], demoItems[1]];

var bestSelling = [demoItems[2], demoItems[3]];

var groceries = [demoItems[4], demoItems[5]];

var beverages = [
  ProductItem(
      id: 7,
      name: "Dite Coke",
      description: "355ml, Price",
      price: 1.99,
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  ProductItem(
      id: 8,
      name: "Sprite Can",
      description: "325ml, Price",
      price: 1.50,
      imagePath: "assets/images/beverages_images/sprite.png"),
  ProductItem(
      id: 8,
      name: "Apple Juice",
      description: "2L, Price",
      price: 15.99,
      imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
  ProductItem(
      id: 9,
      name: "Orange Juice",
      description: "2L, Price",
      price: 1.50,
      imagePath: "assets/images/beverages_images/orange_juice.png"),
  ProductItem(
      id: 10,
      name: "Coca Cola Can",
      description: "325ml, Price",
      price: 4.99,
      imagePath: "assets/images/beverages_images/coca_cola.png"),
  ProductItem(
      id: 11,
      name: "Pepsi Can",
      description: "330ml, Price",
      price: 4.99,
      imagePath: "assets/images/beverages_images/pepsi.png"),
];
