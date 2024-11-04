import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tic Tac Flutter'),
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
  bool state = false; //false = cross, true = circle
  var icons = [Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, ];

  void press(String s) {
    switch(s){
      case "lu":
        setState(() {
          icons[0] = state ? Icons.circle_outlined : Icons.close;
        });
        break;

      case "cu":
        setState(() {
          icons[1] = state ? Icons.circle_outlined : Icons.close;
        });
        break;

      case "ru":
        setState(() {
          icons[2] = state ? Icons.circle_outlined : Icons.close;
        });
        break;

      case "lm":
        setState(() {
          icons[3] = state ? Icons.circle_outlined : Icons.close;
        });
        break;

      case "cm":
        setState(() {
          icons[4] = state ? Icons.circle_outlined : Icons.close;
        });
        break;

      case "rm":
        setState(() {
          icons[5] = state ? Icons.circle_outlined : Icons.close;
        });
        break;

      case "ld":
        setState(() {
          icons[6] = state ? Icons.circle_outlined : Icons.close;
        });
        break;

      case "cd":
        setState(() {
          icons[7] = state ? Icons.circle_outlined : Icons.close;
        });
        break;

      case "rd":
        setState(() {
          icons[8] = state ? Icons.circle_outlined : Icons.close;
        });
        break;
    }

    state = !state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => press("lu"/*left up*/), icon: Icon(icons[0]),),
                IconButton(onPressed: () => press("cu"/*center up*/), icon: Icon(icons[1]),),
                IconButton(onPressed: () => press("ru"/*righ up*/), icon: Icon(icons[2]),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => press("lm"/*left middle*/), icon: Icon(icons[3]),),
                IconButton(onPressed: () => press("cm"/*center middle*/), icon: Icon(icons[4]),),
                IconButton(onPressed: () => press("rm"/*right middle*/), icon: Icon(icons[5]),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => press("ld"/*left down*/), icon: Icon(icons[6]),),
                IconButton(onPressed: () => press("cd"/*center down*/), icon: Icon(icons[7]),),
                IconButton(onPressed: () => press("rd"/*right down*/), icon: Icon(icons[8]),),
              ],
            ),
          ],
        ),
      )
    );
  }
}
