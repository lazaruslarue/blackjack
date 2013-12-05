
class window.AppView extends Backbone.View

  template: _.template '
    <button class="restart-button">Restart</div>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="game-collection-view"><div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .restart-button": -> @restart()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.game-collection-view').html new GameCollectionView(collection: @model.get 'gameCollection')

  restart: ->
    console.log("Here ")
    @model.newGame()
    @render()



