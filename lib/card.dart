part of blackjack;

class Card{
  String suit;
  String value;

  Card(value, suit) {
    this.suit = suit;
    this.value = value;
  }

  int getAmount() {
    var digits = ['2', '3', '4', '5', '6', '7', '8', '9', '10'];
    var faces = ['J', 'Q', 'K'];
    if (digits.contains(value)) {
      return int.parse(value);
    } else if (faces.contains(value)) {
      return 10;
    } else if (value == 'A') {
      return 11;
    }
  }

  @override
  String toString() {
    return value + suit;
  }
}
