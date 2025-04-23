import 'package:destini/models/choice.dart';
import 'package:destini/models/story_node.dart';

final StoryNode rootStory = StoryNode(
  story:
      "One peaceful morning, 🧒 Leo, a curious child, discovered an ancient map 🗺️ under his grandmother’s attic. It showed a secret path to the Enchanted Forest 🌳, said to hold magical creatures and hidden treasures ✨. Leo stands at the edge of the forest.",
  question: "Which path should he take?",
  choices: [
    Choice(
      text: "🐾 Follow the path with glowing paw prints",
      nextNode: StoryNode(
        story:
            'Leo follows the glowing paw prints and meets a talking wolf 🐺 guarding a silver gate. "Answer my riddle, and I’ll let you pass," the wolf says.',
        question: "What should Leo do?",
        choices: [
          Choice(text: "🧠 Try to solve the riddle", nextNode: StoryNode(story: "Leo thinks hard... 🧠✨ (to be continued)")),
          Choice(text: "🚪 Ask the wolf to show what's behind the gate first", nextNode: StoryNode(story: "The wolf growls suspiciously... 🐺🚪 (to be continued)")),
        ],
      ),
    ),
    Choice(
      text: "🍄 Follow the path with sparkling mushrooms",
      nextNode: StoryNode(
        story:
            "Leo walks along the mushroom trail and suddenly shrinks to the size of an ant 🐜! He sees a tiny fairy village 🧚 hidden under a toadstool.",
        question: "What should Leo do?",
        choices: [
          Choice(text: "🏠 Knock on the fairy queen's door", nextNode: StoryNode(story: "The door creaks open... 🧚🚪 (to be continued)")),
          Choice(text: "🎒 Search his backpack for something magical", nextNode: StoryNode(story: "Leo pulls out a glowing marble... 🎒✨ (to be continued)")),
        ],
      ),
    ),
  ],
);
