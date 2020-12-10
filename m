Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3731E2D6222
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 17:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403890AbgLJQCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 11:02:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:60440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403876AbgLJQCF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 11:02:05 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH RFC] docs: experimental: build PDF with rst2pdf
Date:   Thu, 10 Dec 2020 17:01:19 +0100
Message-Id: <a29b97f95cae490cb83da28410fade13d880f365.1607616056.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210074845.4eb67f22@lwn.net>
References: <20201210074845.4eb67f22@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an experimental PDF builder using rst2pdf

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile                     |  5 +++++
 Documentation/conf.py                      | 21 +++++++++++++++------
 Documentation/userspace-api/media/Makefile |  1 +
 Makefile                                   |  4 ++--
 4 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 61a7310b49e0..c3c8fb10f94e 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -115,6 +115,10 @@ pdfdocs: latexdocs
 
 endif # HAVE_PDFLATEX
 
+rst2pdf:
+	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,pdf,$(var),pdf,$(var)))
+
 epubdocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
@@ -140,6 +144,7 @@ dochelp:
 	@echo  '  htmldocs        - HTML'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  pdfdocs         - PDF'
+	@echo  '  rst2pdf         - PDF, using experimental rst2pdf support'
 	@echo  '  epubdocs        - EPUB'
 	@echo  '  xmldocs         - XML'
 	@echo  '  linkcheckdocs   - check for broken external links'
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 66e121df59cd..6f2788aac81e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -123,6 +123,12 @@ if (major == 1 and minor > 3) or (major > 1):
 else:
     extensions.append("sphinx.ext.pngmath")
 
+# Enable experimental rst2pdf, if available
+try:
+    extensions.append("rst2pdf.pdfbuilder")
+except:
+    sys.stderr.write('rst2pdf extension not available.\n')
+
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
 
@@ -614,12 +620,15 @@ epub_exclude_files = ['search.html']
 #
 # See the Sphinx chapter of https://ralsina.me/static/manual.pdf
 #
-# FIXME: Do not add the index file here; the result will be too big. Adding
-# multiple PDF files here actually tries to get the cross-referencing right
-# *between* PDF files.
-pdf_documents = [
-    ('kernel-documentation', u'Kernel', u'Kernel', u'J. Random Bozo'),
-]
+
+# Add all LaTeX files to PDF documents as well
+pdf_documents = []
+for l in latex_documents:
+    doc = l[0]
+    fn = l[1].replace(".tex", "")
+    name = l[2]
+    authors = l[3]
+    pdf_documents.append((doc, fn, name, authors))
 
 # kernel-doc extension configuration for running Sphinx directly (e.g. by Read
 # the Docs). In a normal build, these are supplied from the Makefile via command
diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 81a4a1a53bce..8c6b3ac4ecb0 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -59,6 +59,7 @@ all: $(IMGDOT) $(BUILDDIR) ${TARGETS}
 html: all
 epub: all
 xml: all
+pdf: all
 latex: $(IMGPDF) all
 linkcheck:
 
diff --git a/Makefile b/Makefile
index 43ecedeb3f02..db4043578eec 100644
--- a/Makefile
+++ b/Makefile
@@ -264,7 +264,7 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile
+			 outputmakefile rst2pdf
 no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
 
@@ -1654,7 +1654,7 @@ $(help-board-dirs): help-%:
 
 # Documentation targets
 # ---------------------------------------------------------------------------
-DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
+DOC_TARGETS := xmldocs latexdocs pdfdocs rst2pdf htmldocs epubdocs cleandocs \
 	       linkcheckdocs dochelp refcheckdocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
-- 
2.29.2

