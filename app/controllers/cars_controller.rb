class CarsController < ApplicationController
    def index
        cars = find_company(params[:company_id]).cars.select(:id, :name, :price, :govnum)
        render json: cars, status: :ok
    end

    def show
        car = find_car(params[:id])
        render json: car, status: :ok
    end

    def create
        car = find_company(params[:company_id]).cars.new(car_params)
        if car.save
            car = find_car(car.id)
            render json: car, status: 201
        else
            render json: {errors: car.errors}, status: :unprocessable_entity
        end
    end

    def update
        car = Car.find(params[:id])
        if car.update_attributes(car_params)
            car =car(params[:id])
            render json: car, status: :ok
        else
            render json: {errors: car.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        car = Car.find(params[:id])
        car.destroy
        render json: car, status: 204
    end

    private

        def car_params
            params.require(:car).permit(:name, :price, :govnum)
        end

        def find_company company_id
            Company.find(company_id)
        end
        def find_car id
            Car.select(:id, :name, :price, :govnum).where(id: id)
        end
end
