#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @dH = @get 'dealerHand'
    @pH = @get 'playerHand'
    @set 'game', new Game([@pH, @dH])
    @set 'gameCollection', new GameCollection()


    @get('playerHand').on('dealerTurn', @playDealer, @)
    @get('playerHand').on('computeScores', @computeScores, @)
    @get('dealerHand').on('computeScores', @computeScores, @)

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

  newGame: ->
    @get('gameCollection').add(@get('game'))
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @dH1 = @get 'dealerHand'
    @pH1 = @get 'playerHand'
    @set 'game', new Game([@pH1, @dH1])


