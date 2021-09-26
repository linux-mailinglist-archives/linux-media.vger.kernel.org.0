Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07488418774
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhIZIgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:24 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229710AbhIZIgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:23 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id U6HQmeyzYczbLUPcVmV5Vj; Sun, 26 Sep 2021 08:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645287; bh=tWJvfTKLSYt+6yR9v1mDxI7t+sMuRVfyvNpyvBWiUYY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Ys110x9xkhLl2/m3DUKt+c1wYSiGBTZ9iDPDA8EFwZQSwgwmkJZ6aq926NMGjsS6Z
         Hv1yJNCqrHzCIj7yD7aOgs42aq1KVODK3gmP3yynHwGKXaxONVaEV6EqjIvj7wJqG8
         XJZ8sMZN1OlQrH99lzOrB31W/aaC8u5S+WZf6W+2mIwgu05Rv0lH374Av9dtzyQjJ4
         MdheNxbSmC0ahgIK62KT5QDIhuWDlvMte33fiSAiXNeKTkiALApHwwPXaXKrio2nLi
         Ve8UCzM+yHpUUB1XOn4stGbmDxD9/AyV7H5//5bRJii5Dr+WtRu7MG2GB8Z9s6kKoq
         9bLKBUAeLjbmA==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcUmdRJL; Sun, 26 Sep 2021 08:34:47 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a7
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=z1wPPsIgj9QItgDB7ekA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 25/29] edid-decode: more OUI changes
Date:   Sun, 26 Sep 2021 01:33:26 -0700
Message-Id: <20210926083330.5206-26-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNoV77aVFgQdbcvecCL9UfIjJkrcDS0GueKV91Y8wnA+e/wiP70DOgXeQQBUUB5h77XHHZhnj91RsO8kyaG7pQgirYUhjp4u6opsVrn/1PjxD9HsGxLT
 eEOQl/ImFogCf8sN/qFIyhHetNCNILAbnj6pPEKLfirVuRPzzAQfZA2wque7RTzQidOpdKA9wuSsZDqID7Nkha+a7gHT2HNJ68U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since OUI is part of the tag, we can make the following changes:

- Replace cta.last_block_was_hdmi_vsdb with cta.previous_cta_tag. Instead of remembering if the last tag was HDMI VSDB, we can just always remember the last tag value and compare it to the HDMI VSDB tag value.
With this change, we can clean up the HDMI VSDB case statement (remove the two lines that also exist at the end of the switch and change the return to a break.

- Change found_tags from std::set to std::vector. std::vector not only remembers all the flags, but also their order so you could use it to find the number of tags or the first tag (replace block_number?) or the last tag (replace previous_cta_tag?). We could replace previous_cta_tag except found_tags is separate for DisplayID block for some reason, while previous_cta_tag is used for CTA data blocks in both CTA blocks and DisplayID blocks. Maybe there should be only one found_tags, like there is only one previous_cta_tag.

- Remove duplicate parameter from cta_block. Instead, pass the list of found_tags that we want to check for duplicates. This way, the tag value doesn't need to be recalculated.

- For blocks with OUI that we don't know how to parse, skip OUI even if it is zero. Make sure length passed to hex_block is not negative.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.h             | 15 ++++++++-------
 parse-cta-block.cpp       | 33 ++++++++++++---------------------
 parse-displayid-block.cpp | 27 +++++++++++----------------
 3 files changed, 31 insertions(+), 44 deletions(-)

diff --git a/edid-decode.h b/edid-decode.h
index 9f73e9c..6a40092 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -153,7 +153,8 @@ struct edid_state {
 		// CTA-861 block state
 		cta.has_vic_1 = cta.first_svd_might_be_preferred = cta.has_sldb =
 			cta.has_hdmi = cta.has_vcdb = cta.has_vfpdb = false;
-		cta.last_block_was_hdmi_vsdb = cta.have_hf_vsdb = cta.have_hf_scdb = false;
+		cta.previous_cta_tag = 0xfff;
+		cta.have_hf_vsdb = cta.have_hf_scdb = false;
 		cta.block_number = 0;
 		cta.first_svd = true;
 		cta.supported_hdmi_vic_codes = cta.supported_hdmi_vic_vsb_codes = 0;
@@ -244,8 +245,8 @@ struct edid_state {
 		vec_timings_ext preferred_timings;
 		bool preparsed_has_t8vtdb;
 		// Keep track of the found Tag/Extended Tag pairs.
-		// The unsigned value is equal to: (tag << 8) | ext_tag
-		std::set<unsigned> found_tags;
+		// The unsigned value is equal to: (tag) | (OUI enum << 12) or (extended tag) | (tag << 8) | (OUI enum << 12)
+		std::vector<unsigned> found_tags;
 		timings_ext t8vtdb;
 		vec_timings_ext native_timings;
 		bool has_vic_1;
@@ -259,7 +260,7 @@ struct edid_state {
 		bool preparsed_sld;
 		bool has_sldb;
 		unsigned short preparsed_phys_addr;
-		bool last_block_was_hdmi_vsdb;
+		unsigned previous_cta_tag;
 		bool have_hf_vsdb, have_hf_scdb;
 		unsigned block_number;
 		bool first_svd;
@@ -286,8 +287,8 @@ struct edid_state {
 		unsigned native_width, native_height;
 		unsigned block_number;
 		// Keep track of the found CTA-861 Tag/Extended Tag pairs.
-		// The unsigned value is equal to: (tag << 8) | ext_tag
-		std::set<unsigned> found_tags;
+		// The unsigned value is equal to: (tag) | (OUI enum << 12) or (extended tag) | (tag << 8) | (OUI enum << 12)
+		std::vector<unsigned> found_tags;
 	} dispid;
 
 	// Block Map block state
@@ -350,7 +351,7 @@ struct edid_state {
 	void cta_displayid_type_7(const unsigned char *x, unsigned length);
 	void cta_displayid_type_8(const unsigned char *x, unsigned length);
 	void cta_displayid_type_10(const unsigned char *x, unsigned length);
-	void cta_block(const unsigned char *x, bool duplicate);
+	void cta_block(const unsigned char *x, std::vector<unsigned> &found_tags);
 	void preparse_cta_block(const unsigned char *x);
 	void parse_cta_block(const unsigned char *x);
 	void cta_resolve_svr(vec_timings_ext::iterator iter);
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 71e0041..9ae7597 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2029,13 +2029,15 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 
 #define data_block_o(n) \
 	do { \
+		unsigned ouinum; \
 		data_block_oui(n, x, length, &ouinum); \
 		x += (length < 3) ? length : 3; \
 		length -= (length < 3) ? length : 3; \
 		dooutputname = false; \
+		tag |= ouinum; \
 	} while(0)
 
-void edid_state::cta_block(const unsigned char *x, bool duplicate)
+void edid_state::cta_block(const unsigned char *x, std::vector<unsigned> &found_tags)
 {
 	unsigned length = x[0] & 0x1f;
 	unsigned tag=(x[0] & 0xe0) >> 5;
@@ -2048,7 +2050,6 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		x++;
 	}
 
-	unsigned ouinum = 0;
 	bool dooutputname = true;
 	bool audio_block = false;
 	data_block.clear();
@@ -2118,7 +2119,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x713:
 	case 0x778:
 	case 0x779:
-		if (duplicate)
+		if (std::find(found_tags.begin(), found_tags.end(), tag) != found_tags.end())
 			fail("Only one instance of this Data Block is allowed.\n");
 	}
 
@@ -2126,28 +2127,25 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	if (audio_block && !(cta.byte3 & 0x40))
 		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 
-	tag |= ouinum;
 	switch (tag) {
 	case 0x01: cta_audio_block(x, length); break;
 	case 0x02: cta_svd(x, length, false); break;
 	case 0x03|kOUI_HDMI:
 		cta_hdmi_block(x, length);
-		cta.last_block_was_hdmi_vsdb = 1;
-		cta.block_number++;
 		// The HDMI OUI is present, so this EDID represents an HDMI
 		// interface. And HDMI interfaces must use EDID version 1.3
 		// according to the HDMI Specification, so check for this.
 		if (base.edid_minor != 3)
 			fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\n",
 				 base.edid_minor);
-		return;
+		break;
 	case 0x03|kOUI_HDMIForum:
-		if (!cta.last_block_was_hdmi_vsdb)
+		if (cta.previous_cta_tag != (0x03|kOUI_HDMI))
 			fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n");
 		if (cta.have_hf_scdb || cta.have_hf_vsdb)
 			fail("Duplicate HDMI Forum VSDB/SCDB.\n");
 		cta_hf_scdb(x, length);
-		cta.have_hf_vsdb = 1;
+		cta.have_hf_vsdb = true;
 		break;
 	case 0x03|kOUI_AMD: cta_amd(x, length); break;
 	case 0x03|kOUI_Microsoft: if (length != 0x12) goto dodefault; cta_microsoft(x, length); break;
@@ -2179,7 +2177,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 			fail("Block starts at a wrong offset.\n");
 		break;
 	case 0x779:
-		if (!cta.last_block_was_hdmi_vsdb)
+		if (cta.previous_cta_tag != (0x03|kOUI_HDMI))
 			fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB.\n");
 		if (cta.have_hf_scdb || cta.have_hf_vsdb)
 			fail("Duplicate HDMI Forum VSDB/SCDB.\n");
@@ -2191,7 +2189,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		if (x[0] || x[1])
 			printf("  Non-zero SCDB reserved fields!\n");
 		cta_hf_scdb(x + 2, length - 2);
-		cta.have_hf_scdb = 1;
+		cta.have_hf_scdb = true;
 		break;
 dodefault:
 	default:
@@ -2199,7 +2197,8 @@ dodefault:
 	}
 
 	cta.block_number++;
-	cta.last_block_was_hdmi_vsdb = 0;
+	cta.previous_cta_tag = tag;
+	found_tags.push_back(tag);
 }
 
 void edid_state::preparse_cta_block(const unsigned char *x)
@@ -2345,15 +2344,7 @@ void edid_state::parse_cta_block(const unsigned char *x)
 			unsigned i;
 
 			for (i = 4; i < offset; i += (x[i] & 0x1f) + 1) {
-				unsigned tag = (x[i] & 0xe0) << 3;
-
-				if (tag == 0x700)
-					tag |= x[i + 1];
-				bool duplicate = cta.found_tags.find(tag) != cta.found_tags.end();
-
-				cta_block(x + i, duplicate);
-				if (!duplicate)
-					cta.found_tags.insert(tag);
+				cta_block(x + i, cta.found_tags);
 			}
 
 			data_block.clear();
diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 597005e..a38c90e 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1556,15 +1556,7 @@ void edid_state::parse_displayid_cta_data_block(const unsigned char *x)
 	x += 3;
 
 	for (i = 0; i < len; i += (x[i] & 0x1f) + 1) {
-		unsigned tag = (x[i] & 0xe0) << 3;
-
-		if (tag == 0x700)
-			tag |= x[i + 1];
-		bool duplicate = dispid.found_tags.find(tag) != dispid.found_tags.end();
-
-		cta_block(x + i, duplicate);
-		if (!duplicate)
-			dispid.found_tags.insert(tag);
+		cta_block(x + i, dispid.found_tags);
 	}
 
 	if (i != len)
@@ -1653,21 +1645,25 @@ void edid_state::preparse_displayid_block(const unsigned char *x)
 
 #define data_block_o(n, a, b) \
 do { \
+	unsigned ouinum; \
 	data_block_oui(n, x + 3, len, &ouinum, tag == 0, a, b); \
 	dooutputname = false; \
+	if (tag != 0x00 && tag != 0x20) tag |= ouinum; \
+	hasoui = true; \
 } while (0)
 
 unsigned edid_state::displayid_block(const unsigned version, const unsigned char *x, unsigned length)
 {
 	unsigned i;
 	unsigned tag = x[0];
-	unsigned ouinum = 0;
+	unsigned tag_version = (tag < 0x20) ? 1 : (tag < 0x7f) ? 2 : (tag < 0x80) ? 1 : 0;
 	bool dooutputname = true;
 	unsigned len = (length < 3) ? 0 : x[2];
+	bool hasoui = false;
 
 		switch (tag) {
 		// DisplayID 1.3:
-	case 0x00: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", true, false); ouinum = 0; break;
+	case 0x00: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", true, false); break;
 		case 0x01: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
 		case 0x02: data_block = "Color Characteristics Data Block"; break;
 		case 0x03: data_block = "Video Timing Modes Type 1 - Detailed Timings Data Block"; break;
@@ -1689,7 +1685,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		case 0x13: data_block = "Video Timing Modes Type 6 - Detailed Timings Data Block"; break;
 		// 0x14 .. 0x7e RESERVED for Additional VESA-defined Data Blocks
 		// DisplayID 2.0
-	case 0x20: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", false, false); ouinum = 0; break;
+	case 0x20: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", false, false); break;
 		case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
 		case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break;
 		case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break;
@@ -1743,16 +1739,15 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 	if (dooutputname && data_block.length())
 		printf("  %s:\n", data_block.c_str());
 
-	if (version >= 0x20 && (tag < 0x20 || tag == 0x7f))
+	if (version >= 0x20 && tag_version == 1)
 		fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
 			 version >> 4, version & 0xf);
-	if (version < 0x20 && tag >= 0x20 && tag <= 0x7e)
+	if (version < 0x20 && tag_version == 2)
 		fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
 			 version >> 4, version & 0xf);
 
 	unsigned block_rev = x[1] & 0x07;
 
-	tag |= ouinum;
 		switch (tag) {
 	case 0x00: parse_displayid_product_id(x); break;
 	case 0x01: parse_displayid_parameters(x); break;
@@ -1875,7 +1870,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		}
 	case 0x7e|kOUI_VESA: parse_displayid_vesa(x); break;
 	case 0x81: parse_displayid_cta_data_block(x); break;
-	default: hex_block("    ", x + 3 + (ouinum ? 3 : 0), len - (ouinum ? 3 : 0)); break;
+	default: hex_block("    ", x + 3 + (hasoui ? 3 : 0), (len > (hasoui ? 3 : 0)) ? len - (hasoui ? 3 : 0) : 0); break;
 		}
 
 		if ((tag == 0x00 || tag == 0x20) &&
-- 
2.24.3 (Apple Git-128)

