#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @on 'dealerTurn', @playDealer
    @on 'computeScores', @computeScores
    @get('playerHand').on('bustedHand', @bustedHand, @) 

  playDealer: ->
    # Check own score
    # < 17
    # hit
    # else
    # stand

    if @dealerHand.scores() > 17
      @dealerHand.stand()
    else 
      @dealerHand.hit()
      playDealer()

  computeScores: ->

    playerscore = 21 - @playerHand.scores()
    dealerscore = 21 - @dealerHand.scores()
    if playerscore < dealerscore then announceWinner(@playerHand)
    else announceWinner(@dealerHand)

  announceWinner: (hand)=>
    if @isDealer then console.log "dealer wins with score: #{@scores()}"
    else console.log "player wins with score #{@scores()}"


  bustedHand: (hand)->
    #perform the transfer of turn to the
    #tnext user, or dealer if no more players
    #if dealer, then computescores.
    console.log @

