Return-Path: <linux-media+bounces-40779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30991B31C30
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D9BB23C62
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DB331A063;
	Fri, 22 Aug 2025 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmTp250i"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF030313558;
	Fri, 22 Aug 2025 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755873155; cv=none; b=X4Cw7ljP9nJHKSiEXBugICe9GZAZud2LmVAWeUEwiH8esWev9d0UbN4gbTMQ9rz7aY58UaXRyq61Cu18rqKXd7/KwDvf6imUV8xuBYlSSMagmCtpGsFyv2NGvoMOPARACiC9SjD6xRg9DGdY2NxAg9byIka8+E2c7QGdAAE5ydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755873155; c=relaxed/simple;
	bh=fQ6JfkA4FCbKZN7MdoROYxD4ht6IWPj2dmJIIpwDwY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcl/fybhYMbN3wod+NJKk0ioCwfNr4NS7GVYay8iRoKoI2RP5SCuGE5OTk65DU1VyUlQoUZHe1EOWBFm/A3kPEsQTPLMUPToHQ6xiiqfOxNftjwjaPfm2YBEen99SxZXd1N154iCRUwQpjDVqHdU03mIYwa3s9gJsT4MyVhsxq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmTp250i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A45AC4CEED;
	Fri, 22 Aug 2025 14:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755873154;
	bh=fQ6JfkA4FCbKZN7MdoROYxD4ht6IWPj2dmJIIpwDwY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmTp250ik7/lnzI7GNozFBXZWdKj8RlU+FSprtMo/rSHmOKooVdJJJAyLai3dz67C
	 cVQA7d2HlxmGBZ8FAocASStFN2Z71ys39/OraNXeXlv8kA8dOVAtpzDlq3rkSqF65Q
	 wIFelPvcVHswbPyr8MwqpLYPgUwzN++y/Bf3tztsyDj5Rc9u4T4DVEdNCOAlUM/BtP
	 KgVIsk4l8acbdZ4QlOiU6Ql6yEvIGOTy/ilhGa+0PmgS1njaY62szlxDIqcL5HXSCs
	 Zd0W2KP0eo2xsZYybsV/CbTX5G+aU0zUZ6WT4pq2y1/mCj7jPYEEXyXqSU53UDYVug
	 TLrKHuj9XClSw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1upSoi-0000000CDir-16pH;
	Fri, 22 Aug 2025 16:32:32 +0200
Date: Fri, 22 Aug 2025 16:32:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Erling Ljunggren <hljunggr@cisco.com>, Gary Guo <gary@garyguo.net>, 
	Ricardo Ribalda <ribalda@chromium.org>, Sean Young <sean@mess.org>, Trevor Gross <tmgross@umich.edu>, 
	Yunke Cao <yunkec@google.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 23/24] scripts: sphinx-build-wrapper: get rid of
 uapi/media Makefile
Message-ID: <onft5qi4qoybnv6urs4rlxqjkixvndlujyjznpfc4dj4265yfw@4blah5vnf7gh>
References: <cover.1755872208.git.mchehab+huawei@kernel.org>
 <5dbb257a4b283697271c9c7b8f4713857e8191c8.1755872208.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dbb257a4b283697271c9c7b8f4713857e8191c8.1755872208.git.mchehab+huawei@kernel.org>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Fri, Aug 22, 2025 at 04:19:35PM +0200, Mauro Carvalho Chehab wrote:
> Now that kernel-include directive supports parsing data
> structs directly, we can finally get rid of the horrible hack
> we added to support parsing media uAPI symbols.
> 
> As a side effect, Documentation/output doesn't have anymore
> media auto-generated .rst files on it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/Makefile                        |   3 +-
>  Documentation/userspace-api/media/Makefile    |  64 --
>  .../userspace-api/media/cec/cec-header.rst    |   5 +-
>  .../media/{ => cec}/cec.h.rst.exceptions      |   0
>  .../media/{ => dvb}/ca.h.rst.exceptions       |   0
>  .../media/{ => dvb}/dmx.h.rst.exceptions      |   0
>  .../media/{ => dvb}/frontend.h.rst.exceptions |   0
>  .../userspace-api/media/dvb/headers.rst       |  17 +-
>  .../media/{ => dvb}/net.h.rst.exceptions      |   0
>  .../media/mediactl/media-header.rst           |   5 +-
>  .../{ => mediactl}/media.h.rst.exceptions     |   0
>  .../userspace-api/media/rc/lirc-header.rst    |   4 +-
>  .../media/{ => rc}/lirc.h.rst.exceptions      |   0
>  .../userspace-api/media/v4l/videodev.rst      |   4 +-
>  .../{ => v4l}/videodev2.h.rst.exceptions      |   0
>  scripts/sphinx-build-wrapper                  | 719 ++++++++++++++++++
>  16 files changed, 745 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/userspace-api/media/Makefile
>  rename Documentation/userspace-api/media/{ => cec}/cec.h.rst.exceptions (100%)
>  rename Documentation/userspace-api/media/{ => dvb}/ca.h.rst.exceptions (100%)
>  rename Documentation/userspace-api/media/{ => dvb}/dmx.h.rst.exceptions (100%)
>  rename Documentation/userspace-api/media/{ => dvb}/frontend.h.rst.exceptions (100%)
>  rename Documentation/userspace-api/media/{ => dvb}/net.h.rst.exceptions (100%)
>  rename Documentation/userspace-api/media/{ => mediactl}/media.h.rst.exceptions (100%)
>  rename Documentation/userspace-api/media/{ => rc}/lirc.h.rst.exceptions (100%)
>  rename Documentation/userspace-api/media/{ => v4l}/videodev2.h.rst.exceptions (100%)

Heh, this is is obviously wrong:
>  create mode 100755 scripts/sphinx-build-wrapper

This patch should be, instead:

From 264a1888c3d3956c26c149e88b6a42459a51cbdf Mon Sep 17 00:00:00 2001
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Tue, 5 Aug 2025 11:46:33 +0200
Subject: [PATCH v2 23/24] docs: get rid of uapi/media Makefile

Now that kernel-include directive supports parsing data
structs directly, we can finally get rid of the horrible hack
we added to support parsing media uAPI symbols.

As a side effect, Documentation/output doesn't have anymore
media auto-generated .rst files on it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

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

