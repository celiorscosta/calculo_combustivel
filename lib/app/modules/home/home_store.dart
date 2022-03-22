import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, double> {
  HomeStore() : super(0.0);

  final etanolController = TextEditingController();
  final gasolinaController = TextEditingController();

  Future<void> increment() async {
    setLoading(true);
    if (etanolController.text.isNotEmpty &&
        gasolinaController.text.isNotEmpty &&
        !etanolController.text.contains('0.000') &&
        !gasolinaController.text.contains('0.000')) {
      double etanol = double.parse(
        etanolController.text.replaceAll('R\$', ''),
      );
      double gasolina = double.parse(
        gasolinaController.text.replaceAll('R\$', ''),
      );
      double result = 0.0;

      result = etanol / gasolina * 100;
      update(result);
    }
    setLoading(false);
  }
}
