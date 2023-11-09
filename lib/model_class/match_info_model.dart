import 'package:cricket_score/model_class/score_info.dart';
import 'package:cricket_score/model_class/team_info_score.dart';

class MatchInfo {
  String? id;
  String? name;
  String? matchType;
  String? status;
  String? venue;
  String? date;
  String? dateTimeGMT;
  List<String>? teams;
  List<TeamInfo>? teamInfo;
  List<Score>? score;
  String? seriesId;
  bool? fantasyEnabled;
  bool? bbbEnabled;
  bool? hasSquad;
  bool? matchStarted;
  bool? matchEnded;

  MatchInfo(
      {this.id,
        this.name,
        this.matchType,
        this.status,
        this.venue,
        this.date,
        this.dateTimeGMT,
        this.teams,
        this.teamInfo,
        this.score,
        this.seriesId,
        this.fantasyEnabled,
        this.bbbEnabled,
        this.hasSquad,
        this.matchStarted,
        this.matchEnded});

  MatchInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    matchType = json['matchType'];
    status = json['status'];
    venue = json['venue'];
    date = json['date'];
    dateTimeGMT = json['dateTimeGMT'];
    teams = json['teams'].cast<String>();
    if (json['teamInfo'] != null) {
      teamInfo = <TeamInfo>[];
      json['teamInfo'].forEach((v) {
        teamInfo!.add(new TeamInfo.fromJson(v));
      });
    }
    if (json['score'] != null) {
      score = <Score>[];
      json['score'].forEach((v) {
        score!.add(new Score.fromJson(v));
      });
    }
    seriesId = json['series_id'];
    fantasyEnabled = json['fantasyEnabled'];
    bbbEnabled = json['bbbEnabled'];
    hasSquad = json['hasSquad'];
    matchStarted = json['matchStarted'];
    matchEnded = json['matchEnded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['matchType'] = this.matchType;
    data['status'] = this.status;
    data['venue'] = this.venue;
    data['date'] = this.date;
    data['dateTimeGMT'] = this.dateTimeGMT;
    data['teams'] = this.teams;
    if (this.teamInfo != null) {
      data['teamInfo'] = this.teamInfo!.map((v) => v.toJson()).toList();
    }
    if (this.score != null) {
      data['score'] = this.score!.map((v) => v.toJson()).toList();
    }
    data['series_id'] = this.seriesId;
    data['fantasyEnabled'] = this.fantasyEnabled;
    data['bbbEnabled'] = this.bbbEnabled;
    data['hasSquad'] = this.hasSquad;
    data['matchStarted'] = this.matchStarted;
    data['matchEnded'] = this.matchEnded;
    return data;
  }
}