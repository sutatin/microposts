class Relationship < ActiveRecord::Base
  # :follower　とはUserクラスから生成されたオブジェクト
  belongs_to :follower ,class_name: "User"
  
  belongs_to :followed ,class_name: "User"
end
