"""
1: Create DataBase
2: Create Schema
3: Create STORAGE INTEGRATION (contain authentication b/w snowflake and AWS)
    A: Create IAM role provide full S3 Access
    B: Create Storage integration and get STORAGE_AWS_IAM_USER_ARN,STORAGE_AWS_EXTERNAL_ID, and past there value into IAM role
    Trust Relationship
4. CREATE FILEFORMAT
5. CREATE STAGE WITH STORAGE INTEGRATION
6. CREATE TABLE IF NOT CREATE, AND THEN RUN COPY COMMAND

"""


create schema ADW_STAGE;
use schema ADW_STAGE;
CREATE SCHEMA ADW_DEV.FILE_FORMAT;
CREATE SCHEMA ADW_DEV.EXTERNAL_STAGE;

  CREATE OR REPLACE STORAGE INTEGRATION s3_init
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::221041775123:role/snowflake-aws-role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://tauovir-pub/snow/csv/', 's3://tauovir-pub/snow/json/')
    COMMENT = 'Integration with aws s3 buckets' ;

DESC INTEGRATION s3_init;


// Create file format object
CREATE OR REPLACE file format ADW_DEV.FILE_FORMAT.CSV_FILE_FORMAT
    type = csv
    field_delimiter = '|'
    skip_header = 1
    empty_field_as_null = TRUE;  

    // Create stage object with integration object & file format object
CREATE OR REPLACE STAGE ADW_DEV.EXTERNAL_STAGE.AWS_S3_CSV
    URL = 's3://tauovir-pub/snow/csv/'
    STORAGE_INTEGRATION = s3_init
    FILE_FORMAT = ADW_DEV.FILE_FORMAT.CSV_FILE_FORMAT;

    //Listing files under your s3 buckets
list @ADW_DEV.EXTERNAL_STAGE.AWS_S3_CSV;



CREATE OR REPLACE TABLE SALES(
area_type VARCHAR(100),
availability VARCHAR(100),
location VARCHAR(100),
size VARCHAR(100),
society VARCHAR(100),
total_sqft NUMBER,
bath NUMBER,
balcony NUMBER,
price NUMBER
);

// Use Copy command to load the files
select $1 as area_type, $2 as availability, $2 as AMT from @ADW_DEV.EXTERNAL_STAGE.AWS_S3_CSV;

COPY INTO SALES
    FROM @ADW_DEV.EXTERNAL_STAGE.AWS_S3_CSV
    ON_ERROR ='CONTINUE'
    PATTERN = '.*Bengaluru.*';   

    select * from SALES
