import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: NovelyGame()));
}

class NovelyGame extends FlameGame {
  SpriteComponent novelyComponent = SpriteComponent();
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Add background
    add(SpriteComponent(
      sprite: await loadSprite('backgrounds/blue_sea.jpg'),
      size: size,
    ));
    Vector2 characterSize = Vector2(size.y / 4, size.y / 2);
    // add(SpriteComponent(
    //   size: characterSize,
    //   sprite: await loadSprite('characters/Aiko_SummerUni_Pony_Smile.png'),
    //   position: Vector2.all(20),
    // ));
    novelyComponent
      ..size = characterSize
      ..sprite = await loadSprite('characters/Aiko_SummerUni_Pony_Smile.png')
      ..position = Vector2(size.x / 8, 20)
      ..scale = Vector2(2, 2);
    add(novelyComponent);
  }

  @override
  void update(double dt) {
    if (novelyComponent.x < size.x / 5) novelyComponent.x += 50 * dt;
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final rect = Rect.fromLTWH(0, size.y * .66, size.x, size.y * .66);
    canvas.drawRect(rect, Paint()..color = Color.fromARGB(160, 159, 159, 159));
  }
}
