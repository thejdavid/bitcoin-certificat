require 'blockchain'
require 'digest/md5'
class Processing
  attr_reader :wallet
  def initialize(document_path)
    @document = document_path
    @wallet = Blockchain::Wallet.new('ada4e4b6-3c9f-11e4-baad-164230d1df67', 'password123')
    @transaction = ""
  end
  #@wallet.send(adress of receipient,amount,adress sender,fee,note)
  def transaction
    @transaction = wallet.send('1NAF7GbdyRg3miHNrw2bGxrd63tfMEmJob', 0.0001, from_address: '1A8JiWcwvpY7tAopUkSnGuEYHmzGYfZPiq',note:self.hash_document)
  end
  def transaction_hash
    @transaction.tx_hash
  end
  def hash_document
    Digest::MD5.hexdigest(File.read(@document))
  end
end