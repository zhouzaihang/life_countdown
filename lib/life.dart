import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Life extends Model {
  int life = 900;
  String _key;
  DateTime _birthDay = DateTime(2000, 1, 1);

  DateTime get birthDay => _birthDay;

  set birthDay(DateTime value) {
    _birthDay = value;
    _setBirthday();
    notifyListeners();
  }

  static int dateDifference(DateTime date1, DateTime date2) {
    int result = date1.day - date2.day >= 0 ? 0 : -1;
    return (date1.year - date2.year) * 12 + date1.month - date2.month + result;
  }

  Life(String key) {
    this._key = key;
    _initBirthday();
  }

  int pastLife() {
    return dateDifference(DateTime.now(), this._birthDay);
  }

  int remainingLife() {
    return life - pastLife();
  }

  Future _initBirthday() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String birth = prefs.getString(_key) ?? null;
    if (birth != null) {
      this._birthDay = DateTime.parse(birth);
    }
    notifyListeners();
  }

  Future<bool> _setBirthday() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_key, _birthDay.toString());
  }
}
