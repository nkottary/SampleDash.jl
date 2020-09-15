module SampleDash

using Dash, DashHtmlComponents, DashCoreComponents

function run_app(host="0.0.0.0", port=8080)
    app = dash(external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"],
               requests_pathname_prefix=ENV["JRUN_APP_BASE_PATH"])
    
    app.layout = html_div() do
        html_h1("Hello Dash"),
        html_div("Dash.jl: Julia interface for Dash"),
        dcc_graph(
            id = "example-graph",
            figure = (
                data = [
                    (x = [1, 2, 3], y = [4, 1, 2], type = "bar", name = "SF"),
                    (x = [1, 2, 3], y = [2, 4, 5], type = "bar", name = "Montréal"),
                ],
                layout = (title = "Dash Data Visualization",)
            )
        )
    end
    
    run_server(app, host, port)
end

end
