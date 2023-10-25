import 'dart:convert';
import 'dart:io';

Map<int, FreelancersId> freelancersId = {};
Map<int, Team> teamFind = {};
int nbTeamFind = 0;
int team = 0;
int budget = 0;
int maxUsers = 0;

class FreelancersId {
  final String name;
  final int budget;

  FreelancersId(this.name, this.budget);
}

class Team {
  final List<int> id;

  Team(this.id);
}

Map<String, int> fillFreelancers(dynamic data) {
  Map<String, int> freelancers = {};

  for (dynamic item in data) {
    if (item is Map<String, dynamic>) {
      if (item.containsKey("name") && item.containsKey("price")) {
        freelancers[item["name"]] = item["price"];
      }
    }
  }
  return freelancers;
}

void fillFreelancersId(Map<String, int> freelancers) {
  int id = 0;
  freelancersId = {};

  for (var user in freelancers.entries) {
    String key = user.key;
    int value = user.value;
    var newFreelancersId = FreelancersId(key, value);
    freelancersId[id] = newFreelancersId;
    id++;
  }
}

Future<void> readJsonFile() async {
  final file = File('./freelancers.json');
  Map<String, int> freelancers = {};
  List<dynamic> data;

  try {
    final jsonData = await file.readAsString();
    data = json.decode(jsonData)["freelancers"];
    freelancers = fillFreelancers(data);
    fillFreelancersId(freelancers);
  } catch (e) {
    print('Error while reading the file: $e');
  }
}

bool checkArg(List<String> arg) {
  if (arg.length == 2) {
    int value1 = 0;
    int value2 = 0;

    if (int.tryParse(arg[0]) != null && int.tryParse(arg[1]) != null) {
      value1 = int.parse(arg[0]);
      value2 = int.parse(arg[1]);

      if (value1 >= 1 && value1 <= 100 && value2 >= 100 && value2 <= 10000) {
        return true;
      } else {
        print("arg[0] or arg[1] is outside the specified ranges.");
        return false;
      }
    } else {
      print("arg[0] or arg[1] is not a valid number.");
      return false;
    }
  } else {
    print("Only two arguments are allowed.");
    return false;
  }
}

bool checkAlreadyInTeamFind(List<int> id) {
  List<int> tmpId = List.from(id);
  tmpId.sort();

  for (var key in teamFind.keys) {
    List<int> tmpTeamFind = [];

    if (teamFind.containsKey(key)) {
      tmpTeamFind = List.from(teamFind[key]!.id);
    }

    tmpTeamFind.sort();

    if (tmpId.toString() == tmpTeamFind.toString()) {
      return false;
    }
  }
  return true;
}

void checkTeamBudget(List<int> id, int budget, int team) {
  int total = 0;

  for (int nb in id) {
    if (freelancersId.containsKey(nb)) {
      total += freelancersId[nb]!.budget;
    }
  }

  if (total == budget) {
    if (!checkAlreadyInTeamFind(id)) {
      return;
    }
    final List<int> newId = List.from(id);
    var newTeam = Team(newId);
    teamFind[nbTeamFind] = newTeam;
    nbTeamFind++;
  }
}

void findTeam(List<int> id) {
  // Initialisation de la liste des combinaisons
  List<List<int>> listeCombinaisons = [];

  // Ajout du premier ensemble d'indices à la liste des combinaisons
  listeCombinaisons.add(List.from(id));

  int i = team - 1; // On commence à incrémenter le dernier indice de la liste

  while (i != -1) {
    id[i] += 1; // On incrémente l'indice actuel

    for (int j = i + 1; j < team; j++) {
      // On recale les indices des éléments suivants par rapport à l'indice incrémente
      id[j] = id[j - 1] + 1;
    }

    if (id[i] == (maxUsers - team + i)) {
      // Si l'indice actuel a atteint sa valeur maximale, on repère l'indice précédent
      i -= 1;
    } else {
      // Sinon, on repère le dernier indice
      i = team - 1;
    }
    checkTeamBudget(List.from(id), budget, team);
  }

}

void main(List<String> arg) async {
  if (!checkArg(arg)) {
    return;
  }

  await readJsonFile();
  maxUsers = freelancersId.length;
  team = int.parse(arg[0]);
  budget = int.parse(arg[1]);

  List<int> id = [];

  for (int i = 0; i < team; i++) {
    id.add(i);
  }

  findTeam(id);

  print("Result : $nbTeamFind");
  for (var key in teamFind.keys) {
    List<int> id = [];
    id = teamFind[key]!.id;
    print(teamFind[key]?.id);
    for (var nb in id) {
      print(freelancersId[nb]?.name);
      print(freelancersId[nb]?.budget);
    }
  }
}
