import 'package:flutter/material.dart';
import '../algo/nbMatchingTeams.dart';

Map<String, int> myMap = {
  'item1': 42,
  'item2': 17,
  'item3': 99,
};

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      heightFactor: 0.8,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 80,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF5F9D82),
                  ),
                  child: Center(
                    child: Text(
                      'Freelancers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  )),
            ),
            for (var person in freelancersId.keys) Freelancers(person: person),
          ],
        ),
      ),
    );
  }
}

class Freelancers extends StatelessWidget {
  final person;
  const Freelancers({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF5F9D82),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 5,
              spreadRadius: 3,
            ),
          ],
        ),
        width: 200,
        height: 60,
        margin: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: Colors.white,
              ),
              width: 50,
              height: 50,
              child: Image.network(
                "https://cdn.icon-icons.com/icons2/1736/PNG/512/4043272-avatar-lazybones-sloth-sluggard_113274.png",
                width: 50,
                height: 50,
              ),
            ),
            Column(
              children: [
                Container(
                  width: 200,
                  height: 30,
                  alignment: Alignment.bottomLeft,
                  child: Text("${freelancersId[person]!.name}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ),
                Container(
                  width: 200,
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Price: ${freelancersId[person]!.budget}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
