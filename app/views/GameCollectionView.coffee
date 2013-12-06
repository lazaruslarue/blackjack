class window.GameCollectionView extends Backbone.View

  className: 'game-collections'

  template: _.template '<h3>PreviousGames</h3>'

  initialize: ->
    @collection.on 'add', => @render()

  render: =>
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append(@collection.map (game) =>
      debugger;
      new GameView(model: game).$el)
#   @$('.score').text @collection.scores()[0]