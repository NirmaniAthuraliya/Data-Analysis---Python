Use Data_Analysis_Projects;
SELECT * from athlete_events;

SELECT COUNT(*) as COUNT FROM athlete_events;

-- Total Olympic Games Organized -- 
SELECT COUNT(DISTINCT Games) as COUNT 
FROM athlete_events;

-- Total Olympic Games Organized based on the Season-- 
SELECT Season, COUNT(DISTINCT Games) as COUNT 
FROM athlete_events
GROUP BY Season;

-- Sports Count --
SELECT COUNT(Distinct Sport) FROM athlete_events;
SELECT Distinct Sport FROM athlete_events;

-- Medal Counts -- 
SELECT COUNT(Medal) AS Gold_Medals 
FROM athlete_events 
Where Medal = 'Gold';

Select COUNT(Medal) AS Silver_Medals 
FROM athlete_events 
Where Medal = 'Silver';

Select COUNT(Medal) AS Bronze_Medals 
FROM athlete_events 
Where Medal = 'Bronze';

-- Get the Each Player Medal Count -- 
SELECT Name, Age, COUNT(Medal) AS Medal_Count 
FROM athlete_events
WHERE Medal <> 'NA' 
GROUP BY Name, Age
ORDER BY Medal_Count DESC;

SELECT Name, Age, COUNT(Medal) AS Medal_Count,
SUM(CASE WHEN Medal = 'GOLD' THEN 1 ELSE 0 END) AS GOLD,
SUM(CASE WHEN Medal = 'SILVER' THEN 1 ELSE 0 END) AS SILVER,
SUM(CASE WHEN Medal = 'BRONZE' THEN 1 ELSE 0 END) AS BRONZE
FROM athlete_events
WHERE Medal <> 'NA'
Group BY Name, Age
ORDER BY Medal_Count DESC;

-- Get the Name of the Medalist who has the Highest no of Medals
SELECT Name, Age, Event, COUNT(Medal) AS Medals_Count 
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Name, Age, Event
ORDER BY COUNT(Medal) DESC
LIMIT 1;

-- Get the Name of the Youngest Medalist -- 
SELECT Name, Age, Event, COUNT(Medal) AS Medals_Count 
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Name, Age, Event
ORDER BY Age
LIMIT 1;

-- Get the Name of the Oldest Medalist -- 
SELECT Name, Age, Event, COUNT(Medal) AS Medals_Count 
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Name, Age, Event
ORDER BY Age DESC
LIMIT 1;

-- Get the Season wise Medal Count --
SELECT Season, COUNT(Medal) AS Medals_Count 
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Season;

-- Get the Year wise Medal Count --
SELECT Year, Season, COUNT(Medal) AS Medals_Count 
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Year, Season
ORDER BY Year;

SELECT Year, Season, COUNT(Medal) AS Medal_Count,
SUM(CASE WHEN Medal = 'GOLD' THEN 1 ELSE 0 END) AS GOLD,
SUM(CASE WHEN Medal = 'SILVER' THEN 1 ELSE 0 END) AS SILVER,
SUM(CASE WHEN Medal = 'BRONZE' THEN 1 ELSE 0 END) AS BRONZE
FROM athlete_events
WHERE Medal <> 'NA'
Group BY Year, Season;

-- Get the Year wise Team Count --
SELECT Year, Season, COUNT(Team) AS Team_Count 
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Year, Season
ORDER BY Year;

-- Get the Team wise Medal Count --
SELECT Team, COUNT(Medal) AS Medal_Count 
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Team
ORDER BY Medal_Count DESC;

SELECT Team, COUNT(Medal) AS Medal_Count,
SUM(CASE WHEN Medal = 'GOLD' THEN 1 ELSE 0 END) AS GOLD,
SUM(CASE WHEN Medal = 'SILVER' THEN 1 ELSE 0 END) AS SILVER,
SUM(CASE WHEN Medal = 'BRONZE' THEN 1 ELSE 0 END) AS BRONZE
FROM athlete_events
WHERE Medal <> 'NA'
Group BY Team
ORDER BY Medal_Count DESC;

-- Get the Gender wise Medal Count --
SELECT Sex, COUNT(Medal) AS Medals_Count 
FROM athlete_events
WHERE Medal <> 'NA'
GROUP BY Sex;

-- Top 5 sports in which female athletes have won the most medals --
SELECT Event, COUNT(Medal) AS Medals_Count 
FROM athlete_events
WHERE Medal <> 'NA' and Sex = 'F'
GROUP BY Event
ORDER BY Medals_Count DESC
LIMIT 5;

-- Get the Hosted Country in Each Year
SELECT Year, Season, City 
FROM athlete_events
WHERE Medal <> 'NA' 
GROUP BY Year, Season, City
ORDER BY Year;
