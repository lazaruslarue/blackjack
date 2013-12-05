class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->
    @isBusted = false;

  hit: ->
    @add(@deck.pop()).last()
    @checkBusted()

  stand: -> if !@isDealer #Dealer's turn
              # trigger event to be listened by the app, dealer's turn.
              @trigger 'dealerTurn'
            else
              # find the total scores for both dealer and player
              # trigger event to be listened by app.
              @trigger 'computeScores'

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  checkBusted: ->
    #is @scores > 21?
    debugger;
    console.log(@isDealer, 'is dealer?')
    if @scores()[0] > 21 then @trigger 'bustedHand'












