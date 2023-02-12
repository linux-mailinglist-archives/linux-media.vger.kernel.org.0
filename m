Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0370693575
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 01:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjBLAwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 19:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjBLAwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 19:52:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95447659E
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 16:51:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCBAC1B88;
        Sun, 12 Feb 2023 01:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676163107;
        bh=O5PQCYq4flqzxiV7oaK50xx4jc7prjlN7OOGe+JM0T4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LtV7kD+w9tcWU/szP0l+3lW/7mKGtcomIexnCl6tUezZPDA6z/GEMQJGDQ9FgHb3R
         g0bSBZHgj5LpjHxb5jNK0dTq7YSRsh0LpgsNLauQtzAPNKWb10NHzZeCLgWtvcbIir
         RGQXapU9DYj2UsNSPc1zfu5pP5UR/5wK9eNos/5k=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [v4l-utils] [PATCH v8 5/6] meson: Add support for doxygen documentation
Date:   Sun, 12 Feb 2023 02:51:36 +0200
Message-Id: <20230212005137.12025-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Supports generating plain HTML documentation and manual pages using
Doxygen.

Note that Doxygen configuration template was a copy from the one used by
autotools. This commit updates variables to match meson variable
substitution format, while keeping only options required for HTML and
man pages.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 README.md         |   3 ++
 doc/Doxyfile.in   | 128 +++++++++++++++++++++++-----------------------
 doc/meson.build   |  34 ++++++++++++
 meson.build       |   3 ++
 meson_options.txt |   8 +++
 5 files changed, 112 insertions(+), 64 deletions(-)
 create mode 100644 doc/meson.build

diff --git a/README.md b/README.md
index b11b7fe2ee80..e1befab71615 100644
--- a/README.md
+++ b/README.md
@@ -201,6 +201,9 @@ the package with autotools, running:
 make doxygen-run
 ```
 
+In meson, Doxygen documentation is enabled by the auto feature: `doxygen-doc`.
+If enabled, it will be built within the project.
+
 It is possible to generate documentation in html, man pages and pdf formats.
 
 The documentation is also available via web, at:
diff --git a/doc/Doxyfile.in b/doc/Doxyfile.in
index fba16c4aaa39..b7a76cb16b56 100644
--- a/doc/Doxyfile.in
+++ b/doc/Doxyfile.in
@@ -38,7 +38,7 @@ PROJECT_NAME           = libdvbv5
 # could be handy for archiving the generated documentation or if some version
 # control system is used.
 
-PROJECT_NUMBER         = $(VERSION)
+PROJECT_NUMBER         = @VERSION@
 
 # Using the PROJECT_BRIEF tag one can provide an optional one line description
 # for a project that appears at the top of each page and should give viewer a
@@ -58,7 +58,7 @@ PROJECT_LOGO           =
 # entered, it will be relative to the location where doxygen was started. If
 # left blank the current directory will be used.
 
-OUTPUT_DIRECTORY       = $(DOCDIR)
+OUTPUT_DIRECTORY       = @DOCDIR@
 
 # If the CREATE_SUBDIRS tag is set to YES, then doxygen will create 4096 sub-
 # directories (in 2 levels) under the output directory of each output format and
@@ -144,7 +144,7 @@ FULL_PATH_NAMES        = YES
 # will be relative from the directory where doxygen is started.
 # This tag requires that the tag FULL_PATH_NAMES is set to YES.
 
-STRIP_FROM_PATH        = $(SRCDIR)
+STRIP_FROM_PATH        = @SRCDIR@
 
 # The STRIP_FROM_INC_PATH tag can be used to strip a user-defined part of the
 # path mentioned in the documentation of a class, which tells the reader which
@@ -737,52 +737,52 @@ WARN_LOGFILE           =
 # spaces.
 # Note: If this tag is empty the current directory is searched.
 
-INPUT                  = $(SRCDIR)/doc/libdvbv5-index.doc \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-demux.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-dev.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-fe.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-file.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-log.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-sat.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-scan.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-v5-std.h \
-			 $(SRCDIR)/lib/include/libdvbv5/descriptors.h \
-			 $(SRCDIR)/lib/include/libdvbv5/header.h \
-			 $(SRCDIR)/lib/include/libdvbv5/atsc_header.h \
-			 $(SRCDIR)/lib/include/libdvbv5/atsc_eit.h \
-			 $(SRCDIR)/lib/include/libdvbv5/cat.h \
-			 $(SRCDIR)/lib/include/libdvbv5/eit.h \
-			 $(SRCDIR)/lib/include/libdvbv5/mgt.h \
-			 $(SRCDIR)/lib/include/libdvbv5/nit.h \
-			 $(SRCDIR)/lib/include/libdvbv5/pat.h \
-			 $(SRCDIR)/lib/include/libdvbv5/pmt.h \
-			 $(SRCDIR)/lib/include/libdvbv5/sdt.h \
-			 $(SRCDIR)/lib/include/libdvbv5/vct.h \
-			 $(SRCDIR)/lib/include/libdvbv5/crc32.h \
-			 $(SRCDIR)/lib/include/libdvbv5/countries.h \
-			 $(SRCDIR)/lib/include/libdvbv5/mpeg_es.h \
-			 $(SRCDIR)/lib/include/libdvbv5/mpeg_pes.h \
-			 $(SRCDIR)/lib/include/libdvbv5/mpeg_ts.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_atsc_service_location.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_ca.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_ca_identifier.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_cable_delivery.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_event_extended.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_event_short.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_extension.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_frequency_list.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_hierarchy.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_isdbt_delivery.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_language.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_logical_channel.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_network_name.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_partial_reception.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_registration_id.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_sat.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_service.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_t2_delivery.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_terrestrial_delivery.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_ts_info.h \
+INPUT                  = @SRCDIR@/doc/libdvbv5-index.doc \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-demux.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-dev.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-fe.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-file.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-log.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-sat.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-scan.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-v5-std.h \
+			 @SRCDIR@/lib/include/libdvbv5/descriptors.h \
+			 @SRCDIR@/lib/include/libdvbv5/header.h \
+			 @SRCDIR@/lib/include/libdvbv5/atsc_header.h \
+			 @SRCDIR@/lib/include/libdvbv5/atsc_eit.h \
+			 @SRCDIR@/lib/include/libdvbv5/cat.h \
+			 @SRCDIR@/lib/include/libdvbv5/eit.h \
+			 @SRCDIR@/lib/include/libdvbv5/mgt.h \
+			 @SRCDIR@/lib/include/libdvbv5/nit.h \
+			 @SRCDIR@/lib/include/libdvbv5/pat.h \
+			 @SRCDIR@/lib/include/libdvbv5/pmt.h \
+			 @SRCDIR@/lib/include/libdvbv5/sdt.h \
+			 @SRCDIR@/lib/include/libdvbv5/vct.h \
+			 @SRCDIR@/lib/include/libdvbv5/crc32.h \
+			 @SRCDIR@/lib/include/libdvbv5/countries.h \
+			 @SRCDIR@/lib/include/libdvbv5/mpeg_es.h \
+			 @SRCDIR@/lib/include/libdvbv5/mpeg_pes.h \
+			 @SRCDIR@/lib/include/libdvbv5/mpeg_ts.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_atsc_service_location.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_ca.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_ca_identifier.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_cable_delivery.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_event_extended.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_event_short.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_extension.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_frequency_list.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_hierarchy.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_isdbt_delivery.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_language.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_logical_channel.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_network_name.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_partial_reception.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_registration_id.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_sat.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_service.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_t2_delivery.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_terrestrial_delivery.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_ts_info.h \
 
 # This tag can be used to specify the character encoding of the source files
 # that doxygen parses. Internally doxygen uses the UTF-8 encoding. Doxygen uses
@@ -850,7 +850,7 @@ EXCLUDE_SYMBOLS        =
 # that contain example code fragments that are included (see the \include
 # command).
 
-EXAMPLE_PATH           = $(SRCDIR)/utils/dvb/
+EXAMPLE_PATH           = @SRCDIR@/utils/dvb/
 
 # If the value of the EXAMPLE_PATH tag contains directories, you can use the
 # EXAMPLE_PATTERNS tag to specify one or more wildcard pattern (like *.cpp and
@@ -1032,7 +1032,7 @@ IGNORE_PREFIX          =
 # If the GENERATE_HTML tag is set to YES doxygen will generate HTML output
 # The default value is: YES.
 
-GENERATE_HTML          = $(GENERATE_HTML)
+GENERATE_HTML          = @GENERATE_HTML@
 
 # The HTML_OUTPUT tag is used to specify where the HTML docs will be put. If a
 # relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
@@ -1231,14 +1231,14 @@ DOCSET_PUBLISHER_NAME  = Publisher
 # The default value is: NO.
 # This tag requires that the tag GENERATE_HTML is set to YES.
 
-GENERATE_HTMLHELP      = $(GENERATE_HTMLHELP)
+GENERATE_HTMLHELP      = NO
 
 # The CHM_FILE tag can be used to specify the file name of the resulting .chm
 # file. You can add a path in front of the file if the result should not be
 # written to the html output directory.
 # This tag requires that the tag GENERATE_HTMLHELP is set to YES.
 
-CHM_FILE               = ../$(PROJECT).chm
+CHM_FILE               =
 
 # The HHC_LOCATION tag can be used to specify the location (absolute path
 # including file name) of the HTML help compiler ( hhc.exe). If non-empty
@@ -1246,14 +1246,14 @@ CHM_FILE               = ../$(PROJECT).chm
 # The file has to be specified with full path.
 # This tag requires that the tag GENERATE_HTMLHELP is set to YES.
 
-HHC_LOCATION           = $(HHC_PATH)
+HHC_LOCATION           =
 
 # The GENERATE_CHI flag controls if a separate .chi index file is generated (
 # YES) or that it should be included in the master .chm file ( NO).
 # The default value is: NO.
 # This tag requires that the tag GENERATE_HTMLHELP is set to YES.
 
-GENERATE_CHI           = $(GENERATE_CHI)
+GENERATE_CHI           = NO
 
 # The CHM_INDEX_ENCODING is used to encode HtmlHelp index ( hhk), content ( hhc)
 # and project file content.
@@ -1572,7 +1572,7 @@ EXTRA_SEARCH_MAPPINGS  =
 # If the GENERATE_LATEX tag is set to YES doxygen will generate LaTeX output.
 # The default value is: YES.
 
-GENERATE_LATEX         = $(GENERATE_LATEX)
+GENERATE_LATEX         = NO
 
 # The LATEX_OUTPUT tag is used to specify where the LaTeX docs will be put. If a
 # relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
@@ -1615,7 +1615,7 @@ COMPACT_LATEX          = YES
 # The default value is: a4.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
-PAPER_TYPE             = $(PAPER_SIZE)
+PAPER_TYPE             = a4
 
 # The EXTRA_PACKAGES tag can be used to specify one or more LaTeX package names
 # that should be included in the LaTeX output. To get the times font for
@@ -1674,7 +1674,7 @@ PDF_HYPERLINKS         = YES
 # The default value is: YES.
 # This tag requires that the tag GENERATE_LATEX is set to YES.
 
-USE_PDFLATEX           = $(GENERATE_PDF)
+USE_PDFLATEX           = YES
 
 # If the LATEX_BATCHMODE tag is set to YES, doxygen will add the \batchmode
 # command to the generated LaTeX files. This will instruct LaTeX to keep running
@@ -1709,7 +1709,7 @@ LATEX_BIB_STYLE        = plain
 # readers/editors.
 # The default value is: NO.
 
-GENERATE_RTF           = $(GENERATE_RTF)
+GENERATE_RTF           = NO
 
 # The RTF_OUTPUT tag is used to specify where the RTF docs will be put. If a
 # relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
@@ -1764,7 +1764,7 @@ RTF_EXTENSIONS_FILE    =
 # classes and files.
 # The default value is: NO.
 
-GENERATE_MAN           = $(GENERATE_MAN)
+GENERATE_MAN           = @GENERATE_MAN@
 
 # The MAN_OUTPUT tag is used to specify where the man pages will be put. If a
 # relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
@@ -1801,7 +1801,7 @@ MAN_LINKS              = NO
 # captures the structure of the code including all documentation.
 # The default value is: NO.
 
-GENERATE_XML           = $(GENERATE_XML)
+GENERATE_XML           = NO
 
 # The XML_OUTPUT tag is used to specify where the XML pages will be put. If a
 # relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
@@ -1993,7 +1993,7 @@ TAGFILES               =
 # tag file that is based on the input files it reads. See section "Linking to
 # external documentation" for more information about the usage of tag files.
 
-GENERATE_TAGFILE       = $(DOCDIR)/$(PROJECT).tag
+GENERATE_TAGFILE       = @DOCDIR@/@PROJECT@.tag
 
 # If the ALLEXTERNALS tag is set to YES all external class will be listed in the
 # class index. If set to NO only the inherited external classes will be listed.
@@ -2039,7 +2039,7 @@ HIDE_UNDOC_RELATIONS   = YES
 # set to NO
 # The default value is: NO.
 
-HAVE_DOT               = $(HAVE_DOT)
+HAVE_DOT               = NO
 
 # The DOT_NUM_THREADS specifies the number of dot invocations doxygen is allowed
 # to run in parallel. When set to 0 doxygen will base this on the number of
@@ -2211,7 +2211,7 @@ INTERACTIVE_SVG        = NO
 # found. If left blank, it is assumed the dot tool can be found in the path.
 # This tag requires that the tag HAVE_DOT is set to YES.
 
-DOT_PATH               = $(DOT_PATH)
+DOT_PATH               =
 
 # The DOTFILE_DIRS tag can be used to specify one or more directories that
 # contain dot files that are included in the documentation (see the \dotfile
diff --git a/doc/meson.build b/doc/meson.build
new file mode 100644
index 000000000000..fef3e83fa432
--- /dev/null
+++ b/doc/meson.build
@@ -0,0 +1,34 @@
+doxygen_doc_option = get_option('doxygen-doc')
+if doxygen_doc_option.disabled() or not prog_doxygen.found()
+    subdir_done()
+endif
+
+cdata = configuration_data()
+cdata.set('DOCDIR', 'doc')
+cdata.set('GENERATE_HTML', get_option('doxygen-html'))
+cdata.set('GENERATE_MAN', get_option('doxygen-man'))
+cdata.set('PROJECT', meson.project_name())
+cdata.set('SRCDIR', meson.project_source_root())
+cdata.set('VERSION', as_version)
+
+doxyfile = configure_file(input : 'Doxyfile.in',
+                          output : 'Doxyfile',
+                          configuration : cdata)
+
+doxygen_install_dir = join_paths(get_option('datadir'), 'doc',
+                                 '@0@'.format(meson.project_name()))
+
+doxygen_output = []
+if get_option('doxygen-html')
+    doxygen_output += 'html'
+endif
+if get_option('doxygen-man')
+    doxygen_output += 'man'
+endif
+
+custom_target('doxygen',
+              input : doxyfile,
+              output : doxygen_output,
+              command : [prog_doxygen, doxyfile],
+              install : true,
+              install_dir : doxygen_install_dir)
diff --git a/meson.build b/meson.build
index dec5ff7de470..8c93390818f2 100644
--- a/meson.build
+++ b/meson.build
@@ -58,6 +58,7 @@ v4l2_utils_incdir = include_directories(v4l2_utils_incdir_arr)
 
 prog_bash = find_program('bash')
 prog_clang = find_program('clang', required : get_option('bpf'))
+prog_doxygen = find_program('doxygen', required : get_option('doxygen-doc'))
 prog_git = find_program('git')
 prog_grep = find_program('grep')
 prog_perl = find_program('perl')
@@ -337,6 +338,8 @@ if get_option('v4l-utils')
     subdir('contrib')
 endif
 
+subdir('doc')
+
 configure_file(output : 'config.h', configuration : conf)
 
 foreach m : man_pages
diff --git a/meson_options.txt b/meson_options.txt
index 6fc57bdee168..2fa046c0dfea 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -44,3 +44,11 @@ option('systemdsystemunitdir', type : 'string',
        description : 'Set systemd system unit directory')
 option('udevdir', type : 'string',
        description : 'Set udev directory')
+
+# Doxygen options
+option('doxygen-doc', type : 'feature', value : 'auto',
+       description : 'Generate doxygen project documentation')
+option('doxygen-html', type : 'boolean',
+       description : 'Generate doxygen plain HTML documentation')
+option('doxygen-man', type : 'boolean', value : false,
+       description : 'Generate doxygen manual pages')
-- 
Regards,

Laurent Pinchart

