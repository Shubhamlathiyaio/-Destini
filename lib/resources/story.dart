import 'package:destini/models/choice.dart';
import 'package:destini/models/story_node.dart';
import 'package:destini/resources/consts.dart';

final StoryNode rootStory = StoryNode(
  story:
      "🧒 Leo finds a mysterious map 🗺️ in his grandma’s attic. It leads to the magical Enchanted Forest 🌳 full of wonders. He stands at its edge.",
  question: "Which path should he take?",
  soundAsset: soundLostInForest,
  choices: [
    Choice(
      text: "🐾 Follow the glowing paw prints",
      nextNode: StoryNode(
        story:
            'Leo finds a talking wolf 🐺 by a silver gate. "Solve my riddle to pass," it says.',
        question: "What should Leo do?",
        soundAsset: soundCreepyHouse,
        choices: [
          Choice(
            text: "🧠 Solve the riddle",
            nextNode: StoryNode(
              story: "Leo thinks hard... 🧠✨ (to be continued)",
              soundAsset: soundEnterHouse,
            ),
          ),
          Choice(
            text: "🚪 Ask to see behind the gate",
            nextNode: StoryNode(
              story: "The wolf growls... 🐺🚪 (to be continued)",
              soundAsset: soundGrowlingSound,
            ),
          ),
        ],
      ),
    ),
    Choice(
      text: "🍄 Follow the sparkling mushrooms",
      nextNode: StoryNode(
        story:
            "Leo shrinks 🐜 and sees a fairy village 🧚 under a toadstool.",
        question: "What should Leo do?",
        soundAsset: soundRunAway,
        choices: [
          Choice(
            text: "🏠 Knock on the fairy queen’s door",
            nextNode: StoryNode(
              story: "The door creaks open... 🧚🚪 (to be continued)",
              soundAsset: soundEnterHouse,
            ),
          ),
          Choice(
            text: "🎒 Search his backpack",
            nextNode: StoryNode(
              story: "He finds a glowing marble... 🎒✨ (to be continued)",
              soundAsset: soundFaceTheGrowl,
            ),
          ),
        ],
      ),
    ),
  ],
);
