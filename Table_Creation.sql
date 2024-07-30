CREATE TABLE
    Events (
        id INT AUTO_INCREMENT,
        date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        name VARCHAR(255),
        event_date DATETIME NOT NULL,
        location VARCHAR(255) NOT NULL,
        lap_count INT NOT NULL,
        completed BOOL DEFAULT FALSE,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Sections (
        event_id INT,
        section_number INT,
        PRIMARY KEY (event_id, section_number),
        FOREIGN KEY (event_id) REFERENCES Events (id) ON DELETE CASCADE,
    );

CREATE TABLE
    Classes (
        id INT AUTO_INCREMENT,
        name VARCHAR(5),
        PRIMARY KEY (id)
    );

INSERT INTO
    Classes (name)
VALUES
    ("M"),
    ("E"),
    ("I"),
    ("C");

CREATE TABLE
    Riders (
        event_id INT,
        rider_number INT,
        rider_name VARCHAR(255) NOT NULL,
        class_id INT,
        PRIMARY KEY (event_id, rider_number),
        FOREIGN KEY (event_id) REFERENCES Events (id) ON DELETE CASCADE,
        FOREIGN KEY (class_id) REFERENCES Classes (id) ON DELETE CASCADE
    );

CREATE TABLE
    Scores (
        -- identifiers
        event_id INT,
        rider_number INT,
        section_number INT,
        -- actual data
        lap_number INT NOT NULL,
        score INT NOT NULL,
        PRIMARY KEY (
            event_id,
            section_number,
            rider_number,
            lap_number
        ),
        FOREIGN KEY (event_id, rider_number) REFERENCES Riders (event_id, rider_number) ON DELETE CASCADE,
        FOREIGN KEY (event_id, section_number) REFERENCES Sections (event_id, section_number) ON DELETE CASCADE
    );