class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @length  < 5 
        @add(@deck.pop()).last()
    if @bust() then @trigger "bust", @

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  maxScore: ->
    set = @scores() 
    if set[1] <= 21 then set[1] else set[0]

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  bust: -> 
    @minScore() > 21

  stand: ->
   @trigger 'stand', @ 

  playToWin: -> 
    @first().flip()
    while @minScore() <= 17 
      @hit()
    if !@bust()
      @stand() 


