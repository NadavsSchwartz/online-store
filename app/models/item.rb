class Item < ActiveRecord::Base
	has_many :line_items
	has_many :carts, through: :line_items
	belongs_to :category

	accepts_nested_attributes_for :category

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :image_url, presence: true
	validates :price, presence: true, numericality: { greater_than: 0 }
	validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	def self.new_products
		self.all.last(4)
	end

	def self.featured_products
		self.all.sample(8)
	end

	def in_stock?
		self.inventory > 0
	end
			
end