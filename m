Return-Path: <linux-media+bounces-43472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8156BB0DE4
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63F123B1F5F
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBDC30277F;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpNusqsm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A0275B03;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=kvu3p98+UCMt9r4T/XDG94BRgi7TVsyboAwPzaySuAu5yQULjFQcHr97A513KcBWe4Z7mLgwiIgNyUw0xoeecJwNi9FMl2bJbdNR6X+RjpiwwJkeBdXsdrF7unqInFba5+3Lw4U6ta9H1gt6jny9jlv8hl3fx4G2Isuuo81HPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=zUpIh7TsawGQocua17V5HvZQPsi7cqtACBD6mHMYWK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLPOTGdB89DxtES7ngZNIXaudtimy9ZmN2H4SIq/+JXgr5K6zdu7Ooy8uZR2pTXNEA1Jwka/NWFB3e+ZUgLLqAG8iuAbDyFZ7D1/rQtRrSYZcUiwrAxYTilcwpfuE/Zm0JyRzXeR5PGiia0j4Ej1R5fDwUDI1hwYCGYmrzzDIeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpNusqsm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02678C4AF0B;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=zUpIh7TsawGQocua17V5HvZQPsi7cqtACBD6mHMYWK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mpNusqsmJ3KrdxMODuXBevUmUUwGkKQlhSIG1+1ioeqewQzhH1a1LN2446DbVWUcl
	 uFD2laD7v5yapugZcygArhpkHFMIMlWQdr8ca50HE1N7DBZF7H+rykeYF849KVeI5s
	 eY2lM1DtRAju2hf6ycCLpCFNe0i+SGBzC9ElGp756XiuOrN+adRdyvnGavpEhSm8DN
	 BPlINKgHmYk8IWe+RtbTrBnqhodufH3OHP4qW2MADWVPCiCB+7TwcOwyb3TAYgHkxK
	 He+Q62wNoQJbij4bxoPcFRauytnwHXJZKBcphuuwGO+tQRR/3e52IVAyEVw7quomJw
	 oMpOOt7yGjn+Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLI7-0i2n;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 02/23] tools: docs: parse_data_structs.py: output a line number
Date: Wed,  1 Oct 2025 16:49:25 +0200
Message-ID: <dcffa6844dede00052f5fb851a857991468f22b5.1759329363.git.mchehab+huawei@kernel.org>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/lib/parse_data_structs.py | 29 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
index 6c868f84f029..d28471a045f1 100755
--- a/tools/docs/lib/parse_data_structs.py
+++ b/tools/docs/lib/parse_data_structs.py
@@ -143,7 +143,7 @@ class ParseDataStructs:
         for symbol_type in self.DEF_SYMBOL_TYPES:
             self.symbols[symbol_type] = {}
 
-    def store_type(self, symbol_type: str, symbol: str,
+    def store_type(self, ln, symbol_type: str, symbol: str,
                    ref_name: str = None, replace_underscores: bool = True):
         """
         Stores a new symbol at self.symbols under symbol_type.
@@ -172,7 +172,7 @@ class ParseDataStructs:
         else:
             ref_link = symbol
 
-        self.symbols[symbol_type][symbol] = f"{prefix}{ref_link}{suffix}"
+        self.symbols[symbol_type][symbol] = (f"{prefix}{ref_link}{suffix}", ln)
 
     def store_line(self, line):
         """Stores a line at self.data, properly indented"""
@@ -240,20 +240,20 @@ class ParseDataStructs:
                 if is_enum:
                     match = re.match(r"^\s*([_\w][\w\d_]+)\s*[\,=]?", line)
                     if match:
-                        self.store_type("symbol", match.group(1))
+                        self.store_type(line_no, "symbol", match.group(1))
                     if "}" in line:
                         is_enum = False
                     continue
 
                 match = re.match(r"^\s*#\s*define\s+([\w_]+)\s+_IO", line)
                 if match:
-                    self.store_type("ioctl", match.group(1),
+                    self.store_type(line_no, "ioctl", match.group(1),
                                     replace_underscores=False)
                     continue
 
                 match = re.match(r"^\s*#\s*define\s+([\w_]+)(\s+|$)", line)
                 if match:
-                    self.store_type("define", match.group(1))
+                    self.store_type(line_no, "define", match.group(1))
                     continue
 
                 match = re.match(r"^\s*typedef\s+([_\w][\w\d_]+)\s+(.*)\s+([_\w][\w\d_]+);",
@@ -261,20 +261,20 @@ class ParseDataStructs:
                 if match:
                     name = match.group(2).strip()
                     symbol = match.group(3)
-                    self.store_type("typedef", symbol, ref_name=name)
+                    self.store_type(line_no, "typedef", symbol, ref_name=name)
                     continue
 
                 for re_enum in self.RE_ENUMS:
                     match = re_enum.match(line)
                     if match:
-                        self.store_type("enum", match.group(1))
+                        self.store_type(line_no, "enum", match.group(1))
                         is_enum = True
                         break
 
                 for re_struct in self.RE_STRUCTS:
                     match = re_struct.match(line)
                     if match:
-                        self.store_type("struct", match.group(1))
+                        self.store_type(line_no, "struct", match.group(1))
                         break
 
     def process_exceptions(self, fname: str):
@@ -342,7 +342,8 @@ class ParseDataStructs:
 
                 # Change self.symbols to use the replacement rule
                 if old in self.symbols[c_type]:
-                    self.symbols[c_type][old] = new_ref
+                    (_, ln) = self.symbols[c_type][old]
+                    self.symbols[c_type][old] = (new_ref, ln)
                 else:
                     print(f"{name}:{ln}: Warning: can't find {old} {c_type}")
 
@@ -360,8 +361,8 @@ class ParseDataStructs:
 
             print(f"{c_type}:")
 
-            for symbol, ref in sorted(refs.items()):
-                print(f"  {symbol} -> {ref}")
+            for symbol, (ref, ln) in sorted(refs.items()):
+                print(f"  #{ln:<5d} {symbol} -> {ref}")
 
             print()
 
@@ -384,7 +385,7 @@ class ParseDataStructs:
 
         # Process all reference types
         for ref_dict in self.symbols.values():
-            for symbol, replacement in ref_dict.items():
+            for symbol, (replacement, _) in ref_dict.items():
                 symbol = re.escape(re.sub(r"([\_\`\*\<\>\&\\\\:\/])", r"\\\1", symbol))
                 text = re.sub(fr'{start_delim}{symbol}{end_delim}',
                               fr'\1{replacement}\2', text)
@@ -420,8 +421,8 @@ class ParseDataStructs:
             text.append("")
 
             # Sort symbols alphabetically
-            for symbol, ref in sorted(refs.items()):
-                text.append(f"* :{ref}:")
+            for symbol, (ref, ln) in sorted(refs.items()):
+                text.append(f"* {ref}: line #{ln}")
 
             text.append("")  # Add empty line between categories
 
-- 
2.51.0


