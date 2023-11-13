# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables. This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping. You can assign it based on your skill descriptions.
# time commitment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions. Please be creative!

CREATE TABLE skills (
    skill_id int,
    skill_name varchar(255) NOT NULL,
    skill_description varchar(4096),
    skill_tag varchar(255) NOT NULL,
    skill_url varchar(4096),
    time_commitment varchar(255),
    PRIMARY KEY (skill_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names. Please be creative!

INSERT INTO skills (skill_id, skill_name, skill_description, skill_tag, skill_url, time_commitment)
VALUES
    (1, 'Time Traveling', 'Ability to make time machines', 'Skill 1', 'https://example.com/time', '12 years'),
    (2, 'Freestyling', 'Being able to rap off the dome', 'Skill 2', 'https://example.com/rap', '1 hr/day'),
    (3, 'Canvas Skills', 'Maneuver and use canvas effectively', 'Skill 3', 'https://example.com/blackboard', '5 hr/day'),
    (4, 'Fortnite Skills', 'Ability to crank 90s and hand-eye coordination', 'Skill 4', 'https://example.com/fortnite', '2 hr/day'),
    (5, 'Juggling', 'Can juggle well', 'Skill 5', 'https://example.com/juggling', '20 min/day'),
    (6, 'Color Theory', 'Well versed in understanding color combinations', 'Skill 6', 'https://example.com/colors', '45 min/day'),
    (7, 'Typing Speed', 'Ability to type very fast', 'Skill 7', 'https://example.com/GWAM', '20 min/day'),
    (8, 'Animal Communication', 'Being able to effectively communicate with animals', 'Skill 8', 'https://example.com/dog', '4 hr/day');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int,
    people_first_name varchar(255),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(4096),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(4096),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with ten people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (
    people_id,
    people_last_name,
    people_date_joined,
    people_first_name,
    people_email,
    people_linkedin_url,
    people_headshot_url,
    people_discord_handle,
    people_brief_bio
)
VALUES
    (1, 'Person 1', '2023-01-01', 'Adnan', 'adnandhanaliwala@gmail.com', 'linkedin.com/adnan-dhanaliwala', 
    'adnanface.com', 'adnan-dhanaliwala', 'cool cs guy'),

    (2, 'Person 2', '2023-01-02', 'Tom', 'tomjeff@gmail.com', 'linkedin.com/tom-jeff', 
    'tomface.com', 'tom-jefferson', '3rd president of the US'),

    (3, 'Person 3', '2023-01-03', 'DK', 'dkmetcalf@gmail.com', 'linkedin.com/dk-metcalf', 
    'dkface.com', 'dk-metcalf', 'seahawks wide receiver'),

    (4, 'Person 4', '2023-01-04', 'Jon', 'jonjones@gmail.com', 'linkedin.com/jon-jones', 
    'jonface.com', 'jon-jones', 'UFC Heavyweight Champion'),

    (5, 'Person 5', '2023-01-05', 'Venus', 'venuswilliams@gmail.com', 'linkedin.com/venus-williams', 
    'venusface.com', 'venus-williams', 'tennis player'),

    (6, 'Person 6', '2023-01-06', 'Nikkil', 'nikkiljag@gmail.com', 'linkedin.com/nikkil-jag', 
    'nikkilface.com', 'nikkil-jag', 'Adnans roommate'),

    (7, 'Person 7', '2023-01-07', 'Tasneem', 'tasneemdhanaliwala@gmail.com', 'linkedin.com/tasneem-dhanaliwala', 
    'tasneemface.com', 'tasneem-dhanaliwala', 'best mom of all time'),

    (8, 'Person 8', '2023-01-08', 'John', 'johndoe@gmail.com', 'linkedin.com/john-doe', 
    'johnface.com', 'john-doe', 'a very mysterious person'),

    (9, 'Person 9', '2023-01-09', 'Jane', 'janedoe@gmail.com', 'linkedin.com/jane-doe', 
    'janeface.com', 'jane-doe', 'a very mysterious lady (friends with John)'),

    (10, 'Person 10', '2023-01-19', 'Virat', 'viratkohli@gmail.com', 'linkedin.com/virat-kohli', 
    'viratface.com', 'virat-kohli', 'Indian cricket captain');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can be NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskill_id int AUTO_INCREMENT,
    skill_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (peopleskill_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skill_id, people_id, date_acquired)
VALUES
    (1, 1, '2023-01-15'),
    (3, 1, '2023-01-15'),
    (6, 1, '2023-01-15'),
    (3, 2, '2023-02-15'),
    (4, 2, '2023-02-15'),
    (5, 2, '2023-02-15'),
    (1, 3, '2023-03-15'),
    (5, 3, '2023-03-15'),
    (3, 5, '2023-05-15'),
    (6, 5, '2023-05-15'),
    (2, 6, '2023-06-15'),
    (3, 6, '2023-06-15'),
    (4, 6, '2023-06-15'),
    (3, 7, '2023-07-15'),
    (5, 7, '2023-07-15'),
    (6, 7, '2023-07-15'),
    (1, 8, '2023-08-15'),
    (3, 8, '2023-08-15'),
    (5, 8, '2023-08-15'),
    (6, 8, '2023-08-15'),
    (2, 9, '2023-09-15'),
    (5, 9, '2023-09-15'),
    (6, 9, '2023-09-15'),
    (1, 10, '2023-10-15'),
    (4, 10, '2023-10-15'),
    (5, 10, '2023-10-15');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    role_id int,
    role_name varchar(255),
    sort_priority int,
    PRIMARY KEY (role_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (role_id, role_name, sort_priority)
VALUES
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null. ID can be auto_increment

CREATE TABLE peopleroles (
    peoplerole_id int AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    PRIMARY KEY (peoplerole_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned)
VALUES
        (1, 2, '2023-01-15'),
    (2, 5, '2023-01-15'),
    (2, 6, '2023-01-15'),
    (3, 2, '2023-01-15'),
    (3, 4, '2023-01-15'),
    (4, 3, '2023-01-15'),
    (5, 3, '2023-01-15'),
    (6, 2, '2023-01-15'),
    (6, 1, '2023-01-15'),
    (7, 1, '2023-01-15'),
    (8, 1, '2023-01-15'),
    (8, 4, '2023-01-15'),
    (9, 2, '2023-01-15'),
    (10, 2, '2023-01-15'),
    (10, 1, '2023-01-15');

