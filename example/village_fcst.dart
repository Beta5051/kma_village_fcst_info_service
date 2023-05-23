import 'package:kma_village_fcst_info_service/kma_village_fcst_info_service.dart';

void main() async {
  final client = KmaVillageFcstInfoServiceClient(
    serviceKey: 'YOUR_SERVICE_KEY',
  );

  final items = await client.getVillageFcst(
    baseDateTime: DateTime(2021, 6, 28, 5),
    nx: 55,
    ny: 127,
  );

  print(items);
}
