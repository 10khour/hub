import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:hub/profile.dart';
import 'package:hub/repo.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key, required this.github});
  GitHub github;
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  CurrentUser? user;
  List<Repository> repositories = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (user != null) UserProfile(user: user!),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: repositories.map((repo) {
                    return RepoCard(repo: repo);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.github.users.getCurrentUser().then((u) {
      setState(() {
        user = u;
      });
    });
    repositories.clear();
    widget.github.repositories
        .listRepositories(sort: 'updated', direction: 'desc')
        .listen((event) {
      repositories.add(event);
    }).onDone(() {
      setState(() {});
    });
  }
}
