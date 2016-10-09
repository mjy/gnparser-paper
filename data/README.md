Tests Data Respository
===========================

This directory contains information about data used to gather performance statistics for Global Names' ``biodiversity`` parser, Global Names' ``gnparser``, GBIF ``name-parser`` and iMarine's ``YASMEEN`` parser.

Files
-----

`1000.txt`
: 1000 name-strings randomly taken from Global Names Index dataset. These name-strings were used to calculate Accuracy, Precision and Recall of tested parsers.

`100k.txt`
: 100,000 name-strings randomly taken from Global Names Index dataset. These names had been used to calculate precision of detecting non name-strings.

Precision/Recall Calculation
----------------------------

For GN, GBIF and Biodiversity parsers we generated file with 1000 names and parsed that file with each of them. Then we converted parsed results to files with 3 main components -- original name, canonical form, and terminal authorship. Then we manually inspected all of them and assigned annotations that, in our opinion, would correspond to a nature of a problem.

```
BAD:VRN -- changed vernacular name
BAD:AU  -- terminal authorship dissapeared or lost information
BAD:CAN -- canonical form is not correct
BAD:ALL -- both canonical and authorship are not correct
WARN    -- cases with dupious cases, or personal preferences of programmers
```
Then we converted annotations to fields

```
tp -- true positive: canonical form and terminal authorship are good
tn -- true negative: name is not parsed at all
fp -- false positive: canonical form and/or terminal authorship are generat wrongly
fn -- false negative: Something that should be parsed went was marked as wrong
```

Analysis of unparsed Files
--------------------------

We parsed 100 000 names and then selected only unparsed names from the mix for all 3 parsers. The raw resuts are in

* unparsed-gbif.txt
* unparsed-gnparser.txt
* unparsed-biodiversity.txt

Differences between parsed and unparsed results are in

``unparsed_comparisons.txt``

