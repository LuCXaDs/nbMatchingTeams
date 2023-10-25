import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ButtonRedirection extends StatelessWidget {
  ButtonRedirection({super.key});

  final Uri github = Uri(scheme: 'https', host: 'github.com', path: 'lucxads');

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: InkWell(
        onTap: () async {
          if (await canLaunchUrl(github)) {
            await launchUrl(github);
          } else {
            throw 'Impossible to open $github';
          }
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Image.network(
            'https://static-00.iconduck.com/assets.00/github-icon-2048x1988-jzvzcf2t.png',
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}