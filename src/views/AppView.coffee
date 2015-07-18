class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
     # : console.log "end game"
 
  initialize: -> 
    @model.on 'all', @updateGameStatus, @
    @render()

  updateGameStatus: (events) ->
     switch events 
       when 'winPlayer' then alert "you win brah"
       when 'winDealer' then alert "you lose brah"
       when 'draw' then alert 'draw'

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  #refresh after losing
  #when stand happens, no change in the appView
  #its always win brah and then draw