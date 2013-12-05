describe 'deck', ->
  deck = null
  hand = null
  app = null;
  dealerHand = null;

  beforeEach ->
    app = new App()
    hand = app.get('playerHand');
    dealerHand = app.get('dealerHand');
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
      debugger;
      spyOn(app, 'playDealer')
      hand.stand()
      expect(app.playDealer).toHaveBeenCalled
    it ""

  describe 'busted', ->
    it "should detect when you have too many points", ->
      while hand.scores() < 23
        hand.hit()
      expect(hand.busted).toBe true

  describe 'dealer play ... ', ->
    it "dealer should hit below 17", ->
      expect()
    it "dealer should not hit above 17", ->
      expect()

  describe 'end game', ->
    expect()
