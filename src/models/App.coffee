# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    #@attributes.playerHand
    console.log @get('dealerHand')
    # @get('dealerHand').on('hit', @bustCheck, @)
    #console.log @get('dealerHand').models[0].flip()
    # console.log @get('dealerHand').scores(), @get('playerHand').scores()

#end game
  
  bustCheck: ->
    playerScore = @get('playerHand').scores()
    dealerScore = @get('dealerHand').scores()  
    if Math.min.apply(null,playerScore) > 21
      alert "game over brah"
    if Math.min.apply(null,dealerScore) > 21
      alert "you win brah" 

#score checker
  scoreChecker: -> 
    @get('dealerHand').models[0].flip()
    playerScore = @get('playerHand').scores()
    dealerScore = @get('dealerHand').scores() 
    @bustCheck()

  # either hit 21 flip
  # if player hits stand, flip 


    # if (playerScore > )

    # 


    # @get('dealerHand').models[0].flip()
    #@get('dealerHand').models[0].flip()
  @get('dealerHand').on('hit', -> 
    console.log "hit" , @)
