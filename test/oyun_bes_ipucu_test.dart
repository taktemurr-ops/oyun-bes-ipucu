import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bes_ipucu/oyun_bes_ipucu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(besIpucuConfig.title.length, 33);
    expect(besIpucuConfig.tagline.length, 33);
    for (final s in besIpucuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(besIpucuConfig.gameId, besIpucuId);
    expect(besIpucuRules.gameId, besIpucuId);
    expect(besIpucuRules.levelCount, 100000);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    final planner = LevelPlanner(gameId: besIpucuId, optionalMechanics: besIpucuRules.optionalMechanics);
    for (final l in ['tr', 'en', 'ar', 'ja', 'zh']) {
      besIpucuRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(besIpucuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
