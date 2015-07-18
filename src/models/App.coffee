# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'all', @playerEvents, @
    @get('dealerHand').on 'all', @dealerEvents, @  

  playerEvents: (event, hand) ->
    switch event
      when 'bust' then @trigger 'winDealer' #"the dealer wins and the game ends"
      when 'stand' then @get('dealerHand').playToWin()
  
  dealerEvents: (event, hand) ->
    switch event
      when "bust" then @trigger "winPlayer"
      when "stand" then @scoreChecker()

  scoreChecker: -> 
    playerScore = @get('playerHand').maxScore()
    dealerScore = @get('dealerHand').maxScore()
    if playerScore > dealerScore 
      @trigger 'winPlayer'
    if dealerScore > playerScore
      @trigger 'winDealer'
    else 
      @trigger 'draw'
