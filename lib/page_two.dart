import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:infiltratedtest/main.dart';
import 'package:infiltratedtest/choose_page.dart';
import 'package:countdown_flutter_ns/countdown_flutter_ns.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  PageTwoState createState() => PageTwoState();
}

List<int> order = [1, 1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10];

bool paused = false;
bool firstTime = true;
bool corr = true;
int count = 0;
bool first = true;
int additionTime = 0;
String banner = "";
bool firstpop = true;

class PageTwoState extends State<PageTwo> {
  late AudioPlayer audioPlayer;
  Timer? myTimer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    banner = selectedLanguage == 1
        ? "game_banner_en"
        : selectedLanguage == 2
            ? "game_banner_fr"
            : "game_banner_es";
    cardList.where((crd) => crd.selected == 1 && crd.order == 2).length == 1
        ? corr = true
        : corr = false;
    firstTime = true;
    paused = false;
    first = true;
    additionTime = roleTime;
    firstpop = true;
  }

  void startTimer() {
    myTimer = Timer.periodic(const Duration(seconds: 30), (Timer timer) {
      setState(() {});
    });
  }

  Future<void> playAudio(String audioPath) async {
    await audioPlayer.play(AssetSource(audioPath));
  }

  Widget pgeWidget() {
    if (i == 0) {
      Future.delayed(const Duration(seconds: 4, milliseconds: 100), () {
        playAudio("audios/English/snoring.mp3");
      });
      playAudio(selectedLanguage == 1
          ? 'audios/English/en_00_e.mp3'
          : selectedLanguage == 2
              ? 'audios/French/fr_00_e.mp3'
              : "audios/Spanish/es_00_e.mp3");
      i++;
      Future.delayed(Duration(seconds: 6 + additionTime), () {
        myTimer?.cancel();
        setState(() {
          startTimer();
        });
      });
      return Container(
        child: Text(
          selectedLanguage == 1
              ? "everyone close their eyes."
              : selectedLanguage == 2
                  ? "tout le monde ferme les yeux."
                  : "todos cierren los ojos.",
          style: const TextStyle(fontSize: 50, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );
    }

    while (
        (cardList.where((crd) => crd.selected == 1 && crd.order == i).isEmpty) &&
            (i < 11)) {
      i++;
    }
    //                          INFILTRATOR
    if (i == 1) {
      if (firstpop) {
        firstpop = false;
        if (corr) {
          Future.delayed(Duration(seconds: 11 + additionTime), () {
            myTimer?.cancel();
            setState(() {
              startTimer();
            });
          });

          playAudio(selectedLanguage == 1
              ? 'audios/English/en_11b_e.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_11b_e.mp3'
                  : "audios/Spanish/es_11b_e.mp3");
          Future.delayed(Duration(seconds: 6 + additionTime), () {
            playAudio(selectedLanguage == 1
                ? 'audios/English/en_11b_s.mp3'
                : selectedLanguage == 2
                    ? 'audios/French/fr_11b_s.mp3'
                    : "audios/Spanish/es_11b_s.mp3");
            setState(() {});
          });
        } else {
          Future.delayed(Duration(seconds: 9 + additionTime), () {
            myTimer?.cancel();
            setState(() {
              startTimer();
            });
          });
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_11a_e.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_11a_e.mp3'
                  : "audios/Spanish/es_11a_e.mp3");
          Future.delayed(Duration(seconds: 5 + additionTime), () {
            playAudio(selectedLanguage == 1
                ? 'audios/English/en_11a_s.mp3'
                : selectedLanguage == 2
                    ? 'audios/French/fr_11a_s.mp3'
                    : "audios/Spanish/es_11a_s.mp3");
            setState(() {});
          });
        }

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                !corr
                    ? selectedLanguage == 1
                        ? "Infiltrates, open your eyes and look at each other."
                        : selectedLanguage == 2
                            ? "Infiltrés, ouvrez les yeux et regardez-vous."
                            : "Infiltrados, abran los ojos y mirense el uno al otro."
                    : selectedLanguage == 1
                        ? "Infiltrates and Corruptor, open your eyes and look at each other."
                        : selectedLanguage == 2
                            ? "Infiltrats et Corruptor, ouvrez les yeux et regardez-vous."
                            : "Infiltrados y corruptores, abre los ojos y mírate.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        firstpop = true;
        i++;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                !corr
                    ? selectedLanguage == 1
                        ? "Infiltrates, close your eyes."
                        : selectedLanguage == 2
                            ? "Infiltrats, fermez les yeux."
                            : "Infiltrados, cierren los ojos."
                    : selectedLanguage == 1
                        ? "Infiltrates and Corruptor, close your eyes."
                        : selectedLanguage == 2
                            ? "Infiltrats et Corruptor, fermez les yeux."
                            : "Infiltrados y corruptores, cierra los ojos.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      }
    } //CORRUPTOR
    else if (i == 2) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 12 + additionTime), () {
          myTimer?.cancel();
          setState(() {
            startTimer();
          });
        });

        playAudio(selectedLanguage == 1
            ? 'audios/English/en_12a_e.mp3'
            : selectedLanguage == 2
                ? 'audios/French/fr_12a_e.mp3'
                : "audios/Spanish/es_12a_e.mp3");
        Future.delayed(Duration(seconds: 8 + additionTime), () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_12a_s.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_12a_s.mp3'
                  : "audios/Spanish/es_12a_s.mp3");
          setState(() {});
        });

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Corruptor, open your eyes and use the Infiltrated card to turn another player into an Infiltrated."
                    : selectedLanguage == 2
                        ? "Corruptor, ouvrez les yeux et utilisez la carte Infiltré pour transformer un autre joueur en Infiltré."
                        : "Corruptor, abre los ojos y usa la carta de Infiltrado para convertir a otro jugador en Infiltrado.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        firstpop = true;
        i++;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Corruptor, close your eyes."
                    : selectedLanguage == 2
                        ? "Corruptor, fermez les yeux."
                        : "Corruptor, cierra los ojos.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      }
    } //GREEDY
    else if (i == 3) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 14 + additionTime), () {
          myTimer?.cancel();
          setState(() {
            startTimer();
          });
        });

        if (corr) {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_13b_e.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_13b_e.mp3'
                  : "audios/Spanish/es_13b_e.mp3");
          Future.delayed(Duration(seconds: 8 + additionTime), () {
            playAudio(selectedLanguage == 1
                ? 'audios/English/en_13b_s.mp3'
                : selectedLanguage == 2
                    ? 'audios/French/fr_13b_s.mp3'
                    : "audios/Spanish/es_13b_s.mp3");
            setState(() {});
          });
        } else {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_13a_e.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_13a_e.mp3'
                  : "audios/Spanish/es_13a_e.mp3");
          Future.delayed(Duration(seconds: 7 + additionTime), () {
            playAudio(selectedLanguage == 1
                ? 'audios/English/en_13a_s.mp3'
                : selectedLanguage == 2
                    ? 'audios/French/fr_13a_s.mp3'
                    : "audios/Spanish/es_13a_s.mp3");
          });
        }

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                !corr
                    ? selectedLanguage == 1
                        ? "Greedy, open your eyes. Infiltrates, show the thumb so the Greedy can see them."
                        : selectedLanguage == 2
                            ? "Gourmand, ouvre les yeux. Infiltre, montre le pouce pour que le Gourmand puisse les voir."
                            : "Enchufado, abre los ojos. Infiltrados, muestren el pulgar para que el Enchufado pueda ver quiénes son."
                    : selectedLanguage == 1
                        ? "Greedy, open your eyes. Infiltrates and Corruptor, show the thumb so the Greedy can see them."
                        : selectedLanguage == 2
                            ? "Gourmand, ouvre les yeux. Infiltrats et Corruptor, montre le pouce pour que le Gourmand puisse les voir."
                            : "Enchufado, abre los ojos. Infiltrados y Corruptor, muestren el pulgar para que el Enchufado pueda ver quiénes son",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        i++;
        firstpop = true;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                !corr
                    ? selectedLanguage == 1
                        ? "Infiltrates, hide your thumbs. Greedy, close your eyes."
                        : selectedLanguage == 2
                            ? "Infiltre, cache tes pouces. Gourmand, ferme les yeux."
                            : "Infiltrados, guarden sus pulgares. Enchufado, cierra los ojos."
                    : selectedLanguage == 1
                        ? "Infiltrates and Corruptor,  hide your thumbs. Greedy, close your eyes."
                        : selectedLanguage == 2
                            ? "Infiltrats et Corruptor, cache tes pouces. Gourmand, ferme les yeux."
                            : "Infiltrados y Corruptor, guarden sus pulgares. Enchufado, cierra los ojos.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } //FANATIC
    } else if (i == 4) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 9 + additionTime), () {
          myTimer?.cancel();
          setState(() {
            startTimer();
          });
        });

        playAudio(selectedLanguage == 1
            ? 'audios/English/en_14a_e.mp3'
            : selectedLanguage == 2
                ? 'audios/French/fr_14a_e.mp3'
                : "audios/Spanish/es_14a_e.mp3");
        Future.delayed(Duration(seconds: 6 + additionTime), () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_14a_s.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_14a_s.mp3'
                  : "audios/Spanish/es_14a_s.mp3");
          setState(() {});
        });

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Fanatic, open your eyes and look at each other."
                    : selectedLanguage == 2
                        ? "Fanatique, ouvre les yeux et regarde-toi."
                        : "Fanáticos, abran los ojos y mirense uno al otro.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        i++;
        firstpop = true;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Fanatic, close your eyes."
                    : selectedLanguage == 2
                        ? "Fanatique, ferme les yeux."
                        : "Fanático, cierra los ojos",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } // WITCH
    } else if (i == 5) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 11 + additionTime), () {
          myTimer?.cancel();
          setState(() {
            startTimer();
          });
        });

        playAudio(selectedLanguage == 1
            ? 'audios/English/en_15a_e.mp3'
            : selectedLanguage == 2
                ? 'audios/French/fr_15a_e.mp3'
                : "audios/Spanish/es_15a_e.mp3");
        Future.delayed(Duration(seconds: 8 + additionTime), () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_15a_s.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_15a_s.mp3'
                  : "audios/Spanish/es_15a_s.mp3");
          setState(() {});
        });

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Witch, open your eyes and look at another player's card or two cards from the center of the table."
                    : selectedLanguage == 2
                        ? "Sorcière, ouvre les yeux et regarde la carte d'un autre joueur ou deux cartes du centre de la table."
                        : "Bruja, abre los ojos y mira la carta de otro jugador o dos cartas del centro de la mesa.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        i++;
        firstpop = true;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Witch, close your eyes."
                    : selectedLanguage == 2
                        ? "Sorcière, ferme les yeux."
                        : "Bruja, cierra los ojos",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } // THIEF
    } else if (i == 6) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 18 + additionTime), () {
          myTimer?.cancel();
          setState(() {
            startTimer();
          });
        });

        playAudio(selectedLanguage == 1
            ? 'audios/English/en_16a_e.mp3'
            : selectedLanguage == 2
                ? 'audios/French/fr_16a_e.mp3'
                : "audios/Spanish/es_16a_e.mp3");
        Future.delayed(Duration(seconds: 14 + additionTime), () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_16a_s.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_16a_s.mp3'
                  : "audios/Spanish/es_16a_s.mp3");
          setState(() {});
        });

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Thief, open your eyes and change your card with the card of another player. You can not look at the cards before changing them. Once you've changed the cards, look at your new card."
                    : selectedLanguage == 2
                        ? "Voleur, ouvrez les yeux et changez votre carte avec la carte d'un autre joueur. Vous ne pouvez pas regarder les cartes avant de les changer. Une fois que vous avez changé les cartes, regardez votre nouvelle carte."
                        : "Ladrón, abre los ojos y cambia tu carta con la de otro jugador. No puedes mirar las  cartas antes de cambiarlas. Una vez que hayas cambiado las cartas, mira tu carta.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        firstpop = true;
        i++;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Thief, close your eyes."
                    : selectedLanguage == 2
                        ? "Voleur, fermez les yeux. "
                        : "Ladrón, cierra los ojos. ",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      }
    } else if (i == 7) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 12 + additionTime), () {
          myTimer?.cancel();
          setState(() {
            startTimer();
          });
        });

        playAudio(selectedLanguage == 1
            ? 'audios/English/en_17a_e.mp3'
            : selectedLanguage == 2
                ? 'audios/French/fr_17a_e.mp3'
                : "audios/Spanish/es_17a_e.mp3");
        Future.delayed(Duration(seconds: 8 + additionTime), () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_17a_s.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_17a_s.mp3'
                  : "audios/Spanish/es_17a_s.mp3");
          setState(() {});
        });

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Temptress, open your eyes and exchange, without looking at them, two cards from other players."
                    : selectedLanguage == 2
                        ? "Tentatrice, ouvre les yeux et échange, sans les regarder, deux cartes des autres joueurs."
                        : "Tentadora, abre los ojos e intercambia sin mirarlas, dos cartas de otros jugadores.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        i++;
        firstpop = true;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Temptress, close your eyes."
                    : selectedLanguage == 2
                        ? "Tentatrice, ferme les yeux."
                        : "Tentadora, cierra los ojos",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      }
    } else if (i == 8) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 13 + additionTime), () {
          myTimer?.cancel();
          setState(() {
            startTimer();
          });
        });

        playAudio(selectedLanguage == 1
            ? 'audios/English/en_18a_e.mp3'
            : selectedLanguage == 2
                ? 'audios/French/fr_18a_e.mp3'
                : "audios/Spanish/es_18a_e.mp3");
        Future.delayed(Duration(seconds: 10 + additionTime), () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_18a_s.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_18a_s.mp3'
                  : "audios/Spanish/es_18a_s.mp3");
          setState(() {});
        });

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Drunk, open your eyes and change your card to one of the center of the table, but without looking it, neither before nor after changing."
                    : selectedLanguage == 2
                        ? "Ivre, ouvrez les yeux et changez votre carte en un des centres de la table, mais sans la regarder, ni avant ni après avoir changé."
                        : "Borracho, abre los ojos y cambia tu carta por una del centro de la mesa, pero sin mirarlas, ni antes ni después de cambiarlas.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        i++;
        firstpop = true;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Drunk, close your eyes."
                    : selectedLanguage == 2
                        ? "Ivre, fermez les yeux."
                        : "Borracho, cierra los ojos",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      }
    } else if (i == 9) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 12 + additionTime), () {
          myTimer?.cancel();
          setState(() {
            startTimer();
          });
        });

        playAudio(selectedLanguage == 1
            ? 'audios/English/en_19a_e.mp3'
            : selectedLanguage == 2
                ? 'audios/French/fr_19a_e.mp3'
                : "audios/Spanish/es_19a_e.mp3");
        Future.delayed(Duration(seconds: 9 + additionTime), () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_19a_s.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_19a_s.mp3'
                  : "audios/Spanish/es_19a_s.mp3");
          setState(() {});
        });

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Profiteer, open your eyes and change the card of another player to one of the center of the table, but without looking at them."
                    : selectedLanguage == 2
                        ? "Profiteer, ouvre les yeux et change la carte d'un autre joueur en celle du centre de la table, mais sans les regarder."
                        : "Bachaquera, abre los ojos y cambia la carta de otro jugador por una del centro de la mesa, pero sin mirarlas.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        i++;
        firstpop = true;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Profiteer, close your eyes."
                    : selectedLanguage == 2
                        ? "Profiteer, ferme les yeux."
                        : "Bachaquera, cierra los ojos",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      }
    } else if (i == 10) {
      if (firstpop) {
        firstpop = false;
        Future.delayed(Duration(seconds: 11 + additionTime), () {
          myTimer?.cancel();
          setState(() {});
        });

        playAudio(selectedLanguage == 1
            ? 'audios/English/en_20a_e.mp3'
            : selectedLanguage == 2
                ? 'audios/French/fr_20a_e.mp3'
                : "audios/Spanish/es_20a_e.mp3");
        Future.delayed(Duration(seconds: 8 + additionTime), () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_20a_s.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_20a_s.mp3'
                  : "audios/Spanish/es_20a_s.mp3");
          setState(() {});
        });

        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Watchman, open your eyes and look at your card, to see if your card was changed."
                    : selectedLanguage == 2
                        ? "Watchman, ouvre les yeux et regarde ta carte, pour voir si ta carte a été changée ."
                        : "Vigilante, abre los ojos y mira tu carta, para ver si te cambiaron la carta.",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      } else {
        i++;
        firstpop = true;
        return Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image.asset(
                "assets/images/${cardList[order.indexOf(i - 1)].imageUrl}",
                height: 150,
                width: 100,
              ),
              Container(
                  child: Text(
                selectedLanguage == 1
                    ? "Watchman, close your eyes."
                    : selectedLanguage == 2
                        ? "Watchman, ferme les yeux."
                        : "Vigilante, cierra los ojos",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ))
            ]));
      }
    } else {
      playAudio(selectedLanguage == 1
          ? 'audios/English/en_00_s.mp3'
          : selectedLanguage == 2
              ? 'audios/French/fr_00_s.mp3'
              : "audios/Spanish/es_00_s.mp3");
      myTimer?.cancel();

      return (Container(
          child: Countdown(
        duration: Duration(seconds: int.parse(gameTime)),
        onFinish: () {
          playAudio(selectedLanguage == 1
              ? 'audios/English/en_vote.mp3'
              : selectedLanguage == 2
                  ? 'audios/French/fr_vote.mp3'
                  : "audios/Spanish/es_vote.mp3");
          Navigator.pop(context);
        },
        builder: (BuildContext context, Duration remaining) {
          if (first && remaining.inSeconds < 11) {
            first = false;
            playAudio(selectedLanguage == 1
                ? 'audios/English/en_count.mp3'
                : selectedLanguage == 2
                    ? 'audios/French/fr_count.mp3'
                    : "audios/Spanish/es_count.mp3");
          }
          return Text(
            '${remaining.inSeconds}',
            style: const TextStyle(fontSize: 50, color: Colors.white),
            textAlign: TextAlign.center,
          );
        },
      )));
    }
  }

  @override
Widget build(BuildContext context) {
  if (firstTime) {
    startTimer();
    firstTime = false;
  }

  return Scaffold(
    body: SafeArea(
      child: Container(
        color: primaryColor,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/$banner.png",
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              flex: 9,
              child: PopScope(
                canPop: false,
                onPopInvoked: (didPop) {
                  if (didPop) {
                    return;
                  }
                  // Aquí puedes añadir lógica adicional si es necesario
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 100),
                  color: primaryColor,
                  alignment: Alignment.center,
                  child: pgeWidget(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  await audioPlayer.stop();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  color: buttonColor,
                  child: const Text(
                    "Stop",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
  @override
  void dispose() {
    audioPlayer.dispose();
    myTimer?.cancel();
    super.dispose();
  }
}
