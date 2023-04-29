import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github/github.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class UserProfile extends StatelessWidget {
  UserProfile({super.key, required this.user});
  CurrentUser user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                radius: 130,
                backgroundImage: NetworkImage(user.avatarUrl!),
              ),
              const SizedBox(
                height: 20,
              ),
              if (user.login != null)
                Text(user.login!, style: const TextStyle(fontSize: 30)),
            ]),
            const SizedBox(
              height: 10,
            ),
            if (user.bio != null)
              Text(
                user.bio!,
                style: const TextStyle(fontSize: 15),
              ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              child: Row(children: [
                const Icon(Icons.people_outline, color: Colors.grey),
                const SizedBox(
                  width: 10,
                ),
                if (user.followersCount != null)
                  Text(
                    "${user.followersCount!}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                if (user.followersCount != null) const Text(" followers"),
                const SizedBox(
                  width: 10,
                ),
                if (user.followingCount != null)
                  Text("${user.followingCount!}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                if (user.followingCount != null) const Text(" following"),
              ]),
            ),
            if (user.email != null)
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    const Icon(Icons.email_outlined, color: Colors.grey),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(user.email!)
                  ],
                ),
              ),
            if (user.blog != null)
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    const Icon(Icons.link_outlined, color: Colors.grey),
                    const SizedBox(
                      width: 10,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Text(
                          user.blog!,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (user.twitterUsername != null)
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.grey.withOpacity(0.9),
                      size: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://twitter.com/${user.twitterUsername!}"));
                        },
                        child: Text(
                          user.twitterUsername!,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
