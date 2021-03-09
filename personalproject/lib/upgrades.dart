import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
import 'game.dart';

class Upgrades{
  var name;
  double modifier;
  double cost;
  double costMultiplier = 1.05;
  var modifies;
  int count;


  Upgrades(var n, double m, double c, var ms){
    this.name = n;
    this.modifier = m;
    this.cost = c;
    this.modifies = ms;
  }

 /* void buy(){
    if()
    if(modifies == 'cps'){
    }
    if(modifies == 'cpc'){

    }
  }*/


}