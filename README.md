# Coronavirus Info Dashboard
Link to app: https://gracewindheim.shinyapps.io/combined/

Created by Bo Kim, Austin Gu, and Grace Windheim


Information last updated March 22, 2020.

## App Description
Our app displays data about the coronavirus pandemic from a variety of angles. This information is split into three separate tabs, along with a fourth tab that provides general information about the web app. The first tab called “Travel Restrictions” identifies countries with a CDC Level 3 Travel Health Notice. This information was sourced from the CDC website, which specifies its COVID-19 travel recommendations for each country. This information can be accessed in the following link: https://www.cdc.gov/coronavirus/2019-ncov/travelers/map-and-travel-notices.html.

The second tab titled “Statistics” contains three Plotly graphs displaying relevant coronavirus information regarding the 20 most affected countries: total confirmed cases by country over time, total recovered cases by country over time, and total deaths by country over time. This data was obtained from the Johns Hopkins University Center for Systems Science and Engineering. Information about the coronavirus outbreak including cases, deaths, and recoveries is stored in a public Github Repository accessible through the following link: https://github.com/CSSEGISandData/COVID-19.


The third tab titled “Trends” displays worldwide search trends related to the term “coronavirus” and popular queries related to “coronavirus”. The user can change the time frame and source of results to see how search trends have varied over different time frames and on different websites. Data is sourced from the public Google Trends website https://trends.google.com/trends/?geo=US and retrieved using the gtrendsR package https://cran.r-project.org/web/packages/gtrendsR/gtrendsR.pdf.


## Team Member Roles
These are each team member’s contributions to the project: 

* Bo: created the “Travel Restrictions” page detailing travel recommendations from the CDC and wrote the information about the app that will be displayed on the app 

* Austin: created the “Statistics” page containing interactive plots about total cases, total number of recovered cases, and total number of deaths by country and wrote this README file 

* Grace: created the “Trends” page about coronavirus Google search trends and assembled all the code on flexdashboard, formatted the flexdashboard layout, and published the web app 

