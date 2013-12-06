class window.Game extends Backbone.Model

  # initialize: (playerHand, dealerHand) ->
  initialize: (handArray) ->
    @set 'playerHand', handArray[0]
    @set 'dealerHand', handArray[1]