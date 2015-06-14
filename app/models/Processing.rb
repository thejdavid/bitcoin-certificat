require 'blockchain'
require 'digest/md5'
class Processing
  def initialize(document_value)
    @wallet = Blockchain::Wallet.new('ada4e4b6-3c9f-11e4-baad-164230d1df67', 'password123')
    @document = documment_value
    @md5_hash = ""
    @response_object = transaction.tx_hash ||= ""
  end
  def create
    self.hashing_document
    self.transaction_hash
  end
  #@wallet.send(adress of receipient,amount,adress sender,fee,note)
  def transaction_hash
    @transaction = @wallet.send('1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob', 0.0001, from_address: '1A8JiWcwvpY7tAopUkSnGuEYHmzGYfZPiq',note:@md5_hash)
  end
  def hashing_document
    Digest::MD5.hexdigest(@document)
  end
end
