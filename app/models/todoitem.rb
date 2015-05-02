class Todoitem < ActiveRecord::Base

    def as_json(options = { })
        {
        	"id" => id,
            "title" => title,
            "description" => description
        }
    end

    def to_json(*a)
        as_json.to_json(*a)
    end
end
