Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA77417E4A
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345072AbhIXXdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:37 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:36756 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344971AbhIXXdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:35 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id TtsEmGC2Aps7PTufhmwEJ4; Fri, 24 Sep 2021 23:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526321; bh=IVr7f0QN2wnNyKiiDOx7Ui6uXvYrGwlcqedOk44lI6o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=htjsuJaKnuU9wEeEionwbZ8ds6+vQJ+v7ioO15vcu8SHXJDXuYykTGdNfz94kzYtn
         eE+6JqC43umvtncTk0TEXBnMdw6CStJkJQkBhBKeoy3b808ug0ICdqTNFiRzc7nru0
         kNO0i7mSKItRUwOvJH7FiDcWWsd5A4WRP+uPCPloafKuEXZlY9I/nye4KGxGbzrSWU
         0hPCYVpLdvh2+Bn+wHf3IlTxGwpoH5y3QgE1clZpLZGuuWvqVKGuLyUhW+5hW9kf8C
         z3HkcfQgNvLQtvwc3x+k1EK59ElOAYNJuo7Mf5j9yTys7p1FEatRZehzXNq/lknvS6
         gaS+DTqWEAtpg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufhmYw9E; Fri, 24 Sep 2021 23:32:01 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5ff1
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=3N-FDXTVIB-eM8BF7nEA:9 a=ZQyn_EzgMooA:10 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 18/28] edid-decode: move parse_displayid_block inner loop
Date:   Fri, 24 Sep 2021 16:31:39 -0700
Message-Id: <20210924233149.10028-19-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJWioHSR1SplWo4vsWdWc3U/ECCBExBc6d0craFupfbS3k0InQ3EZ6sNf/+CJ8fHx9D1ziu/qywlW7l4ldKNK5wpWnFlX0AkbdxY9husqjERz22CHSfZ
 8TPj59ma2aKmCDSWqf5d1sLwlvfv4+F/kN8GBi3LTegFhknPT4bLJC/oRb//ixNZQm7zrnKvw4pKSI2sgmN6OjTFb180knhMkLk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move it to a new function displayid_block. Then we can simplify it later.
This is mostly just a copy/paste. No output should change.
The new function returns 0xff for len to signal a break from the loop in parse_displayid_block. That will be cleaned up later.

first_data_block is replaced with dispid.block_number (similar to cta.block_number)

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.h             |   3 +
 parse-displayid-block.cpp | 481 +++++++++++++++++++-------------------
 2 files changed, 247 insertions(+), 237 deletions(-)

diff --git a/edid-decode.h b/edid-decode.h
index 52d555b..b450abd 100644
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
@@ -392,6 +394,7 @@ struct edid_state {
 	void parse_displayid_type_10_timing(const unsigned char *x, unsigned sz,
 					    bool is_cta = false);
 	void preparse_displayid_block(const unsigned char *x);
+	unsigned displayid_block(const unsigned version, const unsigned char *x, unsigned offset, unsigned length);
 	void parse_displayid_block(const unsigned char *x);
 	void parse_displayid_vesa(const unsigned char *x);
 	void parse_displayid_cta_data_block(const unsigned char *x);
diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 5c81294..c0ad872 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1609,13 +1609,254 @@ void edid_state::preparse_displayid_block(const unsigned char *x)
 	}
 }
 
+unsigned edid_state::displayid_block(const unsigned version, const unsigned char *x, unsigned offset, unsigned length)
+{
+	unsigned i;
+	unsigned tag = x[offset];
+	unsigned oui = 0;
+
+	switch (tag) {
+	// DisplayID 1.3:
+	case 0x00: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break;
+	case 0x01: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
+	case 0x02: data_block = "Color Characteristics Data Block"; break;
+	case 0x03: data_block = "Video Timing Modes Type 1 - Detailed Timings Data Block"; break;
+	case 0x04: data_block = "Video Timing Modes Type 2 - Detailed Timings Data Block"; break;
+	case 0x05: data_block = "Video Timing Modes Type 3 - Short Timings Data Block"; break;
+	case 0x06: data_block = "Video Timing Modes Type 4 - DMT Timings Data Block"; break;
+	case 0x07: data_block = "Supported Timing Modes Type 1 - VESA DMT Timings Data Block"; break;
+	case 0x08: data_block = "Supported Timing Modes Type 2 - CTA-861 Timings Data Block"; break;
+	case 0x09: data_block = "Video Timing Range Data Block"; break;
+	case 0x0a: data_block = "Product Serial Number Data Block"; break;
+	case 0x0b: data_block = "GP ASCII String Data Block"; break;
+	case 0x0c: data_block = "Display Device Data Data Block"; break;
+	case 0x0d: data_block = "Interface Power Sequencing Data Block"; break;
+	case 0x0e: data_block = "Transfer Characteristics Data Block"; break;
+	case 0x0f: data_block = "Display Interface Data Block"; break;
+	case 0x10: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
+	case 0x11: data_block = "Video Timing Modes Type 5 - Short Timings Data Block"; break;
+	case 0x12: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
+	case 0x13: data_block = "Video Timing Modes Type 6 - Detailed Timings Data Block"; break;
+	// 0x14 .. 0x7e RESERVED for Additional VESA-defined Data Blocks
+	// DisplayID 2.0
+	case 0x20: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break;
+	case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
+	case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break;
+	case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break;
+	case 0x24: data_block = "Video Timing Modes Type 9 - Formula-based Timings Data Block"; break;
+	case 0x25: data_block = "Dynamic Video Timing Range Limits Data Block"; break;
+	case 0x26: data_block = "Display Interface Features Data Block"; break;
+	case 0x27: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
+	case 0x28: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
+	case 0x29: data_block = "ContainerID Data Block"; break;
+	case 0x32: data_block = "Video Timing Modes Type 10 - Formula-based Timings Data Block"; break;
+	// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
+	case 0x7e: // DisplayID 2.0
+	case 0x7f: // DisplayID 1.3
+		if ((tag == 0x7e && version >= 0x20) ||
+			(tag == 0x7f && version < 0x20)) {
+			oui = (x[offset + 3] << 16) + (x[offset + 4] << 8) + x[offset + 5];
+			const char *name = oui_name(oui);
+			bool reversed = false;
+
+			if (!name) {
+				name = oui_name(oui, true);
+				if (name)
+					reversed = true;
+			}
+			if (name)
+				data_block = std::string("Vendor-Specific Data Block (") + name + ")";
+			else
+				data_block = "Vendor-Specific Data Block, OUI " + ouitohex(oui);
+			if (reversed)
+				fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order.\n").c_str());
+		} else {
+			data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")";
+		}
+		break;
+	// 0x80 RESERVED
+	case 0x81: data_block = "CTA-861 DisplayID Data Block (" + utohex(tag) + ")"; break;
+	// 0x82 .. 0xff RESERVED
+	default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
+	}
+
+	if (version >= 0x20 && (tag < 0x20 || tag == 0x7f))
+		fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
+			 version >> 4, version & 0xf);
+	if (version < 0x20 && tag >= 0x20 && tag <= 0x7e)
+		fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
+			 version >> 4, version & 0xf);
+
+	if (length < 3) {
+		// report a problem when the remaining bytes are not 0.
+		if (tag || x[offset + 1]) {
+			fail("Not enough bytes remain (%d) for a DisplayID data block or the DisplayID filler is non-0.\n", length);
+		}
+		return 0xff;
+	}
+
+	unsigned block_rev = x[offset + 1] & 0x07;
+	unsigned len = x[offset + 2];
+
+	if (length < len + 3) {
+		fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
+		return 0xff;
+	}
+
+	if (!tag && !len) {
+		// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
+		if (!memchk(x + offset, length)) {
+			fail("Non-0 filler bytes in the DisplayID block.\n");
+		}
+		return 0xff;
+	}
+
+	printf("  %s:\n", data_block.c_str());
+
+	switch (tag) {
+	case 0x00: parse_displayid_product_id(x + offset); break;
+	case 0x01: parse_displayid_parameters(x + offset); break;
+	case 0x02: parse_displayid_color_characteristics(x + offset); break;
+	case 0x03:
+		   check_displayid_datablock_revision(x[offset + 1], 0, block_rev & 1);
+		   for (i = 0; i < len / 20; i++)
+			   parse_displayid_type_1_7_timing(&x[offset + 3 + (i * 20)], false, block_rev);
+		   break;
+	case 0x04:
+		   check_displayid_datablock_revision(x[offset + 1]);
+		   for (i = 0; i < len / 11; i++)
+			   parse_displayid_type_2_timing(&x[offset + 3 + (i * 11)]);
+		   break;
+	case 0x05:
+		   check_displayid_datablock_revision(x[offset + 1], 0, block_rev & 1);
+		   for (i = 0; i < len / 3; i++)
+			   parse_displayid_type_3_timing(&x[offset + 3 + (i * 3)]);
+		   break;
+	case 0x06:
+		   check_displayid_datablock_revision(x[offset + 1], 0xc0, 1);
+		   for (i = 0; i < len; i++)
+			   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6, x[offset + 3 + i]);
+		   break;
+	case 0x07:
+		   check_displayid_datablock_revision(x[offset + 1]);
+		   for (i = 0; i < min(len, 10) * 8; i++)
+			   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
+				   char type[16];
+				   sprintf(type, "DMT 0x%02x", i + 1);
+				   print_timings("    ", find_dmt_id(i + 1), type);
+			   }
+		   break;
+	case 0x08:
+		   check_displayid_datablock_revision(x[offset + 1]);
+		   for (i = 0; i < min(len, 8) * 8; i++)
+			   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
+				   char type[16];
+				   sprintf(type, "VIC %3u", i + 1);
+				   print_timings("    ", find_vic_id(i + 1), type);
+			   }
+		   break;
+	case 0x09: parse_displayid_video_timing_range_limits(x + offset); break;
+	case 0x0a:
+	case 0x0b: parse_displayid_string(x + offset); break;
+	case 0x0c: parse_displayid_display_device(x + offset); break;
+	case 0x0d: parse_displayid_intf_power_sequencing(x + offset); break;
+	case 0x0e: parse_displayid_transfer_characteristics(x + offset); break;
+	case 0x0f: parse_displayid_display_intf(x + offset); break;
+	case 0x10: parse_displayid_stereo_display_intf(x + offset); break;
+	case 0x11:
+		   check_displayid_datablock_revision(x[offset + 1]);
+		   for (i = 0; i < len / 7; i++)
+			   parse_displayid_type_5_timing(&x[offset + 3 + (i * 7)]);
+		   break;
+	case 0x12: parse_displayid_tiled_display_topology(x + offset, false); break;
+	case 0x13:
+		   check_displayid_datablock_revision(x[offset + 1]);
+		   for (i = 0; i < len; i += (x[offset + 3 + i + 2] & 0x40) ? 17 : 14)
+			   parse_displayid_type_6_timing(&x[offset + 3 + i]);
+		   break;
+	case 0x20: parse_displayid_product_id(x + offset); break;
+	case 0x21:
+		   if (block_rev >= 1)
+			   check_displayid_datablock_revision(x[offset + 1], 0x80, 1);
+		   else
+			   check_displayid_datablock_revision(x[offset + 1], 0x80, 0);
+		   parse_displayid_parameters_v2(x + offset, block_rev);
+		   break;
+	case 0x22: {
+		   unsigned sz = 20;
+
+		   if (block_rev >= 2)
+			   check_displayid_datablock_revision(x[offset + 1], 0x08, 2);
+		   else if (block_rev == 1)
+			   check_displayid_datablock_revision(x[offset + 1], 0x08, 1);
+		   else
+			   check_displayid_datablock_revision(x[offset + 1]);
+		   sz += (x[offset + 1] & 0x70) >> 4;
+		   if (block_rev >= 1 && (x[offset + 1] & 0x08))
+			   printf("    These timings support DSC pass-through\n");
+		   for (i = 0; i < len / sz; i++)
+			   parse_displayid_type_1_7_timing(&x[offset + 3 + i * sz], true, block_rev);
+		   break;
+	}
+	case 0x23:
+		   if (block_rev)
+			   check_displayid_datablock_revision(x[offset + 1], 0xe8, 1);
+		   else
+			   check_displayid_datablock_revision(x[offset + 1], 0xc8);
+		   if (x[offset + 1] & 0x08) {
+			   for (i = 0; i < len / 2; i++)
+				   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
+								   x[offset + 3 + i * 2] |
+								   (x[offset + 4 + i * 2] << 8));
+		   } else {
+			   for (i = 0; i < len; i++)
+				   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
+								   x[offset + 3 + i]);
+		   }
+		   break;
+	case 0x24:
+		   check_displayid_datablock_revision(x[offset + 1]);
+		   for (i = 0; i < len / 6; i++)
+			   parse_displayid_type_9_timing(&x[offset + 3 + i * 6]);
+		   break;
+	case 0x25: parse_displayid_dynamic_video_timings_range_limits(x + offset); break;
+	case 0x26: parse_displayid_interface_features(x + offset); break;
+	case 0x27: parse_displayid_stereo_display_intf(x + offset); break;
+	case 0x28: parse_displayid_tiled_display_topology(x + offset, true); break;
+	case 0x29: parse_displayid_ContainerID(x + offset); break;
+	case 0x32: {
+		   unsigned sz = 6 + ((x[offset + 1] & 0x70) >> 4);
+
+		   check_displayid_datablock_revision(x[offset + 1], 0x70);
+		   for (i = 0; i < len / sz; i++)
+			   parse_displayid_type_10_timing(&x[offset + 3 + i * sz], sz);
+		   break;
+	}
+	case 0x81: parse_displayid_cta_data_block(x + offset); break;
+	case 0x7e:
+		if (oui == 0x3a0292) {
+			parse_displayid_vesa(x + offset);
+			break;
+		}
+		// fall-through
+	default: hex_block("    ", x + offset + 3, len); break;
+	}
+
+	if ((tag == 0x00 || tag == 0x20) &&
+		(!dispid.is_base_block || dispid.block_number > 0))
+		fail("%s is required to be the first DisplayID Data Block.\n",
+			 data_block.c_str());
+
+	dispid.block_number++;
+	return len;
+}
+
 void edid_state::parse_displayid_block(const unsigned char *x)
 {
 	unsigned version = x[1];
 	unsigned length = x[2];
 	unsigned prod_type = x[3]; // future check: based on type, check for required data blocks
 	unsigned ext_count = x[4];
-	unsigned i;
 
 	printf("  Version: %u.%u\n  Extension Count: %u\n",
 	       version >> 4, version & 0xf, ext_count);
@@ -1648,245 +1889,11 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 	}
 
 	unsigned offset = 5;
-	bool first_data_block = true;
 	while (length > 0) {
-		unsigned tag = x[offset];
-		unsigned oui = 0;
-
-		switch (tag) {
-		// DisplayID 1.3:
-		case 0x00: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break;
-		case 0x01: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
-		case 0x02: data_block = "Color Characteristics Data Block"; break;
-		case 0x03: data_block = "Video Timing Modes Type 1 - Detailed Timings Data Block"; break;
-		case 0x04: data_block = "Video Timing Modes Type 2 - Detailed Timings Data Block"; break;
-		case 0x05: data_block = "Video Timing Modes Type 3 - Short Timings Data Block"; break;
-		case 0x06: data_block = "Video Timing Modes Type 4 - DMT Timings Data Block"; break;
-		case 0x07: data_block = "Supported Timing Modes Type 1 - VESA DMT Timings Data Block"; break;
-		case 0x08: data_block = "Supported Timing Modes Type 2 - CTA-861 Timings Data Block"; break;
-		case 0x09: data_block = "Video Timing Range Data Block"; break;
-		case 0x0a: data_block = "Product Serial Number Data Block"; break;
-		case 0x0b: data_block = "GP ASCII String Data Block"; break;
-		case 0x0c: data_block = "Display Device Data Data Block"; break;
-		case 0x0d: data_block = "Interface Power Sequencing Data Block"; break;
-		case 0x0e: data_block = "Transfer Characteristics Data Block"; break;
-		case 0x0f: data_block = "Display Interface Data Block"; break;
-		case 0x10: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
-		case 0x11: data_block = "Video Timing Modes Type 5 - Short Timings Data Block"; break;
-		case 0x12: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
-		case 0x13: data_block = "Video Timing Modes Type 6 - Detailed Timings Data Block"; break;
-		// 0x14 .. 0x7e RESERVED for Additional VESA-defined Data Blocks
-		// DisplayID 2.0
-		case 0x20: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break;
-		case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
-		case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break;
-		case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break;
-		case 0x24: data_block = "Video Timing Modes Type 9 - Formula-based Timings Data Block"; break;
-		case 0x25: data_block = "Dynamic Video Timing Range Limits Data Block"; break;
-		case 0x26: data_block = "Display Interface Features Data Block"; break;
-		case 0x27: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
-		case 0x28: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
-		case 0x29: data_block = "ContainerID Data Block"; break;
-		case 0x32: data_block = "Video Timing Modes Type 10 - Formula-based Timings Data Block"; break;
-		// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
-		case 0x7e: // DisplayID 2.0
-		case 0x7f: // DisplayID 1.3
-			if ((tag == 0x7e && version >= 0x20) ||
-			    (tag == 0x7f && version < 0x20)) {
-				oui = (x[offset + 3] << 16) + (x[offset + 4] << 8) + x[offset + 5];
-				const char *name = oui_name(oui);
-				bool reversed = false;
-
-				if (!name) {
-					name = oui_name(oui, true);
-					if (name)
-						reversed = true;
-				}
-				if (name)
-					data_block = std::string("Vendor-Specific Data Block (") + name + ")";
-				else
-					data_block = "Vendor-Specific Data Block, OUI " + ouitohex(oui);
-				if (reversed)
-					fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order.\n").c_str());
-			} else {
-				data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")";
-			}
-			break;
-		// 0x80 RESERVED
-		case 0x81: data_block = "CTA-861 DisplayID Data Block (" + utohex(tag) + ")"; break;
-		// 0x82 .. 0xff RESERVED
-		default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
-		}
-
-		if (version >= 0x20 && (tag < 0x20 || tag == 0x7f))
-			fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
-			     version >> 4, version & 0xf);
-		if (version < 0x20 && tag >= 0x20 && tag <= 0x7e)
-			fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
-			     version >> 4, version & 0xf);
-
-		if (length < 3) {
-			// report a problem when the remaining bytes are not 0.
-			if (tag || x[offset + 1]) {
-				fail("Not enough bytes remain (%d) for a DisplayID data block or the DisplayID filler is non-0.\n", length);
-			}
-			break;
-		}
-
-		unsigned block_rev = x[offset + 1] & 0x07;
-		unsigned len = x[offset + 2];
-
-		if (length < len + 3) {
-			fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
-			break;
-		}
-
-		if (!tag && !len) {
-			// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
-			if (!memchk(x + offset, length)) {
-				fail("Non-0 filler bytes in the DisplayID block.\n");
-			}
-			break;
-		}
-
-		printf("  %s:\n", data_block.c_str());
-
-		switch (tag) {
-		case 0x00: parse_displayid_product_id(x + offset); break;
-		case 0x01: parse_displayid_parameters(x + offset); break;
-		case 0x02: parse_displayid_color_characteristics(x + offset); break;
-		case 0x03:
-			   check_displayid_datablock_revision(x[offset + 1], 0, block_rev & 1);
-			   for (i = 0; i < len / 20; i++)
-				   parse_displayid_type_1_7_timing(&x[offset + 3 + (i * 20)], false, block_rev);
-			   break;
-		case 0x04:
-			   check_displayid_datablock_revision(x[offset + 1]);
-			   for (i = 0; i < len / 11; i++)
-				   parse_displayid_type_2_timing(&x[offset + 3 + (i * 11)]);
-			   break;
-		case 0x05:
-			   check_displayid_datablock_revision(x[offset + 1], 0, block_rev & 1);
-			   for (i = 0; i < len / 3; i++)
-				   parse_displayid_type_3_timing(&x[offset + 3 + (i * 3)]);
-			   break;
-		case 0x06:
-			   check_displayid_datablock_revision(x[offset + 1], 0xc0, 1);
-			   for (i = 0; i < len; i++)
-				   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6, x[offset + 3 + i]);
-			   break;
-		case 0x07:
-			   check_displayid_datablock_revision(x[offset + 1]);
-			   for (i = 0; i < min(len, 10) * 8; i++)
-				   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
-					   char type[16];
-					   sprintf(type, "DMT 0x%02x", i + 1);
-					   print_timings("    ", find_dmt_id(i + 1), type);
-				   }
-			   break;
-		case 0x08:
-			   check_displayid_datablock_revision(x[offset + 1]);
-			   for (i = 0; i < min(len, 8) * 8; i++)
-				   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
-					   char type[16];
-					   sprintf(type, "VIC %3u", i + 1);
-					   print_timings("    ", find_vic_id(i + 1), type);
-				   }
-			   break;
-		case 0x09: parse_displayid_video_timing_range_limits(x + offset); break;
-		case 0x0a:
-		case 0x0b: parse_displayid_string(x + offset); break;
-		case 0x0c: parse_displayid_display_device(x + offset); break;
-		case 0x0d: parse_displayid_intf_power_sequencing(x + offset); break;
-		case 0x0e: parse_displayid_transfer_characteristics(x + offset); break;
-		case 0x0f: parse_displayid_display_intf(x + offset); break;
-		case 0x10: parse_displayid_stereo_display_intf(x + offset); break;
-		case 0x11:
-			   check_displayid_datablock_revision(x[offset + 1]);
-			   for (i = 0; i < len / 7; i++)
-				   parse_displayid_type_5_timing(&x[offset + 3 + (i * 7)]);
-			   break;
-		case 0x12: parse_displayid_tiled_display_topology(x + offset, false); break;
-		case 0x13:
-			   check_displayid_datablock_revision(x[offset + 1]);
-			   for (i = 0; i < len; i += (x[offset + 3 + i + 2] & 0x40) ? 17 : 14)
-				   parse_displayid_type_6_timing(&x[offset + 3 + i]);
-			   break;
-		case 0x20: parse_displayid_product_id(x + offset); break;
-		case 0x21:
-			   if (block_rev >= 1)
-				   check_displayid_datablock_revision(x[offset + 1], 0x80, 1);
-			   else
-				   check_displayid_datablock_revision(x[offset + 1], 0x80, 0);
-			   parse_displayid_parameters_v2(x + offset, block_rev);
-			   break;
-		case 0x22: {
-			   unsigned sz = 20;
-
-			   if (block_rev >= 2)
-				   check_displayid_datablock_revision(x[offset + 1], 0x08, 2);
-			   else if (block_rev == 1)
-				   check_displayid_datablock_revision(x[offset + 1], 0x08, 1);
-			   else
-				   check_displayid_datablock_revision(x[offset + 1]);
-			   sz += (x[offset + 1] & 0x70) >> 4;
-			   if (block_rev >= 1 && (x[offset + 1] & 0x08))
-				   printf("    These timings support DSC pass-through\n");
-			   for (i = 0; i < len / sz; i++)
-				   parse_displayid_type_1_7_timing(&x[offset + 3 + i * sz], true, block_rev);
-			   break;
-		}
-		case 0x23:
-			   if (block_rev)
-				   check_displayid_datablock_revision(x[offset + 1], 0xe8, 1);
-			   else
-				   check_displayid_datablock_revision(x[offset + 1], 0xc8);
-			   if (x[offset + 1] & 0x08) {
-				   for (i = 0; i < len / 2; i++)
-					   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
-									   x[offset + 3 + i * 2] |
-									   (x[offset + 4 + i * 2] << 8));
-			   } else {
-				   for (i = 0; i < len; i++)
-					   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
-									   x[offset + 3 + i]);
-			   }
-			   break;
-		case 0x24:
-			   check_displayid_datablock_revision(x[offset + 1]);
-			   for (i = 0; i < len / 6; i++)
-				   parse_displayid_type_9_timing(&x[offset + 3 + i * 6]);
-			   break;
-		case 0x25: parse_displayid_dynamic_video_timings_range_limits(x + offset); break;
-		case 0x26: parse_displayid_interface_features(x + offset); break;
-		case 0x27: parse_displayid_stereo_display_intf(x + offset); break;
-		case 0x28: parse_displayid_tiled_display_topology(x + offset, true); break;
-		case 0x29: parse_displayid_ContainerID(x + offset); break;
-		case 0x32: {
-			   unsigned sz = 6 + ((x[offset + 1] & 0x70) >> 4);
-
-			   check_displayid_datablock_revision(x[offset + 1], 0x70);
-			   for (i = 0; i < len / sz; i++)
-				   parse_displayid_type_10_timing(&x[offset + 3 + i * sz], sz);
-			   break;
-		}
-		case 0x81: parse_displayid_cta_data_block(x + offset); break;
-		case 0x7e:
-			if (oui == 0x3a0292) {
-				parse_displayid_vesa(x + offset);
-				break;
-			}
-			// fall-through
-		default: hex_block("    ", x + offset + 3, len); break;
-		}
-
-		if ((tag == 0x00 || tag == 0x20) &&
-		    (!dispid.is_base_block || !first_data_block))
-			fail("%s is required to be the first DisplayID Data Block.\n",
-			     data_block.c_str());
+		unsigned len = displayid_block(version, x, offset, length);
+		if (len == 0xff) break;
 		length -= len + 3;
 		offset += len + 3;
-		first_data_block = false;
 	}
 
 	/*
-- 
2.24.3 (Apple Git-128)

