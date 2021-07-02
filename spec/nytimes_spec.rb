# require 'minitest/autorun'
# require 'minitest/pride'
require 'pry'
require './lib/nytimes'

RSpec.describe 'Nested Collections' do

before :each do
  @hash = Nytimes::DATA
end

it 'can get copyright' do
  result = @hash[:copyright]
  expect(result).to eq('Copyright (c) 2018 The New York Times Company. All Rights Reserved.')
end

it 'can get array of stories' do
  result = @hash[:results]
  expect(result).is_a? (Array)
end

it 'can get all stories with a subsection of politics' do
  all_stories = @hash[:results]

  result = all_stories.find_all do |story|
    story[:subsection] == "Politics"
  end
  binding.pry
  expect(result.count).to eq(6)
  expect(result.last[:title]).to eq("Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down.")
  expect(result.first[:title]).to eq("Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight")
end

# class NytimesTest < Minitest::Test
#   attr_reader :hash
#
#   def setup
#     @hash = Nytimes::DATA
#   end
#
#   def test_it_can_get_copyright
#     #Set your code to the local variable, "result"
#
#     assert result, "Copyright (c) 2018 The New York Times Company. All Rights Reserved."
#   end
#
#   def test_it_can_get_array_of_stories
#     #Set your code to the local variable, "result"
#
#     assert result.is_a? (Array)
#     assert_equal 44, result.count
#   end
#
#   def test_it_can_get_all_stories_with_subsection_of_politics
#     #Set your code to the local variable, "result"
#
#
#     assert result.is_a? (Array)
#     assert_equal 6, result.count
#     assert_equal "Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight",
#       result.first[:title]
#     assert_equal "Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down.",
#       result.last[:title]
#   end

end
