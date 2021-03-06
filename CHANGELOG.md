#0.2.12

+ Cleaned up the README

#0.2.11

+ Added rounding support for 0s in the data
+ Finished the instructions in the README and included an image of the report output

#0.2.10

+ Finished up rake tasks (and removed extraneous ones)
+ Added getting started instructions to the README
+ Applied a reporting fix for better handling of unsupported locator strategies in older browsers

#0.2.9

+ Improved the rounding so it will add a 0 if there are only 2 decimal places

#0.2.8

+ Trimmed the Opera table header back to '12' from '12.16'
+ Rounded the data output to 3 decimal places

#0.2.7

+ Added the ability to pass the Selenium Standalone Server path on Opera runs (which sets it as an environment variable) -- a required step to run Opera Driver

#0.2.6

+ Fixed a rendering bug with IE test data in the report

#0.2.5

+ Fixed some rendering bugs in the report generator and improved browser naming

#0.2.4

+ Took out the error output when a locator can't be found and added back in '(N/A)'

#0.2.3

+ Fixed bugs in rake tasks to launch browsers

#0.2.2

+ Added rake tasks to simplify launching each browser

#0.2.1

+ Added .gitkeep to keep the benchmark directory active in GitHub

#0.2.0
Release date: Jan 21, 2014

+ Added a Large DOM example
+ Added in report generation and made it dynamic
+ Moved some things around in anticipation of rolling things into a gem

#0.1.0
Release data: Jan 14, 2014

+ Initial benchmarking example
