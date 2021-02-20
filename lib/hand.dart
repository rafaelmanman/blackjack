part of blackjack;

class Hand{
  List<Card> cards;
  Hand([cards = null]){
    this.cards = cards == null ? [] : cards;
  }

  int getValue() {
    int sum = 0;
    
    var card_values = cards.map((card) => card.value);

    cards.forEach((card){
      sum += card.getAmount();
    });
    if(sum>21 && card_values.contains("A")){
      sum -= 10;
    }
    return sum;
  }

  @override
  String toString() {
    String to_return = "";
    for(int i=0; i<cards.length; i++){
      to_return = to_return + cards[i].toString() + " ";
    }
    return to_return;
  }
}
