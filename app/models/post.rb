class Post < ActiveRecord::Base
  attr_accessible :title, :photo
  FOTOS = File.join Rails.root, "public", "photo_store"

  after_save :guardar_foto

  def photo=(file_data)
    unless file_data.blank?
      @file_data=file_data
      self.extention = file_data.original_filename.split('.').last.downcase
    end
  end

  def photo_filename
    File.join   FOTOS , "#{id}.#{extention}"
  end

  def photo_path
    "/photo_store/#{id}.#{extention}"
  end

  def has_photo?
    File.exist? photo_filename
  end

  def next
    arr=Post.all
    for j in (0..arr.length)
      if arr[j]==Post.find(self)
        return @next = arr[j+1]
      end
    end
  end

  def next?
    !self.next.nil?
  end

  def ant
    arr=Post.all
    for j in (0..arr.length)
      if arr[j]==Post.find(self)
        return @ant = arr[j-1]
      end
    end
  end

  def ant?
    !self.ant.nil?
  end




  private
  def guardar_foto
    if @file_data
      FileUtils.mkdir_p FOTOS
      File.open(photo_filename, 'wb') do |f|
        f.write(@file_data.read)
      end
      @file_data = nil
    end
  end


end