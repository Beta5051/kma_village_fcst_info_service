import 'package:kma_village_fcst_info_service/kma_village_fcst_info_service.dart';

void main() async {
  final client = KmaVillageFcstInfoServiceClient(
    serviceKey: 'YOUR_SERVICE_KEY',
  );

  final version = await client.getFcstVersion(
    fileType: FileType.ODAM,
    baseDateTime: DateTime(2021, 6, 29, 8),
  );

  print(version);
}
