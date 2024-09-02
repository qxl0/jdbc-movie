-- Create sequences for actor_id and movie_id
-- Create sequences for actor_id and movie_id
DO $$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_class WHERE relkind = 'S' AND relname = 'actor_id_seq') THEN
            CREATE SEQUENCE actor_id_seq;
        END IF;
    END $$;

DO $$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_class WHERE relkind = 'S' AND relname = 'movie_id_seq') THEN
            CREATE SEQUENCE movie_id_seq;
        END IF;
    END $$;

-- Alter column types to bigint
ALTER TABLE Acting ALTER COLUMN actor_id TYPE bigint;
ALTER TABLE Acting ALTER COLUMN movie_id TYPE bigint;

-- Set default values to the next value of the sequences
ALTER TABLE Acting ALTER COLUMN actor_id SET DEFAULT nextval('actor_id_seq');
ALTER TABLE Acting ALTER COLUMN movie_id SET DEFAULT nextval('movie_id_seq');

-- Update existing rows to use the sequences
UPDATE Acting SET actor_id = nextval('actor_id_seq'), movie_id = nextval('movie_id_seq');

-- Set the sequences to the max values of the actor_id and movie_id columns
SELECT setval('actor_id_seq', MAX(actor_id)) FROM Acting;
SELECT setval('movie_id_seq', MAX(movie_id)) FROM Acting;