import 'package:flutter/material.dart';
import 'package:tugas_apiku/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful dataResponse = HttpStateful(createdAt: "2022-10-06T13:17:44.804Z", id: 'unknown', job: 'Mobile flutter developer', name: 'baihaqi', );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                (dataResponse.id == null)
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.id}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(child: const Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.name == null)
                    ? "Belum ada data"
                    : "${dataResponse.name}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.job == null)
                    ? "Belum ada data"
                    : "${dataResponse.job}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: const Text("Created At : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.createdAt == null)
                    ? "Belum ada data"
                    : "${dataResponse.createdAt}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                HttpStateful.connectAPI("Sandikha Rahardi", "Developer Flutter")
                    .then(
                  (value) {
                    print(value.name);
                    setState(() {
                      dataResponse = value;
                    });
                  },
                );
              },
              child: const Text(
                "POST DATA",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}