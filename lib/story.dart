// ignore_for_file: unused_field, prefer_final_fields

class Story {
  String _storyTitle;
  String _choice1;
  String _choice2;

  Story(this._storyTitle, this._choice1, this._choice2);

  String get getStory => _storyTitle;

  String get choice1 => _choice1;
  String get choice2 => _choice2;
}
