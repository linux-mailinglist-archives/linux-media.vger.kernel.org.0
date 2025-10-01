Return-Path: <linux-media+bounces-43475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F706BB0DA2
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D2A17CAA2
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4503043BD;
	Wed,  1 Oct 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBg0h8Rt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5352773F3;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=RzND6hli3JHnP4JKAVo9yVnj/KoOsBRwe6IOqqZrHEj++3CXJ6rBjj6wDiQViAnsHwt2cN2+e/5rAHWxsnlWOlOsNWYfvvg8K+qbDqEOhyqDQYOEYWjF4CBem89BVhk5XUOfzarizAZHNgGTMG1ZX11cNfWKuGl4urrmi7tVbPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=zSEgAo72B96PVvkyzVvVvzPA6asz0cr2DairSiNfMhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzUiVUf0CY6r/iZ1TsnbfHkCuOpFYf+FS1R7dvL65xR4hxwKx7hUUaOYUq8IOkNhPhxWkpwS6o32nTYqhNg15jeT3Sjr7E4LaTvASf8j2/OHBT1DuMbJdIRcV9l4Ax/RhsMrLbe+SWz1xVugqFnP/nIpUAmwdXHDITDTM7uQvv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBg0h8Rt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A3AC4CEF5;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=zSEgAo72B96PVvkyzVvVvzPA6asz0cr2DairSiNfMhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBg0h8Rt7Yclm3TFlJ9JQ2RK5h5GTA8U4a4pB6ZrcuECEqjTOV9h4Ze+LDMlDH/Hs
	 0JY9d7a3B7AEXUvw3MEG01hDcC19xViNeusALoWlyI7ZQz9NEvcsMUMPicRlWj/N08
	 y/CxhwN5/LacDrzhbo9McqPY3OsuS2doq59/TgRaLaE1c9AA83QU0XWJPoohJp/8aO
	 1P7OS6thz+gA+qYtYS6YkG+1lDfbibSqeCC4qHTA7KqYJlzZ/Mg5AJwj6HCfk5/IxO
	 r9PjaU5VLVZ/ungdJQ63Uqvex6jaUn0QV88EXPiu2ptYsXjh/Tfvk488O+99nPFeHo
	 EyGzGOki8HrKQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIN-1CHp;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 06/23] tools: docs: parse_data_structs.py: get rid of process_exceptions()
Date: Wed,  1 Oct 2025 16:49:29 +0200
Message-ID: <8575bbc94ff706aa7e7cc3a188399ca17a3169e6.1759329363.git.mchehab+huawei@kernel.org>
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

Add an extra parameter to parse_file to make it handle exceptions
internally, cleaning up the API.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_include.py |   6 +-
 tools/docs/lib/parse_data_structs.py   | 105 ++++++++++++-------------
 tools/docs/parse-headers.py            |   5 +-
 3 files changed, 56 insertions(+), 60 deletions(-)

diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index e8f7e7a49758..895646da7495 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -214,14 +214,16 @@ class KernelInclude(Directive):
         - a TOC table containing cross references.
         """
         parser = ParseDataStructs()
-        parser.parse_file(path)
 
         if 'exception-file' in self.options:
             source_dir = os.path.dirname(os.path.abspath(
                 self.state_machine.input_lines.source(
                     self.lineno - self.state_machine.input_offset - 1)))
             exceptions_file = os.path.join(source_dir, self.options['exception-file'])
-            parser.process_exceptions(exceptions_file)
+        else:
+            exceptions_file = None
+
+        parser.parse_file(path, exceptions_file)
 
         # Store references on a symbol dict to be used at check time
         if 'warn-broken' in self.options:
diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
index 46535a05ea4a..cbdbf7dfe785 100755
--- a/tools/docs/lib/parse_data_structs.py
+++ b/tools/docs/lib/parse_data_structs.py
@@ -175,6 +175,54 @@ class ParseDataStructs:
 
                 sys.exit(f"{name}:{ln}: invalid line: {line}")
 
+    def apply_exceptions(self):
+        """
+        Process exceptions file with rules to ignore or replace references.
+        """
+
+        # Handle ignore rules
+        for ln, c_type, symbol in self.ignore:
+            if c_type not in self.DEF_SYMBOL_TYPES:
+                sys.exit(f"{name}:{ln}: {c_type} is invalid")
+
+            d = self.symbols[c_type]
+            if symbol in d:
+                del d[symbol]
+
+        # Handle replace rules
+        for ln, c_type, old, new in self.replace:
+            if c_type not in self.DEF_SYMBOL_TYPES:
+                sys.exit(f"{name}:{ln}: {c_type} is invalid")
+
+            reftype = None
+
+            # Parse reference type when the type is specified
+
+            match = re.match(r"^\:c\:(data|func|macro|type)\:\`(.+)\`", new)
+            if match:
+                reftype = f":c:{match.group(1)}"
+                new = match.group(2)
+            else:
+                match = re.search(r"(\:ref)\:\`(.+)\`", new)
+                if match:
+                    reftype = match.group(1)
+                    new = match.group(2)
+
+            # If the replacement rule doesn't have a type, get default
+            if not reftype:
+                reftype = self.DEF_SYMBOL_TYPES[c_type].get("ref_type")
+                if not reftype:
+                    reftype = self.DEF_SYMBOL_TYPES[c_type].get("real_type")
+
+            new_ref = f"{reftype}:`{old} <{new}>`"
+
+            # Change self.symbols to use the replacement rule
+            if old in self.symbols[c_type]:
+                (_, ln) = self.symbols[c_type][old]
+                self.symbols[c_type][old] = (new_ref, ln)
+            else:
+                print(f"{name}:{ln}: Warning: can't find {old} {c_type}")
+
     def store_type(self, ln, symbol_type: str, symbol: str,
                    ref_name: str = None, replace_underscores: bool = True):
         """
@@ -211,13 +259,15 @@ class ParseDataStructs:
         line = "    " + line.expandtabs()
         self.data += line.rstrip(" ")
 
-    def parse_file(self, file_in: str):
+    def parse_file(self, file_in: str, exceptions: str = None):
         """Reads a C source file and get identifiers"""
         self.data = ""
         is_enum = False
         is_comment = False
         multiline = ""
 
+        self.read_exceptions(exceptions)
+
         with open(file_in, "r",
                   encoding="utf-8", errors="backslashreplace") as f:
             for line_no, line in enumerate(f):
@@ -309,59 +359,6 @@ class ParseDataStructs:
                         self.store_type(line_no, "struct", match.group(1))
                         break
 
-    def apply_exceptions(self):
-        """
-        Process exceptions file with rules to ignore or replace references.
-        """
-
-        # Handle ignore rules
-        for ln, c_type, symbol in self.ignore:
-            if c_type not in self.DEF_SYMBOL_TYPES:
-                sys.exit(f"{name}:{ln}: {c_type} is invalid")
-
-            d = self.symbols[c_type]
-            if symbol in d:
-                del d[symbol]
-
-        # Handle replace rules
-        for ln, c_type, old, new in self.replace:
-            if c_type not in self.DEF_SYMBOL_TYPES:
-                sys.exit(f"{name}:{ln}: {c_type} is invalid")
-
-            reftype = None
-
-            # Parse reference type when the type is specified
-
-            match = re.match(r"^\:c\:(data|func|macro|type)\:\`(.+)\`", new)
-            if match:
-                reftype = f":c:{match.group(1)}"
-                new = match.group(2)
-            else:
-                match = re.search(r"(\:ref)\:\`(.+)\`", new)
-                if match:
-                    reftype = match.group(1)
-                    new = match.group(2)
-
-            # If the replacement rule doesn't have a type, get default
-            if not reftype:
-                reftype = self.DEF_SYMBOL_TYPES[c_type].get("ref_type")
-                if not reftype:
-                    reftype = self.DEF_SYMBOL_TYPES[c_type].get("real_type")
-
-            new_ref = f"{reftype}:`{old} <{new}>`"
-
-            # Change self.symbols to use the replacement rule
-            if old in self.symbols[c_type]:
-                (_, ln) = self.symbols[c_type][old]
-                self.symbols[c_type][old] = (new_ref, ln)
-            else:
-                print(f"{name}:{ln}: Warning: can't find {old} {c_type}")
-
-    def process_exceptions(self, fname: str):
-        """
-        Process exceptions file with rules to ignore or replace references.
-        """
-        self.read_exceptions(fname)
         self.apply_exceptions()
 
     def debug_print(self):
diff --git a/tools/docs/parse-headers.py b/tools/docs/parse-headers.py
index bfa4e46a53e3..6716c7300258 100755
--- a/tools/docs/parse-headers.py
+++ b/tools/docs/parse-headers.py
@@ -47,10 +47,7 @@ def main():
     args = parser.parse_args()
 
     parser = ParseDataStructs(debug=args.debug)
-    parser.parse_file(args.file_in)
-
-    if args.file_rules:
-        parser.process_exceptions(args.file_rules)
+    parser.parse_file(args.file_in, args.file_rules)
 
     parser.debug_print()
     parser.write_output(args.file_in, args.file_out, args.toc)
-- 
2.51.0


