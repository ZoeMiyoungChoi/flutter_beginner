import 'dart:async';

// Future<void> addNumber(int a, int b) async {
//   print('Start addNumber function');
//   await Future.delayed(Duration(seconds: 1), () => print('Wait 1 second'));
//   print('Result: ${a + b}');
// }

// void main() {
//   // 비동기여서 두 함수가 동시에 실행 되는 것을 확인 할 수 있음.
//   // 동기 함수라면서 위에서 하나씩 내려왔을 것임.
//   addNumber(1, 1);
//   addNumber(2, 3);
// }

// Future<void> asyncedAddNumber(int a, int b) async {
//   print('Start asyncedAddNumber function');
//   await Future.delayed(Duration(seconds: 1), () => print('Wait 1 second'));
//   print('End asyncedAddNumber function');
// }

// void main() async {
//   // 함수 자체를 await를 덮어버리면 동기 함수처럼 실행됨.
//   await asyncedAddNumber(1, 1);
//   await asyncedAddNumber(2, 3);
// }

// Future<int> asyncedAddNumberReturnInt(int a, int b) async {
//   print('Start addNumber function');
//   await Future.delayed(Duration(seconds: 1), () => print('Wait 1 second'));
//   print('End addNumber function');
//   return a + b;
// }

// void main() async {
//   // int를 반환하는 함수가 있으면 해당 값을 받은 다음에 사용 가능
//   int result1 = await asyncedAddNumberReturnInt(1, 1);
//   int result2 = await asyncedAddNumberReturnInt(2, 3);
//   print('Result: $result1, $result2');
// }

// // StreamController listen을 사용하여 값이 주입될때마다 이벤트 활용
// void main() {
//   final controller = StreamController();
//   final stream = controller.stream;

//   final streamListener = stream.listen((val) => print(val));

//   controller.sink.add(1);
//   controller.sink.add(2);
//   controller.sink.add(3);
//   controller.sink.add(4);
// }

// // 브로드캐스트 스트림
// void main() {
//   final controller = StreamController();

//   final stream = controller.stream.asBroadcastStream();

//   final streamListener1 = stream.listen((val) => print('Listener 1: $val'));
//   final streamListener2 = stream.listen((val) => print('Listener 2: $val'));

//   controller.sink.add(1);
//   controller.sink.add(2);
//   controller.sink.add(3);
// }


// // 스트림을 반환하는 코드 
Stream<String> calculate(int number) async* {
  for (int i = 1; i < number; i++) {
    yield 'Result: $i';
    await Future.delayed(Duration(seconds: 1));
  }
}

void playStream() async {
  final stream = calculate(5);
  await for (var value in stream) {
    print(value);
  }
}

void main() {
  playStream();
}
