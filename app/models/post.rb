class Post < ApplicationRecord

    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"] }
    validate :valid_title?

    def valid_title?
        unless title =~ /Won\'t Believe|Secret|Top \d+|Guess/
            errors.add(:title, "must include one of the following phrases: 'Won't Believe', 'Secret', 'Top [number]', 'Guess'")
        end
    end



end
