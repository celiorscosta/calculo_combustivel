import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, int> {
  HomeStore() : super(0);

  Future<void> increment() async {
    setLoading(true);

    double etanol = 0.0;
    double gasolina = 0.0;
    double result = 0.0;

    result = etanol / gasolina;

    setLoading(false);
  }
}
