class ViewByMonthController < ApplicationController
    include ViewByMonthHelper
    
    def index
    
        # @articles = articles_by_month
        @months = articles_by_month.keys
    
      end
    
      def show
        @month = params[:id].to_sym

        @articles = articles_by_month[params[:id].to_sym]

      end

     
end
