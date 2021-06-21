/*
Hackers
Difficulty
Challenges
Submissions
*/


SELECT top.hacker_id, h.name FROM
(SELECT s.hacker_id hacker_id, COUNT(s.challenge_id) cnt
FROM Submissions s
LEFT JOIN Hackers h ON s.hacker_id = h.hacker_id
LEFT JOIN Challenges c ON s.challenge_id = c.challenge_id
LEFT JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY s.hacker_id
HAVING cnt > 2
ORDER BY cnt DESC, s.hacker_id ASC) top
LEFT JOIN Hackers h ON top.hacker_id = h.hacker_id