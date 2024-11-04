import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

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

  void _press(String s) {
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

    if(_hasWon() != "no") {
      _showAlert(_hasWon());
      _restart();
    }
  }

  String _hasWon() {
    //rows
    if(icons[0] == icons[1] && icons[1] == icons[2] && icons[0] != Icons.directions_run_rounded && icons[1] != Icons.directions_run_rounded && icons[2] != Icons.directions_run_rounded) { return state ? "Ha vinto il giocatore 2" : "Ha vinto il giocatore 1"; }
    if(icons[3] == icons[4] && icons[4] == icons[5] && icons[3] != Icons.directions_run_rounded && icons[4] != Icons.directions_run_rounded && icons[5] != Icons.directions_run_rounded) { return state ? "Ha vinto il giocatore 2" : "Ha vinto il giocatore 1"; }
    if(icons[6] == icons[7] && icons[7] == icons[8] && icons[6] != Icons.directions_run_rounded && icons[7] != Icons.directions_run_rounded && icons[8] != Icons.directions_run_rounded) { return state ? "Ha vinto il giocatore 2" : "Ha vinto il giocatore 1"; }

    //columns
    if(icons[0] == icons[3] && icons[3] == icons[6] && icons[0] != Icons.directions_run_rounded && icons[3] != Icons.directions_run_rounded && icons[6] != Icons.directions_run_rounded) { return state ? "Ha vinto il giocatore 2" : "Ha vinto il giocatore 1"; }
    if(icons[1] == icons[4] && icons[4] == icons[7] && icons[1] != Icons.directions_run_rounded && icons[4] != Icons.directions_run_rounded && icons[7] != Icons.directions_run_rounded) { return state ? "Ha vinto il giocatore 2" : "Ha vinto il giocatore 1"; }
    if(icons[2] == icons[5] && icons[5] == icons[8] && icons[2] != Icons.directions_run_rounded && icons[5] != Icons.directions_run_rounded && icons[8] != Icons.directions_run_rounded) { return state ? "Ha vinto il giocatore 2" : "Ha vinto il giocatore 1"; }

    //diagonals
    if(icons[0] == icons[4] && icons[4] == icons[8] && icons[0] != Icons.directions_run_rounded && icons[4] != Icons.directions_run_rounded && icons[8] != Icons.directions_run_rounded) { return state ? "Ha vinto il giocatore 2" : "Ha vinto il giocatore 1"; }
    if(icons[2] == icons[4] && icons[4] == icons[6] && icons[2] != Icons.directions_run_rounded && icons[4] != Icons.directions_run_rounded && icons[6] != Icons.directions_run_rounded) { return state ? "Ha vinto il giocatore 2" : "Ha vinto il giocatore 1"; }

    //else
    return "no";
  }

  void _showAlert(String content) {
    CoolAlert.show(context: context, type: CoolAlertType.success, text: content, title: "Vittoria!");
  }

  void _restart() {
    setState(() {
      icons = [Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded, Icons.directions_run_rounded];
    });
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
                IconButton(onPressed: () => _press("lu"/*left up*/), icon: Icon(icons[0]),),
                IconButton(onPressed: () => _press("cu"/*center up*/), icon: Icon(icons[1]),),
                IconButton(onPressed: () => _press("ru"/*righ up*/), icon: Icon(icons[2]),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => _press("lm"/*left middle*/), icon: Icon(icons[3]),),
                IconButton(onPressed: () => _press("cm"/*center middle*/), icon: Icon(icons[4]),),
                IconButton(onPressed: () => _press("rm"/*right middle*/), icon: Icon(icons[5]),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => _press("ld"/*left down*/), icon: Icon(icons[6]),),
                IconButton(onPressed: () => _press("cd"/*center down*/), icon: Icon(icons[7]),),
                IconButton(onPressed: () => _press("rd"/*right down*/), icon: Icon(icons[8]),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(onPressed: _restart, child: const Text("RESTART"),),
            )
          ],
        ),
      )
    );
  }
}
