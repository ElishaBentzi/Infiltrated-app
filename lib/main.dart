import 'package:flutter/material.dart';
import 'package:infiltratedtest/story.dart';
import 'package:infiltratedtest/choose_page.dart';

String gameTime = "120";
int roleTime = 4;
int selectedLanguage = 1;
int story = 0;
int playersNumber =4;

const primaryColor = Color(0xFF3dc5ea);
const buttonColor = Color(0xFF3B2071);
const yellow = Color(0xFFFDCC57);

void main() async => Future.delayed(const Duration(seconds: 3),(){runApp(const MyApp());});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0.025 * height),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
                vertical: 0.025 * height, horizontal: 0.05 * width),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor,
            ),
            child: Column(children: <Widget>[
              Expanded(
                flex: 9,
                child: Container(
                    child: Column(
                  children: <Widget>[                    Container(
                        margin: EdgeInsets.only(
                            top: 0.01 * height, bottom: 0.025 * height),
                        child: Text(
                          selectedLanguage == 1
                              ? "Home"
                              : selectedLanguage == 2 ? "Accueil" : "Inicio",
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 0.015 * height),
                      child: Text(
                        selectedLanguage == 1
                            ? "Language"
                            : selectedLanguage == 2 ? "langue" : "Idioma",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(0.01 * height),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedLanguage = 1;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: selectedLanguage == 1
                                    ? Colors.white
                                    : primaryColor,
                              ),
                              child: Text(
                                selectedLanguage == 1
                                    ? "English"
                                    : selectedLanguage == 2
                                        ? "Anglais"
                                        : "Inglés",
                                style: selectedLanguage == 1
                                    ? const TextStyle(
                                        color: primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)
                                    : const TextStyle(
                                        color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedLanguage = 2;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: selectedLanguage == 2
                                    ? Colors.white
                                    : primaryColor,
                              ),
                              child: Text(
                                selectedLanguage == 1
                                    ? "French"
                                    : selectedLanguage == 2
                                        ? "Francais"
                                        : "Francés",
                                style: selectedLanguage == 2
                                    ? const TextStyle(
                                        color: primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)
                                    : const TextStyle(
                                        color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedLanguage = 3;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: selectedLanguage == 3
                                    ? Colors.white
                                    : primaryColor,
                              ),
                              child: Text(
                                selectedLanguage == 1
                                    ? "Spanish"
                                    : selectedLanguage == 2
                                        ? "espagnol"
                                        : "español",
                                style: selectedLanguage == 3
                                    ? const TextStyle(
                                        color: primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)
                                    : const TextStyle(
                                        color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.05 * height),
                      child: Text(
                        selectedLanguage == 1
                            ? "Game Timer"
                            : selectedLanguage == 2
                                ? "Minuteur de jeu"
                                : "Temporizador de juego",
                        style: TextStyle(
                            fontSize: height*width*0.00005,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 0.01 * height, horizontal: 0.025 * width),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (int.parse(gameTime) < 300) {
                                  setState(() {
                                    gameTime =
                                        (int.parse(gameTime) + 30).toString();
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height*width*0.000075,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (int.parse(gameTime) > 30) {
                                  setState(() {
                                    gameTime =
                                        (int.parse(gameTime) - 30).toString();
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height*width*0.000075,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(left: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Text(
                                "$gameTime seconds",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height*width*0.000075,
                                  color: primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.015 * height),
                      child: Text(
                        selectedLanguage == 1
                            ? "Role Timer"
                            : selectedLanguage == 2
                                ? "Minuterie de rôle"
                                : "Temporizador de roles",
                        style: TextStyle(
                            fontSize: height*width*0.00005,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 0.01 * height, horizontal: 0.025 * width),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (roleTime < 10) {
                                  setState(() {
                                    roleTime++;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height*width*0.000075,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (roleTime > 0) {
                                  setState(() {
                                    roleTime--;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height*width*0.000075,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(left: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Text("$roleTime seconds",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height*width*0.000075,
                                  color: primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.015 * height),
                      child: Text(
                        selectedLanguage == 1
                            ? "Storys"
                            : selectedLanguage == 2 ? "Histoires" : "Historias",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 0.01 * height, horizontal: 0.025 * width),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                story = 1;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Story()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(width * 0.02),
                                padding: EdgeInsets.symmetric(
                                    vertical: width * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Text(
                                  selectedLanguage == 1
                                      ? "Extreme Right"
                                      : selectedLanguage == 2
                                          ? "extrême droite"
                                          : "Extrema Derecha",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * width * 0.000055,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                story = 2;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Story()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(width * 0.02),
                                padding: EdgeInsets.symmetric(
                                    vertical: width * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Text(
                                  selectedLanguage == 1
                                      ? "Extreme Left"
                                      : selectedLanguage == 2
                                          ? "extrême Gauche"
                                          : "Extrema Izquierda",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * width * 0.000055,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
              ),
              Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 0.01 * height, horizontal: 0.025 * width),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (playersNumber < 15) {
                                  setState(() {
                                    playersNumber++;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height*width*0.000075,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (playersNumber > 4) {
                                  setState(() {
                                    playersNumber--;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height*width*0.000075,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(left: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Text("$playersNumber players",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height*width*0.000075,
                                  color: primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChoosePage()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Text(
                        selectedLanguage == 1
                            ? "Continue"
                            : selectedLanguage == 2 ? "Continuer" : "Seguir",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                    ),
                  )),
                  
            ]),
          ),
        ),
      ),
    );
  }
}
