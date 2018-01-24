xquery version "1.0-ml";

module namespace log = "http://marklogic.com/roxy/controller/log";

import module namespace ch = "http://marklogic.com/roxy/controller-helper" at "/roxy/lib/controller-helper.xqy";

import module namespace req = "http://marklogic.com/roxy/request" at "/roxy/lib/request.xqy";

import module namespace l = "http://marklogic.com/roxy/models/logging" at "/app/models/log-lib.xqy";


declare function log:logging() as item()*
{
      let $level as xs:string := req:get("level", "info", "type=xs:string")
      let $filter as xs:string := req:get("filter", "", "type=xs:string")
      let $page as xs:string := req:get("page", "", "type=xs:string")
      return
      (
            ch:add-value("response", l:search($q, $page)),
            ch:add-value("q", $q),
            ch:add-value("page", $page)
      ),
      ch:use-view((), "xml"),
      ch:use-layout((), "xml")
};