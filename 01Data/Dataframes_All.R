df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", 'skipper.cs.utexas.edu:5001/rest/native/?query=
"select GENDER, yr, round(sum(Current_annual_salary),0) as sum from salary
    group by GENDER, yr;"
                                                ')), httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_by2578', PASS='orcl_by2578', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON', verbose = TRUE))))

df1 <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", 'skipper.cs.utexas.edu:5001/rest/native/?query=
"select * from salary;"
                                                ')), httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_by2578', PASS='orcl_by2578', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON', verbose = TRUE))))
