## AWS Lambda: 

This function contain AWS lambda pipeline functionality with layers.
Follow the below steps to create pipeline 
### Setting up Development Environment:
### RDS database
    a. Create RDS Postgres Database
    b. Allow public accessibility 
    c. In security group(VPC) , edit inbound rules and add below rules
    ```IPv4	PostgreSQL	TCP	5432	0.0.0.0/0  ```
    d. Test connect in local PgAdmin using RDS endpoint, if success, we all good at RDS site
    e. run sql query from sample_sql.sql to create table and inserr some data
### Lambda Function
    a. Create Lambda function with default IAM roles, but add policy to access S3 objects.
    b. Copy and past lambda function code to lambda console

## S3 Bucket and SNS EVENT LAMBDA
* create bucket and create folder in that bucket: rds-bkt101lambda_code/data/
* Create sns-event, mention prefix and suffix and attach to lambda function

### AWS Lambda Layers:
* create virtual env in local machine and activate it
```
C:\Users\LENOVO\AppData\Local\Programs\Python\Python39\python -m venv f_venv
  ```
* create folder named: python (Since layers expect, code/libraries should be in python fonder)
* Install Required dependencies in that folder:
  ```
  pip install sqlalchemy --target python/
  pip install --platform=manylinux1_x86_64 --only-binary=:all: psycopg2-binary --target python/
  pip install boto3 --target python/
  ```  
* right click on that folder and do compress to zip file.
* upload that zip files in s3 bucket: exp: s3_bucket/lambda_code/external/python.zip
* Now create Lambda layer and give s3 file path and select python run time environment.
* Similarly, create (fresh)folder named: python,and copy source_script package to that folder(python), and zip it.
* upload that zip to s3 bucket and create layer for that.
* Now attach both layer to lambda function

## ALL set
when we upload data.csv file into s3 bucket, it will trigger lambda function, and lambda function will
read s3 object data and insert into RDS(postgres database)
d to S3 |

## NOte:
  ```
  pip list
  pip show
  ```  