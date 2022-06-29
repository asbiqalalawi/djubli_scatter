import 'package:carousel_slider/carousel_slider.dart';
import 'package:djubli_scatter/models/car.dart';
import 'package:djubli_scatter/bloc/home_index.dart';
import 'package:djubli_scatter/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeIndex index = BlocProvider.of(context);
    CarouselController carouselC = CarouselController();

    return Scaffold(
      appBar: AppBar(
        leading: Image.network(
          'https://media-exp2.licdn.com/dms/image/C560BAQEHsiU5JyOZJQ/company-logo_200_200/0/1630236739673?e=2147483647&v=beta&t=-NX75hDiTUgzkWW1eDWu_WokE6rc9VVaDXCUj_WZnxc',
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
              margin: const EdgeInsets.all(8),
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                    enabled: false,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Cari Mobil',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text(
                    'Sedan',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'SUV',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'MPV',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Toyota Camry 25 V',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              Icon(Icons.arrow_back_ios),
              Text(
                '2015',
                style: TextStyle(fontSize: 16),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Echarts(
              option: '''
{
color: 'rgb(0,142,122)',
  tooltip: {
    backgroundColor: 'rgba(255,255,255,0.7)',
    formatter: function (param) {
            var value = param.value;
            return     'Tanggal Transaksi' + '：' + value[5] + '<br>'
                      + 'Harga' + '：Rp. ' + value[1] + '<br>'
                      + 'Warna' + '：' + value[2] + '<br>'
                      + 'KM' + '：' + value[3] + '<br>'
                      + 'Lokasi' + '：' + value[4] + '<br>';
    }
  },
  xAxis: {
    type: 'value',
    name: 'Waktu',
    nameTextStyle: {
            fontSize: 16
    },
    min: 2010,
    max: 2020,
    splitLine: {
            show: false
    }
  },
  yAxis: {
    type: 'value',
    name: 'Harga',
    nameTextStyle: {
            fontSize: 16
    },
    splitLine: {
            show: false
    }
  },
  series: [
    {
            name: 'Toyota Innova 2.5V AT',
            type: 'scatter',
            opacity: 0.8,
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowOffsetY: 0,
            shadowColor: 'rgb(0,142,122)',
            symbolSize: 20,
            data: [
              [2015, 5000000, 'Hitam', 1250, 'Surabaya', '31/1/2015', 0],
              [2016, 4000000, 'Putih', 12300, 'DKI Jakarta', '30/11/2016', 1],
              [2017, 3350000, 'Silver', 26520, 'DKI Jakarta', '2/2/2017', 2],
              [2017, 3000000, 'Putih', 23200, 'Bandung', '20/4/2017', 3],
              [2018, 2000000, 'Abu-Abu', 41513, 'DKI Jakarta', '3/3/2018', 4],
            ]
    },
  ]
}
  ''',
              extraScript: '''
  chart.on('click', (params) => {
    if(params.componentType === 'series') {
        var value = params.value;
        Messager.postMessage(value[6]);
    }
  });
''',
              onMessage: (String message) {
                index.changeIndex(int.parse(message));
                carouselC.jumpToPage(int.parse(message));
              },
            ),
            height: 300,
            width: 100,
          ),
          BlocBuilder<HomeIndex, int>(
            bloc: index,
            builder: (context, state) => CarouselSlider.builder(
              itemCount: carList.length,
              carouselController: carouselC,
              itemBuilder: (context, idx, page) {
                return Material(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(car: carList[idx]),
                      ),
                    ),
                    child: SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tanggal : ' + carList[idx].tanggal),
                            Text('Harga : Rp. ' + carList[idx].harga),
                            Text('Warna : ' + carList[idx].warna),
                            Text('Jarak : ' + carList[idx].km + ' KM'),
                            Text('Lokasi  : ' + carList[idx].lokasi),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                onPageChanged: (newIndex, reason) {
                  index.changeIndex(newIndex);
                },
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
