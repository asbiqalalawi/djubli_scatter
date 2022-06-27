class Car {
  Car({
    required this.harga,
    required this.tanggal,
    required this.warna,
    required this.km,
    required this.lokasi,
  });

  String harga;
  String tanggal;
  String warna;
  String km;
  String lokasi;
}

List<Car> carList = [
  Car(
      harga: '5000000',
      tanggal: '31/1/2015',
      warna: 'Hitam',
      km: '1250',
      lokasi: 'Surabaya'),
  Car(
      harga: '4000000',
      tanggal: '30/11/2016',
      warna: 'Putih',
      km: '12300',
      lokasi: 'DKI Jakarta'),
  Car(
      harga: '3350000',
      tanggal: '2/2/2017',
      warna: 'Silver',
      km: '26520',
      lokasi: 'DKI Jakarta'),
  Car(
      harga: '3000000',
      tanggal: '20/4/2017',
      warna: 'Putih',
      km: '23200',
      lokasi: 'Bandung'),
  Car(
      harga: '2000000',
      tanggal: '3/3/2018',
      warna: 'Abu-Abu',
      km: '41513',
      lokasi: 'DKI Jakarta'),
];
