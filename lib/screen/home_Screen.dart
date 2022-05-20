import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozo/color.dart';
import 'package:pozo/widget/employee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> readEmployeeinfo() async {
    final String response =
        await rootBundle.loadString('asset/employeeInfo.json');
    final data = await json.decode(response);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: const Text("Pozo TodoApp"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 5, 140),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Hello you !",
                style: TextStyle(
                    color: darkBlue, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Have a nice day !",
                style: TextStyle(
                    color: darkBlue, fontSize: 20, fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 60),
              const Text(
                "List of Employees",
                style: TextStyle(
                    color: darkBlue, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder(
                    future: readEmployeeinfo(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                            return employeeCard(context, index, data);
                          }),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'loading...',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
