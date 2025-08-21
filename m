Return-Path: <linux-media+bounces-40614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37ABB2FC8E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F00F13AC55B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD1929E105;
	Thu, 21 Aug 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExsOIfGY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277228CF49;
	Thu, 21 Aug 2025 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786100; cv=none; b=kx7UYxjKnVS++k9OrgTG/JIpZLdmXueBGxX4F7/Ysgky8TGqxvKITAlKDOjI6cNrdyMFUKTCHSYb7jJ7gjfc+UX3psqQgTUrevheu/LSRh4qhQuqLqKNryf8x0oJpHkJhUvHG0dA+m5l9MmAJVH+56oBDHTyxi0FELc/vF9kAOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786100; c=relaxed/simple;
	bh=KsD1vNVCtNtIDrdngUGcQADwaGx5iOiHWVt8kHIS/5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KM3fBZGJVn873cMptQJXkrXnZjsjCYZ6v/bMUohEz1hYdRTr7y7Rd9uesCvhs32CTOeIHTuIx8GM6pG/GLmoGlM9ACPOYIIEy2HYoRoAR5J3oDFr5jY4Y+4hz4FXvn5sLHA1U8tLgJAtv5crK2X+o4jfkTjPnlDh1cUqgxrQgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExsOIfGY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1A7C4CEF4;
	Thu, 21 Aug 2025 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755786100;
	bh=KsD1vNVCtNtIDrdngUGcQADwaGx5iOiHWVt8kHIS/5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ExsOIfGYWwOaZ5MoutZDuMpVbAfW2+2P6Snm8/PlalBhiMJuxudAABK0DOTLiHK2L
	 ehTj9R2/5GjSPN7ipKhryQfAfOH8w3/Mt1Y2Kj6C4GtMs/qK7DhQ+mhhE9K2G5rW/C
	 fIcRPdV6ZYw9mEy2fUjhcKv8Pp1LdGD5y09MMPrMxBpQraMsXBTxEy8iLpvy5jvt5F
	 T4V9X7n1xWvgJjuaB1exw+ZmnHONTkLfaquuoiJghBclOlToR9bOefjBxxm01Tzhs8
	 5huvuWg1s2IbOIHfdK32ckJ6QocptTJlxpxLlJ8BOd4VMGMdzHJiyYOFhXr+TSalPY
	 S3BwYpixHvN3w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1up6Ab-0000000BT9U-2R6C;
	Thu, 21 Aug 2025 16:21:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <mchehab+huawei@kernel.org>,
	Hans de Goede <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sean Young <sean@mess.org>,
	Yunke Cao <yunkec@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 23/24] scripts: sphinx-build-wrapper: get rid of uapi/media Makefile
Date: Thu, 21 Aug 2025 16:21:29 +0200
Message-ID: <72c95996d5202b467ad55b5948cc8e70d99ac5cd.1755784930.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755784929.git.mchehab+huawei@kernel.org>
References: <cover.1755784929.git.mchehab+huawei@kernel.org>
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
 Documentation/userspace-api/media/Makefile    | 64 -------------------
 .../userspace-api/media/cec/cec-header.rst    |  5 +-
 .../media/{ => cec}/cec.h.rst.exceptions      |  0
 .../media/{ => dvb}/ca.h.rst.exceptions       |  0
 .../media/{ => dvb}/dmx.h.rst.exceptions      |  0
 .../media/{ => dvb}/frontend.h.rst.exceptions |  0
 .../userspace-api/media/dvb/headers.rst       | 17 +++--
 .../media/{ => dvb}/net.h.rst.exceptions      |  0
 .../media/mediactl/media-header.rst           |  5 +-
 .../{ => mediactl}/media.h.rst.exceptions     |  0
 .../userspace-api/media/rc/lirc-header.rst    |  4 +-
 .../media/{ => rc}/lirc.h.rst.exceptions      |  0
 .../userspace-api/media/v4l/videodev.rst      |  4 +-
 .../{ => v4l}/videodev2.h.rst.exceptions      |  0
 scripts/sphinx-build-wrapper                  | 48 --------------
 15 files changed, 25 insertions(+), 122 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/Makefile
 rename Documentation/userspace-api/media/{ => cec}/cec.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/ca.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/dmx.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/frontend.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => dvb}/net.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => mediactl}/media.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => rc}/lirc.h.rst.exceptions (100%)
 rename Documentation/userspace-api/media/{ => v4l}/videodev2.h.rst.exceptions (100%)

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
index 0d13c19f6df3..abe8c26ae137 100755
--- a/scripts/sphinx-build-wrapper
+++ b/scripts/sphinx-build-wrapper
@@ -463,56 +463,10 @@ class SphinxBuilder:
             except subprocess.CalledProcessError as e:
                 sys.exit(f"Error generating info docs: {e}")
 
-    def get_make_media(self):
-        """
-        The media uAPI requires an additional Makefile target.
-        """
-
-        mediadir = f"{self.obj}/userspace-api/media"
-
-        make = os.environ.get("MAKE", "make")
-        build = os.environ.get("build", "-f $(srctree)/scripts/Makefile.build obj")
-
-        # Check if the script was started outside docs Makefile
-        if not os.environ.get("obj"):
-            mediadir = os.path.abspath(mediadir)
-
-        # the build makefile var contains macros that require expand
-        make_media = f"{make} {build}={mediadir}"
-        make_media = make_media.replace("$(", "${").replace(")", "}")
-        make_media = os.path.expandvars(make_media)
-
-        # As it also contains multiple arguments, use shlex to split it
-        return shlex.split(make_media)
-
-    def prepare_media(self, builder):
-        """
-        Run userspace-api/media Makefile.
-
-        The logic behind it are from the initial ports to Sphinx.
-        They're old and need to be replaced by a proper Sphinx extension.
-        While we don't do that, we need to explicitly call media Makefile
-        to build some files.
-        """
-
-        cmd = self.get_make_media() + [builder]
-
-        if self.verbose:
-            print(" ".join(cmd))
-
-        with JobserverExec() as jobserver:
-            rc = jobserver.run(cmd, env=self.env)
-
-        if rc:
-            cmd_str = " ".join(cmd)
-            sys.exit(f"Failed to run {cmd_str}")
-
     def cleandocs(self, builder):
 
         shutil.rmtree(self.builddir, ignore_errors=True)
 
-        self.prepare_media(builder)
-
     def build(self, target, sphinxdirs=None, conf="conf.py",
               theme=None, css=None, paper=None):
         """
@@ -533,8 +487,6 @@ class SphinxBuilder:
         if not sphinxbuild:
             sys.exit(f"Error: {self.sphinxbuild} not found in PATH.\n")
 
-        self.prepare_media(builder)
-
         if builder == "latex":
             if not self.pdflatex_cmd and not self.latexmk_cmd:
                 sys.exit("Error: pdflatex or latexmk required for PDF generation")
-- 
2.50.1


