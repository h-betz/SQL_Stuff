/* The following query returns the number of 5,4,3,2,1 stars for each restaurant*/
SELECT 
	restaurant,
	rank,
	COUNT(*) total,
	SUM(CASE
		WHEN review_stars = 5 THEN 1
		ELSE 0
	END) fiveCount,
	SUM(CASE
		WHEN review_stars = 4 THEN 1
		ELSE 0
	END) fourCount,
	SUM(CASE
		WHEN review_stars = 3 THEN 1
		ELSE 0
	END) threeCount,
	SUM(CASE
		WHEN review_stars = 2 THEN 1
		ELSE 0
	END) twoCount,
	SUM(CASE
		WHEN review_stars = 1 THEN 1
		ELSE 0
	END) oneCount
FROM
	tripadvisor
GROUP BY rank;

/* Following query returns the total number of reviews and the total number of reviews in the last four months
 * for the top 10 restaurants
 */
SELECT
	restaurant,
	rank,
	COUNT(*) total, 
	SUM(CASE
		WHEN
			rank <= 10
				AND (review_date LIKE '8/%/2015'
				OR review_date LIKE '9/%/2015'
				OR review_date LIKE '10/%/2015'
				OR review_date LIKE '11/%/2015')
		THEN
			1
		ELSE
			0
	END) lastFourMonths
FROM
	tripadvisor
WHERE
	rank <= 10
GROUP BY restaurant
ORDER BY rank;

/* Following query returns the total number of reviews and the total number of reviews in the last four months
 * for the bottom 10 restaurants
 */
SELECT
	restaurant,
	rank,
	COUNT(*) total, 
	SUM(CASE
		WHEN
			rank >= 50
				AND (review_date LIKE '8/%/2015'
				OR review_date LIKE '9/%/2015'
				OR review_date LIKE '10/%/2015'
				OR review_date LIKE '11/%/2015')
		THEN
			1
		ELSE
			0
	END) lastFourMonths
FROM
	tripadvisor
WHERE
	rank >= 50
GROUP BY restaurant
ORDER BY rank;