import 'match_info_model.dart';
import 'info_score.dart';


class ScoreApiResponse {
  String? apikey;
  List<MatchInfo>? data;
  String? status;
  ScoreInformation? info;

  ScoreApiResponse({this.apikey, this.data, this.status, this.info});

  ScoreApiResponse.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    if (json['data'] != null) {
      data = <MatchInfo>[];
      json['data'].forEach((v) {
        data!.add(new MatchInfo.fromJson(v));
      });
    }
    status = json['status'];
    info = json['info'] != null ? new ScoreInformation.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apikey'] = this.apikey;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}








