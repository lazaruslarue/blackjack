#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on('dealerTurn', @playDealer, @)
    @get('playerHand').on('computeScores', @computeScores, @)
    @get('dealerHand').on('computeScores', @computeScores, @)
    # @get('playerHand').on('bustedHand', @bustedHand)


    #@get('playerHand').on('change:isBusted', @testBusted, @)
    #@get('dealerHand').on('change:isBusted', @testBusted, @)


  playDealer: ->
    player = @get('playerHand')
    dealer = @get('dealerHand')
    if dealer.scores()[0] > 17
      dealer.stand()
    else
      dealer.hit()
      @playDealer()

  computeScores: ->
    playerscore = 21 - @get('playerHand').scores()[0]
    dealerscore = 21 - @get('dealerHand').scores()[0]
    if playerscore < dealerscore then @announceWinner(@get('playerHand'))
    else @announceWinner(@get('dealerHand'))

  announceWinner: (hand)=>
    if hand.isDealer then alert ("dealer wins with score: #{hand.scores()}")
    else alert("player wins with score #{hand.scores()}")


  bustedHand: (hand)->
    debugger;
    @isBusted =  true;
    @stand()


  testBusted: ->
    console.log("Here!")
