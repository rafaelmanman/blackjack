part of blackjack;

class Player{
  String name;
  Hand hand;
  Player(String name){
    this.name = name;
    this.hand = new Hand();
  }

  void drawCard(deck){
    hand.cards.add(deck.removeAt(0));
  }
}
