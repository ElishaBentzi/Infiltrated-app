import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infiltratedtest/main.dart';
import 'package:infiltratedtest/page_two.dart';

int total =0;
int i = 0;
int inf1Number = 2;
int inf2Number = 0;

class InfCard {
  String name;
  String imageUrl;
  int order;
  int count;
  int selected;

  InfCard({
    this.name ="",
    this.imageUrl ="",
    this.order = 0,
    this.count = 0,
    this.selected = 0
  });
}

List<InfCard> cardList=[];

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  ChoosePageState createState() => ChoosePageState();
}

class ChoosePageState extends State<ChoosePage> {
  @override
  void initState() {
    cardList = [
      InfCard(
          name: selectedLanguage == 1
              ? "Infiltrator"
              : selectedLanguage == 2 ? "Infiltrator" : "Infiltrado",
          imageUrl: "Infiltrator1.png",
          order: 1,
          selected: 1),
      /*InfCard(
          name: selectedLanguage == 1
              ? "Infiltrator"
              : selectedLanguage == 2 ? "Infiltrator" : "Infiltrado",
          imageUrl: "Infiltrator1.png",
          order: 1,
          selected: 1),*/
      InfCard(
        name: selectedLanguage == 1
            ? "Infiltrator"
            : selectedLanguage == 2 ? "Infiltrator" : "Infiltrado",
        imageUrl: "Infiltrator2.png",
        order: 1,
      ),
      /*InfCard(
        name: selectedLanguage == 1
            ? "Infiltrator"
            : selectedLanguage == 2 ? "Infiltrator" : "Infiltrado",
        imageUrl: "Infiltrator2.png",
        order: 1,
      ),*/
      InfCard(
          name: selectedLanguage == 1
              ? "Corruptor"
              : selectedLanguage == 2 ? "Corruptor" : "Corruptor",
          imageUrl: "Corruptor.png",
          order: 2,
          selected: playersNumber > 13 ? 1 : 0),
      InfCard(
          name: selectedLanguage == 1
              ? "Greedy"
              : selectedLanguage == 2 ? "Greedy" : "Enchufado",
          imageUrl: "Greedy.png",
          order: 3,
          selected: playersNumber > 6 ? 1 : 0),
      InfCard(
          name: selectedLanguage == 1
              ? "Fanatic"
              : selectedLanguage == 2 ? "Fanatic" : "Fanatico",
          imageUrl: "Fanatic1.png",
          order: 4,
          selected: playersNumber > 7 ? 1 : 0),
      InfCard(
          name: selectedLanguage == 1
              ? "Fanatic"
              : selectedLanguage == 2 ? "Fanatic" : "Fanatico",
          imageUrl: "Fanatic2.png",
          order: 4,
          selected: playersNumber > 7 ? 1 : 0),
      InfCard(
        name: selectedLanguage == 1
            ? "Witch"
            : selectedLanguage == 2 ? "Witch" : "Bruja",
        imageUrl: "Witch.png",
        order: 5,
        selected: 1,
      ),
      InfCard(
        name: selectedLanguage == 1
            ? "Thief"
            : selectedLanguage == 2 ? "Thief" : "Malandro",
        imageUrl: "Thief.png",
        order: 6,
        selected: 1,
      ),
      InfCard(
          name: selectedLanguage == 1
              ? "Temptress"
              : selectedLanguage == 2 ? "Temptress" : "Tentadora",
          imageUrl: "Temptress.png",
          order: 7,
          selected: playersNumber > 11 ? 1 : 0),
      InfCard(
          name: selectedLanguage == 1
              ? "Drunk"
              : selectedLanguage == 2 ? "Drunk" : "Borracho",
          imageUrl: "Drunk.png",
          order: 8,
          selected: playersNumber > 12 ? 1 : 0),
      InfCard(
          name: selectedLanguage == 1
              ? "Profiteer"
              : selectedLanguage == 2 ? "Profiteer" : "Bachaquera",
          imageUrl: "Profiteer.png",
          order: 9,
          selected: playersNumber > 4 ? 1 : 0),
      InfCard(
        name: selectedLanguage == 1
            ? "Watchman"
            : selectedLanguage == 2 ? "Watchman" : "Vigilante",
        imageUrl: "Watchman.png",
        order: 10,
        selected: 1,
      ),
      InfCard(
          name: selectedLanguage == 1
              ? "Mercenary"
              : selectedLanguage == 2 ? "Mercenary" : "Paramilitar",
          imageUrl: "Mercenary.png",
          order: -1,
          selected: playersNumber > 9 ? 1 : 0),
      InfCard(
          name: selectedLanguage == 1
              ? "Protester"
              : selectedLanguage == 2 ? "Protester" : "Guarimbero",
          imageUrl: "Protester.png",
          order: -1,
          selected: playersNumber > 14 ? 1 : 0),
      InfCard(
        name: selectedLanguage == 1
            ? "Citizen"
            : selectedLanguage == 2 ? "Citizen" : "Ciudadano",
        imageUrl: "Citizen.png",
        order: -1,
        selected: playersNumber > 8 ? 1 : playersNumber > 7 ? 0 : 1,
      ),
      InfCard(
          name: selectedLanguage == 1
              ? "Portu"
              : selectedLanguage == 2 ? "Portu" : "Portu",
          imageUrl: "Portuguese.png",
          order: -1,
          selected: playersNumber > 10 ? 1 : 0),
      InfCard(
          name: selectedLanguage == 1
              ? "Asian"
              : selectedLanguage == 2 ? "Asian" : "Chino",
          imageUrl: "Asian.png",
          order: -1,
          selected: playersNumber > 5 ? 1 : 0),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    inf1Number < 1 ? cardList[0].selected = 0 : cardList[0].selected = 1;
    inf2Number < 1 ? cardList[1].selected = 0 : cardList[1].selected = 1;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 12,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0.01 * height),
child: MasonryGridView.count(
  crossAxisCount: 3,
  itemCount: cardList.length,
  itemBuilder: (BuildContext context, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            // Tu lógica de onTap existente
            if (index == 4 || index == 5) {
              if (cardList[4].selected == 0 ||
                  cardList[5].selected == 0) {
                cardList[4].selected = 1;
                cardList[5].selected = 1;
              } else {
                cardList[4].selected = 0;
                cardList[5].selected = 0;
              }
            } else if (index == 0 || index == 1) {
              // Toda la lógica existente para index 0 y 1
            } else {
              if (cardList[index].selected == 0) {
                cardList[index].selected = 1;
              } else {
                cardList[index].selected = 0;
              }
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: primaryColor, width: 3),
            color: cardList[index].selected == 1
                ? primaryColor
                : Colors.white,
          ),
          child: Column(
            children: <Widget>[
              if (cardList[index].imageUrl == "Infiltrator1.png")
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: yellow,
                  ),
                  child: Text(
                    "$inf1Number",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: buttonColor,
                    ),
                  ),
                )
              else if (cardList[index].imageUrl == "Infiltrator2.png")
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: yellow,
                  ),
                  child: Text(
                    "$inf2Number",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: buttonColor,
                    ),
                  ),
                )
              else
                const SizedBox(height: 25, width: 25),
              Image.asset(
                "assets/images/${cardList[index].imageUrl}",
                width: height * 0.125,
                height: height * 0.25,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  cardList[index].name,
                  style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.bold,
                    color: cardList[index].selected == 1
                        ? yellow
                        : primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  },
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
)),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              if (cardList.where((crd) => crd.selected == 1).length < 4) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(selectedLanguage == 1
                            ? "at least 4 players"
                            : selectedLanguage == 2
                                ? "au moins 4 joueurs"
                                : "al menos 4 jugadores"),
                      );
                    });
              } /*else if (cardList
                      .where((crd) => crd.selected == 1 && crd.order == 4)
                      .length ==
                  1) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(selectedLanguage == 1
                            ? "both Fanatics should be selected"
                            : selectedLanguage == 2
                                ? "les deux fanatiques doivent être sélectionnés"
                                : "ambos fanáticos deben ser seleccionados"),
                      );
                    });
              } else if (cardList
                      .where((crd) => crd.order == 1 && crd.selected == 1)
                      .length ==
                  2) {
                i = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageTwo(),
                  ),
                );
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(selectedLanguage == 1
                            ? "Please select exactly 2 infiltrators"
                            : selectedLanguage == 2
                                ? "Veuillez sélectionner exactement 2 infiltrateurs"
                                : "Por favor seleccione exactamente 2 infiltrados"),
                      );
                    });
              }*/
              else {
                i = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageTwo(),
                  ),
                );
              }
            },
            child: Stack(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  color: buttonColor,
                  child: Text(
                    selectedLanguage == 1
                        ? "Start"
                        : selectedLanguage == 2 ? "Début" : "Comienzo",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
              Row(children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/images/players.png",
                      fit: BoxFit.contain,
                      color: Colors.white,
                    )),

                /*child: Text(
                        selectedLanguage == 1
                            ? "Players Number" + " : \n ${cardList.where((crd) => crd.selected == 1).length - 2}"
                            : selectedLanguage == 2
                                ? "nombre de joueurs" + " : \n ${cardList.where((crd) => crd.selected == 1).length - 2}"
                                : "número de jugadores" +
                                    " : \n ${cardList.where((crd) => crd.selected == 1).length - 2}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),*/
                Container(
                    child: Text(
                  "${cardList.where((crd) => crd.selected == 1 && crd.order != 1).length - 2 + inf1Number + inf2Number}",
                  style: const TextStyle(
                      color: yellow, fontWeight: FontWeight.bold, fontSize: 16),
                )),
              ])
            ]),
          ),
        )
      ],
    ));
  }
}
