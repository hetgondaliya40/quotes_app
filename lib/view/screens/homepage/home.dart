import 'dart:io';

import 'package:flutter/material.dart';

import '../../../routes/routes.dart';
import '../../../utilis/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xff88BAA2),
                  title: Text(" Alert !!!"),
                  content: Text(
                    "Are you sure Exit !!!",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        exit(2);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "no",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Quotes ",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  toggle = !toggle;
                });
              },
              icon: (toggle)
                  ? const Icon(
                      Icons.list_alt,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.grid_on,
                      color: Colors.white,
                    ),
            ),
          ],
        ),
        body: Column(
          children: [
            if (toggle) list() else list2(),
          ],
        ),
      ),
    );
  }

  Expanded list() {
    return Expanded(
      child: ListView.builder(
        itemCount: allQuote.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.detailspage,
                arguments: allQuote[index]);
          },
          child: ListTile(
            leading: Text("${index + 1}"),
            title: Text(allQuote[index].quotes),
            subtitle: Text("~ ${allQuote[index].author}"),
            trailing: Text(allQuote[index].category),
          ),
        ),
      ),
    );
  }

  Expanded list2() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: allQuote.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.detailspage,
                arguments: allQuote[index]);
          },
          child: Card(
            // color: Colors.primaries[index % 18],
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(allQuote[index].quotes),
                  Text("~ ${allQuote[index].author}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
