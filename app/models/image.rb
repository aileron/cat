class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  require 'open-uri'
  require 'digest/md5'

  field :data, :type=> BSON::Binary, :unique => true

  #
  # 適当に一件取得
  #
  def self.get
    skip(rand(count)).limit(1).first()
    #order_by(:created_at, :desc).first
  end
  
  #
  # 画像取得
  #
  def self.fetch
    open('http://www.randomkittengenerator.com/randomkitten.php', 'rb', 'Referer'=> 'http://www.randomkittengenerator.com/') do |x|
      create(:data=> BSON::Binary.new(x.read) )
    end
  end

  #
  # 画像のパス
  #
  def path
    "#{id}.jpg"
  end
end
