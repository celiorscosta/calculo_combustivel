import 'package:calculo_combustivel/app/helpers/colors.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final homeStore = Modular.get<HomeStore>();
  final _costMaskController = TextInputMask(
    mask: 'R!\$! !9+.999',
    placeholder: '0',
    maxPlaceHolders: 4,
    reverse: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: ScopedBuilder<HomeStore, Exception, double>(
        store: store,
        onState: (_, calc) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: backGroundColor,
                height: 100.0,
                child: const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Center(
                    child: Text(
                      'Gasolina ou Alcool?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 300.0,
                child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 3),
                        spreadRadius: 2,
                        blurRadius: 15,
                        color: Colors.grey,
                      ),
                    ],
                    color: containerColorBlue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _inputText(
                                'Etanol',
                                homeStore.etanolController,
                              ),
                              _inputText(
                                'Gasolina',
                                homeStore.gasolinaController,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: homeStore.increment,
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 67, 52, 136),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Calcular',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        _mensagem(calc),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        onError: (context, error) => const Center(
          child: Text(
            'Erro',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  String _mensagem(double calc) {
    var resp = calc == 0
        ? ''
        : calc >= 70.0
            ? '${calc.toStringAsPrecision(2)}% \nAbasteça com Gasolina'
            : '${calc.toStringAsPrecision(2)}% \nAbasteça com Etanol';
    return resp;
  }

  _inputText(String label, TextEditingController? controller) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.40,
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        inputFormatters: [_costMaskController],
        cursorColor: Colors.white,
        enableInteractiveSelection: false,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurple.shade200,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurple.shade200,
            ),
          ),
          // suffixText: label,
          // suffixStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
