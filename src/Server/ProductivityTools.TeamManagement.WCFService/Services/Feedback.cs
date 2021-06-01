﻿using PSTeamManagement.Contract.Feedback;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PSTeamManagement.WCFService
{
    public partial class TeamManagement : IFeedback
    {
        public List<PersonFeedback> GetFeedback(List<string> initials)
        {
            var people= GetPerson(initials);

            List<PersonFeedback> personFeedbacks = new List<PersonFeedback>();
            foreach (var person in people)
            {
                var feedbacks = (from f in DbContext.Feedback
                                 where f.Person.Initials == person.Initials
                                 select new Feedback() { Date = f.CreatedDate, Value = f.Value }).ToList();
                personFeedbacks.Add(new PersonFeedback { FirstName = person.FirstName, LastName = person.FirstName, Feedback = feedbacks });

            }

            return personFeedbacks;
        }

        public void SaveFeedback(List<string> initials, string value)
        {
            var people = GetPerson(initials);
            foreach (var person in people)
            {
                var newFeedback = new PSTeamManagement.DB.Feedback();
                newFeedback.CreatedDate = TimeTools.Now;
                newFeedback.Value = value;
                newFeedback.Person = person;
                this.DbContext.Feedback.Add(newFeedback);
            }

            this.DbContext.SaveChanges();
        }
    }
}