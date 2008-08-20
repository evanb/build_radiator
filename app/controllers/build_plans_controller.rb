class BuildPlansController < ApplicationController
  # GET /build_plans
  # GET /build_plans.xml
  def index
    @build_plans = BuildPlan.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @build_plans }
    end
  end

  # GET /build_plans/1
  # GET /build_plans/1.xml
  def show
    @build_plan = BuildPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @build_plan }
    end
  end

  # GET /build_plans/new
  # GET /build_plans/new.xml
  def new
    @build_plan = BuildPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @build_plan }
    end
  end

  # GET /build_plans/1/edit
  def edit
    @build_plan = BuildPlan.find(params[:id])
  end

  # POST /build_plans
  # POST /build_plans.xml
  def create
    @build_plan = BuildPlan.new(params[:build_plan])

    respond_to do |format|
      if @build_plan.save
        flash[:notice] = 'BuildPlan was successfully created.'
        format.html { redirect_to(@build_plan) }
        format.xml  { render :xml => @build_plan, :status => :created, :location => @build_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @build_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /build_plans/1
  # PUT /build_plans/1.xml
  def update
    @build_plan = BuildPlan.find(params[:id])

    respond_to do |format|
      if @build_plan.update_attributes(params[:build_plan])
        flash[:notice] = 'BuildPlan was successfully updated.'
        format.html { redirect_to(@build_plan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @build_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /build_plans/1
  # DELETE /build_plans/1.xml
  def destroy
    @build_plan = BuildPlan.find(params[:id])
    @build_plan.destroy

    respond_to do |format|
      format.html { redirect_to(build_plans_url) }
      format.xml  { head :ok }
    end
  end
end
