import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github/github.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class RepoCard extends StatelessWidget {
  Repository repo;
  RepoCard({super.key, required this.repo});

  Widget getLanguageIcon(String lanuge) {
    Color? color;
    switch (lanuge.toLowerCase()) {
      case "perl":
        color = const Color.fromRGBO(2, 152, 195, 1.0);
        break;
      case "html":
        color = const Color.fromRGBO(227, 76, 38, 1.0);
        break;
      case "go":
        color = const Color.fromRGBO(0, 173, 216, 1.0);
        break;
      case "dockerfile":
        color = const Color.fromRGBO(56, 77, 84, 1.0);
        break;
      case "vue":
        color = const Color.fromRGBO(65, 184, 131, 1.0);
        break;
      case "vim script":
        color = const Color.fromRGBO(25, 159, 75, 1.0);
        break;
    }
    color ??= Colors.grey;
    return CircleAvatar(
      radius: 10,
      backgroundColor: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 230,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 1.0, color: Colors.grey.withOpacity(0.6))),
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 10),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 10,
                spacing: 10,
                children: [
                  const Icon(Icons.bookmark),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onHover: (event) {},
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(repo.htmlUrl));
                      },
                      child: Text(
                        repo.name,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                    ),
                  ),
                  Container(
                      height: 25,
                      width: 70,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(1.0)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(repo.isPrivate ? "Private" : "Public")))
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 25, top: 15),
                  child: Text(
                    repo.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getLanguageIcon(repo.language),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(repo.language),
                    const SizedBox(
                      width: 20,
                    ),
                    if (repo.stargazersCount > 0)
                      const Icon(
                        FontAwesomeIcons.star,
                        color: Colors.grey,
                        size: 19,
                      ),
                    if (repo.stargazersCount > 0)
                      const SizedBox(
                        width: 10,
                      ),
                    if (repo.stargazersCount > 0)
                      Text(repo.stargazersCount.toString()),
                    const SizedBox(
                      width: 20,
                    ),
                    if (repo.forksCount > 0)
                      const Icon(
                        FontAwesomeIcons.codeFork,
                        color: Colors.grey,
                        size: 19,
                      ),
                    if (repo.forksCount > 0)
                      const SizedBox(
                        width: 10,
                      ),
                    if (repo.forksCount > 0) Text(repo.forksCount.toString())
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
