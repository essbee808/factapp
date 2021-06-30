class Post < ApplicationRecord
    validates :name, presence: true
    validates :organization, presence: true

    belongs_to :category

    # setter method is called whenever Post is initialized with a category_name field
    # setter "intercepts the call" to the db
    # checks to see if the Category exists
    # aka "virtuals"
    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
    end
    
    def category_name
        self.category ? self.category.name : nil
    end
end
