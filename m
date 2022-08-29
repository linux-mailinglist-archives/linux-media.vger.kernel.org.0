Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA185A409C
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiH2BX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiH2BXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:23:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F4827CF3
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:23:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B63F481;
        Mon, 29 Aug 2022 03:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736232;
        bh=s3pNxeF87Xm2Znr6PWAcG+anLeGK7+uKfMSNVoYxWh4=;
        h=From:To:Cc:Subject:Date:From;
        b=Qoew/0YYqeh2rJUgqqg3Ht7NR2ixw7Tfq/ysLPVu2P7D9FPClN5+WFHYtNMzvfUcI
         kILqlHKIujU3uW1Bc12ELy6gJT/aPD1+/ePdCRrLWIqS9To3en549OzM0V6lvDGMzK
         6yCK9KDvyMq0ILd4grFDxFU6kBJT9DJ7rExM0zBY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] libdvbv5: Fix Doygen deprecation warnings
Date:   Mon, 29 Aug 2022 04:23:44 +0300
Message-Id: <20220829012344.5483-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A number of Doxygen options have become obsolete, and Doxygen complains
about this when building the documentation:

warning: Tag 'TCL_SUBST' at line 229 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'COLS_IN_ALPHA_INDEX' at line 1031 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'LATEX_SOURCE_CODE' at line 1716 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'XML_SCHEMA' at line 1841 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'XML_DTD' at line 1847 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'PERL_PATH' at line 2057 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'CLASS_DIAGRAMS' at line 2070 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"
warning: Tag 'MSCGEN_PATH' at line 2079 of file 'doc/Doxyfile' has become obsolete.
         To avoid this warning please remove this line from your configuration file or upgrade it using "doxygen -u"

We don't use those options, so drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 doxygen_libdvbv5.cfg | 59 --------------------------------------------
 1 file changed, 59 deletions(-)

diff --git a/doxygen_libdvbv5.cfg b/doxygen_libdvbv5.cfg
index 83f33a23ebf4..fba16c4aaa39 100644
--- a/doxygen_libdvbv5.cfg
+++ b/doxygen_libdvbv5.cfg
@@ -222,12 +222,6 @@ TAB_SIZE               = 8
 
 ALIASES                =
 
-# This tag can be used to specify a number of word-keyword mappings (TCL only).
-# A mapping has the form "name=value". For example adding "class=itcl::class"
-# will allow you to use the command class in the itcl::class meaning.
-
-TCL_SUBST              =
-
 # Set the OPTIMIZE_OUTPUT_FOR_C tag to YES if your project consists of C sources
 # only. Doxygen will then generate output that is more tailored for C. For
 # instance, some of the names that are used will be different. The list of all
@@ -1023,13 +1017,6 @@ VERBATIM_HEADERS       = YES
 
 ALPHABETICAL_INDEX     = YES
 
-# The COLS_IN_ALPHA_INDEX tag can be used to specify the number of columns in
-# which the alphabetical index list will be split.
-# Minimum value: 1, maximum value: 20, default value: 5.
-# This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
-
-COLS_IN_ALPHA_INDEX    = 5
-
 # In case all classes in a project start with a common prefix, all classes will
 # be put under the same header in the alphabetical index. The IGNORE_PREFIX tag
 # can be used to specify a prefix (or a list of prefixes) that should be ignored
@@ -1705,16 +1692,6 @@ LATEX_BATCHMODE        = YES
 
 LATEX_HIDE_INDICES     = NO
 
-# If the LATEX_SOURCE_CODE tag is set to YES then doxygen will include source
-# code with syntax highlighting in the LaTeX output.
-#
-# Note that which sources are shown also depends on other settings such as
-# SOURCE_BROWSER.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_SOURCE_CODE      = NO
-
 # The LATEX_BIB_STYLE tag can be used to specify the style to use for the
 # bibliography, e.g. plainnat, or ieeetr. See
 # http://en.wikipedia.org/wiki/BibTeX and \cite for more info.
@@ -1834,18 +1811,6 @@ GENERATE_XML           = $(GENERATE_XML)
 
 XML_OUTPUT             = xml
 
-# The XML_SCHEMA tag can be used to specify a XML schema, which can be used by a
-# validating XML parser to check the syntax of the XML files.
-# This tag requires that the tag GENERATE_XML is set to YES.
-
-XML_SCHEMA             =
-
-# The XML_DTD tag can be used to specify a XML DTD, which can be used by a
-# validating XML parser to check the syntax of the XML files.
-# This tag requires that the tag GENERATE_XML is set to YES.
-
-XML_DTD                =
-
 # If the XML_PROGRAMLISTING tag is set to YES doxygen will dump the program
 # listings (including syntax highlighting and cross-referencing information) to
 # the XML output. Note that enabling this will significantly increase the size
@@ -2050,34 +2015,10 @@ EXTERNAL_GROUPS        = YES
 
 EXTERNAL_PAGES         = YES
 
-# The PERL_PATH should be the absolute path and name of the perl script
-# interpreter (i.e. the result of 'which perl').
-# The default file (with absolute path) is: /usr/bin/perl.
-
-PERL_PATH              = /usr/bin/false
-
 #---------------------------------------------------------------------------
 # Configuration options related to the dot tool
 #---------------------------------------------------------------------------
 
-# If the CLASS_DIAGRAMS tag is set to YES doxygen will generate a class diagram
-# (in HTML and LaTeX) for classes with base or super classes. Setting the tag to
-# NO turns the diagrams off. Note that this option also works with HAVE_DOT
-# disabled, but it is recommended to install and use dot, since it yields more
-# powerful graphs.
-# The default value is: YES.
-
-CLASS_DIAGRAMS         = YES
-
-# You can define message sequence charts within doxygen comments using the \msc
-# command. Doxygen will then run the mscgen tool (see:
-# http://www.mcternan.me.uk/mscgen/)) to produce the chart and insert it in the
-# documentation. The MSCGEN_PATH tag allows you to specify the directory where
-# the mscgen tool resides. If left empty the tool is assumed to be found in the
-# default search path.
-
-MSCGEN_PATH            =
-
 # You can include diagrams made with dia in doxygen documentation. Doxygen will
 # then run dia to produce the diagram and insert it in the documentation. The
 # DIA_PATH tag allows you to specify the directory where the dia binary resides.
-- 
Regards,

Laurent Pinchart

