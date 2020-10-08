class AuxFunctions {
  final scoreList = [0, 0, 0, 0];
  int finalScore = 0;

  void addScore(int _question, int answerScore) {
    scoreList[_question] = answerScore;
  }

  int calcFinalScore() {
    for (int i = 0; i <= scoreList.length; i++) {
      finalScore += scoreList[i];
    }
    return finalScore;
  }
}
