Return-Path: <linux-media+bounces-25978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB7A30385
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 07:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48363188B789
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 06:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7521EB9E3;
	Tue, 11 Feb 2025 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJYZ/+7h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E191D54C2;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254995; cv=none; b=h9Hc4rdFcsVUeF6EE7b8wLWSjcBNmp/XzsDtzO3UkVH52V22+UxIMkPY1FvhQhTj+NIM1J9T2PVnPnFU+TTMv3297WzVMY/i/5UgFjQt9al3KoSyiiZuBPxtkj6/PSxAOiAaNYtvGyHDWn1Gb61LLcZ1ExOt+hyio3pPPwsgpyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254995; c=relaxed/simple;
	bh=t4nvCsVaeq/JWg5HRJsbxqzjIAI8bXe8VWVi54lXQhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEHLpzf3I7g14zmL1Cgme4KVhOIR4RdnTu9TmamtgyzLxX/DrRuPNrv8xLXB97KEmXIFXXXs6PnmSk4Cdwjm+g7Ryh2buBNItXw3sQfzfW/tVjUPxSoALFNNGX+HeCn1g05uTq96N5IcD4GQeBzxOzsAdrCuXqgiAhArLQWGsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJYZ/+7h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826AFC4CEE4;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254994;
	bh=t4nvCsVaeq/JWg5HRJsbxqzjIAI8bXe8VWVi54lXQhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YJYZ/+7hJosWMfEZ28HJjJhTP3Q5VQyEJbDLYTss8M8hrB7i/k9VAreWE+sJVZCRC
	 SoRdczOhg8x0un+CW/AfoqJ3C7e4YrgaUE7OpHBu6+A/I3QaCrPDuT5n22kjBYV9le
	 eBVeZ+gYKwNVQ2fjZv+0JH1tu3UYIAli0pXA7gFE1cSJFJdaRjl1gEYoPjWeUZTz6l
	 5ssX1As1PSmocWoJsHiyJk7mYvJS70ogxrSKC5ITWvPp6ppdu27bOzEF9ltFm1I3VX
	 /xSzkkKT/lJs7BRAhfobftYGLcaRuCuvplSCvBJ1y4w9Kcu6yuD6naBE5vgAP2xV1y
	 xkgybcRkbtJSQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjfs-00000008YBH-34yO;
	Tue, 11 Feb 2025 07:23:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Sean Young <sean@mess.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 1/9] docs: media: Allow creating cross-references for RC ABI
Date: Tue, 11 Feb 2025 07:22:55 +0100
Message-ID: <7c2f9a9970a15df8b5e3a6ecd21bcedcc8881ce1.1739254867.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739254867.git.mchehab+huawei@kernel.org>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that Documentation/ABI is processed by automarkup, let it
generate cross-references for RC sysfs devnodes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/automarkup.py              | 17 +++++++++++++----
 .../userspace-api/media/rc/rc-sysfs-nodes.rst   |  2 +-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 22defc18d6d2..03bb7020f5cb 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -88,13 +88,13 @@ def markup_refs(docname, app, node):
     # Associate each regex with the function that will markup its matches
     #
     markup_func_sphinx2 = {RE_doc: markup_doc_ref,
-                           RE_abi_file: markup_abi_ref,
+                           RE_abi_file: markup_abi_file_ref,
                            RE_abi_symbol: markup_abi_ref,
                            RE_function: markup_c_ref,
                            RE_generic_type: markup_c_ref}
 
     markup_func_sphinx3 = {RE_doc: markup_doc_ref,
-                           RE_abi_file: markup_abi_ref,
+                           RE_abi_file: markup_abi_file_ref,
                            RE_abi_symbol: markup_abi_ref,
                            RE_function: markup_func_ref_sphinx3,
                            RE_struct: markup_c_ref,
@@ -279,10 +279,10 @@ def markup_doc_ref(docname, app, match):
         return nodes.Text(match.group(0))
 
 #
-# Try to replace a documentation reference of the form Documentation/ABI/...
+# Try to replace a documentation reference for ABI symbols and files
 # with a cross reference to that page
 #
-def markup_abi_ref(docname, app, match):
+def markup_abi_ref(docname, app, match, warning=False):
     stddom = app.env.domains['std']
     #
     # Go through the dance of getting an xref out of the std domain
@@ -294,6 +294,8 @@ def markup_abi_ref(docname, app, match):
 
     # Kernel ABI doesn't describe such file or symbol
     if not target:
+        if warning:
+            kernel_abi.log.warning("%s not found", fname)
         return nodes.Text(match.group(0))
 
     pxref = addnodes.pending_xref('', refdomain = 'std', reftype = 'ref',
@@ -317,6 +319,13 @@ def markup_abi_ref(docname, app, match):
     else:
         return nodes.Text(match.group(0))
 
+#
+# Variant of markup_abi_ref() that warns whan a reference is not found
+#
+def markup_abi_file_ref(docname, app, match):
+    return markup_abi_ref(docname, app, match, warning=True)
+
+
 def get_c_namespace(app, docname):
     source = app.env.doc2path(docname)
     with open(source) as f:
diff --git a/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst b/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
index 34d6a0a1f4d3..70b5966aaff8 100644
--- a/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
+++ b/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
@@ -6,7 +6,7 @@
 Remote Controller's sysfs nodes
 *******************************
 
-As defined at ``Documentation/ABI/testing/sysfs-class-rc``, those are
+As defined at Documentation/ABI/testing/sysfs-class-rc, those are
 the sysfs nodes that control the Remote Controllers:
 
 
-- 
2.48.1


