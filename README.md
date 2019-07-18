# README
## Simple API built in Rails
## Gets, adds, updates and deletes Colors
## Swagger documentation included: localhost://3000/api-docs

* Ruby version
  http://railsinstaller.org
  ruby v2.3.3
  rails v5.1

* Configuration
  Download latest version from http://railsinstaller.org

* Run API
  * from command line, cd into folder
  * rails s OR rails server
  * from your browser, go to localhost://3000/colors
  * open Postman and test the API routing endpoints:
    * GET
      * localhost:3000/colors
      * localhost:3000/colors/1
    * POST
      * localhost:3000/colors
      * body:
        ```json
        {
          "name": "red",
          "hexCode": "#FF0000",
          "rgbCode": "(255,0,0)"
        }```
    * PUT
      * localhost:3000/colors/1
      * body:
        ```json
        {
          "name": "blue",
          "hexCode": "#00FF00",
          "rgbCode": "(0,255,0)"
        }```
    * DELETE
      * localhost:3000/colors/1