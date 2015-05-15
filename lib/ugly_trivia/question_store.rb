module UglyTrivia

  class QuestionStore
    attr_reader :pop_questions, :rock_questions, :sports_questions, :science_questions

    def initialize
      @pop_questions = []
      @science_questions = []
      @sports_questions = []
      @rock_questions = []

      50.times do |i|
        @pop_questions.push "Pop Question #{i}"
        @science_questions.push "Science Question #{i}"
        @sports_questions.push "Sports Question #{i}"
        @rock_questions.push "Rock Question #{i}"
      end
    end

    def get_from_category(category)
      case category
      when 'Rock'
        @rock_questions.shift
      when 'Science'
        @science_questions.shift
      when 'Sports'
        @sports_questions.shift
      when 'Pop'
        @pop_questions.shift
      end
    end
  end
end
