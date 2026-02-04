class HealthChecksController < ApplicationController
  def question1
    # 診断スタート時にセッションを初期化
    session[:answers] = {}
  end

  def question2
  end

  def question3
  end

  def answer
    # セッションがなければ作る
    session[:answers] ||= {}

    # 質問番号ごとに回答を保存
    # 例：{ "1" => "A", "2" => "B" }
    session[:answers][params[:question]] = params[:choice]

    # 次の画面へ遷移
    case params[:question]
    when "1"
      redirect_to question2_health_checks_path
    when "2"
      redirect_to question3_health_checks_path
    when "3"
      redirect_to result_health_checks_path
    end
  end

  def result
    answers = session[:answers] || {}
    a_count = answers.values.count("A")

    if a_count >= 3
      @level = "高"
      @message = "未来のあなた、健康診断でドヤ顔してます😄"
    elsif a_count == 2
      @level = "中"
      @message = "ほどほど健康派。そのバランス、嫌いじゃない👍"
    else
      @level = "低"
      @message = "健康意識が冬眠中ですね。春が来るのを気長に待ちましょう🌸"
    end
  end
end
