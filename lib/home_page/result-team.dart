import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../algo/nbMatchingTeams.dart';
import './sidebar.dart';

class ResultTeam extends StatelessWidget {
  const ResultTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        width: 550,
        height: 800,
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Center(
                          child: Text(
                            "Team found",
                            style: TextStyle(
                                fontSize: 30, color: Color(0xFF1f4037)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:
                                  nbTeamFind != 0 ? Colors.green : Colors.red,
                            ),
                            width: 100,
                            height: 60,
                            alignment: Alignment.center,
                            child: Text(
                              "$nbTeamFind",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  for (var person in teamFind.keys)
                    Container(
                      color: person % 2 != 0 ? Colors.white : Colors.white24,
                      child: ResultSlider(person: person),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResultSlider extends StatelessWidget {
  final person;
  const ResultSlider({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: CarouselSlider(
        items: [
          for (var nb in teamFind[person]!.id)
            SizedBox(
              width: 300,
              child: Freelancers(person: nb),
            )
        ],
        options: CarouselOptions(
          height: 80,
          viewportFraction: 0.7,
          enableInfiniteScroll: team != 1 ? true : false,
        ),
      ),
    );
  }
}
