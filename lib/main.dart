import 'package:flutter/material.dart';

void main() {
  runApp(Tes());
}

class Tes extends StatelessWidget {
  List<String> menu = ["Soto", "Rawon"];

  List<int> harga = [10000, 15000];

  List<String> gambar = ["assets/soto.jpg", "assets/rawon.jpg"];

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
            TableRow(
              children: [
                Text("No"),
                Text("Gambar"),
                Text("Menu"),
                Text("Harga"),
                Text("Porsi"),
              ],
            ),
            for (int i = 0; i < menu.length; i++)
              TableRow(
                children: [
                  Text("${i + 1}"),

                  Image.asset(
                    gambar[i],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),

                  Text(menu[i]),

                  Text("Rp ${harga[i]}"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.remove, size: 20),
                        onPressed: () {
                          if (porsi[i] > 0) {
                            porsi[i]--;
                            controllers[i].text = "${porsi[i]}";
                          }
                        },
                      ),
                      Expanded(
                        child: TextField(
                          controller: controllers[i],
                          readOnly: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 4),
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.add, size: 20),
                        onPressed: () {
                          porsi[i]++;
                          controllers[i].text = "${porsi[i]}";
                        },
                      ),
                    ],
                  ),
                  // =================================================
                ],
              ),
          ],
        ),
      ),
    );
  }
}
