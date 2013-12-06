
class window.GameView extends Backbone.View

  className: 'game'

  #todo: switch to mustache
  template: '
      <div class="dealer-hand"><h4>Dealer(<span class="dealer-score"></span>)</h4><div>
      <div class="player-hand"><h4>Player(<span class="player-score"></span>)</h4></div>
      '

  initialize: ->
    @render()

  render: ->
    debugger
    @$el.html @template
    @$('.player-hand').append new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand').append new HandView(collection: @model.get 'dealerHand').el

    @$('.dealer-score').text (@model.get 'dealerHand').scores()[0]
    @$('.player-score').text (@model.get 'playerHand').scores()[0]