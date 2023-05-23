enum UltraSrtNcstDataCategory {
  T1H, // 기온
  RN1, // 1시간 강수량
  UUU, // 동서바람성분
  VVV, // 남북바람성분
  REH, // 습도
  PTY, // 강수형태
  VEC, // 풍향
  WSD, // 풍속
}

enum UltraSrtFcstDataCategory {
  T1H, // 기온
  RN1, // 1시간 강수량
  SKY, // 하늘상태
  UUU, // 동서바람성분
  VVV, // 남북바람성분
  REH, // 습도
  PTY, // 강수형태
  LGT, // 낙뢰
  VEC, // 풍향
  WSD, // 풍속
}

enum VillageFcstDataCategory {
  POP, // 강수확률
  PTY, // 강수형태
  PCP, // 1시간 강수량
  REH, // 습도
  SNO, // 1시간 신적설
  SKY, // 하늘상태
  TMP, // 1시간 기온
  TMN, // 일 최저기온
  TMX, // 일 최고기온
  UUU, // 풍속(동서성분)
  VVV, // 풍속(남북성분)
  WAV, // 파고
  VEC, // 풍향
  WSD, // 풍속
}

extension ConvertToCategory on String {
  UltraSrtNcstDataCategory get toUltraShortNcstDataCategory {
    switch (this) {
      case 'T1H':
        return UltraSrtNcstDataCategory.T1H;
      case 'RN1':
        return UltraSrtNcstDataCategory.RN1;
      case 'UUU':
        return UltraSrtNcstDataCategory.UUU;
      case 'VVV':
        return UltraSrtNcstDataCategory.VVV;
      case 'REH':
        return UltraSrtNcstDataCategory.REH;
      case 'PTY':
        return UltraSrtNcstDataCategory.PTY;
      case 'VEC':
        return UltraSrtNcstDataCategory.VEC;
      case 'WSD':
        return UltraSrtNcstDataCategory.WSD;
      default:
        throw Exception('Invalid UltraSrtNcstDataCategory value');
    }
  }

  UltraSrtFcstDataCategory get toUltraShortFcstDataCategory {
    switch (this) {
      case 'T1H':
        return UltraSrtFcstDataCategory.T1H;
      case 'RN1':
        return UltraSrtFcstDataCategory.RN1;
      case 'SKY':
        return UltraSrtFcstDataCategory.SKY;
      case 'UUU':
        return UltraSrtFcstDataCategory.UUU;
      case 'VVV':
        return UltraSrtFcstDataCategory.VVV;
      case 'REH':
        return UltraSrtFcstDataCategory.REH;
      case 'PTY':
        return UltraSrtFcstDataCategory.PTY;
      case 'LGT':
        return UltraSrtFcstDataCategory.LGT;
      case 'VEC':
        return UltraSrtFcstDataCategory.VEC;
      case 'WSD':
        return UltraSrtFcstDataCategory.WSD;
      default:
        throw Exception('Invalid UltraSrtFcstDataCategory value');
    }
  }

  VillageFcstDataCategory get toVillageFcstDataCategory {
    switch (this) {
      case 'POP':
        return VillageFcstDataCategory.POP;
      case 'PTY':
        return VillageFcstDataCategory.PTY;
      case 'PCP':
        return VillageFcstDataCategory.PCP;
      case 'REH':
        return VillageFcstDataCategory.REH;
      case 'SNO':
        return VillageFcstDataCategory.SNO;
      case 'SKY':
        return VillageFcstDataCategory.SKY;
      case 'TMP':
        return VillageFcstDataCategory.TMP;
      case 'TMN':
        return VillageFcstDataCategory.TMN;
      case 'TMX':
        return VillageFcstDataCategory.TMX;
      case 'UUU':
        return VillageFcstDataCategory.UUU;
      case 'VVV':
        return VillageFcstDataCategory.VVV;
      case 'WAV':
        return VillageFcstDataCategory.WAV;
      case 'VEC':
        return VillageFcstDataCategory.VEC;
      case 'WSD':
        return VillageFcstDataCategory.WSD;
      default:
        throw Exception('Invalid VillageFcstDataCategory value');
    }
  }
}

enum SKY {
  lucidity, // 맑음
  cloudy, // 구름많음
  turbidity, // 흐림
}

enum UltraSrtPTY {
  none, // 없음
  rain, // 비
  rainAndSnow, // 비/눈
  snow, // 눈
  raindrop, // 빗방울
  raindropAndSnowBlowing, // 빗방울눈날림
  snowBlowing, // 눈날림
}

enum VillagePTY {
  none, // 없음
  rain, // 비
  rainAndSnow, // 비/눈
  snow, // 눈
  shower, // 소나기
}

extension ConvertData on int {
  SKY get toSKY {
    switch (this) {
      case 1:
        return SKY.lucidity;
      case 3:
        return SKY.cloudy;
      case 4:
        return SKY.turbidity;
      default:
        throw Exception('Invalid SKY value');
    }
  }

  UltraSrtPTY get toUltraShortPTY {
    switch (this) {
      case 0:
        return UltraSrtPTY.none;
      case 1:
        return UltraSrtPTY.rain;
      case 2:
        return UltraSrtPTY.rainAndSnow;
      case 3:
        return UltraSrtPTY.snow;
      case 4:
        return UltraSrtPTY.raindrop;
      case 5:
        return UltraSrtPTY.raindropAndSnowBlowing;
      case 6:
        return UltraSrtPTY.snowBlowing;
      default:
        throw Exception('Invalid UltraSrtPTY value');
    }
  }

  VillagePTY get toVillagePTY {
    switch (this) {
      case 0:
        return VillagePTY.none;
      case 1:
        return VillagePTY.rain;
      case 2:
        return VillagePTY.rainAndSnow;
      case 3:
        return VillagePTY.snow;
      case 4:
        return VillagePTY.shower;
      default:
        throw Exception('Invalid VillagePTY value');
    }
  }
}
