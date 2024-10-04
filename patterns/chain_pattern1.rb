# Object to be processed
class CV
  attr_accessor :status, :name

  def initialize(status, name, chain = CVHandlerChain)
    @name       = name
    @cv_process = chain.setup

    set_status(status)
  end

  def set_status(status)
    @status = status
    @cv_process.handle(self)
  end
end

require_relative './lib/printable'
# Handlers in chain
class CVHandler
  include Printable
  attr_accessor :status, :next_handler

  def initialize(status)
    @status = status
  end

  def handle(cv)
    if can_handle?(cv.status)
      process(cv)
    elsif next_handler
      next_handler.handle(cv)
    else
      puts "Could not handle cv"
    end
  end

  def can_handle?(status)
    status <= self.status
  end

  def process(cv)
    raise NotImplementedError
  end
end

class CVUploadHandler < CVHandler
  def initialize
    super(1)
  end

  def process(cv)
    print(cv.name, 'upload')
  end
end

class CVScanHandler < CVHandler
  def initialize
    super(2)
  end

  def process(cv)
    print(cv.name, 'scan')
  end
end

class CVMatchingHandler < CVHandler
  def initialize
    super(3)
  end

  def process(cv)
    print(cv.name, 'match skills')
  end
end

class CVApproveHandler < CVHandler
  def initialize
    super(4)
  end

  def process(cv)
    print(cv.name, 'approve')
  end
end

# Build chain
class CVHandlerChain
  def self.setup
    uploading = CVUploadHandler.new
    scanning  = CVScanHandler.new
    matching  = CVMatchingHandler.new
    approving = CVApproveHandler.new

    uploading.next_handler = scanning
    scanning.next_handler  = matching
    matching.next_handler  = approving

    uploading
  end
end

# cv_process = CVHandlerChain.setup
#
# cv = CV.new(1, 'Will Nguyen')
#
# (1..5).each do |i|
#   cv.status = i
#   cv_process.handle(cv)
# end

cv = CV.new(1, 'Will Nguyen')
(2..5).each { |status| cv.set_status(status) }



