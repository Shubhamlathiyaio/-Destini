import 'package:audioplayers/audioplayers.dart';
import 'package:destini/services/commons/common_chip.dart';
import 'package:destini/services/commons/common_spacing.dart';
import 'package:destini/services/commons/common_text.dart';
import 'package:destini/resources/consts.dart';
import 'package:destini/services/media_query_helper.dart';
import 'package:destini/resources/story.dart';
import 'package:destini/models/story_node.dart';
import 'package:destini/views/final_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initStory();
    _playSound(soundLostInForest);
  }

  void _playSound(String? soundAsset) {
    if (soundAsset != null) {
      _audioPlayer.stop(); // Stop previous sound
      _audioPlayer.play(AssetSource(soundAsset));
    }
  }

  late StoryNode story;
  void initStory() {
    story = StoryNode(
        story: rootStory.story,
        question: rootStory.question,
        choices: rootStory.choices);
  }

  bool isGoodEnding = false;
  void chackEnding(StoryNode storyNode) {
    if (storyNode.story.contains("Leo thinks hard") ||
        storyNode.story.contains("The door creaks open")) {
      isGoodEnding = true;
    } else if (storyNode.story.contains("The wolf growls") ||
        storyNode.story.contains("Leo pulls out a glowing marble")) {
      // 💀 Bad Ending
      isGoodEnding = false;
    }
  }
Future<void> _stopSound() async {
  await _audioPlayer.stop();
}
  @override
  Widget build(BuildContext context) {
    if (story.choices == null || story.choices!.isEmpty) {
      _stopSound();
      return FinalPage(isGoodEnding: isGoodEnding);
    } else {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonChip(
                backgroundColor: Colors.black45,
                child: storyText(
                  data: story.story,
                  fontColor: Colors.white,
                  textAlign: TextAlign.justify,
                  fontSize: 18,
                ),
              ),
              h20,
              Align(
                alignment: Alignment.centerLeft,
                child: CommonChip(
                  radius: 2,
                  backgroundColor: Colors.black45,
                  child: FittedBox(
                    child: Text(
                      story.question ?? "?",
                      maxLines: 2,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              h20,
              CustomButton(
                  text: story.choices![0].text,
                  onPressed: () {
                    story = story.choices![0].nextNode;
                    chackEnding(story);
                    setState(() {});
                    _playSound(story.soundAsset);
                  }),
              h16,
              CustomButton(
                  text: story.choices![1].text,
                  onPressed: () {
                    story = story.choices![1].nextNode;
                    setState(() {});
                    _playSound(story.soundAsset);
                  }),
            ],
          ),
        ),
      );
    }
  }

  storyText({
    required String data,
    Color? fontColor,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return Text(
      data,
      style: TextStyle(
        color: fontColor ?? Colors.white,
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.5,
        wordSpacing: 1.5,
        shadows: const [
          Shadow(
            color: Colors.black,
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      textAlign: textAlign ?? TextAlign.center,
      maxLines: 100,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryHelper media = MediaQueryHelper(context);
    return SizedBox(
      width: media.screenWidth * 0.7,
      height: media.screenHeight * 0.07 * 1.5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        child: CommonText(
          maxLines: 2,
          data: text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          fontColor: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
