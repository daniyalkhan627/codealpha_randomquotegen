import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: QuoteGenerator(),
    );
  }
}
class QuoteGenerator extends StatefulWidget {
  const QuoteGenerator({super.key});

  @override
  State<QuoteGenerator> createState() => _QuoteGeneratorState();
}

class _QuoteGeneratorState extends State<QuoteGenerator> {
  final String quoteURL = "https://api.adviceslip.com/advice";
  String quote = 'Random Quote';

  generateQuote() async{
    var res = await http.get(Uri.parse(quoteURL));
    var result = jsonDecode(res.body);
    print(result["slip"] ["advice"]);
setState(() {
  quote = result["slip"] ["advice"];
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
appBar: AppBar(

  title: Text("Random Quote Generator"),


),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
Text(quote , style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,

              child: 
              ElevatedButton(onPressed: (){
                generateQuote();
              }, child: Text("Generate")),

            )
          ],
        ),
      ),
    );
  }
}
