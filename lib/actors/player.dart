import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure_game/pixel_adventure.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameReference<PixelAdventure> {
  String character;
  Player({myPosition, required this.character}) : super(position: myPosition);

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;
  final int amountAnimation = 11;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = _spriteAnimations("Idle", amountAnimation);
    runningAnimation = _spriteAnimations("Run", amountAnimation + 1);
    //list of all animations
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation,
    };
    //set current animation
    current = PlayerState.running;
  }

  _spriteAnimations(String state, int amount) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Main Characters/$character/$state (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
