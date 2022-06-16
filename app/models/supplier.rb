class Supplier < ApplicationRecord
    has_one :account, dependent: :destroy

    before_create :greeting_message
    after_create :hello_fun
    after_update :update_fun
    before_save :before_save_fun
    after_save :after_save_fun
    after_commit :after_commit_fun

    before_destroy :before_destroy_fun
    after_destroy :after_destroy_fun

    def greeting_message
        puts "Hello before cretaion."
    end


    def hello_fun
        if self.name.present?
            puts "------------Created, Hello #{self.name}------------"
        else
            puts "------------Created, No Name Present------------"
        end
    end 
    

    def update_fun
        if self.name.present?
            puts "------------Updated #{self.name}------------"
        else
            puts "------------No Name Present Please update name also.------------"
        end
    end



    def after_save_fun
        if self.name.present?
            puts "------------Saved #{self.name}------------"
        else
            puts "------------Saved without Name Please update name------------"
        end
    end

    def before_save_fun
        puts "------------(Before)Saving The Entry...------------"
    end


    def before_destroy_fun
        puts "------------Deletion Started------------"
    end
    def after_destroy_fun
        puts "------------Deleted Successfully------------"
    end

    def after_commit_fun
        puts "------------Commited Successfully------------"
    end
end
