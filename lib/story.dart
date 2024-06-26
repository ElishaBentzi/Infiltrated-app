import 'package:audioplayers/audioplayers.dart';
import 'package:infiltratedtest/main.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  StoryState createState() => StoryState();
}

class StoryState extends State<Story> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _playAudio();
  }

  Future<void> _playAudio() async {
    String audioPath = _getAudioPath();
    await audioPlayer.play(AssetSource(audioPath));
  }

  String _getAudioPath() {
    if (story == 1) {
      return selectedLanguage == 1
          ? 'audios/English/story_en_right.mp3'
          : selectedLanguage == 2
              ? 'audios/French/story_fr_right.mp3'
              : "audios/Spanish/story_es_right.mp3";
    } else {
      return selectedLanguage == 1
          ? 'audios/English/story_en_left.mp3'
          : selectedLanguage == 2
              ? 'audios/French/story_fr_left.mp3'
              : "audios/Spanish/story_es_left.mp3";
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        await _stopAudioAndPop();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 12,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _getStoryText(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: _stopAudioAndPop,
                  child: Container(
                    color: buttonColor,
                    alignment: Alignment.center,
                    child: const Text(
                      "Return",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _stopAudioAndPop() async {
    await audioPlayer.stop();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  String _getStoryText() {
    if (story == 2) {
      return selectedLanguage == 1
          ? "A democratic government is being harassed by a terrorist group, which seeks to destabilize it and seize power through violence. The government has a plan to catch today the terrorists and bring them to justice, but this plan may fail because the government has been infiltrated by terrorist agents. Let discover the Infiltrates, so democracy can be maintained, or the republic will be lost and the fascism will win. The destiny of the country is in your hands and is played today."
          : selectedLanguage == 2
              ? "Un gouvernement démocratique est harcelé par un groupe terroriste qui cherche à le déstabiliser et à prendre le pouvoir par la violence. Le gouvernement a un plan pour attraper aujourd'hui les terroristes et les traduire en justice, mais ce plan pourrait échouer parce que le gouvernement a été infiltré par des agents terroristes. Laissons découvrir les Infiltrés, afin que la démocratie puisse être maintenue, ou la république sera perdue et le fascisme gagnera. Le destin du pays est entre vos mains et se joue aujourd'hui."
              : "Un gobierno terrorista está siendo hostigado por un grupo terrorista, que busca desestabilizarlo y tomar el poder a través de la violencia. El gobierno tiene un plan para atrapar hoy a los terroristas y llevarlos ante la justicia, pero este plan puede fallar porque el gobierno ha sido infiltrado por agentes terroristas. Dejemos descubrir a los infiltrados, para que se pueda mantener la democracia, o la república se perderá y el fascismo ganará. El destino del país está en tus manos y se juega hoy.";
    } else {
      return selectedLanguage == 1
          ? "A group of brave citizens, freedom fighters, today decide their strategies to free their country from the evil power of a fascist government that became a dictatorship. Some of them asking for help from friendly countries, others solving the problem with their own hands, protesting, and others praying to their god for justice to be done. But their plans are in danger of failing because citizens have been infiltrated by government agents. Let discover the Infiltrates, so that freedom and democracy will impose themselves, or the plans of our citizens will fail and they will be imprisoned by the fascist government. The destiny of the country is in your hands and is played today."
          : selectedLanguage == 2
              ? "Un groupe de braves citoyens, des combattants de la liberté, décident aujourd'hui de leurs stratégies pour libérer leur pays de la puissance perverse d'un gouvernement fasciste devenu une dictature. Certains d'entre eux demandent l'aide de pays amis, d'autres résolvent le problème de leurs propres mains, protestent et d'autres prient leur dieu pour que justice soit faite. Mais leurs plans risquent d'échouer car les citoyens ont été infiltrés par des agents du gouvernement. Laissons découvrir les Infiltrés, pour que la liberté et la démocratie s'imposent, ou que les plans de nos concitoyens échouent et qu'ils soient emprisonnés par le gouvernement fasciste. Le destin du pays est entre vos mains et se joue aujourd'hui."
              : "Un grupo de valientes ciudadanos, luchadores por la libertad, hoy decide sus estrategias para liberar a su país del poder maligno de un gobierno fascista que se convirtió en una dictadura. Algunos de ellos pidieron ayuda a países amigos, otros resolvieron el problema con sus propias manos, protestaron y otros oraron a su dios para que se hiciera justicia. Pero sus planes corren peligro de fracasar porque los ciudadanos han sido infiltrados por agentes del gobierno. Descubramos a los infiltrados, para que la libertad y la democracia se impongan, o los planes de nuestros ciudadanos fracasen y sean encarcelados por el gobierno fascista. El destino del país está en tus manos y se juega hoy.";
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
