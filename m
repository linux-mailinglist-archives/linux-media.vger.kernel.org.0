Return-Path: <linux-media+bounces-40776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA3B31B82
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 591863BCEBD
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25B3313522;
	Fri, 22 Aug 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AltfQXcs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E433126D0;
	Fri, 22 Aug 2025 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872389; cv=none; b=Wv4g0PdZC8QnYF9s5BUyy556FdFjLjTpoqPbKtrfAXLHQ0xB+ZO1U4cqsQC1zQ/uUPAqLEQ0MEcPRpBJyL6JnVJktYB2kdVgI5K5OwiI0pegJzEpBilDV258FBVzEXbBaP4h1tJzylvi1JaJs1ff/0W6Vk9Wh3Q2egW/nD5Fqcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872389; c=relaxed/simple;
	bh=bIP/wRP3b422VCDjvrgxR9/Zg0ckPnkkNpui1ZjXpUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGAFGhNz1KwvxbYzZovZkrtv75lBxIoBZA/1cv9EOlNWx8MX9UPkzCDP1iSZ0ml8T5URCiSaHAGPWUsLmGupRXh2KaL+jl/m9KGDvieh6ojcsKLL/F1/YkwXiaSp26JAfEey7pNio+4PZYb/PTKoXRzC8rrZg4OTgh4AAz8v8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AltfQXcs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AB1C2BD01;
	Fri, 22 Aug 2025 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872388;
	bh=bIP/wRP3b422VCDjvrgxR9/Zg0ckPnkkNpui1ZjXpUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AltfQXcsWcqXeCL5zo+KzuqiIWeX1U+NQjsEqTgzJXkLe+dx+7GJznuVEH+IVGUnW
	 W649ffBV7iJZe2d7pfYmOqrBZH4DSFsjk8t645yNDtfW1Z2EoH7/A1ZVy5Qb6xSWzg
	 EbLl/DQNne0x7Xtya3hxLDVinkSFPgDsN3mDr2hCPgjGSzMpeM/a1QgnlmpdcuaPia
	 uHP3IUgWYrbybESt4/vud9zEPeVDV3Rao67o8s6E1qWtpfTRlhgQGASr5IzR+1CSEW
	 H+brM+rOGAwOdkUAFxmIhEvCOdU/ce3RRKmxUTGVSLYK7TFZ2HZ/EGtBzCsMj1mdS5
	 lh4tWumW4qPuw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1upScM-0000000CCsO-3068;
	Fri, 22 Aug 2025 16:19:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <mchehab+huawei@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Benno Lossin <mchehab+huawei@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <mchehab+huawei@kernel.org>,
	Erling Ljunggren <hljunggr@cisco.com>,
	Gary Guo <gary@garyguo.net>,
	Hans Verkuil <mchehab+huawei@kernel.org>,
	Hans de Goede <mchehab+huawei@kernel.org>,
	Miguel Ojeda <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sean Young <sean@mess.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yunke Cao <yunkec@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 23/24] scripts: sphinx-build-wrapper: get rid of uapi/media Makefile
Date: Fri, 22 Aug 2025 16:19:35 +0200
Message-ID: <5dbb257a4b283697271c9c7b8f4713857e8191c8.1755872208.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755872208.git.mchehab+huawei@kernel.org>
References: <cover.1755872208.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that kernel-include directive supports parsing data
structs directly, we can finally get rid of the horrible hack
we added to support parsing media uAPI symbols.

As a side effect, Documentation/output doesn't have anymore
media auto-generated .rst files on it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile                        |   3 +-
 Documentation/userspace-api/media/Makefile    |  64 --
 .../userspace-api/media/cec/cec-header.rst    |   5 +-
 .../media/{ => cec}/cec.h.rst.exceptions      |   0
 .../media/{ => dvb}/ca.h.rst.exceptions       |   0
 .../media/{ => dvb}/dmx.h.rst.exceptions      |   0
 .../media/{ => dvb}/frontend.h.rst.exceptions |   0
 .../userspace-api/media/dvb/headers.rst       |  17 +-
 .../media/{ => dvb}/net.h.rst.exceptions      |   0
 .../media/mediactl/media-header.rst           |   5 +-
 .../{ => mediactl}/media.h.rst.exceptions     |   0
 .../userspace-api/media/rc/lirc-header.rst    |   4 +-
 .../media/{ => rc}/lirc.h.rst.exceptions      |   0
 .../userspace-api/media/v4l/videodev.rst      |   4 +-
 .../{ => v4l}/videodev2.h.rst.exceptions      |   0
 scripts/sphinx-build-wrapper                  | 719 ++++++++++++++++++
 16 files changed, 745 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/Makefile
 rename Documentation/userspace-api/media/{ => cec}/cec.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/ca.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/dmx.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/frontend.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/net.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => mediactl}/media.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => rc}/lirc.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => v4l}/videodev2.h.rst.exceptions (100%)
 create mode 100755 scripts/sphinx-build-wrapper

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 2ed334971acd..5c20c68be89a 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -87,7 +87,7 @@ loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
 PYTHONPYCACHEPREFIX ?= $(abspath $(BUILDDIR)/__pycache__)
 
 quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
-      cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
+      cmd_sphinx = \
 	PYTHONPYCACHEPREFIX="$(PYTHONPYCACHEPREFIX)" \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(src)/$5/$(SPHINX_CONF)) \
 	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
@@ -171,7 +171,6 @@ refcheckdocs:
 
 cleandocs:
 	$(Q)rm -rf $(BUILDDIR)
-	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media clean
 
 dochelp:
 	@echo  ' Linux kernel internal documentation in different formats from ReST:'
diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
deleted file mode 100644
index accc734d045a..000000000000
--- a/Documentation/userspace-api/media/Makefile
+++ /dev/null
@@ -1,64 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-# Rules to convert a .h file to inline RST documentation
-
-SRC_DIR=$(srctree)/Documentation/userspace-api/media
-PARSER = $(srctree)/tools/docs/parse-headers.py
-UAPI = $(srctree)/include/uapi/linux
-KAPI = $(srctree)/include/linux
-
-FILES = ca.h.rst dmx.h.rst frontend.h.rst net.h.rst \
-	videodev2.h.rst media.h.rst cec.h.rst lirc.h.rst
-
-TARGETS := $(addprefix $(BUILDDIR)/, $(FILES))
-
-gen_rst = \
-	echo ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
-	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
-
-quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree)/%,%,$<)'; \
-	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
-
-silent_gen_rst = ${gen_rst}
-
-$(BUILDDIR)/ca.h.rst: ${UAPI}/dvb/ca.h ${PARSER} $(SRC_DIR)/ca.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
-$(BUILDDIR)/dmx.h.rst: ${UAPI}/dvb/dmx.h ${PARSER} $(SRC_DIR)/dmx.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
-$(BUILDDIR)/frontend.h.rst: ${UAPI}/dvb/frontend.h ${PARSER} $(SRC_DIR)/frontend.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
-$(BUILDDIR)/net.h.rst: ${UAPI}/dvb/net.h ${PARSER} $(SRC_DIR)/net.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
-$(BUILDDIR)/videodev2.h.rst: ${UAPI}/videodev2.h ${PARSER} $(SRC_DIR)/videodev2.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
-$(BUILDDIR)/media.h.rst: ${UAPI}/media.h ${PARSER} $(SRC_DIR)/media.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
-$(BUILDDIR)/cec.h.rst: ${UAPI}/cec.h ${PARSER} $(SRC_DIR)/cec.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
-$(BUILDDIR)/lirc.h.rst: ${UAPI}/lirc.h ${PARSER} $(SRC_DIR)/lirc.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
-# Media build rules
-
-.PHONY: all html texinfo epub xml latex
-
-all: $(IMGDOT) $(BUILDDIR) ${TARGETS}
-html: all
-texinfo: all
-epub: all
-xml: all
-latex: $(IMGPDF) all
-linkcheck:
-
-clean:
-	-rm -f $(DOTTGT) $(IMGTGT) ${TARGETS} 2>/dev/null
-
-$(BUILDDIR):
-	$(Q)mkdir -p $@
diff --git a/Documentation/userspace-api/media/cec/cec-header.rst b/Documentation/userspace-api/media/cec/cec-header.rst
index d70736ac2b1d..f67003bb8740 100644
--- a/Documentation/userspace-api/media/cec/cec-header.rst
+++ b/Documentation/userspace-api/media/cec/cec-header.rst
@@ -6,5 +6,6 @@
 CEC Header File
 ***************
 
-.. kernel-include:: $BUILDDIR/cec.h.rst
-
+.. kernel-include:: include/uapi/linux/cec.h
+    :generate-cross-refs:
+    :exception-file: cec.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/cec.h.rst.exceptions b/Documentation/userspace-api/media/cec/cec.h.rst.exceptions
similarity index 100%
rename from Documentation/userspace-api/media/cec.h.rst.exceptions
rename to Documentation/userspace-api/media/cec/cec.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/ca.h.rst.exceptions b/Documentation/userspace-api/media/dvb/ca.h.rst.exceptions
similarity index 100%
rename from Documentation/userspace-api/media/ca.h.rst.exceptions
rename to Documentation/userspace-api/media/dvb/ca.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/dmx.h.rst.exceptions b/Documentation/userspace-api/media/dvb/dmx.h.rst.exceptions
similarity index 100%
rename from Documentation/userspace-api/media/dmx.h.rst.exceptions
rename to Documentation/userspace-api/media/dvb/dmx.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/frontend.h.rst.exceptions b/Documentation/userspace-api/media/dvb/frontend.h.rst.exceptions
similarity index 100%
rename from Documentation/userspace-api/media/frontend.h.rst.exceptions
rename to Documentation/userspace-api/media/dvb/frontend.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/dvb/headers.rst b/Documentation/userspace-api/media/dvb/headers.rst
index 88c3eb33a89e..c75f64cf21d5 100644
--- a/Documentation/userspace-api/media/dvb/headers.rst
+++ b/Documentation/userspace-api/media/dvb/headers.rst
@@ -7,10 +7,19 @@ Digital TV uAPI header files
 Digital TV uAPI headers
 ***********************
 
-.. kernel-include:: $BUILDDIR/frontend.h.rst
+.. kernel-include:: include/uapi/linux/dvb/frontend.h
+    :generate-cross-refs:
+    :exception-file: frontend.h.rst.exceptions
 
-.. kernel-include:: $BUILDDIR/dmx.h.rst
+.. kernel-include:: include/uapi/linux/dvb/dmx.h
+    :generate-cross-refs:
+    :exception-file: dmx.h.rst.exceptions
 
-.. kernel-include:: $BUILDDIR/ca.h.rst
+.. kernel-include:: include/uapi/linux/dvb/ca.h
+    :generate-cross-refs:
+    :exception-file: ca.h.rst.exceptions
+
+.. kernel-include:: include/uapi/linux/dvb/net.h
+    :generate-cross-refs:
+    :exception-file: net.h.rst.exceptions
 
-.. kernel-include:: $BUILDDIR/net.h.rst
diff --git a/Documentation/userspace-api/media/net.h.rst.exceptions b/Documentation/userspace-api/media/dvb/net.h.rst.exceptions
similarity index 100%
rename from Documentation/userspace-api/media/net.h.rst.exceptions
rename to Documentation/userspace-api/media/dvb/net.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/mediactl/media-header.rst b/Documentation/userspace-api/media/mediactl/media-header.rst
index c674271c93f5..d561d2845f3d 100644
--- a/Documentation/userspace-api/media/mediactl/media-header.rst
+++ b/Documentation/userspace-api/media/mediactl/media-header.rst
@@ -6,5 +6,6 @@
 Media Controller Header File
 ****************************
 
-.. kernel-include:: $BUILDDIR/media.h.rst
-
+.. kernel-include:: include/uapi/linux/media.h
+    :generate-cross-refs:
+    :exception-file: media.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/media.h.rst.exceptions b/Documentation/userspace-api/media/mediactl/media.h.rst.exceptions
similarity index 100%
rename from Documentation/userspace-api/media/media.h.rst.exceptions
rename to Documentation/userspace-api/media/mediactl/media.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/rc/lirc-header.rst b/Documentation/userspace-api/media/rc/lirc-header.rst
index 54cb40b8a065..a53328327847 100644
--- a/Documentation/userspace-api/media/rc/lirc-header.rst
+++ b/Documentation/userspace-api/media/rc/lirc-header.rst
@@ -6,5 +6,7 @@
 LIRC Header File
 ****************
 
-.. kernel-include:: $BUILDDIR/lirc.h.rst
+.. kernel-include:: include/uapi/linux/lirc.h
+    :generate-cross-refs:
+    :exception-file: lirc.h.rst.exceptions
 
diff --git a/Documentation/userspace-api/media/lirc.h.rst.exceptions b/Documentation/userspace-api/media/rc/lirc.h.rst.exceptions
similarity index 100%
rename from Documentation/userspace-api/media/lirc.h.rst.exceptions
rename to Documentation/userspace-api/media/rc/lirc.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/v4l/videodev.rst b/Documentation/userspace-api/media/v4l/videodev.rst
index c866fec417eb..cde485bc9a5f 100644
--- a/Documentation/userspace-api/media/v4l/videodev.rst
+++ b/Documentation/userspace-api/media/v4l/videodev.rst
@@ -6,4 +6,6 @@
 Video For Linux Two Header File
 *******************************
 
-.. kernel-include:: $BUILDDIR/videodev2.h.rst
+.. kernel-include:: include/uapi/linux/videodev2.h
+    :generate-cross-refs:
+    :exception-file: videodev2.h.rst.exceptions
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
similarity index 100%
rename from Documentation/userspace-api/media/videodev2.h.rst.exceptions
rename to Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
diff --git a/scripts/sphinx-build-wrapper b/scripts/sphinx-build-wrapper
new file mode 100755
index 000000000000..abe8c26ae137
--- /dev/null
+++ b/scripts/sphinx-build-wrapper
@@ -0,0 +1,719 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2025 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+#
+# pylint: disable=R0902, R0912, R0913, R0914, R0915, R0917, C0103
+#
+# Converted from docs Makefile and parallel-wrapper.sh, both under
+# GPLv2, copyrighted since 2008 by the following authors:
+#
+#    Akira Yokosawa <akiyks@gmail.com>
+#    Arnd Bergmann <arnd@arndb.de>
+#    Breno Leitao <leitao@debian.org>
+#    Carlos Bilbao <carlos.bilbao@amd.com>
+#    Dave Young <dyoung@redhat.com>
+#    Donald Hunter <donald.hunter@gmail.com>
+#    Geert Uytterhoeven <geert+renesas@glider.be>
+#    Jani Nikula <jani.nikula@intel.com>
+#    Jan Stancek <jstancek@redhat.com>
+#    Jonathan Corbet <corbet@lwn.net>
+#    Joshua Clayton <stillcompiling@gmail.com>
+#    Kees Cook <keescook@chromium.org>
+#    Linus Torvalds <torvalds@linux-foundation.org>
+#    Magnus Damm <damm+renesas@opensource.se>
+#    Masahiro Yamada <masahiroy@kernel.org>
+#    Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+#    Maxim Cournoyer <maxim.cournoyer@gmail.com>
+#    Peter Foley <pefoley2@pefoley.com>
+#    Randy Dunlap <rdunlap@infradead.org>
+#    Rob Herring <robh@kernel.org>
+#    Shuah Khan <shuahkh@osg.samsung.com>
+#    Thorsten Blum <thorsten.blum@toblux.com>
+#    Tomas Winkler <tomas.winkler@intel.com>
+
+
+"""
+Sphinx build wrapper that handles Kernel-specific business rules:
+
+- it gets the Kernel build environment vars;
+- it determines what's the best parallelism;
+- it handles SPHINXDIRS
+
+This tool ensures that MIN_PYTHON_VERSION is satisfied. If version is
+below that, it seeks for a new Python version. If found, it re-runs using
+the newer version.
+"""
+
+import argparse
+import locale
+import os
+import re
+import shlex
+import shutil
+import subprocess
+import sys
+
+from concurrent import futures
+from glob import glob
+
+LIB_DIR = "lib"
+SRC_DIR = os.path.dirname(os.path.realpath(__file__))
+
+sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
+
+from jobserver import JobserverExec                  # pylint: disable=C0413
+
+
+def parse_version(version):
+    """Convert a major.minor.patch version into a tuple"""
+    return tuple(int(x) for x in version.split("."))
+
+def ver_str(version):
+    """Returns a version tuple as major.minor.patch"""
+
+    return ".".join([str(x) for x in version])
+
+# Minimal supported Python version needed by Sphinx and its extensions
+MIN_PYTHON_VERSION = parse_version("3.7")
+
+# Default value for --venv parameter
+VENV_DEFAULT = "sphinx_latest"
+
+# List of make targets and its corresponding builder and output directory
+TARGETS = {
+    "cleandocs": {
+        "builder": "clean",
+    },
+    "htmldocs": {
+        "builder": "html",
+    },
+    "epubdocs": {
+        "builder": "epub",
+        "out_dir": "epub",
+    },
+    "texinfodocs": {
+        "builder": "texinfo",
+        "out_dir": "texinfo",
+    },
+    "infodocs": {
+        "builder": "texinfo",
+        "out_dir": "texinfo",
+    },
+    "latexdocs": {
+        "builder": "latex",
+        "out_dir": "latex",
+    },
+    "pdfdocs": {
+        "builder": "latex",
+        "out_dir": "latex",
+    },
+    "xmldocs": {
+        "builder": "xml",
+        "out_dir": "xml",
+    },
+    "linkcheckdocs": {
+        "builder": "linkcheck"
+    },
+}
+
+# Paper sizes. An empty value will pick the default
+PAPER = ["", "a4", "letter"]
+
+class SphinxBuilder:
+    """
+    Handles a sphinx-build target, adding needed arguments to build
+    with the Kernel.
+    """
+
+    def is_rust_enabled(self):
+        """Check if rust is enabled at .config"""
+        config_path = os.path.join(self.srctree, ".config")
+        if os.path.isfile(config_path):
+            with open(config_path, "r", encoding="utf-8") as f:
+                return "CONFIG_RUST=y" in f.read()
+        return False
+
+    def get_path(self, path, abs_path=False):
+        """
+        Ancillary routine to handle patches the right way, as shell does.
+
+        It first expands "~" and "~user". Then, if patch is not absolute,
+        join self.srctree. Finally, if requested, convert to abspath.
+        """
+
+        path = os.path.expanduser(path)
+        if not path.startswith("/"):
+            path = os.path.join(self.srctree, path)
+
+        if abs_path:
+            return os.path.abspath(path)
+
+        return path
+
+    def __init__(self, venv=None, verbose=False, n_jobs=None, interactive=None):
+        """Initialize internal variables"""
+        self.venv = venv
+        self.verbose = None
+
+        # Normal variables passed from Kernel's makefile
+        self.kernelversion = os.environ.get("KERNELVERSION", "unknown")
+        self.kernelrelease = os.environ.get("KERNELRELEASE", "unknown")
+        self.pdflatex = os.environ.get("PDFLATEX", "xelatex")
+
+        if not interactive:
+            self.latexopts = os.environ.get("LATEXOPTS", "-interaction=batchmode -no-shell-escape")
+        else:
+            self.latexopts = os.environ.get("LATEXOPTS", "")
+
+        if not verbose:
+            verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
+
+        # Handle SPHINXOPTS evironment
+        sphinxopts = shlex.split(os.environ.get("SPHINXOPTS", ""))
+
+        # As we handle number of jobs and quiet in separate, we need to pick
+        # it the same way as sphinx-build would pick, so let's use argparse
+        # do to the right argument expansion
+        parser = argparse.ArgumentParser()
+        parser.add_argument('-j', '--jobs', type=int)
+        parser.add_argument('-q', '--quiet', type=int)
+
+        # Other sphinx-build arguments go as-is, so place them
+        # at self.sphinxopts
+        sphinx_args, self.sphinxopts = parser.parse_known_args(sphinxopts)
+        if sphinx_args.quiet == True:
+            self.verbose = False
+
+        if sphinx_args.jobs:
+            self.n_jobs = sphinx_args.jobs
+
+        # Command line arguments was passed, override SPHINXOPTS
+        if verbose is not None:
+            self.verbose = verbose
+
+        self.n_jobs = n_jobs
+
+        # Source tree directory. This needs to be at os.environ, as
+        # Sphinx extensions and media uAPI makefile needs it
+        self.srctree = os.environ.get("srctree")
+        if not self.srctree:
+            self.srctree = "."
+            os.environ["srctree"] = self.srctree
+
+        # Now that we can expand srctree, get other directories as well
+        self.sphinxbuild = os.environ.get("SPHINXBUILD", "sphinx-build")
+        self.kerneldoc = self.get_path(os.environ.get("KERNELDOC",
+                                                      "scripts/kernel-doc.py"))
+        self.obj = os.environ.get("obj", "Documentation")
+        self.builddir = self.get_path(os.path.join(self.obj, "output"),
+                                      abs_path=True)
+
+        # Media uAPI needs it
+        os.environ["BUILDDIR"] = self.builddir
+
+        # Detect if rust is enabled
+        self.config_rust = self.is_rust_enabled()
+
+        # Get directory locations for LaTeX build toolchain
+        self.pdflatex_cmd = shutil.which(self.pdflatex)
+        self.latexmk_cmd = shutil.which("latexmk")
+
+        self.env = os.environ.copy()
+
+        # If venv parameter is specified, run Sphinx from venv
+        if venv:
+            bin_dir = os.path.join(venv, "bin")
+            if os.path.isfile(os.path.join(bin_dir, "activate")):
+                # "activate" virtual env
+                self.env["PATH"] = bin_dir + ":" + self.env["PATH"]
+                self.env["VIRTUAL_ENV"] = venv
+                if "PYTHONHOME" in self.env:
+                    del self.env["PYTHONHOME"]
+                print(f"Setting venv to {venv}")
+            else:
+                sys.exit(f"Venv {venv} not found.")
+
+    def run_sphinx(self, sphinx_build, build_args, *args, **pwargs):
+        """
+        Executes sphinx-build using current python3 command and setting
+        -j parameter if possible to run the build in parallel.
+        """
+
+        with JobserverExec() as jobserver:
+            if jobserver.claim:
+                n_jobs = str(jobserver.claim)
+            else:
+                n_jobs = "auto" # Supported since Sphinx 1.7
+
+            cmd = []
+
+            if self.venv:
+                cmd.append("python")
+            else:
+                cmd.append(sys.executable)
+
+            cmd.append(sphinx_build)
+
+            # if present, SPHINXOPTS or command line --jobs overrides default
+            if self.n_jobs:
+                n_jobs = str(self.n_jobs)
+
+            if n_jobs:
+                cmd += [f"-j{n_jobs}"]
+
+            if not self.verbose:
+                cmd.append("-q")
+
+            cmd += self.sphinxopts
+
+            cmd += build_args
+
+            if self.verbose:
+                print(" ".join(cmd))
+
+            rc = subprocess.call(cmd, *args, **pwargs)
+
+    def handle_html(self, css, output_dir):
+        """
+        Extra steps for HTML and epub output.
+
+        For such targets, we need to ensure that CSS will be properly
+        copied to the output _static directory
+        """
+
+        if not css:
+            return
+
+        css = os.path.expanduser(css)
+        if not css.startswith("/"):
+            css = os.path.join(self.srctree, css)
+
+        static_dir = os.path.join(output_dir, "_static")
+        os.makedirs(static_dir, exist_ok=True)
+
+        try:
+            shutil.copy2(css, static_dir)
+        except (OSError, IOError) as e:
+            print(f"Warning: Failed to copy CSS: {e}", file=sys.stderr)
+
+    def build_pdf_file(self, latex_cmd, from_dir, path):
+        """Builds a single pdf file using latex_cmd"""
+        try:
+            subprocess.run(latex_cmd + [path],
+                            cwd=from_dir, check=True)
+
+            return True
+        except subprocess.CalledProcessError:
+            # LaTeX PDF error code is almost useless: it returns
+            # error codes even when build succeeds but has warnings.
+            # So, we'll ignore the results
+            return False
+
+    def pdf_parallel_build(self, tex_suffix, latex_cmd, tex_files, n_jobs):
+        """Build PDF files in parallel if possible"""
+        builds = {}
+        build_failed = False
+        max_len = 0
+        has_tex = False
+
+        # Process files in parallel
+        with futures.ThreadPoolExecutor(max_workers=n_jobs) as executor:
+            jobs = {}
+
+            for from_dir, pdf_dir, entry in tex_files:
+                name = entry.name
+
+                if not name.endswith(tex_suffix):
+                    continue
+
+                name = name[:-len(tex_suffix)]
+
+                max_len = max(max_len, len(name))
+
+                has_tex = True
+
+                future = executor.submit(self.build_pdf_file, latex_cmd,
+                                         from_dir, entry.path)
+                jobs[future] = (from_dir, name, entry.path)
+
+            for future in futures.as_completed(jobs):
+                from_dir, name, path = jobs[future]
+
+                pdf_name = name + ".pdf"
+                pdf_from = os.path.join(from_dir, pdf_name)
+
+                try:
+                    success = future.result()
+
+                    if success and os.path.exists(pdf_from):
+                        pdf_to = os.path.join(pdf_dir, pdf_name)
+
+                        os.rename(pdf_from, pdf_to)
+                        builds[name] = os.path.relpath(pdf_to, self.builddir)
+                    else:
+                        builds[name] = "FAILED"
+                        build_failed = True
+                except Exception as e:
+                    builds[name] = f"FAILED ({str(e)})"
+                    build_failed = True
+
+        # Handle case where no .tex files were found
+        if not has_tex:
+            name = "Sphinx LaTeX builder"
+            max_len = max(max_len, len(name))
+            builds[name] = "FAILED (no .tex file was generated)"
+            build_failed = True
+
+        return builds, build_failed, max_len
+
+    def handle_pdf(self, output_dirs):
+        """
+        Extra steps for PDF output.
+
+        As PDF is handled via a LaTeX output, after building the .tex file,
+        a new build is needed to create the PDF output from the latex
+        directory.
+        """
+        builds = {}
+        max_len = 0
+        tex_suffix = ".tex"
+
+        # Get all tex files that will be used for PDF build
+        tex_files = []
+        for from_dir in output_dirs:
+            pdf_dir = os.path.join(from_dir, "../pdf")
+            os.makedirs(pdf_dir, exist_ok=True)
+
+            if self.latexmk_cmd:
+                latex_cmd = [self.latexmk_cmd, f"-{self.pdflatex}"]
+            else:
+                latex_cmd = [self.pdflatex]
+
+            latex_cmd.extend(shlex.split(self.latexopts))
+
+            # Get a list of tex files to process
+            with os.scandir(from_dir) as it:
+                for entry in it:
+                    if entry.name.endswith(tex_suffix):
+                        tex_files.append((from_dir, pdf_dir, entry))
+
+        # When using make, this won't be used, as the number of jobs comes
+        # from POSIX jobserver. So, this covers the case where build comes
+        # from command line. On such case, serialize by default, except if
+        # the user explicitly sets the number of jobs.
+        n_jobs = 1
+
+        # n_jobs is either an integer or "auto". Only use it if it is a number
+        if self.n_jobs:
+            try:
+                n_jobs = int(self.n_jobs)
+            except ValueError:
+                pass
+
+        # When using make, jobserver.claim is the number of jobs that were
+        # used with "-j" and that aren't used by other make targets
+        with JobserverExec() as jobserver:
+            n_jobs = 1
+
+            # Handle the case when a parameter is passed via command line,
+            # using it as default, if jobserver doesn't claim anything
+            if self.n_jobs:
+                try:
+                    n_jobs = int(self.n_jobs)
+                except ValueError:
+                    pass
+
+            if jobserver.claim:
+                n_jobs = jobserver.claim
+
+            # Build files in parallel
+            builds, build_failed, max_len = self.pdf_parallel_build(tex_suffix,
+                                                                    latex_cmd,
+                                                                    tex_files,
+                                                                    n_jobs)
+
+        msg = "Summary"
+        msg += "\n" + "=" * len(msg)
+        print()
+        print(msg)
+
+        for pdf_name, pdf_file in builds.items():
+            print(f"{pdf_name:<{max_len}}: {pdf_file}")
+
+        print()
+
+        # return an error if a PDF file is missing
+
+        if build_failed:
+            sys.exit(f"PDF build failed: not all PDF files were created.")
+        else:
+            print("All PDF files were built.")
+
+    def handle_info(self, output_dirs):
+        """
+        Extra steps for Info output.
+
+        For texinfo generation, an additional make is needed from the
+        texinfo directory.
+        """
+
+        for output_dir in output_dirs:
+            try:
+                subprocess.run(["make", "info"], cwd=output_dir, check=True)
+            except subprocess.CalledProcessError as e:
+                sys.exit(f"Error generating info docs: {e}")
+
+    def cleandocs(self, builder):
+
+        shutil.rmtree(self.builddir, ignore_errors=True)
+
+    def build(self, target, sphinxdirs=None, conf="conf.py",
+              theme=None, css=None, paper=None):
+        """
+        Build documentation using Sphinx. This is the core function of this
+        module. It prepares all arguments required by sphinx-build.
+        """
+
+        builder = TARGETS[target]["builder"]
+        out_dir = TARGETS[target].get("out_dir", "")
+
+        # Cleandocs doesn't require sphinx-build
+        if target == "cleandocs":
+            self.cleandocs(builder)
+            return
+
+        # Other targets require sphinx-build
+        sphinxbuild = shutil.which(self.sphinxbuild, path=self.env["PATH"])
+        if not sphinxbuild:
+            sys.exit(f"Error: {self.sphinxbuild} not found in PATH.\n")
+
+        if builder == "latex":
+            if not self.pdflatex_cmd and not self.latexmk_cmd:
+                sys.exit("Error: pdflatex or latexmk required for PDF generation")
+
+        docs_dir = os.path.abspath(os.path.join(self.srctree, "Documentation"))
+
+        # Prepare base arguments for Sphinx build
+        kerneldoc = self.kerneldoc
+        if kerneldoc.startswith(self.srctree):
+            kerneldoc = os.path.relpath(kerneldoc, self.srctree)
+
+        # Prepare common Sphinx options
+        args = [
+            "-b", builder,
+            "-c", docs_dir,
+        ]
+
+        if builder == "latex":
+            if not paper:
+                paper = PAPER[1]
+
+            args.extend(["-D", f"latex_elements.papersize={paper}paper"])
+
+        if self.config_rust:
+            args.extend(["-t", "rustdoc"])
+
+        if conf:
+            self.env["SPHINX_CONF"] = self.get_path(conf, abs_path=True)
+
+        if not sphinxdirs:
+            sphinxdirs = os.environ.get("SPHINXDIRS", ".")
+
+        # The sphinx-build tool has a bug: internally, it tries to set
+        # locale with locale.setlocale(locale.LC_ALL, ''). This causes a
+        # crash if language is not set. Detect and fix it.
+        try:
+            locale.setlocale(locale.LC_ALL, '')
+        except Exception:
+            self.env["LC_ALL"] = "C"
+            self.env["LANG"] = "C"
+
+        # sphinxdirs can be a list or a whitespace-separated string
+        sphinxdirs_list = []
+        for sphinxdir in sphinxdirs:
+            if isinstance(sphinxdir, list):
+                sphinxdirs_list += sphinxdir
+            else:
+                for name in sphinxdir.split(" "):
+                    sphinxdirs_list.append(name)
+
+        # Build each directory
+        output_dirs = []
+        for sphinxdir in sphinxdirs_list:
+            src_dir = os.path.join(docs_dir, sphinxdir)
+            doctree_dir = os.path.join(self.builddir, ".doctrees")
+            output_dir = os.path.join(self.builddir, sphinxdir, out_dir)
+
+            # Make directory names canonical
+            src_dir = os.path.normpath(src_dir)
+            doctree_dir = os.path.normpath(doctree_dir)
+            output_dir = os.path.normpath(output_dir)
+
+            os.makedirs(doctree_dir, exist_ok=True)
+            os.makedirs(output_dir, exist_ok=True)
+
+            output_dirs.append(output_dir)
+
+            build_args = args + [
+                "-d", doctree_dir,
+                "-D", f"kerneldoc_bin={kerneldoc}",
+                "-D", f"version={self.kernelversion}",
+                "-D", f"release={self.kernelrelease}",
+                "-D", f"kerneldoc_srctree={self.srctree}",
+                src_dir,
+                output_dir,
+            ]
+
+            # Execute sphinx-build
+            try:
+                self.run_sphinx(sphinxbuild, build_args, env=self.env)
+            except Exception as e:
+                sys.exit(f"Build failed: {e}")
+
+            # Ensure that html/epub will have needed static files
+            if target in ["htmldocs", "epubdocs"]:
+                self.handle_html(css, output_dir)
+
+        # PDF and Info require a second build step
+        if target == "pdfdocs":
+            self.handle_pdf(output_dirs)
+        elif target == "infodocs":
+            self.handle_info(output_dirs)
+
+    @staticmethod
+    def get_python_version(cmd):
+        """
+        Get python version from a Python binary. As we need to detect if
+        are out there newer python binaries, we can't rely on sys.release here.
+        """
+
+        result = subprocess.run([cmd, "--version"], check=True,
+                                stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                                universal_newlines=True)
+        version = result.stdout.strip()
+
+        match = re.search(r"(\d+\.\d+\.\d+)", version)
+        if match:
+            return parse_version(match.group(1))
+
+        print(f"Can't parse version {version}")
+        return (0, 0, 0)
+
+    @staticmethod
+    def find_python():
+        """
+        Detect if are out there any python 3.xy version newer than the
+        current one.
+
+        Note: this routine is limited to up to 2 digits for python3. We
+        may need to update it one day, hopefully on a distant future.
+        """
+        patterns = [
+            "python3.[0-9]",
+            "python3.[0-9][0-9]",
+        ]
+
+        # Seek for a python binary newer than MIN_PYTHON_VERSION
+        for path in os.getenv("PATH", "").split(":"):
+            for pattern in patterns:
+                for cmd in glob(os.path.join(path, pattern)):
+                    if os.path.isfile(cmd) and os.access(cmd, os.X_OK):
+                        version = SphinxBuilder.get_python_version(cmd)
+                        if version >= MIN_PYTHON_VERSION:
+                            return cmd
+
+        return None
+
+    @staticmethod
+    def check_python():
+        """
+        Check if the current python binary satisfies our minimal requirement
+        for Sphinx build. If not, re-run with a newer version if found.
+        """
+        cur_ver = sys.version_info[:3]
+        if cur_ver >= MIN_PYTHON_VERSION:
+            return
+
+        python_ver = ver_str(cur_ver)
+
+        new_python_cmd = SphinxBuilder.find_python()
+        if not new_python_cmd:
+            sys.exit(f"Python version {python_ver} is not supported anymore.")
+
+        # Restart script using the newer version
+        script_path = os.path.abspath(sys.argv[0])
+        args = [new_python_cmd, script_path] + sys.argv[1:]
+
+        print(f"Python {python_ver} not supported. Changing to {new_python_cmd}")
+
+        try:
+            os.execv(new_python_cmd, args)
+        except OSError as e:
+            sys.exit(f"Failed to restart with {new_python_cmd}: {e}")
+
+def jobs_type(value):
+    """
+    Handle valid values for -j. Accepts Sphinx "-jauto", plus a number
+    equal or bigger than one.
+    """
+    if value is None:
+        return None
+
+    if value.lower() == 'auto':
+        return value.lower()
+
+    try:
+        if int(value) >= 1:
+            return value
+
+        raise argparse.ArgumentTypeError(f"Minimum jobs is 1, got {value}")
+    except ValueError:
+        raise argparse.ArgumentTypeError(f"Must be 'auto' or positive integer, got {value}")
+
+def main():
+    """
+    Main function. The only mandatory argument is the target. If not
+    specified, the other arguments will use default values if not
+    specified at os.environ.
+    """
+    parser = argparse.ArgumentParser(description="Kernel documentation builder")
+
+    parser.add_argument("target", choices=list(TARGETS.keys()),
+                        help="Documentation target to build")
+    parser.add_argument("--sphinxdirs", nargs="+",
+                        help="Specific directories to build")
+    parser.add_argument("--conf", default="conf.py",
+                        help="Sphinx configuration file")
+
+    parser.add_argument("--theme", help="Sphinx theme to use")
+
+    parser.add_argument("--css", help="Custom CSS file for HTML/EPUB")
+
+    parser.add_argument("--paper", choices=PAPER, default=PAPER[0],
+                        help="Paper size for LaTeX/PDF output")
+
+    parser.add_argument("-v", "--verbose", action='store_true',
+                        help="place build in verbose mode")
+
+    parser.add_argument('-j', '--jobs', type=jobs_type,
+                        help="Sets number of jobs to use with sphinx-build")
+
+    parser.add_argument('-i', '--interactive', action='store_true',
+                        help="Change latex default to run in interactive mode")
+
+    parser.add_argument("-V", "--venv", nargs='?', const=f'{VENV_DEFAULT}',
+                        default=None,
+                        help=f'If used, run Sphinx from a venv dir (default dir: {VENV_DEFAULT})')
+
+    args = parser.parse_args()
+
+    SphinxBuilder.check_python()
+
+    builder = SphinxBuilder(venv=args.venv, verbose=args.verbose,
+                            n_jobs=args.jobs, interactive=args.interactive)
+
+    builder.build(args.target, sphinxdirs=args.sphinxdirs, conf=args.conf,
+                  theme=args.theme, css=args.css, paper=args.paper)
+
+if __name__ == "__main__":
+    main()
-- 
2.50.1


