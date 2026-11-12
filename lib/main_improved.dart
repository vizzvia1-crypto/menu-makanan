import 'package:flutter/material.dart';

void main() {
  runApp(const MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Makanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  final List<String> menu = const ["Soto", "Rawon"];
  final List<int> harga = const [10000, 15000];
  final List<String> gambar = const [
    "assets/soto.jpg",
    "assets/rawon.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Menu Makanan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(
            width: 2,
            color: Colors.grey.shade600,
            borderRadius: BorderRadius.circular(8),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2.5),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(2),
          },
          children: [
            // Header Row
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              children: const [
                _HeaderCell(text: "No"),
                _HeaderCell(text: "Gambar"),
                _HeaderCell(text: "Menu"),
                _HeaderCell(text: "Harga"),
              ],
            ),

            // Data Rows
            for (int i = 0; i < menu.length; i++)
              TableRow(
                children: [
                  // No
                  _BodyCell(
                    child: Text(
                      "${i + 1}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Gambar
                  _BodyCell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        gambar[i],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 80,
                            height: 80,
                            color: Colors.amber.shade100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.restaurant, color: Colors.deepOrange),
                                const SizedBox(height: 4),
                                Text(
                                  menu[i],
                                  style: const TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Nama Menu
                  _BodyCell(
                    child: Text(
                      menu[i],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),

                  // Harga
                  _BodyCell(
                    child: Text(
                      "Rp ${harga[i]}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}

class _BodyCell extends StatelessWidget {
  final Widget child;
  const _BodyCell({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}

