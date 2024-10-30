import 'Product.dart';

class Shoppingmall {
  List<Product> products;
  int totalPrice = 0;
  List<String> cart = [];

  Shoppingmall(
    this.products,
  );

  void showProducts() {
    for (Product product in products) {
      print(product.productName + " / " + product.price.toString() + "\n");
    }
  }

  void addToCart(String productName, int quantity) {
    Product p =
        products.where((product) => product.productName == productName).first;
    totalPrice += (p.price * quantity);
    cart.add(productName);
  }

  String showCart() {
    return cart.join(", ");
  }

  void showTotalPrice() {
    print("장바구니에 " + totalPrice.toString() + "원 어치를 담으셨네요 !");
  }
}
