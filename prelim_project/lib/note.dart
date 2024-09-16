class Note {
  final String title;
  final String content;

  Note({
    required this.title,
    required this.content,
  });

  @override
  String toString() => '$title: $content';
}