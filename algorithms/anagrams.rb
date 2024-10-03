# Given two strings, inputs are two arrays.
# Check if 2nd is anagrams of first.
# Anagrams: rearrange letters of one that will be another.
# exam: aaz, zaa; anagram, nagaram.

# require_relative 'spec/spec_helper'

RSpec.describe 'validAnagram' do
  context 'when length is not matched' do
    it 'returns false' do

    end
  end

  context 'when length is matched' do
    context 'and one letter counter not matched' do
      it 'returns false' do

      end
    end

    context 'and all letters frequency matched' do
      it 'returns true' do

      end

      context 'and it has spaces inside' do
        it 'returns true' do

        end
      end
    end
  end
end