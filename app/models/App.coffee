#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on('dealerTurn', @playDealer, @)
    @get('playerHand').on('computeScores', @computeScores, @)
    @get('dealerHand').on('computeScores', @computeScores, @)
    @get('playerHand').on('bustedHand', @bustedHand)
    

  playDealer: ->
    # Check own score
    # < 17
    # hit
    # else
    # stand
    player = @get('playerHand')
    dealer = @get('dealerHand')
    debugger;
    console.log @get 'dealerHand'
    if dealer.scores()[0] > 10
      debugger;
      dealer.stand()
    else
      dealer.hit()
      @playDealer()

  computeScores: ->

    console.log('computing scores')

    playerscore = 21 - @get('playerHand').scores()[0]
    dealerscore = 21 - @get('dealerHand').scores()[0]
    if playerscore < dealerscore then @announceWinner(@get('playerHand'))
    else @announceWinner(@get('dealerHand'))

  announceWinner: (hand)=>
    if hand.isDealer then alert ("dealer wins with score: #{hand.scores()}")
    else alert("player wins with score #{hand.scores()}")


  bustedHand: (hand)->
    @isBusted =  true;
    @stand()
    #perform the transfer of turn to the
    #tnext user, or dealer if no more players
    #if dealer, then computescores.

