import 'package:flutter/material.dart';
import 'package:nasa_app/models/nasa_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Nasa posts = new Nasa();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(),
          FutureBuilder(
            future: posts.getnasa(),
            builder: (context, snapshots) {
              if (!snapshots.hasData) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 20,
                          color: Colors.transparent,
                          child: Image.network(
                            snapshots.data["hdurl"],
                            fit: BoxFit.cover,
                          )),
                    ),
                    ExpansionTile(
                      title: ListTile(
                        title: Text(snapshots.data["title"]),
                        subtitle: Text(snapshots.data["date"]),
                      ),
                      children: [
                        Text(
                          snapshots.data["explanation"],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
