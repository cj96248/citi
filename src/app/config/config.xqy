xquery version "1.0-ml";

module namespace c = "http://marklogic.com/roxy/config";

import module namespace def = "http://marklogic.com/roxy/defaults" at "/roxy/config/defaults.xqy";

declare namespace rest = "http://marklogic.com/appservices/rest";

declare variable $c:ROXY-OPTIONS :=
  <options>
    <layouts>
      <layout format="html">three-column</layout>
    </layouts>
  </options>;

declare variable $c:ROXY-ROUTES :=
  <routes xmlns="http://marklogic.com/appservices/rest">
    <request uri="/log4ml/(\w*)/?(\w*)$" endpoint="/roxy/query-router.xqy">
        <uri-param name="controller">log</uri-param>
        <url-param name="func">$1</url-param>
        <http method="GET"></http>
    </request>
    {
      $def:ROXY-ROUTES/rest:request
    }
  </routes>;

declare variable $c:CTRL-EXT := ("@ml.controller-ext", $def:CTRL-EXT)[fn:not(. eq "@ml.controller-ext")][1];

declare variable $c:DEFAULT-PAGE-LENGTH as xs:int := 5;

declare variable $c:SEARCH-OPTIONS :=
  <options xmlns="http://marklogic.com/appservices/search">
    <search-option>unfiltered</search-option>
    <term>
      <term-option>case-insensitive</term-option>
    </term>
    <constraint name="facet1">
      <collection>
        <facet-option>limit=10</facet-option>
      </collection>
    </constraint>

    <return-results>true</return-results>
    <return-query>true</return-query>
  </options>;

(:
 : Labels are used by appbuilder faceting code to provide internationalization
 :)
declare variable $c:LABELS :=
  <labels xmlns="http://marklogic.com/xqutils/labels">
    <label key="facet1">
      <value xml:lang="en">Sample Facet</value>
    </label>
  </labels>;