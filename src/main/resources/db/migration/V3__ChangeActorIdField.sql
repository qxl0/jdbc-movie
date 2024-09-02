-- Step 1: Create a new sequence
CREATE SEQUENCE actor_id_seq;

-- Step 2: Change the data type of the id column to bigint
ALTER TABLE Actor ALTER COLUMN id TYPE bigint;

-- Step 3: Set the default value of the id column to the next value of the sequence
ALTER TABLE Actor ALTER COLUMN id SET DEFAULT nextval('actor_id_seq');

-- Step 4: Update existing rows to use the sequence
UPDATE Actor SET id = nextval('actor_id_seq');

-- Step 5: Set the sequence to the max value of the id column
SELECT setval('actor_id_seq', MAX(id)) FROM Actor;