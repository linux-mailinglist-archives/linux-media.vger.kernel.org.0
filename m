Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA7141876D
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhIZIfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:22 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:39161 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229894AbhIZIfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:20 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U6LtmGvqUps7PUPbRmzSH3; Sun, 26 Sep 2021 08:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645222; bh=57g/H0MT18mIwqR5ZwRAz2ZlA/WoXz3S0mUHsZqXyRk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BMgPO+Jf5D+aj045+ywocMf//gIIEzKhNwLM5TwQSHh1lNtmCO9j0D/hIWVJYHOD+
         O4ZWMbt4Kbey8YfTzB6wqugeGLeH0rmwGVtVkDP4f4weYOAkxZUAcxPoy+cPf0YgJB
         56DxuaQNeR7p2BppsQWNrHuha0+E7YaMJlD+JyBxwyGe4A44kzKtxaD8HGnhWJRpLA
         lYAYHUZVMOTe+HQ4jaWFu6r35J1NHpafx1mbzvfxk1SSyaiK1IsTwjvW3i2nr73qLs
         18tDS21Gcj1Hug4RyIbQoIOlVoam7Yh4+pA6yVKwHJJB/n8FtSQs7TlDFrwYSbxUun
         rk2hPbqKV2Syw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbRm6iFN; Sun, 26 Sep 2021 08:33:41 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503065
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=wA_Q9vgazLIMpfE_LfMA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 18/29] edid-decode: move parse_displayid_block inner loop
Date:   Sun, 26 Sep 2021 01:33:19 -0700
Message-Id: <20210926083330.5206-19-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGWXBY4HvalrRx/3DaJvAGBBeTSVFDda6tc4rcB80y3y6T1C4yyoE9uROdofOyHrUP1OnGZqSYavEPTHEUUqpyL7Qw59Q+VBuzgMostAsbRCXk651a4b
 b6dBlsTsmtihdblvjJ+XMS5hLiayLoTIJE0HmaqWTbldUVK+KARyuPRZxqOsSe55AzSKJ4OaymBISk/QCClR46HlIYSBiSzjGZw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move it to a new function displayid_block. Then we can simplify it later.
This is mostly just a copy/paste. No output should change.
The new function returns 0xff for len to signal a break from the loop in parse_displayid_block. That will be cleaned up later.

first_data_block is replaced with dispid.block_number (similar to cta.block_number)

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.h             |  3 ++
 parse-displayid-block.cpp | 95 +++++++++++++++++++++------------------
 2 files changed, 54 insertions(+), 44 deletions(-)

diff --git a/edid-decode.h b/edid-decode.h
index dbc00c2..4636978 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -176,6 +176,7 @@ struct edid_state {
 		dispid.is_display = dispid.has_product_identification =
 			dispid.has_display_parameters = dispid.has_type_1_7 =
 			dispid.has_display_interface_features = false;
+		dispid.block_number = 0;
 
 		// Block Map block state
 		block_map.saw_block_1 = false;
@@ -283,6 +284,7 @@ struct edid_state {
 		bool has_display_interface_features;
 		vec_timings_ext preferred_timings;
 		unsigned native_width, native_height;
+		unsigned block_number;
 		// Keep track of the found CTA-861 Tag/Extended Tag pairs.
 		// The unsigned value is equal to: (tag << 8) | ext_tag
 		std::set<unsigned> found_tags;
@@ -393,6 +395,7 @@ struct edid_state {
 	void parse_displayid_type_10_timing(const unsigned char *x, unsigned sz,
 					    bool is_cta = false);
 	void preparse_displayid_block(const unsigned char *x);
+	unsigned displayid_block(const unsigned version, const unsigned char *x, unsigned offset, unsigned length);
 	void parse_displayid_block(const unsigned char *x);
 	void parse_displayid_vesa(const unsigned char *x);
 	void parse_displayid_cta_data_block(const unsigned char *x);
diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index e4c3bff..0a996bd 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1651,47 +1651,9 @@ void edid_state::preparse_displayid_block(const unsigned char *x)
 	}
 }
 
-void edid_state::parse_displayid_block(const unsigned char *x)
+unsigned edid_state::displayid_block(const unsigned version, const unsigned char *x, unsigned offset, unsigned length)
 {
-	unsigned version = x[1];
-	unsigned length = x[2];
-	unsigned prod_type = x[3]; // future check: based on type, check for required data blocks
-	unsigned ext_count = x[4];
 	unsigned i;
-
-	printf("  Version: %u.%u\n  Extension Count: %u\n",
-	       version >> 4, version & 0xf, ext_count);
-
-	if (dispid.is_base_block) {
-		dispid.version = version;
-		printf("  %s: %s\n", product_type(prod_type, true).c_str(),
-		       product_type(prod_type, false).c_str());
-		if (!prod_type)
-			fail("DisplayID Base Block has no product type.\n");
-		if (ext_count != dispid.preparsed_displayid_blocks - 1)
-			fail("Expected %u DisplayID Extension Block%s, but got %u.\n",
-			     ext_count,
-			     ext_count > 1 ? "s" : "",
-			     dispid.preparsed_displayid_blocks - 1);
-	} else {
-		if (prod_type)
-			fail("Product Type should be 0 in extension block.\n");
-		if (ext_count)
-			fail("Extension Count should be 0 in extension block.\n");
-		if (version != dispid.version)
-			fail("Got version %u.%u, expected %u.%u.\n",
-			     version >> 4, version & 0xf,
-			     dispid.version >> 4, dispid.version & 0xf);
-	}
-
-	if (length > 121) {
-		fail("DisplayID length %d is greater than 121.\n", length);
-		length = 121;
-	}
-
-	unsigned offset = 5;
-	bool first_data_block = true;
-	while (length > 0) {
 		unsigned tag = x[offset];
 		unsigned oui = 0;
 
@@ -1773,7 +1735,7 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 			if (tag || x[offset + 1]) {
 				fail("Not enough bytes remain (%d) for a DisplayID data block or the DisplayID filler is non-0.\n", length);
 			}
-			break;
+		return 0xff;
 		}
 
 		unsigned block_rev = x[offset + 1] & 0x07;
@@ -1781,7 +1743,7 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 
 		if (length < len + 3) {
 			fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
-			break;
+		return 0xff;
 		}
 
 		if (!tag && !len) {
@@ -1789,7 +1751,7 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 			if (!memchk(x + offset, length)) {
 				fail("Non-0 filler bytes in the DisplayID block.\n");
 			}
-			break;
+		return 0xff;
 		}
 
 		printf("  %s:\n", data_block.c_str());
@@ -1925,12 +1887,57 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 		}
 
 		if ((tag == 0x00 || tag == 0x20) &&
-		    (!dispid.is_base_block || !first_data_block))
+		(!dispid.is_base_block || dispid.block_number > 0))
 			fail("%s is required to be the first DisplayID Data Block.\n",
 			     data_block.c_str());
+
+	dispid.block_number++;
+	return len;
+}
+
+void edid_state::parse_displayid_block(const unsigned char *x)
+{
+	unsigned version = x[1];
+	unsigned length = x[2];
+	unsigned prod_type = x[3]; // future check: based on type, check for required data blocks
+	unsigned ext_count = x[4];
+
+	printf("  Version: %u.%u\n  Extension Count: %u\n",
+	       version >> 4, version & 0xf, ext_count);
+
+	if (dispid.is_base_block) {
+		dispid.version = version;
+		printf("  %s: %s\n", product_type(prod_type, true).c_str(),
+		       product_type(prod_type, false).c_str());
+		if (!prod_type)
+			fail("DisplayID Base Block has no product type.\n");
+		if (ext_count != dispid.preparsed_displayid_blocks - 1)
+			fail("Expected %u DisplayID Extension Block%s, but got %u.\n",
+			     ext_count,
+			     ext_count > 1 ? "s" : "",
+			     dispid.preparsed_displayid_blocks - 1);
+	} else {
+		if (prod_type)
+			fail("Product Type should be 0 in extension block.\n");
+		if (ext_count)
+			fail("Extension Count should be 0 in extension block.\n");
+		if (version != dispid.version)
+			fail("Got version %u.%u, expected %u.%u.\n",
+			     version >> 4, version & 0xf,
+			     dispid.version >> 4, dispid.version & 0xf);
+	}
+
+	if (length > 121) {
+		fail("DisplayID length %d is greater than 121.\n", length);
+		length = 121;
+	}
+
+	unsigned offset = 5;
+	while (length > 0) {
+		unsigned len = displayid_block(version, x, offset, length);
+		if (len == 0xff) break;
 		length -= len + 3;
 		offset += len + 3;
-		first_data_block = false;
 	}
 
 	/*
-- 
2.24.3 (Apple Git-128)

