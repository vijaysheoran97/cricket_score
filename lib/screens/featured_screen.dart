import 'package:cricket_score/model_class/match_info_model.dart';
import 'package:flutter/material.dart';
import '../model_class/score_api_response.dart';
import '../service/match_api_service.dart';
import 'match_detail_screen.dart';

class FeaturedScreen extends StatefulWidget {
  MatchInfo matchInfo;

  FeaturedScreen({super.key, required this.matchInfo});

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  late MatchApiService matchApiService;
  ScoreApiResponse? scoreApiResponse;

  getMatchInformation() async {
    scoreApiResponse = await MatchApiService.getMatchInformation();
    setState(() {});
  }

  @override
  void initState() {
    getMatchInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.teal[600],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FEATURED',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'FEATURED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  'CRICBUZZ PLUS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: scoreApiResponse?.data?.length ?? 0,
          itemBuilder: (context, index) {
            MatchInfo? matchInfo = scoreApiResponse?.data![index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MatchDetailScreen(
                    matchInfo: matchInfo,
                    information: scoreApiResponse?.info,
                  );
                }));
              },
              child: Card(
                child: ListTile(
                  title: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Icon(Icons.notifications_active_outlined)],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Image.network(
                            matchInfo!.teamInfo![0].img.toString(),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(matchInfo!.teamInfo![0].shortname.toString()),
                          const Spacer(),
                          const Text(
                            'V/S',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(matchInfo!.teamInfo![1].shortname.toString()),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.network(
                            matchInfo!.teamInfo![1].img.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          Text(matchInfo.status.toString()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
