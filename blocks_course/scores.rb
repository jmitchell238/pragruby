# scores = [83, 71, 92, 64, 98, 87, 75, 69]
# scores_doubled = scores.map { |score| score * 2   }
#
# high_scores, low_scores = scores.partition { |s| s > 80}
#
# p high_scores
# p low_scores
#
# puts scores.any? { |s| s < 70 }
# puts scores.detect { |s| s < 70 }
#
# p scores
#
# scores.select! { |s| s > 70 }
#
# p scores
#
# scores.reject!(&:even?)
# p scores


scores = [83, 71, 92, 64, 98, 87, 75, 69]
scores_doubled = scores.map { |score| score * 2   }
p scores_doubled

# total = scores_doubled.reduce(0) { |total, s| total + s }
total = scores_doubled.reduce(0, :+)
puts "Total score: #{total}"

evens, odds = scores.partition(&:even?)
p evens
p odds


