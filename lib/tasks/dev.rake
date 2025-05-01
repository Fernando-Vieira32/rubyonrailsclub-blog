# frozen_string_literal: true

namespace :dev do
  desc 'Reset the database'
  task reset: :environment do
    system('rails db:drop')
    system('rails db:create')
    system('rails db:migrate')
    system('rails db:seed')
    system('rails dev:add_categories')
    system('rails dev:add_articles')
  end

  desc 'add articles to database'
  task add_articles: :environment do
    show_spiner('Adding articles') { add_articles }
  end

  desc 'add categories to database'
  task add_categories: :environment do
    show_spiner('Adding categories') { add_categories }
  end

  def add_categories
    categories = %w[Java Ruby Delphi Rails Linux]
    categories.each do |category_name|
      next if Category.find_by(name: category_name)

      Category.create!(name: category_name)
    end
  end

  def add_articles
    50.times do
      article = Article.create(
        title: Faker::Lorem.sentence.delete('.'),
        body: Faker::Lorem.paragraph(sentence_count: rand(100..200)),
        category: Category.all.sample
      )
      image_id = rand(1..5)
      article.cover_image.attach(io: File.open(Rails.root.join("lib/tasks/images/full-hd/0#{image_id}.jpg")),
                                 filename: "article_#{image_id}.jpg", content_type: 'image/jpg')
    end
  end

  def show_spiner(msg_start, msg_end = 'Done!')
    spinner = TTY::Spinner.new("[:spinner], #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end.to_s)
  end
end
