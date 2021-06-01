﻿using PSTeamManagement.Configuration;
using PSTeamManagement.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PSTeamManagement.WCFService
{
    public class ContextFactory
    {
        public TeamFeadbackEntities CreateNewContext()
        {
            var database = ProductivityTools.MasterConfiguration.MConfiguration.Configuration[ConfigurationKeys.DatabaseName];
            var server = ProductivityTools.MasterConfiguration.MConfiguration.Configuration[ConfigurationKeys.ServerName];
            string connectionString = ConnectionStringPT.ConnectionString.GetSqlEntityFrameworkConnectionString(server, database, "TeamFeedback");
            var context = new TeamFeadbackEntities(connectionString);
            return context;
        }
    }
}