--Use StackOverflow Database
use StackOverflow2010;

-- Question 01
--Write a query to display all users along with all post types
select u.Id, u.DisplayName, p.Id AS PostID, pt.Type AS PostType
from Users u 
left join Posts p
on u.Id = p.OwnerUserId
left join PostTypes pt 
on p.PostTypeId = pt.Id;

-- Question 02
/* Write a query to retrieve all posts along with their owner's
display name and reputation. Only include posts that have an
owner.
*/
select p.Id AS PostID,p.Title, u.DisplayName, u.Reputation
from Posts p inner join Users u
on p.OwnerUserId = u.Id;

-- Question 03
/*Write a query to show all comments with their associated post
titles. Display the comment text, comment score, and post title.
*/
select c.Text, c.Score, p.Title
from Comments c inner join Posts p 
on c.PostId = p.Id;

-- Question 04
/*Write a query to list all users and their badges (if any).
Include users even if they don't have badges. Show display name,
badge name, and badge date.
*/
select u.DisplayName, b.Name as BadgeName, b.Date as BadgeDate
from Users u left join Badges b
on u.Id = b.UserId;

-- Question 05
/*Write a query to display all posts along with their comments (if
any). Include posts that have no comments. Show post title, post
score, comment text, and comment score.
*/
select p.Title as PostTitle, p.Score as PostScore, c.Text as CommentText, c.Score as CommentScore
from Posts p left join Comments c
on p.Id = c.PostId;
-- Question 06
/*Write a query to show all votes along with their corresponding
posts. Include all votes even if the post information is missing.
Display vote type ID, creation date, and post title.
*/
select v.VoteTypeId, v.CreationDate,p.Title as PostTitle
from Votes v left join Posts p 
on v.PostId = p.Id;

-- Question 07
/*Write a query to find all answers (posts with ParentId) along with
their parent question. Show the answer title, answer score,
question title, and question score.
*/
select answers.Title as 'answer title', answers.Score as 'answer score',questions.Title as 'question title' ,questions.Score as 'question score'
from Posts answers inner join Posts questions
on answers.ParentId = questions.Id;

-- Question 08
/*Write a query to display all related posts using the PostLinks table.
Show the original post title, related post title, and link type ID.
*/
SELECT
    original.Title AS OriginalPostTitle,
    related.Title AS RelatedPostTitle,
    pl.LinkTypeId
FROM PostLinks pl
INNER JOIN Posts original
    ON pl.PostId = original.Id
INNER JOIN Posts related
    ON pl.RelatedPostId = related.Id;
-- Question 09
/*Write a query to show posts with their authors and the post type
name. Display post title, author display name, author reputation,
and post type.
*/
select p.Title as 'post title', u.DisplayName as 'author name', u.Reputation, pt.Type as 'post type'
from Posts p inner join Users u
on p.OwnerUserId = u.Id
inner join PostTypes pt
on p.PostTypeId = pt.Id;
-- Question 10
/*Write a query to retrieve all comments along with the post title,
post author, and the commenter's display name.
*/ 
select c.Text as Comment,p.Title as PostTitle,u.DisplayName as Author,commenter.DisplayName as Commenter
from Comments c join Posts p
on c.PostId = p.Id
join Users u
on p.OwnerUserId = u.Id
join Users commenter
on commenter.Id = c.UserId;
-- Question 11
/*Write a query to display all votes with post information and vote
type name. Show post title, vote type name, creation date, and
bounty amount.
*/
select p.Title as PostTitle, vt.Name as VoteTypeName, v.CreationDate, v.BountyAmount
from Votes v left join Posts p
on v.PostId = p.Id
join VoteTypes vt 
on v.VoteTypeId = vt.Id;
-- Question 12
/*Write a query to show all users along with their posts and
comments on those posts. Include users even if they have no
posts or comments. Display user name, post title, and comment
text.
*/
select u.DisplayName as UserName, p.Title as PostTitle, c.Text as Comment
from Users u left join Posts p
on u.Id = p.OwnerUserId
left join Comments c
on p.Id = c.PostId;
-- Question 13
/*Write a query to retrieve posts with their authors, post types, and
any badges the author has earned. Show post title, author name,
post type, and badge name.
*/
select p.Title as PostTitle, u.DisplayName as Author, pt.Type as PostType, b.Name as BadgeName
from Posts p join Users u 
on p.OwnerUserId = u.Id
join PostTypes pt
on p.PostTypeId = pt.Id
left join Badges b
on b.UserId = u.Id;
-- Question 14
/*Write a query to create a comprehensive report showing:
post title, post author name, author reputation, comment text,
commenter name, vote type, and vote creation date. Include
posts even if they don't have comments or votes. Filter to only
show posts with a score greater than 5.
*/
select p.Title as PostTitle, u.DisplayName as Author,u.Reputation,c.Text as Comment,commenter.DisplayName as Commenter,vt.Name as VoteType,v.CreationDate
from Posts p left join Users u
on p.OwnerUserId = u.Id
left join Comments c 
on p.Id = c.PostId
left join Users commenter
on c.UserId = commenter.Id
left join Votes v 
on p.Id = v.PostId
left join VoteTypes vt 
on v.VoteTypeId = vt.Id
where p.Score > 5;