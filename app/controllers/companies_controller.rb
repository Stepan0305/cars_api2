class CompaniesController < ApplicationController
    def index
        companies = Company.left_outer_joins(:cars)
                            .select('companies.id, companies.name, companies.iin, companies.turnover, COUNT(cars.id) AS cars_count')
                            .group('companies.id, companies.name, companies.iin, companies.turnover')
        render json: companies, status: :ok
    end

    def create
        company = Company.new(com_params)
        if company.save
            company = find_company(company.id)
            render json: company, status: 201
        else 
            render json: {errors: company.errors}, status: unprocessable_entity

    end

    def show
        company = find_company(params[:id])
        render json: company, status: :ok
    end

    def update
        company = Company.find(params[:id])
        if company.update_attributes(com_params)
            render json: company, status: :ok
        else
            # Что-то пошло не так
            render json: {errors: company.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        company = company.find(params[:id])
        company.destroy
        render json: company, status: 204
    end

    private
        def com_params
            params.require(:company).permit(:name, :iin, :turnover)
        end

        def find_company id
            Company.left_outer_joins(:cars)
                                .select('companies.id, companies.name, companies.iin, companies.turnover, COUNT(cars.id) AS cars_count')
                                .where(id: id)
                                .group('categories.id, categories.name, companies.iin, companies.turnover')         

        end
    end
end
