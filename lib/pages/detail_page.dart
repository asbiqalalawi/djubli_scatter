import 'package:djubli_scatter/models/car.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.car}) : super(key: key);
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Car\'s Detail',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tanggal : ' + car.tanggal),
                    Text('Harga : Rp. ' + car.harga),
                    Text('Warna : ' + car.warna),
                    Text('Jarak : ' + car.km + ' KM'),
                    Text('Lokasi  : ' + car.lokasi),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
