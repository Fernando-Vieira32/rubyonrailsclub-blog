# frozen_string_literal: true

namespace :dev do
  desc 'add articles to database'
  task add_articles: :environment do
    show_spiner('Adding articles') { add_articles }
  end

  def add_articles
    50.times do
      Article.create(
        title: Faker::Lorem.sentence.delete('.'),
        body: Faker::Lorem.paragraph(sentence_count: rand(100..200))
      )
    end
  end

  def show_spiner(msg_start, msg_end = 'Done!')
    spinner = TTY::Spinner.new("[:spinner], #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end.to_s)
  end
end
