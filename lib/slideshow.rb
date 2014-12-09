# encoding: utf-8

require 'slideshow/models'


# more core and stlibs    -- remove libs already included in models
require 'optparse'
require 'erb'
require 'logger'               # todo: remove!! replaced by logutils gem
require 'fileutils'
require 'pp'
require 'uri'
require 'net/http'
require 'net/https'
require 'ostruct'
require 'date'
require 'yaml'
require 'cgi'


# required gems
require 'active_support/all'

require 'logutils'       # logger utils library

require 'markdown'          # default markdown library
require 'fetcher'           # fetch docs and blogs via http, https, etc.

require 'props'             # manage settings/env

class Env
  def self.slideshowopt
    ENV[ 'SLIDESHOWOPT' ]
  end
end # class Env

require 'textutils'     # text filters and helpers
require 'pakman'        # template pack manager


# our own code
require 'slideshow/cli/version'        # note: let version always go first
require 'slideshow/cli/opts'


module Slideshow

  def self.main_old
    
    # allow env variable to set RUBYOPT-style default command line options
    #   e.g. -o slides -t <your_template_manifest_here>
    slideshowopt = Env.slideshowopt
    
    args = []
    args += slideshowopt.split if slideshowopt
    args += ARGV.dup
    
    Runner.new.run(args)
  end

  def self.main
    require 'slideshow/cli/main'
    ## Runner.new.run(ARGV) - old code
  end


end # module Slideshow


Slideshow.main   if __FILE__ == $0
