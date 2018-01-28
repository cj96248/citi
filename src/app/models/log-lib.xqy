xquery version "1.0-ml";

module namespace logging = "http://marklogic.com/roxy/models/log";

declare option xdmp:mapping "false";

declare function logging:search($filename as xs:string, $filter as xs:string, $level as xs:string)
{
    let $path := logging:build-uri($filename)
    let $length := xdmp:filesystem-file-length($path)
    let $line := 
        for $log in fn:tokenize(xdmp:filesystem-file($path), "\n")
        where fn:matches($log, fn:concat($level, ":"))
        return if($filter ne "")
               then $log[fn:contains(., $filter)]
               else $log
return  fn:string-join($line, "
")
};

declare function logging:build-uri($filename as xs:string){
    fn:concat("/var/opt/MarkLogic/Logs/", "filename")
};