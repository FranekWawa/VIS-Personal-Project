import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
import 'upgrades.dart';
class Game{
  double coins;
  double cpc;//coins per click
  double cps;//coins per second
  Timer timer;
  Game(var c,var cp,var cs){
    coins = c;
    cpc = cp;
    cps = cs;
  }
  void onClick() {
      coins+=cpc;
  }
  double getCoins(){
    return coins;
  }
  double getCpc(){
    return cpc;
  }
  void incrementCoin(){
    coins += cps;
  }
  void increaseCps(double mod){
    this.cps += cps*mod;
  }
  void increaseCpc(double mod){
    this.cpc += cpc*mod;
  }
}
