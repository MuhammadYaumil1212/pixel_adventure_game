import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pixel_adventure_game/levels/level.dart';

class PixelAdventure extends FlameGame {
  late final CameraComponent cam;
  @override
  Color backgroundColor() {
    const Color(0xff211f30);
    return super.backgroundColor();
  }

  final world = Level();
  @override
  FutureOr<void> onLoad() {
    cam = CameraComponent.withFixedResolution(
      world: world,
      width: 640,
      height: 360,
    );
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);
    return super.onLoad();
  }
}
