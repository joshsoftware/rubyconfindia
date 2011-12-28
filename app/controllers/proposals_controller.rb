class ProposalsController <ApplicationController
  layout '/layouts/box_user' 

  skip_load_and_authorize_resource
  def new
   begin
    puts "Parameter #{params}"
    @content_type = ContentType.where(:slug => params[:slug]).first   
    @content = @content_type.contents.new
    #new! { @content.attributes = params[:content] }    
   rescue Exception => e
    p e.message
   end
  end

  def create
    ContentType.where(:slug => params[:slug]).first.contents.create(params[:content])
    redirect_to :back and return
  end

  private
=begin
  def require_admin
    return false
  end

  def validate_site_membership
    return true
  end
=end
end
