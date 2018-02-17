class Post < ActiveRecord::Base
    belongs_to :user
    validates :title, :body, :user, presence: true

    def self.titles
        Post.pluck( :title)
    end

    def word_count
        body.split(" ").count
    end

    def creator_email
        user.email

    end

    def pretty_word_count
        "This post has #{word_count} words."
    end

    def character_count
        body.split("").count
    end

    def pretty_character_count
        "This post has #{character_count} characters."

    end
end
