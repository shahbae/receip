import 'package:get/get.dart';

class DataController extends GetxController {
  RxList<Map<String, dynamic>> data = <Map<String, dynamic>>[].obs;

  Future<void> fetchData() async {
    try {
      final response = await GetConnect().get(
          'https://my-auth-b0dc2-default-rtdb.asia-southeast1.firebasedatabase.app/receip.json');

      if (response.statusCode == 200) {
        // Data berhasil diambil
        // Konversi response body menjadi Map
        Map<String, dynamic> responseData =
            Map<String, dynamic>.from(response.body);

        // Periksa apakah respons berisi data
        if (responseData.isNotEmpty) {
          List<Map<String, dynamic>> dataList = [];
          responseData.forEach((key, value) {
            // Periksa apakah value memiliki struktur yang diharapkan
            if (value is Map<String, dynamic>) {
              dataList.add({
                'title': value['title'],
                'cook_time': value['cook_time'],
                'prep_time': value['prep_time'],
                'ingredients': value['ingredients'].join(", "),
                'instructions': value['instructions'].join("\n"),
                'photo_url': value['photo_url'],
              });
            }
          });

          // Update data di controller
          data.value = dataList;
        } else {
          print('Error: Respons tidak berisi data.');
        }
      } else {
        // Handle kesalahan jika status code bukan 200
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle kesalahan lainnya
      print('Error: $error');
    }
  }
}
