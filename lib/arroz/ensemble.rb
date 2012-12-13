module Arroz

  class Ensemble

    attr_accessor :classifiers

    def initialize(classifiers)
      @classifiers = classifiers
    end

    def classify(element)
      guesses = classifiers.map { |c| c.classify(element) }
      
      plurality_vote(guesses)
    end

    def classify_projections(projections)
      raise ArgumentError.new("Wrong number of projections") if projections.size != classifiers.size
      
      guesses = classifiers.zip(projections).
        map { |classifier, projection| classifier.classify(projection) }

      plurality_vote(guesses)
    end

  private

    def plurality_vote(guesses)
      uniq_guesses = guesses.uniq

      uniq_guesses.map { |g| guesses.count(g) }.zip(uniq_guesses).
        sort.last.last
    end
  end
end