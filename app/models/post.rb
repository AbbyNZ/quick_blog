class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :body, :title, presence: true

  scope :published, -> { where(published: true) }

  def content
    MarkdownService.new.render(body)
  end
end
