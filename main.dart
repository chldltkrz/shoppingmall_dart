import 'dart:io';
import 'Product.dart';
import 'ShoppingMall.dart';

void main() {
  Shoppingmall shoppingmall = Shoppingmall([
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 5000),
  ]);

  print("-" * 100);
  print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격보기 / [4] 프로그램 종료");
  print("-" * 100);

  var choice = stdin.readLineSync();

  while (true) {
    if (choice == "1") {
      shoppingmall.showProducts();
    } else if (choice == "2") {
      try {
        print("상품 이름을 입력해주세요: ");
        String? pN = stdin.readLineSync();
        !shoppingmall.products.any((product) => product.productName == pN)
            ? print("입력값이 올바르지 않아요 !")
            : print("수량을 입력해주세요: ");

        int? quantity = int.parse(stdin.readLineSync()!);
        quantity.runtimeType != int
            ? print("입력값이 올바르지 않아요 !")
            : {
                quantity < 0
                    ? print("0개보다 많은 개수의 상품만 담을 수 있어요 !")
                    : {
                        shoppingmall.addToCart(pN!, quantity),
                        print("장바구니에 상품이 담겼어요 !")
                      }
              };
      } catch (e) {
        print("상품이 존재하지 않습니다. 다시 시도해 주세요 ..");
        continue;
      }
    } else if (choice == "3") {
      if (shoppingmall.totalPrice == 0) {
        print("장바구니에 담긴 상품이 없습니다.");
      } else {
        print("장바구니에 " +
            shoppingmall.showCart() +
            "가 담겨있네요. 총" +
            shoppingmall.totalPrice.toString() +
            "원 입니다.");
      }
    } else if (choice == "4") {
      print("정말 종료하시겠습니까? Press 5 to exit");
      var exit = stdin.readLineSync();
      if (exit == "5") {
        print("이용해 주셔서 감사합니다 ~ 안녕히 가세요!");
        break;
      } else if (choice == "6") {
        if (shoppingmall.totalPrice == 0) {
          print("이미 장바구니가 비어있습니다.");
        } else {
          print("장바구니를 초기화합니다.");
          shoppingmall.totalPrice = 0;
        }
      } else {
        print("프로그램이 종료되지 않았습니다");
      }
    } else {
      print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
    print("-" * 100);
    print(
        "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격보기 / [4] 프로그램 종료");
    print("-" * 100);
    choice = stdin.readLineSync();
  }
}
