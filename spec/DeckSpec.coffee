describe 'deck', ->
  deck = null
  hand = null
  app = null;
  dealer = null;

  beforeEach ->
    app = new App()
    hand = app.get('playerHand');
    dealer = app.get('dealerHand');
    deck = app.get('deck');

  # describe 'hit', ->
  #   it "should give the last card from the deck", ->
  #     expect(deck.length).toBe 50
  #     expect(deck.last()).toEqual hand.hit()
  #     expect(deck.length).toBe 49
  #     expect(deck.last()).toEqual hand.hit()
  #     expect(deck.length).toBe 48

  describe 'stand', ->
    it "should have a stand method",  ->
      expect( hand.stand() ).toBeDefined
    it "should pass pass play when stand is invoked", ->
      spyOn(app, 'playDealer')
      hand.stand()
      expect(app.playDealer).toHaveBeenCalled
    it ""

  describe 'busted', ->
    it "should detect when player has too many points", ->
      spyOn(app, 'bustedHand')
      while hand.scores() < 23
        hand.hit()
      expect(app.bustedHand()).toHaveBeenCalled 

  describe 'busted', ->
    it "should detect when dealer has too many points", ->
      spyOn(app, 'bustedHand')
      while dealer.scores() < 23
        dealer.hit()
      expect(app.bustedHand()).toHaveBeenCalled

  describe 'dealer play ... ', ->
    it "dealer should hit below 17", ->
      expect()
    it "dealer should not hit above 17", ->
      expect()

  describe 'end game', ->
    expect()
