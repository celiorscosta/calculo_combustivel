import 'package:calculo_combustivel/app/helpers/colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: store,
        onState: (_, counter) {
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
                  // color: Colors.blue,
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
                    children: [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _inputText('Alcool'),
                              _inputText('Gasolina'),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Container(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, // <-- Button color
                          onPrimary: Colors.transparent, // <-- Splash color
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        onError: (context, error) => const Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  _inputText(String label) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width * 0.40,
      alignment: Alignment.center,
      child: TextFormField(
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
          suffixText: label,
          suffixStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
