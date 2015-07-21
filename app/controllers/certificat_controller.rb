class CertificatController < ApplicationController
  def index
    @certificats = Certificat.find_by(user_id:current_user.id)
  end
  def create
    processing = Processing.new(params[:file].path)
    certificat = Certificat.new(file_name:params[:file].original_filename, btc_transaction: processing.transaction,file_hash:processing.hash_document ,user_id:current_user)
    if certificat.save
      redirect_to(certificat_index_path)
    else
      #flash msg error
    end
  end
end