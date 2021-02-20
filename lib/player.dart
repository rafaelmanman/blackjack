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

  bool isBust(){
    return hand.getValue() > 21;
  }

  bool is21(){
    return hand.getValue() == 21;
  }


  @override
  String toString() {
    return "$name: [${hand.getValue()}] ${hand.toString()}";
  }
}
