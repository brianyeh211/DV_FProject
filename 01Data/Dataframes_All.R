df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", 'skipper.cs.utexas.edu:5001/rest/native/?query=
"select *
                                                from Salary;"
                                                ')), httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_by2578', PASS='orcl_by2578', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON', verbose = TRUE))))
