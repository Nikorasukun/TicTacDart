import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:gradient_icon/gradient_icon.dart';

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
  bool state = false; //false = close, true = circle
  var colors = [Colors.black, Colors.blue, Colors.red]; //neutral, p1, p2
  var icons = <Icon>[]; //array of icons of grid
  IconData? neutralIcon = Icons.directions_run_rounded;
  IconData? p1Icon = Icons.close;
  IconData? p2Icon = Icons.circle_outlined;
  var buttonColors = [Colors.red, Colors.blue, Colors.purple, Colors.amber, Colors.green, Colors.orange, Colors.deepPurple, Colors.pink];

  @override
  void initState() {
    super.initState();
    _arrayInizializer();
  }


  //TO DO LIST
  //migliorare estetica bottone restart   --done
  //mettere colori rosso e blu a icone    --done
  //generalizza icone player    --done
  //chiedi nomi ai player
  //mettere vari temi di colori sceglibili tramite iconcine   --done
  //menù per selezionare la modalità
  //aggiungere sound effects
  //aggiungere bot che fa mosse random
  //implementare logica base bot attacco-difesa-random
  //codificare mosse in file json in modo che il bot impari dall'utente
  //implementare nuove modalità oltre che PvP e Bot, magari dopo tot mosse la prima mossa fatta viene resa neutra

  void _arrayInizializer(){
    icons.clear();
    for(int i = 0; i < 9; i++) {
      icons.add(Icon(neutralIcon, color: colors[0]));
    }
  }

  void _press(String s) {
    switch(s){
      case "lu":
        setState(() {
          if(icons[0].icon == neutralIcon)
          { icons[0] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;

      case "cu":
        setState(() {
          if(icons[1].icon == neutralIcon)
          { icons[1] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;

      case "ru":
        setState(() {
          if(icons[2].icon == neutralIcon)
          { icons[2] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;

      case "lm":
        setState(() {
          if(icons[3].icon == neutralIcon)
          { icons[3] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;

      case "cm":
        setState(() {
          if(icons[4].icon == neutralIcon)
          { icons[4] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;

      case "rm":
        setState(() {
          if(icons[5].icon == neutralIcon)
          { icons[5] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;

      case "ld":
        setState(() {
          if(icons[6].icon == neutralIcon)
          { icons[6] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;

      case "cd":
        setState(() {
          if(icons[7].icon == neutralIcon)
          { icons[7] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;

      case "rd":
        setState(() {
          if(icons[8].icon == neutralIcon)
          { icons[8] = state ? Icon(p2Icon, color: colors[1]) : Icon(p1Icon, color: colors[2]); state = !state; }
        });
        break;
    }

    if(_hasWon() != "no") {
      _showAlert(_hasWon());
      _restart();
    }
  }

  String _hasWon() {

    //rows
    if(icons[0].icon == icons[1].icon
    && icons[1].icon == icons[2].icon
    && icons[0].icon != neutralIcon
    && icons[1].icon != neutralIcon
    && icons[2].icon != neutralIcon)
    { return state ? "Ha vinto il giocatore 1" : "Ha vinto il giocatore 2"; }

    if(icons[3].icon == icons[4].icon
    && icons[4].icon == icons[5].icon
    && icons[3].icon != neutralIcon
    && icons[4].icon != neutralIcon
    && icons[5].icon != neutralIcon)
    { return state ? "Ha vinto il giocatore 1" : "Ha vinto il giocatore 2"; }

    if(icons[6].icon == icons[7].icon
    && icons[7].icon == icons[8].icon
    && icons[6].icon != neutralIcon
    && icons[7].icon != neutralIcon
    && icons[8].icon != neutralIcon)
    { return state ? "Ha vinto il giocatore 1" : "Ha vinto il giocatore 2"; }


    //columns
    if(icons[0].icon == icons[3].icon
    && icons[3].icon == icons[6].icon
    && icons[0].icon != neutralIcon
    && icons[3].icon != neutralIcon
    && icons[6].icon != neutralIcon)
    { return state ? "Ha vinto il giocatore 1" : "Ha vinto il giocatore 2"; }

    if(icons[1].icon == icons[4].icon
    && icons[4].icon == icons[7].icon
    && icons[1].icon != neutralIcon
    && icons[4].icon != neutralIcon
    && icons[7].icon != neutralIcon)
    { return state ? "Ha vinto il giocatore 1" : "Ha vinto il giocatore 2"; }

    if(icons[2].icon == icons[5].icon
    && icons[5].icon == icons[8].icon
    && icons[2].icon != neutralIcon
    && icons[5].icon != neutralIcon
    && icons[8].icon != neutralIcon)
    { return state ? "Ha vinto il giocatore 1" : "Ha vinto il giocatore 2"; }


    //diagonals
    if(icons[0].icon == icons[4].icon
    && icons[4].icon == icons[8].icon
    && icons[0].icon != neutralIcon
    && icons[4].icon != neutralIcon
    && icons[8].icon != neutralIcon)
    { return state ? "Ha vinto il giocatore 1" : "Ha vinto il giocatore 2"; }

    if(icons[2].icon == icons[4].icon
    && icons[4].icon == icons[6].icon
    && icons[2].icon != neutralIcon
    && icons[4].icon != neutralIcon
    && icons[6].icon != neutralIcon)
    { return state ? "Ha vinto il giocatore 1" : "Ha vinto il giocatore 2"; }


    //tie mechanic
    bool tie = true;
    for(int i = 0; i < icons.length; i++){
      if(icons[i].icon == neutralIcon) { tie = false; break; }
    }
    if(tie) { return "La partita è finita in pareggio."; }


    //else
    return "no";
  }

  void _showAlert(String content) {
    CoolAlert.show(context: context, type: CoolAlertType.success, text: content, title: "Esito");
  }

  void _restart() {
    setState(() {
      _arrayInizializer();
    });
  }

  void _changeColour(MaterialColor primary, MaterialColor secondary){
    setState(() {
      colors[1] = primary;
      colors[2] = secondary;

      for(int i = 0; i < icons.length; i++) {
        if(icons[i].icon == neutralIcon)
        { icons[i] = Icon(neutralIcon, color: colors[0]); }

        if(icons[i].icon == p1Icon)
        { icons[i] = Icon(p1Icon, color: colors[2]); }

        if(icons[i].icon == p2Icon)
        { icons[i] = Icon(p2Icon, color: colors[1]); }        
      }
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
                IconButton(onPressed: () => _press("lu"/*left up*/), icon: icons[0]),
                IconButton(onPressed: () => _press("cu"/*center up*/), icon: icons[1]),
                IconButton(onPressed: () => _press("ru"/*righ up*/), icon: icons[2]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => _press("lm"/*left middle*/), icon: icons[3]),
                IconButton(onPressed: () => _press("cm"/*center middle*/), icon: icons[4]),
                IconButton(onPressed: () => _press("rm"/*right middle*/), icon: icons[5]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => _press("ld"/*left down*/), icon: icons[6]),
                IconButton(onPressed: () => _press("cd"/*center down*/), icon: icons[7]),
                IconButton(onPressed: () => _press("rd"/*right down*/), icon: icons[8]),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: 
              ElevatedButton(
                style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                  backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 178, 252, 193)),
                  side: WidgetStatePropertyAll(BorderSide(
                    width: 3.0,
                    color: Color.fromARGB(255, 6, 209, 50)
                  ),
                  ), 
                ),
                onPressed: _restart,
                child: const Text("RESTART"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _changeColour(buttonColors[0], buttonColors[1]),
                  icon: GradientIcon(
                    icon: Icons.circle,
                    gradient: LinearGradient(
                      colors: [buttonColors[0], buttonColors[1]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  iconSize: 15,
                ),
                IconButton(
                  onPressed: () => _changeColour(buttonColors[2], buttonColors[3]),
                  icon:  GradientIcon(
                    icon: Icons.circle,
                    gradient: LinearGradient(
                      colors: [buttonColors[2], buttonColors[3]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  iconSize: 15,
                ),
                IconButton(
                  onPressed: () => _changeColour(buttonColors[4], buttonColors[5]),
                  icon:  GradientIcon(
                    icon: Icons.circle,
                    gradient: LinearGradient(
                      colors: [buttonColors[4], buttonColors[5]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  iconSize: 15,
                ),
                IconButton(
                  onPressed: () => _changeColour(buttonColors[6], buttonColors[7]),
                  icon: GradientIcon(
                    icon: Icons.circle,
                    gradient: LinearGradient(
                      colors: [buttonColors[6], buttonColors[7]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  iconSize: 15,
                ),
              ],
            )
          ],          
        ),
      )
    );
  }
}
