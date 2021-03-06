SET IDENTITY_INSERT PTTeamManagement.tm.Person ON;  
INSERT INTO PTTeamManagement.tm.Person ( PersonId,[FirstName],[Lastname],[Initials],[Category])
SELECT  PersonId,[FirstName],[Lastname],[Initials],[Category]
FROM [EcoVadisPT].[tm].[Person] where PersonId<>1
SET IDENTITY_INSERT PTTeamManagement.tm.Person OFF;  

SET IDENTITY_INSERT PTTeamManagement.tm.[Feedback] ON;  
INSERT INTO PTTeamManagement.tm.[Feedback] ([FeedbackId],[PersonId],[CreatedDate],[Value],[ReFeedback])
SELECT [FeedbackId],[PersonId],[CreatedDate],[Value],[ReFeedback]
FROM [EcoVadisPT].[tm].[Feedback]
SET IDENTITY_INSERT PTTeamManagement.tm.[Feedback] OFF; 

SET IDENTITY_INSERT PTTeamManagement.tm.Internal ON;  
INSERT INTO PTTeamManagement.tm.Internal ( [InternalId],[PersonId],[CreatedDate],[Value])
SELECT [InternalId],[PersonId],[CreatedDate],[Value]
FROM [EcoVadisPT].[tm].[Internal]
SET IDENTITY_INSERT PTTeamManagement.tm.Internal OFF; 

SET IDENTITY_INSERT PTTeamManagement.tm.Meeting ON;  
INSERT INTO PTTeamManagement.tm.Meeting ( [MeetingId],[Date],[Subject],[BeforeNotes],[DuringNotes],[AfterNotes])
SELECT [MeetingId],[Date],[Subject],[BeforeNotes],[DuringNotes],[AfterNotes]
FROM [EcoVadisPT].[tm].[Meeting]
SET IDENTITY_INSERT PTTeamManagement.tm.Meeting OFF; 

INSERT INTO PTTeamManagement.tm.MeetingsPerson ( MeetingId,[PersonId])
SELECT MeetingId,[PersonId]
FROM [EcoVadisPT].[tm].[MeetingsPerson]

SET IDENTITY_INSERT PTTeamManagement.tm.One2One ON;  
INSERT INTO PTTeamManagement.tm.One2One ([One2OneId],[PersonId],[CreatedDate],[Feedback],[ReFeedback],[TopicsToDiscuss])
SELECT [One2OneId],[PersonId],[CreatedDate],[Feedback],[ReFeedback],[TopicsToDiscuss]
  FROM [EcoVadisPT].[tm].[One2One]
SET IDENTITY_INSERT PTTeamManagement.tm.One2One OFF; 

SET IDENTITY_INSERT PTTeamManagement.tm.[Success] ON;  
INSERT INTO PTTeamManagement.tm.[Success] ([SuccessId],[CreatedDate],[Subject],[Value])
SELECT [SuccessId],[CreatedDate],[Subject],[Value]
FROM [EcoVadisPT].[tm].[Success]
SET IDENTITY_INSERT PTTeamManagement.tm.[Success] OFF; 

