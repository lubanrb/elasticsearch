# Change log

## Version 0.1.7 (Nov 24, 2016)

* Made use of linked_files convention
    * Relocated elasticsearch.yml.erb and logging.yml to templates/config
    * As a result, bump up gem dependency of Luban to version 0.10.4

## Version 0.1.6 (Oct 23, 2016)

Minor enhancements:
  * Added a new parameter, #network_host, in Elasticsearch configuration
  * Cleaned up the design and implementation of app parameters in a deployment project
    * As a result, bump up gem dependency on Luban to version 0.9.10

## Version 0.1.5 (Oct 19, 2016)

Minor enhancements:
  * Created symlinks for log_path to elasticsearch logs
  * Utilized new parameters, #logrotate_max_age, #logrotate_count, from Luban to unify logrotate setup
  * Bump up gem dependency of Luban to version 0.9.8

## Version 0.1.4 (Oct 17, 2016)

Bug fixes:
  * Corrected the logrotate template file name

## Version 0.1.3 (Oct 12, 2016)

Minor enhancements:
  * Set up FileAppender instead of DailyRollingFileAppender in logging.yml of Elasticsearch
  * Added logrotate configuration for Elasticsearch
  * Bump up gem dependency of Luban to version 0.9.0

## Version 0.1.2 (Sept 20, 2016)

Minor enhancements:
  * Refactored the way of composing shell commands
    * As a result, bumped up the gem dependency on Luban to version 0.8.0

## Version 0.1.1 (Aug 31, 2016)

Minor enhancements:
  * Specified bin path for current version of Java in Elasticsearch start command to ensure the right version of Java is being used during Elasticsearch startup
  * Turned on bootstrap.mlockall to true to boost up elasticsearch performance

## Version 0.1.0 (Aug 30, 2016)

New features:
  * Initialized Luban deployemnt package of Elasticsearch
