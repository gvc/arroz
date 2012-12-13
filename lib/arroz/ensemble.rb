module Arroz

  class Ensemble

    attr_accessor :classifiers

    def initialize(classifiers)
      @classifiers = classifiers
    end

    def classify(element)
      guesses = classifiers.map { |c| c.classify(element) }
      
      uniq_guesses = guesses.uniq

      uniq_guesses.map { |g| guesses.count(g) }.zip(uniq_guesses).
        sort.last.last
    end
  end
end