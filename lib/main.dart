import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double celcius = 0;
  double kelvin = 0;
  double reamor = 0;

  void _convert() {
    setState(() {
      kelvin = celcius + 273.15;
      reamor = celcius * 4 / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.runtimeType is! double) {
                    return "Tolong masukkan sebuah nilai celcius";
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    celcius = double.parse(text);
                  });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Suhu dalam Celcius"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "Suhu dalam Kelvin",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          "$kelvin",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 32),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "Suhu dalam Reamur",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          "$reamor",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 32),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: _convert,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                child: const Text('Konversi Suhu'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _convert,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
