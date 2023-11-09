import 'package:cricket_score/model_class/info_score.dart';
import 'package:flutter/material.dart';


import '../model_class/match_info_model.dart';

class MatchDetailScreen extends StatefulWidget {
   const MatchDetailScreen({super.key,required this.information, this.matchInfo,});

  final ScoreInformation? information;
 final  MatchInfo? matchInfo;

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {

  ScoreInformation? scoreInformation;
  MatchInfo? data;


  @override
  void initState() {
  data = widget.matchInfo;
  scoreInformation = widget.information;
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.matchInfo!.teamInfo![0].shortname.toString()),
            const SizedBox(width: 7),
            Text(widget.matchInfo!.teamInfo![1].shortname.toString()),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'INFO',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Row(
                    children: [
                      const Text('Match Type'),
                      const Spacer(),
                      Text(widget.matchInfo!.matchType.toString()),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text('Date'),
                  const Spacer(),
                  Text(widget.matchInfo!.date.toString()),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text('Time'),
                  const Spacer(),
                  Text(widget.matchInfo!.dateTimeGMT.toString()),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text('Venue'),
                  const Spacer(),
                  Flexible(child: Text(widget.matchInfo!.venue.toString())),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text('History'),
                      const Spacer(),
                      Text(widget.information!.hitsToday.toString()
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Query Time'),
                      const Spacer(),
                      Text(widget.information!.queryTime.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Hits Limit'),
                      const Spacer(),
                      Text(widget.information!.hitsLimit.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Cache'),
                      const Spacer(),
                      Text(widget.information!.cache.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Credits'),
                      const Spacer(),
                      Text(widget.information!.credits.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Hits Today'),
                      const Spacer(),
                      Text(widget.information!.hitsToday.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Sever'),
                      const Spacer(),
                      Text(widget.information!.server.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Total Rows'),
                      const Spacer(),
                      Text(widget.information!.totalRows.toString()),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
