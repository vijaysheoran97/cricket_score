class Score {
  int? r;
  int? w;
  num? o;
  String? inning;

  Score({this.r, this.w, this.o, this.inning});

  Score.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    w = json['w'];
    o = json['o'];
    inning = json['inning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['r'] = this.r;
    data['w'] = this.w;
    data['o'] = this.o;
    data['inning'] = this.inning;
    return data;
  }
}