class Article < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, length: { minimum: 2, maximum: 30}
	validates :job_title, presence: true, length: { minimum: 2, maximum: 50}
	validates :description, presence: true, length: { minimum: 5, maximum: 800}
	validates :user_id, presence: true
end
