class Wrestler

	attr_accessor :id, :name, :height, :weight, :origin, :finisher

	def save

		conn = Wrestler.open_connection

		if(!self.id)
			sql = "INSERT INTO wrestlers (name, height, weight, origins, finisher) VALUES ( '#{self.name}', '#{self.height}', '#{self.weight}', #{self.origin}', #{self.finisher}')"
		else
			sql = "UPDATE wrestlers SET name='#{self.name}', height='#{self.height}', weight='#{self.weight}', origin='#{self.origin}', finisher='#{self.finisher}' WHERE id = #{self.id}"
		end
		
		conn.exec(sql)

	end

	def self.open_connection

		conn = PG.connect( dbname: "wrestlerdir" )

	end

	def self.all

		conn = self.open_connection

		sql = "SELECT id,name,height,weight,origin,finisher FROM wrestlers ORDER by id"

		results = conn.exec(sql)

		wrestlers = results.map do |tuple|
			self.hydrate tuple
		end

		wrestlers

	end

	def self.find id

		conn = self.open_connection

		sql = "SELECT * FROM wrestlers WHERE id = #{id} LIMIT 1"

		wrestlers = conn.exec(sql)

		wrestler = self.hydrate wrestlers[0]

		wrestler

	end

	def self.destroy id

		conn = self.open_connection

		sql = "DELETE FROM posts where id = #{id}"

		conn.exec(sql)

	end

	def self.hydrate wrestler_data

		wrestler = Wrestler.new

		wrestler.id = wrestler_data['id']
		wrestler.name = wrestler_data['name']
		wrestler.height = wrestler_data['height']
		wrestler.weight = wrestler_data['weight']
		wrestler.origin = wrestler_data['origin']
		wrestler.finisher = wrestler_data['finisher']

		wrestler

	end

end

