#encoding: UTF-8
class Student
  attr_accessor :name, :n1,:n2,:n3, :code

  def initialize(name,n1,n2,n3,code,media)
    @name,@n1,@n2,@n3,@code,@media = name,n1,n2,n3,code,media
  end
end

class CsvReader
  require 'csv'
  def read_csv_data(csv_filename)
    CSV.foreach(csv_filename, headers: true) do |row|
      s =  Student.new(row["Nome"],row["n1"],row["n2"],row["n3"],row["Matricula"],row["media"])
      puts s.inspect
    end	
  end
end


class Main
  def self.init
    reader = CsvReader.new
    ARGV.each do |filename|
      reader.read_csv_data(filename)
    end
  end
end

Main.init
