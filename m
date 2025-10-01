Return-Path: <linux-media+bounces-43473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 785E1BB0DA8
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633D61947908
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAC43043B3;
	Wed,  1 Oct 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppegjNb8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5F82DECDD;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=im3kxja3aBFwygxItvDMD2i5BcmqS0s2dNAnpZa+Ibr2+6wWDDyF0tdOhbJPM+YGjx0X5oKvsCpFosf4PjAyHUOLnIKNJcJvmsYs5yLzcaJwHNlNcsg8hBq7tEx2NeMuSM89trc83XLV9we2UN2MsU9DWcswWiIy26BhQVon89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=qB159IYUOz+MSNR6iulmqvylalzUczQT+mGqT4T/ngs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6fkISdnrm9aaHUnfg9wLtk3IsjQiGm3Qufn8PjMlQhENFahjZW9MlQmlZvICFwcblUHu61QN1y77OPoqIMJuzYvBodETVjDos3qgdP5gZhqFu9s3hlIfngY3tFqEb4R7nhMt0C0COwtWNS5pBZVOKLXlO1XArPFSsFFz2JzEVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppegjNb8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022D0C4AF09;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=qB159IYUOz+MSNR6iulmqvylalzUczQT+mGqT4T/ngs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ppegjNb8B4VJfFLes6+pEWUlE3jpRc5heDj0Do6dQJrxxxJIMoGXbZHeXu/+LEat8
	 wmtZHYuntupy4g8K3gh/oa2MctkjfR310JQdPEtKAtPcvbgGUEg3XNf7X1+lVKLXeN
	 KHqjCugHd3JOqENkjmlblzsJqsTPabEhb0CakKhBqe6uGh10tv6p6ogWmlpe+B/rxv
	 DKc3744YL9kdOis+MN8/K0oV44uqawjKFhbBqveaXV1XYwSWzNSqc3/97e8eAnN4kN
	 E/t4H5ISHWHeah/2FhhSDHPWZCzUUbzV8ylJatQen9Gf+p0prBeN59HhyVhTzQRw2M
	 ANBLvK367FVYA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIB-0pcH;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 03/23] docs: kernel_include.py: fix line numbers for TOC
Date: Wed,  1 Oct 2025 16:49:26 +0200
Message-ID: <74eed96e32f79eaaef7a99ffe7c3224fed369c27.1759329363.git.mchehab+huawei@kernel.org>
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

On TOC output, we need to embeed line numbers with ViewList.

Change the parse class to produce a line-number parsed result,
and adjust the output accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_include.py | 36 ++++++++++++++++----------
 tools/docs/lib/parse_data_structs.py   |  2 +-
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index f94412cd17c9..ed819e9821c2 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -104,6 +104,7 @@ logger = logging.getLogger(__name__)
 
 RE_DOMAIN_REF = re.compile(r'\\ :(ref|c:type|c:func):`([^<`]+)(?:<([^>]+)>)?`\\')
 RE_SIMPLE_REF = re.compile(r'`([^`]+)`')
+RE_LINENO_REF = re.compile(r'^\s*-\s+LINENO_(\d+):\s+(.*)')
 
 def ErrorString(exc):  # Shamelessly stolen from docutils
     return f'{exc.__class__.__name}: {exc}'
@@ -242,23 +243,32 @@ class KernelInclude(Directive):
         # TOC output is a ReST file, not a literal. So, we can add line
         # numbers
 
-        rawtext = parser.gen_toc()
-
-        include_lines = statemachine.string2lines(rawtext, tab_width,
-                                                  convert_whitespace=True)
-
-        # Append line numbers data
-
         startline = self.options.get('start-line', None)
+        endline = self.options.get('end-line', None)
+
+        relpath = os.path.relpath(path, srctree)
 
         result = ViewList()
-        if startline and startline > 0:
-            offset = startline - 1
-        else:
-            offset = 0
+        for line in parser.gen_toc().split("\n"):
+            match = RE_LINENO_REF.match(line)
+            if not match:
+                result.append(line, path)
+                continue
 
-        for ln, line in enumerate(include_lines, start=offset):
-            result.append(line, path, ln)
+            ln, ref = match.groups()
+            ln = int(ln)
+
+            # Filter line range if needed
+            if startline and (ln < startline):
+                continue
+
+            if endline and (ln > endline):
+                continue
+
+            # Sphinx numerates starting with zero, but text editors
+            # and other tools start from one
+            realln = ln + 1
+            result.append(f"- {ref}: {relpath}#{realln}", path, ln)
 
         self.state_machine.insert_input(result, path)
 
diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
index d28471a045f1..9ad621712103 100755
--- a/tools/docs/lib/parse_data_structs.py
+++ b/tools/docs/lib/parse_data_structs.py
@@ -422,7 +422,7 @@ class ParseDataStructs:
 
             # Sort symbols alphabetically
             for symbol, (ref, ln) in sorted(refs.items()):
-                text.append(f"* {ref}: line #{ln}")
+                text.append(f"- LINENO_{ln}: {ref}")
 
             text.append("")  # Add empty line between categories
 
-- 
2.51.0


