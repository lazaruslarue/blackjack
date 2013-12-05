class window.Game extends Backbone.Model

  initialize: (playerHand, dealerHand) ->
    @set 'playerHand', playerHand
    @set 'dealerHand', dealerHand