SQL Files:
    Ttek_db_setup.sql  - initial database set up - traktor_tek_db and tables creation
    TTek_query_views.sql - a few select statements to check on tables and to create one joined query table to be used in EXCEL dashboards

Python Files:
    Ttek_initial_data_load.ipynb - load of all CSV files into the database
    TTek_Analysis.ipynb - load data from database and perform some joins and aggregations

EXCEL files:
    folder historical_data - contains the initial Capstone xlsx data file as well as the CSV files with the cleaned up data to be imported into the database
    Ttek_Dashboards.xlsx - it has 3 tabs
        RAW Data tab - contains the data connected to the joined table, ttek_anlysis, created in the SQL file
        Pivot Table tab - the tables controlling the charts in the Dashboard tab
        Dashboard tab - contains the pivot charts pulling info from the Pivot Table tab

UI:
    UI folder contains all python files related to the UI
    traktor_tek.ipynb - main python file, has the data model and views functions
    form.ipynb - the main form for weekly sales add 
    config.ipynb - the username and password info for the database
    templates folder - contains the HTML files

Power Point:
    TraktorTEK_Paola_PPT - two identical files, a PDF and a Power Point File

PNG:
    database_EER_diagram - the final EER diagram
    Please note, this diagram is slightly different from the the diagram in the PPT presentation. At the time of submission
    there is a temp app_sales table which is connected to the UI and it is to be removed once the UI is completely functional.


