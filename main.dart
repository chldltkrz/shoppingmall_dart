import 'dart:io';
import 'Product.dart';
import 'ShoppingMall.dart';

void main() {
  /*
   *  ShoppingMall 클래스의 인스턴스를 생성하고, 상품 목록을 초기화. 
   */
  Shoppingmall shoppingmall = Shoppingmall([
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 5000),
  ]);

  /*
   * do-while로 처리를 할수도 있지만, 여기서는 while을 채택하여 가독성을 높임
   */
  print("-" * 100);
  print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격보기 / [4] 프로그램 종료");
  print("-" * 100);

  // 사용자의 선택을 받아서 choice 변수에 저장
  var choice = stdin.readLineSync();

  /*
   *  사용자가 선택한 기능에 따라서 다른 동작을 수행(switch-case문 대신 if-else문 사용)
   *  1. 상품 목록 보기
   *  2. 장바구니에 담기
   *  3. 장바구니에 담긴 상품의 총 가격보기
   *  4. 프로그램 종료
   *    5. 프로그램 종료 확인
   *  6. 장바구니 초기화
   */
  while (true) {
    if (choice == "1") {
      shoppingmall.showProducts();
    } else if (choice == "2") {
      // 예외처리, 모든 케이스를 잡아서 하나로 처리하기 위해 try-catch문 사용
      // 예외 발생시 continue로 다시 반복문으로 돌아가게 함
      // ternary operator를 사용하여 장바구니 관련 로직을 처리
      //   -> 조금 헷갈릴 수 있지만, depth가 2를 넘어가지 않아 사용해도 좋다고 판단
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
      // 장바구니에 담긴 상품의 총 가격을 보여주는 기능
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
      // 프로그램 종료 기능
      // while문을 true로 설정하여 무한루프를 돌리고, 한번더 확인 한 뒤에 break로 종료시킴
    } else if (choice == "4") {
      print("정말 종료하시겠습니까? Press 5 to exit");
      var exit = stdin.readLineSync();
      if (exit == "5") {
        print("이용해 주셔서 감사합니다 ~ 안녕히 가세요!");
        break;
      } else {
        print("프로그램이 종료되지 않았습니다");
      }
      // 그외 모든 입력은 지원하지 않도록 안내 메세지 출력
    } else if (choice == "6") {
      if (shoppingmall.totalPrice == 0) {
        print("이미 장바구니가 비어있습니다.");
      } else {
        print("장바구니를 초기화합니다.");
        shoppingmall.cart.clear();
        shoppingmall.totalPrice = 0;
      }
    } else {
      print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
    // 다시 선택지를 보여주기 위해 반복문을 돌림
    print("-" * 100);
    print(
        "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격보기 / [4] 프로그램 종료");
    print("-" * 100);
    choice = stdin.readLineSync();
  }
}
