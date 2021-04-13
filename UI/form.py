from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, RadioField, SelectField, BooleanField, SubmitField
from wtforms.validators import DataRequired, NumberRange


# CREATE SOME DICTIONARIES WITH TUPLE VALUES TO USE IN THE DROP DOWN CHOICE MENUS OF THE FORM
PROD_CHOICES =[('NULL','None'),('PROD_001','Gator XUV 590M'),('PROD_002','CUV82'),('PROD_003','1025R Sub-Compact Tractor'),
('PROD_004','CT1021 Sub-Compact Tractor'),('PROD_005','Bobcat UV34 Gas'),('PROD_006','ZT2000 Zero Turn Mower'),
('PROD_007','S70 Skid Steer Loader'),('PROD_008','Z930M Ztrack'),('ESP_001','ESP_001'),('ESP_002','ESP_002'),('ESP_003','ESP_003'),('ESP_004','ESP_004'),
('ESP_005','ESP_005'),('ESP_006','ESP_006')]
SALES_CHIOCES = [('EMP234','Jane Bachmann'),('EMP244','Gina Evans'),('EMP256','Harry Lawson'),('EMP267','Beverly Clement'),
('EMP290','Maude Allen')]

YEAR_CHOICES = [('2021','2021'),('2020','2020'),('2019','2019')]
# LOOP THROUGH THEM WEEK_CHOICES = 0,W0 ... 51,W51


# FORM FIELDS
class SalesForm (FlaskForm):
    emp_id= SelectField(u'Sales Team Lead:', choices=SALES_CHIOCES)
    item_code = SelectField(u'Product Code:', choices=PROD_CHOICES)
    quantity = IntegerField('Quantity of product sold:')
    sales_year = SelectField(u'Year:',choices=YEAR_CHOICES)
    sales_week = IntegerField('Week:')
    submit = SubmitField('Submit')