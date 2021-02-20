import 'lib/blackjack.dart';
import 'dart:io';
import 'dart:math';

void main() {
  var rng = new Random();
  Card card1 = Card("A", "H");
  Card card2 = Card("K", "S");
  Card card3 = Card("Q", "H");
  Hand hand1 = Hand([card1, card2, card3]);
  Player player1 = new Player("Alexander");
  Player dealer = new Player("Dealer");

  var deck = makeDeck();

  dealCards(player1, deck);
  dealCards(dealer, deck);


  while (keepGoing(player1, dealer)) {
    print("\n");
    print(dealer);
    print(player1);
    print("1: Hit");
    print("2: Stay");
    stdout.write("What do you want to do? ");
    String playerAction = stdin.readLineSync();
    if(playerAction == "1"){
      player1.drawCard(deck);
      print("\nYou drew a ${player1.hand.cards.last}\n");
    }

    if(dealer.hand.getValue() < 16){
      dealer.drawCard(deck);
    } else {
      if (rng.nextInt(2) == 1) {
        dealer.drawCard(deck);
      }
    }
  }

  if(player1.isBust() || dealer.is21()){
    print("You Lost!");
  }else if(player1.is21() || dealer.isBust()){
    print("You Win!");
  }
  print("The final hands are:");
  print(dealer);
  print(player1);
}

bool keepGoing(player1, dealer) {
  bool bust = player1.isBust() == false && dealer.isBust() == false;
  bool blackjack = player1.is21() == false && dealer.is21() == false;
  return bust && blackjack;
}

void dealCards(player, deck) {
  player.drawCard(deck);
  player.drawCard(deck);
}

List<Card> makeDeck() {
  List<Card> deck = [];
  List<String> suits = ["H", "S", "C", "D"];
  List<String> values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"];

  suits.forEach((suit) {
    values.forEach((value) {
      deck.add(Card(value, suit));
    });
  });
  deck.shuffle();
  return deck; 
}
