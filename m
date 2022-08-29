Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76F615A40AF
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiH2Bdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiH2Bdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:33:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AEC3A49C
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:33:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B03AE153D;
        Mon, 29 Aug 2022 03:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661736831;
        bh=nrk2u91RxxnLezKoYn8RVEhkb+9XvRhclzDoSfwvjic=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b1qpIIxi+MxpqrEBp5uevcd5HW0rOWV3Nkj22GNIBVhnl0m8gwGIPO5k4cjYU2bnp
         U30jfWsx/VibO6xrt8GxonANVU61IdbcQjwTShH+vx0PEd7N82PvMJFPbGRuxFlV/6
         ERBwBcCLTKRQI/TKP9mxGF7qG6CkKV2c7LLfo9Zk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
Subject: [PATCH v6 11/13] [FIXUP] doc: Fix Doygen deprecation warnings
Date:   Mon, 29 Aug 2022 04:33:25 +0300
Message-Id: <20220829013327.5791-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220829013327.5791-1-laurent.pinchart@ideasonboard.com>
References: <20220829013327.5791-1-laurent.pinchart@ideasonboard.com>
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
 doc/Doxyfile.in | 59 -------------------------------------------------
 1 file changed, 59 deletions(-)

diff --git a/doc/Doxyfile.in b/doc/Doxyfile.in
index 83f33a23ebf4..fba16c4aaa39 100644
--- a/doc/Doxyfile.in
+++ b/doc/Doxyfile.in
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

