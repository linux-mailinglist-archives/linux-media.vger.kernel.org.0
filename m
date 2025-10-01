Return-Path: <linux-media+bounces-43481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95811BB0E27
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F41204C3AE4
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6169F30E846;
	Wed,  1 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBxgjRyq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F32F1FE9;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=in/fTi5PBu9578SbbGbkkorTgI+0SBDavhMc/Rm62pNlzdyVJ8mKK7quqMGywF3kFlnF8S4jFciq6A88ErRJQuUHzkF+l8oOo5Czf8UcGNadKN2Zo/aK+YqS4Dk6Pu5zD5bgcCmLjqc8fd/LFdtELUPb53nhuE2vDE1Ha1PLhVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=gWTpAMgrDNjjcf3uRyjFHcg7Xl9zfe2ooTOSLm0xHCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fthL3/zW23umOD+tStdpIL7UHDpDOk/QrIFsloMdP63rkaOHLiG/voXKFPPnb2M1XNC3LJlhRDj3ZUgUvc/UUsjzExjm18ZByOdanLP8yGEA6bPJsdJMPK8wyRPwUxx2y8YHLT6oPvXvUTgVUJVBX7qCt4MpZ+EpysoiL9SNcSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBxgjRyq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359B6C2BCB0;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=gWTpAMgrDNjjcf3uRyjFHcg7Xl9zfe2ooTOSLm0xHCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HBxgjRyqUkrnBXbn3U7XEwEufQPZmwMGKL7FyXfZ69ZFgZ/XQfRYMYGGnunGWtqUg
	 1gmWE1lMyfW9b8vt3I81X18juwK8XMuRkSWzUcWN1vwLsMEA4AHI1xmwowVz/9/+HI
	 SSMNrfxUpCGK4IFDflvC0UDXq77LblwgcOAI3Urbym3BIvuekIOeoo9wh+8r0ORccx
	 umFe6Uh3pqNUx14/NZQ1LmjykNE2yDqL1ujENw7UsC4moFzbv22Y+N09Qf1pyiI0rT
	 ZWamN40UzByJWmU01w4h+wK20+WosgmOG2GZvcYXYc+reicrWWw2U61pinN4Oiq64b
	 6a+EOHspTioog==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIp-1xpS;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 13/23] docs: kernel_include.py: use get_close_matches() to propose alternatives
Date: Wed,  1 Oct 2025 16:49:36 +0200
Message-ID: <7365feb74cbdd6b982c87baf5863360ab98cf727.1759329363.git.mchehab+huawei@kernel.org>
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

Improve the suggestions algorithm by using get_close_matches() if
no suggestions with the same name are found. As we're now building
a dict, when the name is identical, but on a different domain,
the search is O(1), making it a lot faster.

The get_close_matches is also fast, as there is just one loop,
instead of 3.

This can be useful to detect typos on references, with could
be the base of a futuere extension that will handle ref unmatches
for the entire build, allowing someone to find typos and fix them.

As difflib and get_close_matches are there since the early
Python 3.x days, we don't need to handle any extra dependencies
to use it.

We're keeping the default values for the search, e.g. n=3, cutoff=0.6.
With that, we now have things like:

  $ make SPHINXDIRS="userspace-api/media" htmldocs
  ...
  include/uapi/linux/videodev2.h:199: WARNING: Invalid xref: c:type:`v4l2_memory`. Possible alternatives:
        c:type:`v4l2_meta_format` (from v4l/dev-meta)
        c:type:`v4l2_rect` (from v4l/dev-overlay)
        c:type:`v4l2_area` (from v4l/ext-ctrls-image-source) [ref.missing]
  ...
  include/uapi/linux/videodev2.h:1985: WARNING: Invalid xref: c:type:`V4L.v4l2_queryctrl`. Possible alternatives:
        std:label:`v4l2-queryctrl` (from v4l/vidioc-queryctrl)
        std:label:`v4l2-query-ext-ctrl` (from v4l/vidioc-queryctrl)

At the first example, it was not a typo, but a symbol that doesn't
seem to be properly documented. The second example points to
v4l2-queryctrl, which is a close match for the symbol.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_include.py | 62 +++++++++++++-------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index 895646da7495..75e139287d50 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -87,6 +87,8 @@ import os.path
 import re
 import sys
 
+from difflib import get_close_matches
+
 from docutils import io, nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import Directive, directives
@@ -401,8 +403,8 @@ class KernelInclude(Directive):
 # ==============================================================================
 
 reported = set()
-
 DOMAIN_INFO = {}
+all_refs = {}
 
 def fill_domain_info(env):
     """
@@ -419,47 +421,43 @@ def fill_domain_info(env):
             # Ignore domains that we can't retrieve object types, if any
             pass
 
+    for domain in DOMAIN_INFO.keys():
+        domain_obj = env.get_domain(domain)
+        for name, dispname, objtype, docname, anchor, priority in domain_obj.get_objects():
+            ref_name = name.lower()
+
+            if domain == "c":
+                if '.' in ref_name:
+                    ref_name = ref_name.split(".")[-1]
+
+            if not ref_name in all_refs:
+                all_refs[ref_name] = []
+
+            all_refs[ref_name].append(f"\t{domain}:{objtype}:`{name}` (from {docname})")
+
 def get_suggestions(app, env, node,
                     original_target, original_domain, original_reftype):
     """Check if target exists in the other domain or with different reftypes."""
     original_target = original_target.lower()
 
     # Remove namespace if present
-    if '.' in original_target:
-        original_target = original_target.split(".")[-1]
-
-    targets = set([
-        original_target,
-        original_target.replace("-", "_"),
-        original_target.replace("_", "-"),
-    ])
-
-    # Propose some suggestions, if possible
-    # The code below checks not only variants of the target, but also it
-    # works when .. c:namespace:: targets setting a different C namespace
-    # is in place
+    if original_domain == "c":
+        if '.' in original_target:
+            original_target = original_target.split(".")[-1]
 
     suggestions = []
-    for target in sorted(targets):
-        for domain in DOMAIN_INFO.keys():
-            domain_obj = env.get_domain(domain)
-            for name, dispname, objtype, docname, anchor, priority in domain_obj.get_objects():
-                lower_name = name.lower()
 
-                if domain == "c":
-                    # Check if name belongs to a different C namespace
-                    match = RE_SPLIT_DOMAIN.match(name)
-                    if match:
-                        if target != match.group(2).lower():
-                            continue
-                    else:
-                        if target !=  lower_name:
-                            continue
-                else:
-                    if target != lower_name:
-                        continue
+    # If name exists, propose exact name match on different domains
+    if original_target in all_refs:
+        return all_refs[original_target]
 
-                suggestions.append(f"\t{domain}:{objtype}:`{name}` (from {docname})")
+    # If not found, get a close match, using difflib.
+    # Such method is based on Ratcliff-Obershelp Algorithm, which seeks
+    # for a close match within a certain distance. We're using the defaults
+    # here, e.g. cutoff=0.6, proposing 3 alternatives
+    matches = get_close_matches(original_target, all_refs.keys())
+    for match in matches:
+        suggestions += all_refs[match]
 
     return suggestions
 
-- 
2.51.0


