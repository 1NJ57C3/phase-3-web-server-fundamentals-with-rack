require 'rack'
require 'pry'

class App
    def call(env)
        # binding.pry
        path = env["PATH_INFO"]

        if path == "/"
            [200, { "Content-Type" => "text/html" }, ["<h2>Hello <em>World</em>!</h2>"]]
        elsif path == "/potato"
            [200, { "Content-Type" => "text/html" }, ["<p>Boil 'em, mash 'em, stick 'em in a stew</p>"]]
        elsif path == "/superhero"
            [200, { "Content-Type" => "text/html" }, File.open('./public/superhero.html', File::RDONLY)]
        else
            [404, { "Content-Type" => "text/html" }, ["Page not found"]]
        end
    end
end

# Could not figure out how to use CSS with response

run App.new