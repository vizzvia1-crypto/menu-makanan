import 'package:flutter/material.dart';

void main() {
  runApp(Tes());
}

class Tes extends StatelessWidget {
  List<String> menu = ["Soto", "Rawon"];

  List<int> harga = [10000, 15000];

  List<String> gambar = [
    "assets/soto.jpg",
    "assets/rawon.jpg"
  ];

  List<int> porsi = [0, 0];
  List<TextEditingController> controllers = [
    TextEditingController(text: "0"),
    TextEditingController(text: "0"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu Makanan"),
        ),
        body: Table(
          border: TableBorder.all(width: 2),

          children: [
            // Header
            TableRow(
              children: [
                Text("No"),
                Text("Gambar"),
                Text("Menu"),
                Text("Harga"),
                Text("Porsi"),
              ],
            )

            for (int i = 0; i < menu.length; i++)
              TableRow(
                children: [
                  Text("${i + 1}"),

                  Image.asset(
                    gambar[i],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )

                  Text(menu[i]),

                  Text("Rp ${harga[i]}"),

                  TextField(
                    controller: controllers[i],
                    readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (porsi[i] > 0) {
                            porsi[i]--;
                            controllers[i].text = "${porsi[i]}";
                          }
                        },
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          porsi[i]++;
                          controllers[i].text = "${porsi[i]}";
                        },
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
