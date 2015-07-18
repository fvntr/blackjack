class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @length  < 5 
        @add(@deck.pop()).last();
    @trigger('scoreChecker', @)

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


  stand: ->
    @add(@deck.pop()).last();


    # ,m nju87console.log "dealer",@scores()
    # dealer decided whether it hits or not
    # access the dealer's hand
    # hit him if 

# if player hand score is greater than 21 than the game is over 
# implement stand 
# compare scores to see who is closer to 21 

#need a listener for score
    #inside listener, checking for 21 or over
    #if more than 21, then alert game over

#need to reveal player and dealer cards when game is over 


