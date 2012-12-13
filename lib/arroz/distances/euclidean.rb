module Arroz::Distances
  module Euclidean

    def distance(e1, e2)
      sum = e1.zip(e2).map { |pair| (pair.first.to_f - pair.last.to_f)**2 }.
        reduce(:+)

      Math.sqrt(sum)
    end
  end
end
