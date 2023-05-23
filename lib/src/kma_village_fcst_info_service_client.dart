import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';
import 'kma_village_fcst_info_service_error.dart';
import 'models/models.dart';

class KmaVillageFcstInfoServiceClient {
  static const serviceUrl =
      'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0';

  KmaVillageFcstInfoServiceClient({
    required this.serviceKey,
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  final String serviceKey;

  Future<Iterable<XmlElement>> get(
    String path, {
    int numOfRows = 10,
    int pageNo = 1,
    Map<String, dynamic> params = const {},
  }) async {
    final request = Uri.parse(serviceUrl + path).replace(
      queryParameters: {
        'serviceKey': serviceKey,
        'numOfRows': '$numOfRows',
        'pageNo': '$pageNo',
        ...params.map((key, value) => MapEntry(key, '$value')),
      },
    );

    final response = await _httpClient.get(request);

    final document = XmlDocument.parse(response.body);

    final error = KmaVillageFcstInfoServiceError.getError(document);
    if (error != null) throw error;

    return document
        .findAllElements('body')
        .first
        .getElement('items')!
        .findElements('item');
  }

  // 초단기실황조회
  Future<List<UltraSrtNcstData>> getUltraSrtNcst({
    int numOfRows = 10,
    int pageNo = 1,
    required DateTime baseDateTime,
    required int nx,
    required int ny,
  }) =>
      get(
        '/getUltraSrtNcst',
        numOfRows: numOfRows,
        pageNo: pageNo,
        params: {
          'base_date': DateFormat('yyyyMMdd').format(baseDateTime),
          'base_time': DateFormat('HHmm').format(baseDateTime),
          'nx': nx,
          'ny': ny,
        },
      ).then((elements) => elements
          .map((element) => UltraSrtNcstData.fromXmlElement(element))
          .toList());

  // 초단기예보조회
  Future<List<UltraSrtFcstData>> getUltraSrtFcst({
    int numOfRows = 10,
    int paegNo = 1,
    required DateTime baseDateTime,
    required int nx,
    required int ny,
  }) =>
      get(
        '/getUltraSrtFcst',
        numOfRows: numOfRows,
        pageNo: paegNo,
        params: {
          'base_date': DateFormat('yyyyMMdd').format(baseDateTime),
          'base_time': DateFormat('HHmm').format(baseDateTime),
          'nx': nx,
          'ny': ny,
        },
      ).then((elements) => elements
          .map((element) => UltraSrtFcstData.fromXmlElement(element))
          .toList());

  // 단기예보조회
  Future<List<VillageFcstData>> getVillageFcst({
    int numOfRows = 50,
    int paegNo = 1,
    required DateTime baseDateTime,
    required int nx,
    required int ny,
  }) =>
      get(
        '/getVilageFcst',
        params: {
          'base_date': DateFormat('yyyyMMdd').format(baseDateTime),
          'base_time': DateFormat('HHmm').format(baseDateTime),
          'nx': nx,
          'ny': ny,
        },
      ).then((elements) => elements
          .map((element) => VillageFcstData.fromXmlElement(element))
          .toList());

  // 예보버전조회
  Future<DateTime> getFcstVersion({
    required FileType fileType,
    required DateTime baseDateTime,
  }) =>
      get(
        '/getFcstVersion',
        numOfRows: 10,
        pageNo: 1,
        params: {
          'ftype': fileType.name,
          'basedatetime': DateFormat('yyyyMMddHHmm').format(baseDateTime),
        },
      ).then((elements) {
        final version = elements.first.getElement('version')!.innerText;
        return DateTime.parse(
            version.substring(0, 8) + ' ' + version.substring(8));
      });
}
