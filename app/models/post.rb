class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    # validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :is_clickbait?

    CLICKBAITS=[
        /Won't Believe/i,
        /Secret/i,
        /Top \d+/i,
        /Guess/i
    ]
    def is_clickbait?
        if CLICKBAITS.none? { |pattern| pattern.match title}
        errors.add(:title, "must be a clickbait")
        end
    end

end

