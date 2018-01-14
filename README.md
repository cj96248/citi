## log for MarkLogic

Marklogic has a service to get log message. But the API returns all the log message.

log4Marklogic can filter the log and only return the specified info.

I recommend to use application-level auth, so that we don't need to input username/password when get log.

  
### About roxy

Roxy is a utility for configuring and deploying MarkLogic applications. Using Roxy you can define your app servers, databases, forests, groups, tasks, etc in local configuration files. Roxy can then remotely create, update, and remove those settings from the command line.

Please refer to [roxy](https://github.com/marklogic-community/roxy)