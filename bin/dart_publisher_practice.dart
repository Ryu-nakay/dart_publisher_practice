import 'package:dart_publisher_practice/dart_publisher_practice.dart'
    as dart_publisher_practice;
import 'package:rxdart/subjects.dart';

void main(List<String> arguments) {
  print('Hello world: ${dart_publisher_practice.calculate()}!');

  Publisher<int> a = Publisher<int>(1);

  a.sink(() {
    print(a.value);
  });

  a.value = 3;

  print("----");

  a.value = 4;
}

class Publisher<T> {
  // 値を保持する部分
  late T _instance;
  // 値変更時に実行する処理
  Function listenProcess = () {};

  // _instanceのゲッター
  T get value {
    return _instance;
  }

  // 値のセットと購読されている処理の実行をする
  set value(T inputValue) {
    _instance = inputValue;
    listenProcess();
  }

  // 値変更時に実行する処理をセットするための関数
  void sink(Function process) {
    listenProcess = process;
  }

  Publisher(T inputValue) {
    _instance = inputValue;
  }
}
