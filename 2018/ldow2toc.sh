#!/bin/bash
saxonb-xslt -t -tree:linked -ext:on -s index.html -xsl ldow.xsl > ceur/toc.xml
