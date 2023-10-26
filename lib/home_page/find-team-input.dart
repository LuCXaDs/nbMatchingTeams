import 'package:flutter/material.dart';
import '../algo/nbMatchingTeams.dart';
import './result-team.dart';

class FindTeamInput extends StatefulWidget {
  const FindTeamInput({super.key});
  @override
  _FindTeamInputState createState() => _FindTeamInputState();
}

class _FindTeamInputState extends State<FindTeamInput> {
  late TextEditingController controllerTeamSize;
  late TextEditingController controllerBudget;

  String textTeamSize = '';
  String textBudget = '';

  bool errorInput = false;

  @override
  void initState() {
    super.initState();
    controllerTeamSize = TextEditingController();
    controllerBudget = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(
                    0, 5),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
          width: 500,
          height: 700,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Find the Teams",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1f4037),
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: controllerTeamSize,
                        onSubmitted: (String value) {
                          setState(() {
                            textTeamSize = controllerTeamSize.text;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Number of people in each group',
                          hintText: '1 - 4',
                          errorText: errorInput ? 'Input is wrong' : null,
                        ),
                      ),
                      TextField(
                        controller: controllerBudget,
                        onSubmitted: (String value) {
                          setState(() {
                            textBudget = controllerBudget.text;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Team budget",
                          hintText: '100 - 10000',
                          errorText: errorInput ? 'Input is wrong' : null,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!checkArg(
                          [controllerTeamSize.text, controllerBudget.text])) {
                        errorInput = false;
                      } else {
                        delayedFunction(context, controllerTeamSize.text,
                            controllerBudget.text);
                      }
                      controllerBudget.clear();
                      controllerTeamSize.clear();
                    },
                    child: const Center(
                      child: Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> delayedFunction(
      BuildContext context, String teamSize, String budget) async {
    final myContext = context;

    waitingAlgo(myContext);
    await Future.delayed(const Duration(milliseconds: 100));

    await startAlgo([teamSize, budget], myContext);
    Navigator.of(myContext).pop();

    await Future.delayed(const Duration(milliseconds: 100));

    showDialog(
        context: context,
        builder: (context) {
          return const ResultTeam();
        });
  }
}

void waitingAlgo(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: Text("WAITING..."),
        );
      });
}
