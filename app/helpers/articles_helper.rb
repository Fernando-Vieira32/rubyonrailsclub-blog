# frozen_string_literal: true

module ArticlesHelper
  def cover_image(article)
    article.cover_image.attached? ? article.cover_image.variant(:cover) : 'posts/post1.jpg'
  end
end
