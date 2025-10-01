Return-Path: <linux-media+bounces-43476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C6BB0DAB
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3FB117F6C3
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449A83043D0;
	Wed,  1 Oct 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGx6QR84"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6AC2E54DE;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=u3lbz6Ke6k9S6CPNz5lmZjB5izDqfi++fltYbJvjPQS/2enzbn6Q7FykefcvMmqgJu55qNvUWcv1OC4t5jScjGfuUY/fgDQa38uESiKc0wwDIpQbyVXNCbiaBSALr3Gn8CEqzigp1U1sIe4zhRhK4xUfUgrSokWhJRNR9RRlp1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=3CTScuwxC9ZYFhvKDygUTwinDqi3MU7C1ktyjxp78ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0H3kbiGArCxvL6gqGXrto52KV6RsbkucwGvKMlDvkYDrXUxzLpr9DUup2MCe/wFkOoyJOfelXI81Ef712VeHohJMeGaIg2Ku/hrRfzvp/hEIn9yR4P5KxlM1OzWpEbTKG8tVfMANp/SffyAfQKXsx17/nTenJlX5/LbnMLnTgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGx6QR84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FABC4CEFA;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=3CTScuwxC9ZYFhvKDygUTwinDqi3MU7C1ktyjxp78ZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGx6QR846NsCLlOPyb53nZiJLHRWcoYy+OtbF50kSnwmLr+Q1R4gmKtqhqVkXRl2F
	 kcljejHtbGFUjAmSLE9o/FaKuXl5YlzDpOmNOypCktZCtOrCy7zs4B0QUbUC6lnSCm
	 G1yC3hLO8G4SyJ4d4TIee0yjoNQNolhUcHjXMYVqLdtKSD/TUYUgXBb+29NzhzlY/a
	 pWH/nr/OKcyRhM4EZ9ylewbmEmJ11wca6z3Kj82slzz5m8IbfTfDypwvhz6L5u2TZP
	 v9mfZQk3FyCJSf7OGknzMS55DOMr237gMTZHb4vzxDWHcuwJT54wygDDXrCbCmtvHc
	 H4pq0bWitWY+Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIJ-14t7;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 05/23] tools: docs: parse_data_structs: make process_exceptions two stages
Date: Wed,  1 Oct 2025 16:49:28 +0200
Message-ID: <da9ca5f2ce1ffcfb355e32e676ff013607c227e0.1759329363.git.mchehab+huawei@kernel.org>
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

Split the logic which parses exceptions on two stages, preparing
the exceptions file to have rules that will affect xref generation.

For now, preserve the original API.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/lib/parse_data_structs.py | 125 +++++++++++++++------------
 1 file changed, 71 insertions(+), 54 deletions(-)

diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
index 9ad621712103..46535a05ea4a 100755
--- a/tools/docs/lib/parse_data_structs.py
+++ b/tools/docs/lib/parse_data_structs.py
@@ -140,9 +140,41 @@ class ParseDataStructs:
 
         self.symbols = {}
 
+        self.ignore = []
+        self.replace = []
+
         for symbol_type in self.DEF_SYMBOL_TYPES:
             self.symbols[symbol_type] = {}
 
+    def read_exceptions(self, fname: str):
+        if not fname:
+            return
+
+        name = os.path.basename(fname)
+
+        with open(fname, "r", encoding="utf-8", errors="backslashreplace") as f:
+            for ln, line in enumerate(f):
+                ln += 1
+                line = line.strip()
+                if not line or line.startswith("#"):
+                    continue
+
+                # ignore rules
+                match = re.match(r"^ignore\s+(\w+)\s+(\S+)", line)
+
+                if match:
+                    self.ignore.append((ln, match.group(1), match.group(2)))
+                    continue
+
+                # replace rules
+                match = re.match(r"^replace\s+(\S+)\s+(\S+)\s+(\S+)", line)
+                if match:
+                    self.replace.append((ln, match.group(1), match.group(2),
+                                         match.group(3)))
+                    continue
+
+                sys.exit(f"{name}:{ln}: invalid line: {line}")
+
     def store_type(self, ln, symbol_type: str, symbol: str,
                    ref_name: str = None, replace_underscores: bool = True):
         """
@@ -277,75 +309,60 @@ class ParseDataStructs:
                         self.store_type(line_no, "struct", match.group(1))
                         break
 
-    def process_exceptions(self, fname: str):
+    def apply_exceptions(self):
         """
         Process exceptions file with rules to ignore or replace references.
         """
-        if not fname:
-            return
 
-        name = os.path.basename(fname)
+        # Handle ignore rules
+        for ln, c_type, symbol in self.ignore:
+            if c_type not in self.DEF_SYMBOL_TYPES:
+                sys.exit(f"{name}:{ln}: {c_type} is invalid")
 
-        with open(fname, "r", encoding="utf-8", errors="backslashreplace") as f:
-            for ln, line in enumerate(f):
-                ln += 1
-                line = line.strip()
-                if not line or line.startswith("#"):
-                    continue
+            d = self.symbols[c_type]
+            if symbol in d:
+                del d[symbol]
 
-                # Handle ignore rules
-                match = re.match(r"^ignore\s+(\w+)\s+(\S+)", line)
-                if match:
-                    c_type = match.group(1)
-                    symbol = match.group(2)
-
-                    if c_type not in self.DEF_SYMBOL_TYPES:
-                        sys.exit(f"{name}:{ln}: {c_type} is invalid")
-
-                    d = self.symbols[c_type]
-                    if symbol in d:
-                        del d[symbol]
-
-                    continue
-
-                # Handle replace rules
-                match = re.match(r"^replace\s+(\S+)\s+(\S+)\s+(\S+)", line)
-                if not match:
-                    sys.exit(f"{name}:{ln}: invalid line: {line}")
-
-                c_type, old, new = match.groups()
-
-                if c_type not in self.DEF_SYMBOL_TYPES:
-                    sys.exit(f"{name}:{ln}: {c_type} is invalid")
+        # Handle replace rules
+        for ln, c_type, old, new in self.replace:
+            if c_type not in self.DEF_SYMBOL_TYPES:
+                sys.exit(f"{name}:{ln}: {c_type} is invalid")
 
-                reftype = None
+            reftype = None
 
-                # Parse reference type when the type is specified
+            # Parse reference type when the type is specified
 
-                match = re.match(r"^\:c\:(data|func|macro|type)\:\`(.+)\`", new)
+            match = re.match(r"^\:c\:(data|func|macro|type)\:\`(.+)\`", new)
+            if match:
+                reftype = f":c:{match.group(1)}"
+                new = match.group(2)
+            else:
+                match = re.search(r"(\:ref)\:\`(.+)\`", new)
                 if match:
-                    reftype = f":c:{match.group(1)}"
+                    reftype = match.group(1)
                     new = match.group(2)
-                else:
-                    match = re.search(r"(\:ref)\:\`(.+)\`", new)
-                    if match:
-                        reftype = match.group(1)
-                        new = match.group(2)
 
-                # If the replacement rule doesn't have a type, get default
+            # If the replacement rule doesn't have a type, get default
+            if not reftype:
+                reftype = self.DEF_SYMBOL_TYPES[c_type].get("ref_type")
                 if not reftype:
-                    reftype = self.DEF_SYMBOL_TYPES[c_type].get("ref_type")
-                    if not reftype:
-                        reftype = self.DEF_SYMBOL_TYPES[c_type].get("real_type")
+                    reftype = self.DEF_SYMBOL_TYPES[c_type].get("real_type")
 
-                new_ref = f"{reftype}:`{old} <{new}>`"
+            new_ref = f"{reftype}:`{old} <{new}>`"
 
-                # Change self.symbols to use the replacement rule
-                if old in self.symbols[c_type]:
-                    (_, ln) = self.symbols[c_type][old]
-                    self.symbols[c_type][old] = (new_ref, ln)
-                else:
-                    print(f"{name}:{ln}: Warning: can't find {old} {c_type}")
+            # Change self.symbols to use the replacement rule
+            if old in self.symbols[c_type]:
+                (_, ln) = self.symbols[c_type][old]
+                self.symbols[c_type][old] = (new_ref, ln)
+            else:
+                print(f"{name}:{ln}: Warning: can't find {old} {c_type}")
+
+    def process_exceptions(self, fname: str):
+        """
+        Process exceptions file with rules to ignore or replace references.
+        """
+        self.read_exceptions(fname)
+        self.apply_exceptions()
 
     def debug_print(self):
         """
-- 
2.51.0


