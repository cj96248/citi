xquery version "1.0-ml";

module namespace log = "http://marklogic.com/roxy/controller/log";

import module namespace ch = "http://marklogic.com/roxy/controller-helper" at "/roxy/lib/controller-helper.xqy";

import module namespace req = "http://marklogic.com/roxy/request" at "/roxy/lib/request.xqy";

import module namespace l = "http://marklogic.com/roxy/models/logging" at "/app/models/log-lib.xqy";


declare function log:logging() as item()*
{
      let $level as xs:string := req:get("level", "info", "type=xs:string")
      let $filter as xs:string := req:get("filter", "", "type=xs:string")
      let $filename as xs:string := req:get("filename", "ErrorLog.txt", "type=xs:string")
      return
      (
            ch:add-value("response", l:search($filename, $filter, $level)),
            ch:set-format("text"),
            ch:use-view("log/logging", "text")
      )
};