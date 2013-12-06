class window.GameCollectionView extends Backbone.View

  className: 'game-collections'

  template: _.template '<h3>PreviousGames</h3>'

  initialize: ->
    @render()

  render: =>
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append(@collection.map (game) =>
      new GameView(model: game).$el)
