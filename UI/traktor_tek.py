import os
from flask import Flask, render_template, redirect, url_for
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy 
from form import SalesForm
from config import username, password, key

app = Flask(__name__)
app.config['SECRET_KEY'] = key

############################
####    SQL DATABASE    ####

basedir = os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI']=f'mysql+pymysql://{username}:{password}@localhost/traktor_tek_db' 
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False
db = SQLAlchemy(app)
Migrate(app,db)

################################
####    DATABASE TABLE MODELS     ####


# SALES MODEL
class App_Sales(db.Model):

 # Manual table name   
    __tablename__ = 'app_sales'

# Table Column Names
    sales_id = db.Column(db.Integer,primary_key=True)
    emp_id = db.Column(db.Text)
    item_code = db.Column(db.Text)
    quantity = db.Column(db.Integer)
    sales_year = db.Column(db.Integer)
    sales_week = db.Column(db.Integer)

       

# Define init and repr method for the class

    def __init__ (self,emp_id,item_code,quantity,sales_year,sales_week):

        self.emp_id = emp_id
        self.item_code = item_code
        self.quantity = quantity
        self.sales_year = sales_year
        self.sales_week = sales_week
       

        

    def __repr__(self):
        return f"This week we have sold {self.quantity} of {self.item_code}."




######################################
#### VIEW FUNCTIONS -- HAVE FORMS ####

@app.route('/')
def index():
    return render_template('home.html')

@app.route('/sales',methods=['GET','POST'])
def sales():
    form = SalesForm()

    if form.validate_on_submit():
        emp_id = form.emp_id.data 
        item_code = form.item_code.data
        quantity = form.quantity.data
        sales_year = form.sales_year.data
        sales_week = form.sales_week.data
    

        new_sale = App_Sales(emp_id,item_code,quantity,sales_year,sales_week)
        
        db.session.add(new_sale)
        db.session.commit()

        return redirect(url_for('thankyou'))

    return render_template('sales.html',form=form)

@app.route('/thankyou')
def thankyou():
    return render_template('thankyou.html')

if __name__ == '__main__':
    app.run(debug=True)



