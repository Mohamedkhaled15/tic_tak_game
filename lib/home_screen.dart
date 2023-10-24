import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'game_logic.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  String activePlayer ='x';
  bool gameOver=false;
  int turn=0;
  String result='';
  Game game =Game();
  bool isSwitched=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child:Column(
          children: [
            SwitchListTile.adaptive(
              title: Text('Turn on /off tow player',
              style: TextStyle(color: Colors.white,fontSize: 30,),
                textAlign:TextAlign.center ,
              ),
              value:isSwitched ,
              onChanged: (bool newValue){
                setState(() {
                  isSwitched=newValue;
                });
              },
            ),
            Text(
              'Its $activePlayer Turn'.toUpperCase(),
              style:const TextStyle(color: Colors.white,fontSize: 50,),
              textAlign:TextAlign.center ,
            ),
            Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(16),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                  crossAxisCount: 3,
                  children:List.generate(9,
                          (index) => InkWell(
                            borderRadius: BorderRadius.circular(16),
                           onTap:gameOver? null: ()=>_onTap(index),
                            child: Container(

                              decoration: BoxDecoration(
                                color:Colors.deepPurple.shade900,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  Player.playerx.contains(index)
                                      ? 'x'
                                      :Player.playero.contains(index)
                                      ?'o'
                                      :'',
                                  style: TextStyle(
                                  color: Player.playerx.contains(index)
                                       ?Colors.blue
                                      :Colors.pink,
                                    fontSize: 50,),
                                  textAlign:TextAlign.center ,),
                              ),
                            ),
                          )
                  ),
                )
            ),
            Text(
              result,
              style:const TextStyle(color: Colors.white,fontSize: 50,),
              textAlign:TextAlign.center ,
            ),
            ElevatedButton.icon(onPressed: (){
              setState(() {
                Player.playerx=[];
                Player.playero=[];
                 activePlayer ='x';
                 gameOver=false;
                 turn=0;
                 result='';
              });
            },
                icon: const Icon(Icons.replay),
                label: const Text('Repeat the Game'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            )



        ],),
      ),
    );
  }
  _onTap(int index) async{
    if( (Player.playerx.isEmpty||
        !Player.playerx.contains(index))&&
        (Player.playero.isEmpty||
        !Player.playero.contains(index))) {
      game.playGame(index,activePlayer);
      updateState();
      if(!isSwitched&&!gameOver&&turn!=9){
      await game.autoPlay(activePlayer);
      updateState();
      }
    }
  }
  void updateState(){
    setState(() {
      activePlayer=(activePlayer=='x')?'o':'x';
      turn++;
      String winnerPlayer= game.checkWinner();
      if(winnerPlayer!=''){
        gameOver=true;
        result ='$winnerPlayer is the winner';
      }
        else if(!gameOver&&turn==9){
        result='Its draw';
      }



    });
  }
}



