class TicketsController < ApplicationController
skip_before_filter :verify_authenticity_token
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        email_sender = Postmark::ApiClient.new(ENV['POSTMARK_API_KEY'])
        email_sender.deliver(from: "admin@unofficialtrakehnerdatabase.com",
                             reply_to: "2ddfa4399d3128bf1440462efb3eb4e5@inbound.postmarkapp.com",
                             to: "susan.prestage@gmail.com",
                             subject: "Help Ticket [#{@ticket.id}]: #{@ticket.summary}",
                             text_body: @ticket.problem)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  def inbound
    logger.info request.body.inspect

    subject = request.params["Subject"]
    m = subject.match(/([^\?]*)\Help Ticket \[(\d*)/)
    ticket_id = m[2]

    ticket = Ticket.find(ticket_id)

    body = request.params["TextBody"]
    ticket.response = body

    if ticket.save
      redirect_to ticket
    else
      raise Exception.new 'Ticket save failed!!!'
    end
  end
end
