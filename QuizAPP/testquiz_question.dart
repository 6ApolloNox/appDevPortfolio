class TestquizQuestion {
  const TestquizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> get listShuffled {
    final listShuffled = List.of(answers);
    listShuffled.shuffle();
    return listShuffled;
  }
}
