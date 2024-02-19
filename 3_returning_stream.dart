// import dart async class
import 'dart:async';

// Stream을 반환하는 함수는 async*로 선언합니다.
// Stream <String> generic
// async and await
// yield
Stream<String> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    // StreamController의 add()처럼 yield 키워드를 이용해서 값 반환
    yield 'i = $i';
    await Future.delayed(Duration(seconds: 1));
  }
}

// playStream
void playStream() {
  // StreamController와 마찬가지로 listen() 함수로 콜백 함수 입력
  // calculate listen
  calculate(1).listen((val) {
    print(val);
  });
}

// main function
void main() {
  // call playStream function
  playStream();
}
