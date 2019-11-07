require 'prawn'
Prawn::Font::AFM.hide_m17n_warning = true

class Report

    def initialize(country)
        @country = country
    end

    def run
        Prawn::Document.generate("country_report.pdf") do |pdf|
            pdf.text @country.name
            pdf.move_down 20
            pdf.text "Region: #{@country.region}"
            pdf.move_down 20
            pdf.text "Location: #{@country.latitude}, #{@country.longitude}"
            if @country.states.any?
                pdf.move_down 20
                pdf.text "States:"
                pdf.move_down 20
                @country.states.values.each do |state|
                    pdf.text state["name"]
                end
            end
        end
    end
end

