import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:bmicalculator/Screens/homepage.dart';

class BMIStore extends VxStore {
  int weight = 180;
  int height = 50;
  int age = 20;

  Sex choice = Sex.Female;

  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;
}

class ChangeHeight extends VxMutation<BMIStore> {
  final int height;

  ChangeHeight(this.height);

  @override
  perform() {
    store.height = height;
  }
}

class ChangeAge extends VxMutation<BMIStore> {
  final int age;

  ChangeAge(this.age);

  @override
  perform() {
    store.age = age;
  }
}

class ChangeWeight extends VxMutation<BMIStore> {
  final int weight;

  ChangeWeight(this.weight);

  @override
  perform() {
    store.weight = weight;
  }
}

class ChangeGender extends VxMutation<BMIStore> {
  final Sex choice;
  ChangeGender(this.choice);
  @override
  perform() {
    store.choice = choice;
    if (choice == Sex.Male) {
      store.maleCardColor = kActiveCardColor;
      store.femaleCardColor = kInActiveCardColor;
    } else {
      store.maleCardColor = kInActiveCardColor;
      store.femaleCardColor = kActiveCardColor;
    }
  }
}
