# Write a function called "same", accepts two array.
# return true if every value in array has it's corresponding
# value squared in second array. Frequency of values same.
# exam: sam([1,2,3], [4,9,1]) // true


require_relative './spec/spec_helper'

def same(arr1, arr2)
  return false if arr1.length != arr2.length

  counter = {}
  arr1.each { |el| counter[el*el] = 1 }
  arr2.each { |el| return false if counter[el].nil? }
  return true
end


RSpec.describe '#same' do
  it 'returns true if the two arrays are equal' do
    expect(same([1,2,3], [1,4,9])).to be_truthy
  end

  it 'return false if one element is not equal' do
    expect(same([1,2,3], [7,4,9])).to be_falsy
  end

  it 'returns false if more than one element is not equal' do
    expect(same([1,2,3], [1,7,7])).to be_falsy
  end

  it 'returns true even duplicated values are equal' do
    expect(same([1,2,2], [1,4,4])).to be_truthy
  end

  it 'returns false if many strange values not matched at second array' do
    expect(same([1,2,2], [1,4,4,34,546,767,7878,989])).to be_falsy
  end

  context 'when sizes are different' do
    it 'returns false' do
      expect(same([1,2,3], [1,4,9,5])).to be_falsy
    end
  end
end