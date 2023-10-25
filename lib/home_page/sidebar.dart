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
      heightFactor: 0.8, // 70 % de la hauteur de l'écran (de 20 % à 90 %)
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
              color: Colors.black.withOpacity(0.3), // Couleur de l'ombre
              offset: const Offset(
                  0, 5), // Décalage horizontal et vertical de l'ombre
              blurRadius: 5, // Rayon du flou de l'ombre
              spreadRadius: 3, // Optionnel : étend l'ombre (dilatation)
            ),
          ],
        ),
        width: 200,
        height: 60,
        margin:
            const EdgeInsets.all(10.0), // Ajustez le padding selon vos besoins
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
                "https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png",
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
