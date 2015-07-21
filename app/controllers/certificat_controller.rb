class CertificatController < ApplicationController
  def index
    @certificats = Certificat.where(user_id:current_user.id)
  end
  def create
    #creating the certificat and saving the record
    processing = Processing.new(params[:file].path)
    processing.transaction
    certificat = Certificat.new(file_name:params[:file].original_filename, btc_transaction: processing.tx_hash,file_hash:processing.hash_document ,user_id:current_user)
    if certificat.save
      redirect_to(certificat_index_path)
    else
      flash[:notice] = "Error"
    end
    #Saving the file
    name = params[:file].original_filename
    directory = "/public"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    flash[:notice] = "File uploaded"
  end
end