module Arroz::Distances
  module Euclidean

    def distance(e1, e2)
      sum = e1.zip(e2).map { |pair| (pair.first - pair.last)**2 }.
        reduce(:+)

      Math.sqrt(sum)
    end
  end
end
