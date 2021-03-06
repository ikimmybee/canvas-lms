require File.expand_path(File.dirname(__FILE__) + '/../../../../spec_helper.rb')

describe Quizzes::QuizQuestion::AnswerSerializers::AnswerSerializer do

  ASes = Quizzes::QuizQuestion::AnswerSerializers

  it 'automatically registers answer serializers' do
    serializer = nil

    qq = { question_type: 'uber_hax_question' }

    expect(ASes.serializer_for(qq)).to be_kind_of(Quizzes::QuizQuestion::AnswerSerializers::Unknown)

    class Quizzes::QuizQuestion::AnswerSerializers::UberHax < Quizzes::QuizQuestion::AnswerSerializers::AnswerSerializer
    end

    begin
      expect { serializer = ASes.serializer_for(qq) }.to_not raise_error
      expect(serializer.is_a?(ASes::AnswerSerializer)).to be_truthy
    ensure
      Quizzes::QuizQuestion::AnswerSerializers.send(:remove_const, :UberHax)
    end
  end

  it 'has Error constant' do
    expect{Quizzes::QuizQuestion::AnswerSerializers::Error.new('message')}.to_not raise_error
  end
end
