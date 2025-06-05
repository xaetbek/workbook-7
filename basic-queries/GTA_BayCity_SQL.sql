-- Page 2: 
-- List all citizen names and their professions from the GTA.Citizens table.
SELECT *
FROM GTA.Citizens;

-- Page 3:
-- Retrieve all citizens who are under 25 years old.
SELECT *
FROM GTA.Citizens
WHERE Age < 25;

-- Page 4:
-- List all vehicle types sorted from slowest to fastest.
SELECT *
FROM GTA.Vehicles
ORDER BY Speed DESC;

-- Page 5:
-- How many vehicles does each citizen own?
SELECT CitizenID, COUNT(*) AS [Assignments]
FROM GTA.Assignments 
GROUP BY CitizenID;

-- Page 6: Bonus
-- What is the highest wanted level in the city?
SELECT MAX(WantedLevel)
FROM GTA.Citizens;


-- Mission 1: Suspect Scanner
-- Write a SQL query to return all suspects with a WantedLevel of 2 or more. 
-- Include the suspect's name, alias, and wanted level.

SELECT Name, Alias, WantedLevel
FROM GTA.Citizens
WHERE WantedLevel >= 2;

-- Mission 2: Vehicle Watchlist
-- Write a query that returns the name of the suspect, the vehicle type, 
-- and the brand of all stolen vehicles (where IsStolen = 1).

SELECT 
    c.Name AS SuspectName, 
    v.Type AS VehicleType, 
    v.Brand AS VehicleBrand
FROM GTA.Vehicles v
JOIN GTA.Citizens c ON c.CitizenID = v.OwnerID
WHERE v.IsStolen = 1;

-- Mission 3: Reward Tracker
-- Write a SQL query that shows:
-- The name of each suspect
-- The total money earned from completed missions
-- Group by name and order by earnings from highest to lowest.

SELECT 
    c.Name AS SuspectName, 
    SUM(m.Reward) AS TotalEarnings
FROM GTA.Assignments a
JOIN GTA.Citizens c ON c.CitizenID = a.CitizenID
JOIN GTA.Missions m ON m.MissionID = a.MissionID
WHERE a.Completed = 1
GROUP BY c.Name
ORDER BY TotalEarnings DESC;

-- Mission 4: Mission Speed Metrics
-- For each suspect who completed missions, return:
-- Their name
-- The number of missions completed
-- Their fastest time
-- Their slowest time

SELECT 
    c.Name AS SuspectName,
    COUNT(*) AS MissionsCompleted,
    MIN(a.TimeSpent) AS FastestTime,
    MAX(a.TimeSpent) AS SlowestTime
FROM GTA.Assignments a
JOIN GTA.Citizens c ON c.CitizenID = a.CitizenID
WHERE a.Completed = 1
GROUP BY c.Name;

-- Mission 5: Elite Agent Filter
-- Write a query that returns the names of suspects who:
-- Completed at least 2 missions
-- Earned $4000 or more total
-- Only show those who meet both conditions.

SELECT
    c.Name AS SuspectName,
    COUNT(*) AS MissionsCompleted,
    SUM(m.Reward) AS TotalEarnings
FROM GTA.Assignments a
JOIN GTA.Citizens c ON c.CitizenID = a.CitizenID
JOIN GTA.Missions m ON m.MissionID = a.MissionID
WHERE a.Completed = 1
GROUP BY c.Name
HAVING COUNT(*) >= 2 AND SUM(m.Reward) >= 4000;