Return-Path: <linux-media+bounces-43486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF66BB0E26
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9615F4C3AE9
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E48830E843;
	Wed,  1 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h21DCwwn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49602FDC37;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=iimyCvGeN6UYZczIrPrhmHSWpk1AnFuPhDx4oqwxkBsXTBhAimTPdfONbI46RrDQtQ87+mO3s9TKkfuyt65vK+BCywQl8IqxHG/xrGmwyn6Nx4SUMaTp1spe5tvf5mu7DvXQjWXQuqfOzdYGL2MlEQ42S2y+Ei/idKm/nDTOCe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=7G19TBRqcSSvnXToM3u1Uoshyb2F1JhNkDvRwLoG1lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJy//TvEwJKtlwtYH3c9BvAcm42TPuci/3SPWuMJVrhozaiioNq6/bP99MKxys5iq0Gs03/FWh4v/IYDtFe3aqXb2Cno/drh765ZtufB41B59nmsXxRbBhncZbikUbq/rzVauyqyJTEFlCHBDIXYfbIOKwTaPB3tgh8MvywMYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h21DCwwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020F2C4CEFB;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=7G19TBRqcSSvnXToM3u1Uoshyb2F1JhNkDvRwLoG1lg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h21DCwwnNnwhWIgt4Nd/lj/Rg4FGlP3XWSWdLWAfdgLQf4PmN8DaAC3zSndlrfvfn
	 CsqAf2f38Jcu2Bexz1Clg8HdEYscqSpXU+U9Y8z4D5DOs/CGWApyaxeVfmA+1Q1a+p
	 5jra5MRayKt7kU4RN4YsUzIuBiIGwZ1LiNDDDslPfAGznWaJrQJCAcgOe0qDXtiIoh
	 JlK2a6BdpUPen0SMZwuOhdQ7Tan7v8iy3olTklAJWrOvr5VMEOBNa4usMMJlI6/IUl
	 LR6yBikgOYGLIks7WLVpUhVsvSV0aaMLMX9pNIME134kKw5laL5AFHKoZJJTP6ItBW
	 ON8UiGgOn65/g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIF-0xSI;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 04/23] docs: kernel_include.py: propose alternatives
Date: Wed,  1 Oct 2025 16:49:27 +0200
Message-ID: <4c75d277e950e619ea00ba2dea336853a4aac976.1759329363.git.mchehab+huawei@kernel.org>
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

Specially when using c::namespace, it is not hard to break
a reference by forgetting to add a domain. Also, different
cases and using "-"/"_" the wrong way are typical cases that
people often gets wrong.

We might use a more complex logic here to also check for typos,
but let's keep it plain, simple.

This is enough to get thos exeptions from media controller:

  .../include/uapi/linux/media.h:26: WARNING: Invalid xref: c:type:`media_device_info`. Possible alternatives:
	c:type:`MC.media_device_info` (from mediactl/media-ioc-device-info)
  .../include/uapi/linux/media.h:149: WARNING: Invalid xref: c:type:`media_entity_desc`. Possible alternatives:
	c:type:`MC.media_entity_desc` (from mediactl/media-ioc-enum-entities)
  .../include/uapi/linux/media.h:228: WARNING: Invalid xref: c:type:`media_link_desc`. Possible alternatives:
	c:type:`MC.media_link_desc` (from mediactl/media-ioc-enum-links)
  .../include/uapi/linux/media.h:235: WARNING: Invalid xref: c:type:`media_links_enum`. Possible alternatives:
	c:type:`MC.media_links_enum` (from mediactl/media-ioc-enum-links)
  .../include/uapi/linux/media.h:212: WARNING: Invalid xref: c:type:`media_pad_desc`. Possible alternatives:
	c:type:`MC.media_pad_desc` (from mediactl/media-ioc-enum-links)
  .../include/uapi/linux/media.h:298: WARNING: Invalid xref: c:type:`media_v2_entity`. Possible alternatives:
	c:type:`MC.media_v2_entity` (from mediactl/media-ioc-g-topology)
  .../include/uapi/linux/media.h:312: WARNING: Invalid xref: c:type:`media_v2_interface`. Possible alternatives:
	c:type:`MC.media_v2_interface` (from mediactl/media-ioc-g-topology)
  .../include/uapi/linux/media.h:307: WARNING: Invalid xref: c:type:`media_v2_intf_devnode`. Possible alternatives:
	c:type:`MC.media_v2_intf_devnode` (from mediactl/media-ioc-g-topology)
  .../include/uapi/linux/media.h:341: WARNING: Invalid xref: c:type:`media_v2_link`. Possible alternatives:
	c:type:`MC.media_v2_link` (from mediactl/media-ioc-g-topology)
  .../include/uapi/linux/media.h:333: WARNING: Invalid xref: c:type:`media_v2_pad`. Possible alternatives:
	c:type:`MC.media_v2_pad` (from mediactl/media-ioc-g-topology)
  .../include/uapi/linux/media.h:349: WARNING: Invalid xref: c:type:`media_v2_topology`. Possible alternatives:
	c:type:`MC.media_v2_topology` (from mediactl/media-ioc-g-topology)

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_include.py        | 70 ++++++++++++++++++-
 .../userspace-api/media/v4l/videodev.rst      |  8 ++-
 .../media/v4l/videodev2.h.rst.exceptions      |  3 +
 3 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index ed819e9821c2..e8f7e7a49758 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -105,6 +105,7 @@ logger = logging.getLogger(__name__)
 RE_DOMAIN_REF = re.compile(r'\\ :(ref|c:type|c:func):`([^<`]+)(?:<([^>]+)>)?`\\')
 RE_SIMPLE_REF = re.compile(r'`([^`]+)`')
 RE_LINENO_REF = re.compile(r'^\s*-\s+LINENO_(\d+):\s+(.*)')
+RE_SPLIT_DOMAIN = re.compile(r"(.*)\.(.*)")
 
 def ErrorString(exc):  # Shamelessly stolen from docutils
     return f'{exc.__class__.__name}: {exc}'
@@ -399,6 +400,67 @@ class KernelInclude(Directive):
 
 reported = set()
 
+DOMAIN_INFO = {}
+
+def fill_domain_info(env):
+    """
+    Get supported reference types for each Sphinx domain and C namespaces
+    """
+    if DOMAIN_INFO:
+        return
+
+    for domain_name, domain_instance in env.domains.items():
+        try:
+            object_types = list(domain_instance.object_types.keys())
+            DOMAIN_INFO[domain_name] = object_types
+        except AttributeError:
+            # Ignore domains that we can't retrieve object types, if any
+            pass
+
+def get_suggestions(app, env, node,
+                    original_target, original_domain, original_reftype):
+    """Check if target exists in the other domain or with different reftypes."""
+    original_target = original_target.lower()
+
+    # Remove namespace if present
+    if '.' in original_target:
+        original_target = original_target.split(".")[-1]
+
+    targets = set([
+        original_target,
+        original_target.replace("-", "_"),
+        original_target.replace("_", "-"),
+    ])
+
+    # Propose some suggestions, if possible
+    # The code below checks not only variants of the target, but also it
+    # works when .. c:namespace:: targets setting a different C namespace
+    # is in place
+
+    suggestions = []
+    for target in sorted(targets):
+        for domain in DOMAIN_INFO.keys():
+            domain_obj = env.get_domain(domain)
+            for name, dispname, objtype, docname, anchor, priority in domain_obj.get_objects():
+                lower_name = name.lower()
+
+                if domain == "c":
+                    # Check if name belongs to a different C namespace
+                    match = RE_SPLIT_DOMAIN.match(name)
+                    if match:
+                        if target != match.group(2).lower():
+                            continue
+                    else:
+                        if target !=  lower_name:
+                            continue
+                else:
+                    if target != lower_name:
+                        continue
+
+                suggestions.append(f"\t{domain}:{objtype}:`{name}` (from {docname})")
+
+    return suggestions
+
 def check_missing_refs(app, env, node, contnode):
     """Check broken refs for the files it creates xrefs"""
     if not node.source:
@@ -414,11 +476,13 @@ def check_missing_refs(app, env, node, contnode):
     if node.source not in xref_files:
         return None
 
+    fill_domain_info(env)
+
     target = node.get('reftarget', '')
     domain = node.get('refdomain', 'std')
     reftype = node.get('reftype', '')
 
-    msg = f"can't link to: {domain}:{reftype}:: {target}"
+    msg = f"Invalid xref: {domain}:{reftype}:`{target}`"
 
     # Don't duplicate warnings
     data = (node.source, msg)
@@ -426,6 +490,10 @@ def check_missing_refs(app, env, node, contnode):
         return None
     reported.add(data)
 
+    suggestions = get_suggestions(app, env, node, target, domain, reftype)
+    if suggestions:
+        msg += ". Possible alternatives:\n" + '\n'.join(suggestions)
+
     logger.warning(msg, location=node, type='ref', subtype='missing')
 
     return None
diff --git a/Documentation/userspace-api/media/v4l/videodev.rst b/Documentation/userspace-api/media/v4l/videodev.rst
index cde485bc9a5f..64be44716494 100644
--- a/Documentation/userspace-api/media/v4l/videodev.rst
+++ b/Documentation/userspace-api/media/v4l/videodev.rst
@@ -2,10 +2,12 @@
 
 .. _videodev:
 
-*******************************
-Video For Linux Two Header File
-*******************************
+***************************************
+Video For Linux Two Header uAPI Symbols
+***************************************
 
 .. kernel-include:: include/uapi/linux/videodev2.h
     :generate-cross-refs:
     :exception-file: videodev2.h.rst.exceptions
+    :toc:
+    :warn-broken:
diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 35d3456cc812..951d01bf7579 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# All symbols are mapped inside V4L C domain namespace
+namespace V4L
+
 # Ignore header name
 ignore define _UAPI__LINUX_VIDEODEV2_H
 
-- 
2.51.0


