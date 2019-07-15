class Life {
  int life = 900;
  DateTime birthDay;

  static int dateDifference(DateTime date1, DateTime date2) {
    int result = date1.day - date2.day > 0 ? 1 : 0;
    return (date1.year - date2.year) * 12 + date1.month - date2.month + result;
  }

  Life(DateTime birthDay) {
    this.birthDay = birthDay;
  }

  int pastLife() {
    return dateDifference(DateTime.now(), this.birthDay);
  }

  int remainingLife() {
    return life - pastLife();
  }
}
