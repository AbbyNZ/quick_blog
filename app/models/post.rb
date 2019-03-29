class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  belongs_to :author, class_name: "AdminUser"

  validates :body, :title, presence: true

  scope :published, -> { where(published: true) }

  def content
    MarkdownService.new.render(body)
  end

  def author_name
    if author
      author.name
    else
      "Nobody"
    end
  end
end
