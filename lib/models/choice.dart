import 'package:destini/models/story_node.dart';

class Choice {
  final String text;
  final StoryNode nextNode;

  Choice({required this.text, required this.nextNode});

  factory Choice.fromMap(Map<String, dynamic> map) {
    return Choice(
      text: map['text'],
      nextNode: StoryNode.fromMap(map['nextNode']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'nextNode': nextNode.toMap(),
    };
  }
}
