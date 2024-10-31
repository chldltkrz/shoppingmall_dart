import 'Product.dart';

// Shoppingmall 클래스 선언
// 1. Product 클래스의 리스트를 멤버변수로 가짐
// 2. 총 가격을 저장하는 totalPrice 변수를 가짐
// 3. 장바구니에 담긴 상품을 저장하는 리스트를 가짐
class Shoppingmall {
  List<Product> products;
  int totalPrice = 0;
  List<String> cart = [];

  // 생성자는 products를 받아서 초기화
  Shoppingmall(
    this.products,
  );

  // 상품 목록을 보여주는 함수, for문의 in을 사용하여 간단하게 구현
  void showProducts() {
    for (Product product in products) {
      print(product.productName + " / " + product.price.toString() + "\n");
    }
  }

  // 장바구니에 상품을 추가하는 함수
  // where을 사용하여 productName이 일치하는 상품을 찾아서 상품의 가격과 수량을 곱한 값을 totalPrice에 더함
  // cart 리스트에 상품을 추가
  void addToCart(String productName, int quantity) {
    Product p =
        products.where((product) => product.productName == productName).first;
    totalPrice += (p.price * quantity);
    cart.add(productName);
  }

  // 장바구니에 담긴 상품을 보여주는 함수
  String showCart() {
    return cart.join(", ");
  }

  // 장바구니에 담긴 상품의 총 가격을 보여주는 함수
  void showTotalPrice() {
    print("장바구니에 " + totalPrice.toString() + "원 어치를 담으셨네요 !");
  }
}
