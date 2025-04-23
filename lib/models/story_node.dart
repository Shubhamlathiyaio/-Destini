import 'package:destini/models/choice.dart';

class StoryNode {
  final String story;
  final String? question;
  final List<Choice>? choices;
  final String? bgImage;
  final String? emojiAsset;
  final String? soundAsset;

  StoryNode({
    required this.story,
    this.question,
    this.choices,
    this.bgImage,
    this.emojiAsset,
    this.soundAsset,
  });

  factory StoryNode.fromMap(Map<String, dynamic> map) {
    return StoryNode(
      story: map['story'],
      question: map['question'],
      bgImage: map['bgImage'],
      emojiAsset: map['emojiAsset'],
      soundAsset: map['soundAsset'],
      choices: (map['choices'] as List<dynamic>?)
          ?.map((choiceMap) => Choice.fromMap(choiceMap))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'story': story,
      'question': question,
      'bgImage': bgImage,
      'emojiAsset': emojiAsset,
      'soundAsset': soundAsset,
      'choices': choices?.map((c) => c.toMap()).toList(),
    };
  }
}
