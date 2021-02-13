import 'lib/blackjack.dart';

void main() {
  Card card1 = Card("A", "H");
  Card card2 = Card("K", "S");
  Card card3 = Card("Q", "H");
  Hand hand1 = Hand([card1, card2, card3]);
  Player player1 = new Player("Alexander");

  var deck = makeDeck();

  player1.drawCard(deck);

  print(player1.hand.cards[0]);
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
