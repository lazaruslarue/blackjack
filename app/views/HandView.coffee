
class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    console.log(@collection)
    @collection.on 'add remove change', @render, @
    @collection.on 'bustedHand', @showBusted
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]

  showBusted: =>
      console.log('showBusted ')
      @$el.addClass('busted')
