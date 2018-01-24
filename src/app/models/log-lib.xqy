xquery version "1.0-ml";

module namespace logging = "http://marklogic.com/roxy/models/log";

declare option xdmp:mapping "false";

declare function logging:search($query as xs:string, $page as xs:int)
{
  let $start := ($page - 1) * $c:DEFAULT-PAGE-LENGTH + 1
  return
    search:search($query, $c:SEARCH-OPTIONS, $start, $c:DEFAULT-PAGE-LENGTH)
};