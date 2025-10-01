Return-Path: <linux-media+bounces-43478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D085BB0E1A
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 910694C349B
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0964330E0D6;
	Wed,  1 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNTLK0bd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7472EA74D;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=WUkdiaplFiyFYtXajxXxAho1SUPPaJUZuwhogqDOZjMqe1La+P7hg8uEPs/5ocWx16jztzjcbjE9PYJ0QZY3H/I+fbll6d8DVEA3TrFD+n/gDd4EQqZj7c1HwZALhojEJBkwyPwlo7n1GBdywIyBMaw455qBc78z0gpgfuTVhKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=cpudc7RxxWHkEhpC0NFFpbwb/vOwgTPsZ8i0Bb1r0y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foAIvAzyj0rcD3CgBHeU/Z2g1Mh7g5HS5TFpwJGl26tSd1w85V4F88uGHCJeNJl1gBOXQYBrvNVOIpZbruxoTTKF16M/AZB9nfTLqShWsRrOVa6rHP8PPwhvjzsXm466jy817sfiCZKb4bRLApK4bF4kMW8PZvcOflD4gbxzxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNTLK0bd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171EFC4CEFC;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=cpudc7RxxWHkEhpC0NFFpbwb/vOwgTPsZ8i0Bb1r0y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LNTLK0bdEFGF1PCtKmj9vCgGEdMBQprPG8h3wkc9bzMAMcFUlie4WywkPrWbm1RDX
	 9qXIvxVQg5LbqTGbS3/BWvcPWO1NiKXSsJmYFRzHAHZUS1Xh53BmNUou8oP4z4rAIo
	 7pcKOziYZHwHQPN7hLaHFxCyI3YdX2WzCdFQJJjZWZJ4GKur7EqplW8OJ4wFj7F7S8
	 ljwMIgWaFSZfPMW4X9XL2rKlJJ0EB/Uxd9LZtlxqiQk0WZnjDhd7nk9AhZotjUAFfr
	 yAInPl7iu3s5Vx+R3GWhs6/YIM/v/+nUoeajugEvuQ1ZiGR+ugoJSFBxu4MFohxa+V
	 2ZDqaWS0YkWqw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIR-1JUm;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 07/23] tools: docs: parse_data_structs.py: add namespace support
Date: Wed,  1 Oct 2025 16:49:30 +0200
Message-ID: <cc27ec60ceb3bdac4197fb7266d2df8155edacda.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

C domain supports a ".. c:namespace::" tag that allows setting a
symbol namespace. This is used within the kernel to avoid warnings
about duplicated symbols. This is specially important for syscalls,
as each subsystem may have their own documentation for them.
This is specially true for ioctl.

When such tag is used, all C domain symbols have c++ style,
e.g. they'll become "{namespace}.{reference}".

Allow specifying C namespace at the exception files, avoiding
the need of override rules for every symbol.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/lib/parse_data_structs.py | 43 +++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
index cbdbf7dfe785..0d537e989ea7 100755
--- a/tools/docs/lib/parse_data_structs.py
+++ b/tools/docs/lib/parse_data_structs.py
@@ -53,11 +53,19 @@ class ParseDataStructs:
 
         replace <type> <old_symbol> <new_reference>
 
-    Replaces how old_symbol with a new reference. The new_reference can be:
+       Replaces how old_symbol with a new reference. The new_reference can be:
+
         - A simple symbol name;
         - A full Sphinx reference.
 
-    On both cases, <type> can be:
+    3. Namespace rules
+
+        namespace <namespace>
+
+       Sets C namespace to be used during cross-reference generation. Can
+       be overridden by replace rules.
+
+    On ignore and replace rules, <type> can be:
         - ioctl: for defines that end with _IO*, e.g. ioctl definitions
         - define: for other defines
         - symbol: for symbols defined within enums;
@@ -71,6 +79,8 @@ class ParseDataStructs:
         ignore ioctl VIDIOC_ENUM_FMT
         replace ioctl VIDIOC_DQBUF vidioc_qbuf
         replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
+
+        namespace MC
     """
 
     # Parser regexes with multiple ways to capture enums and structs
@@ -140,6 +150,7 @@ class ParseDataStructs:
 
         self.symbols = {}
 
+        self.namespace = None
         self.ignore = []
         self.replace = []
 
@@ -173,6 +184,11 @@ class ParseDataStructs:
                                          match.group(3)))
                     continue
 
+                match = re.match(r"^namespace\s+(\S+)", line)
+                if match:
+                    self.namespace = match.group(1)
+                    continue
+
                 sys.exit(f"{name}:{ln}: invalid line: {line}")
 
     def apply_exceptions(self):
@@ -237,18 +253,23 @@ class ParseDataStructs:
         ref_type = defs.get("ref_type")
 
         # Determine ref_link based on symbol type
-        if ref_type:
-            if symbol_type == "enum":
-                ref_link = f"{ref_type}:`{symbol}`"
-            else:
-                if not ref_name:
-                    ref_name = symbol.lower()
+        if ref_type or self.namespace:
+            if not ref_name:
+                ref_name = symbol.lower()
 
-                # c-type references don't support hash
-                if ref_type == ":ref" and replace_underscores:
-                    ref_name = ref_name.replace("_", "-")
+            # c-type references don't support hash
+            if ref_type == ":ref" and replace_underscores:
+                ref_name = ref_name.replace("_", "-")
 
+            # C domain references may have namespaces
+            if ref_type.startswith(":c:"):
+                if self.namespace:
+                    ref_name = f"{self.namespace}.{ref_name}"
+
+            if ref_type:
                 ref_link = f"{ref_type}:`{symbol} <{ref_name}>`"
+            else:
+                ref_link = f"`{symbol} <{ref_name}>`"
         else:
             ref_link = symbol
 
-- 
2.51.0


