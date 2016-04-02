
    finder = FileFinder.new( config )

    args.each do |arg|
      files = finder.find_files( arg )
      files.each do |file| 
        Slideshow::Gen.new( config ).create_slideshow( file )
      end
    end


