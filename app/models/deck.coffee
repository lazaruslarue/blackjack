###
  You'll probably want to define some kind of Card model.

  If you need to define a collection of cards as well, you could also put that in 
  this file if you want to.
###
class window.Deck extends Backbone.Model

  initialize: () ->
    @deck = _.range(1, 53);
  
  shuffle : () ->
    cardsLeftToShuffle = @deck.length
    while cardsLeftToShuffle
      randomI = Math.floor(Math.random() * cardsLeftToShuffle--)
      cardToSwap = @deck[cardsLeftToShuffle]
      @deck[cardsLeftToShuffle] = @deck[randomI]
      @deck[randomI] = cardToSwap