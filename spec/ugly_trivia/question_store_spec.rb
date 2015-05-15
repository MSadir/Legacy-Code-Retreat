require 'spec_helper'
require 'ugly_trivia/question_store'

describe UglyTrivia::QuestionStore do

  describe '#initialize' do
    it 'creates 50 of each category of question' do
      expect(subject.pop_questions.length).to eq(50)
      expect(subject.rock_questions.length).to eq(50)
      expect(subject.sports_questions.length).to eq(50)
      expect(subject.science_questions.length).to eq(50)
    end
  end

  describe '#get_from_category' do
    it 'shifts on the given category' do
      expect(subject.get_from_category('Rock')).to eq('Rock Question 0')
      expect(subject.get_from_category('Science')).to eq('Science Question 0')
      expect(subject.get_from_category('Sports')).to eq('Sports Question 0')
      expect(subject.get_from_category('Pop')).to eq('Pop Question 0')
    end

    it 'removes the question from the given category' do
      subject.get_from_category('Rock')
      expect(subject.rock_questions.length).to eq(49)
      expect(subject.science_questions.length).to eq(50)
      expect(subject.sports_questions.length).to eq(50)
      expect(subject.pop_questions.length).to eq(50)
    end
  end
end
