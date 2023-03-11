import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({required Key key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              )
            ],
          ),
          Row(
            children: const [
              Expanded(
                  child: Text(
                'Welcome to Kimmi\'s Task Tracker',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.cyan),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ))
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Text(
                '1. You can start by adding tasks in the tasks list page',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Expanded(
                child: Text(
                  '2. Each Tasks added are editable and deleteable. \n You can edit tasks by clicking on the task card and you can delete tasks by clicking on the trash icon',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Expanded(
                child: Text(
                  '3. The task can then be completed by clicking the green check button',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Expanded(
                child: Text(
                  '4. Once the task is completed, you can see the completed task in the completed tab along with the completion date and time.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Expanded(
                child: Text(
                  'You can find the github link at:',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.cyan),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final url = Uri.parse(
                        'https://github.com/kimimaula/task-tracker.git');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: const Text(
                      'https://github.com/kimimaula/task-tracker.git'),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
