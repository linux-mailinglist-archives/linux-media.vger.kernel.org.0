Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A10418778
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhIZIg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:26 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:37615 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229939AbhIZIg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:26 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id U6HQmeyzYczbLUPcXmV5Vs; Sun, 26 Sep 2021 08:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645289; bh=O8GtA2gaMBuwNLOvMt64bZNoYUHo7C2r0wuhf1/pcNg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IY9f878Iq/cp/LAM/Li0uzkWG5SlXQzzNGezVGCBUEOlGG/IVS4s4vmL/Ew3FwzX5
         JPdNATmc8eritCNd2/g1kelvzqt/Y4WJnt2OLJzISPCQD6NEhu6hvpWcF2Mf9yFjjm
         QSYzl3H1fZHg6QGfoP8HAF4zHh5N+mL7smSRsCmtjU0e2/6/fTygs+0cGAMVwQDjia
         nG0rb1ac55kGHZlWgu4ZHyJsyt0xuzTOzw5hk7JBowLN1NHKUdWEWHatjEmY1EtL8K
         DI603riZFCy3pQaHKJjHs5XGUnZ0qYfABV3SdiYd8Vchhl4LlJBe6thNZ5aZFRdIOG
         3mcMpo9TlMsJw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcXmdRJk; Sun, 26 Sep 2021 08:34:49 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a9
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=2NhWfB50d646GWr7k7QA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 29/29] edid-decode: fix indents
Date:   Sun, 26 Sep 2021 01:33:30 -0700
Message-Id: <20210926083330.5206-30-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJBSncQJzUV+HHvi7hQavYn1Kcuyqd7WHuHQQ427TzabV0NqwCuQ2lema/+L4t2HOVAeW+DNBbeScuU3p7bKGQSgSeWiven36N7LjjrIhaz46BVeLVjl
 H123nH7mnqOh5f4qb2msh3/Gc453BgR/FBKvwBjaQ3ey746QINvsbF/H9ffz1s1ufU+GPvPNRomymfPJqGVDqYF1HcQwYpZjaoo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The indenting was messed up during rebase.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 230 +++++++++++++++++++-------------------
 1 file changed, 115 insertions(+), 115 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index ba2c15e..3fa0759 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1655,80 +1655,80 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 	unsigned len = (length < 3) ? 0 : x[2];
 	bool hasoui = false;
 
-		switch (tag) {
-		// DisplayID 1.3:
+	switch (tag) {
+	// DisplayID 1.3:
 	case 0x00: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", true, false); break;
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
 	case 0x20: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", false, false); break;
-		case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
-		case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break;
-		case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break;
-		case 0x24: data_block = "Video Timing Modes Type 9 - Formula-based Timings Data Block"; break;
-		case 0x25: data_block = "Dynamic Video Timing Range Limits Data Block"; break;
-		case 0x26: data_block = "Display Interface Features Data Block"; break;
-		case 0x27: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
-		case 0x28: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
-		case 0x29: data_block = "ContainerID Data Block"; break;
-		case 0x2b: data_block = "Adaptive Sync Data Block"; break;
-		case 0x32: data_block = "Video Timing Modes Type 10 - Formula-based Timings Data Block"; break;
-		// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
+	case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
+	case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break;
+	case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break;
+	case 0x24: data_block = "Video Timing Modes Type 9 - Formula-based Timings Data Block"; break;
+	case 0x25: data_block = "Dynamic Video Timing Range Limits Data Block"; break;
+	case 0x26: data_block = "Display Interface Features Data Block"; break;
+	case 0x27: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
+	case 0x28: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
+	case 0x29: data_block = "ContainerID Data Block"; break;
+	case 0x2b: data_block = "Adaptive Sync Data Block"; break;
+	case 0x32: data_block = "Video Timing Modes Type 10 - Formula-based Timings Data Block"; break;
+	// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
 	case 0x7e: data_block_o("Vendor-Specific Data Block (" + utohex(tag) + ")", false, true); break; // DisplayID 2.0
 	case 0x7f: data_block_o("Vendor-Specific Data Block (" + utohex(tag) + ")", true, false); break; // DisplayID 1.3
-		// 0x80 RESERVED
+	// 0x80 RESERVED
 	case 0x81: data_block = "CTA-861 DisplayID Data Block"; break;
-		// 0x82 .. 0xff RESERVED
-		default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
-		}
+	// 0x82 .. 0xff RESERVED
+	default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
+	}
 
-		if (length < 3) {
+	if (length < 3) {
 		// Report a problem when the remaining bytes are not 0.
 		data_block.clear(); // Probably not a Data Block so clear this.
 		if (tag || (length > 1 && x[1])) {
 			printf("  Filler:\n");
 			fail("Not enough bytes remain (%d) for a DisplayID data block and the DisplayID filler is non-0.\n", length);
 			hex_block("    ", x, length);
-			}
-		return length;
 		}
+		return length;
+	}
 
-		if (length < len + 3) {
+	if (length < len + 3) {
 		data_block.clear(); // Probably not a Data Block so clear this.
 		printf("  Filler:\n");
-			fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
+		fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
 		hex_block("    ", x, length);
 		return length;
-		}
+	}
 
-		if (!tag && !len) {
-			// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
+	if (!tag && !len) {
+		// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
 		data_block.clear(); // Probably not a Product Identification Data Block so clear this.
 		if (!memchk(x, length)) {
 			printf("  Filler:\n");
-				fail("Non-0 filler bytes in the DisplayID block.\n");
+			fail("Non-0 filler bytes in the DisplayID block.\n");
 			hex_block("    ", x, length);
-			}
-		return length;
 		}
+		return length;
+	}
 
 	if (dooutputname && data_block.length())
 		printf("  %s:\n", data_block.c_str());
@@ -1742,135 +1742,135 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 
 	unsigned block_rev = x[1] & 0x07;
 
-		switch (tag) {
+	switch (tag) {
 	case 0x00: parse_displayid_product_id(x); break;
 	case 0x01: parse_displayid_parameters(x); break;
 	case 0x02: parse_displayid_color_characteristics(x); break;
-		case 0x03:
+	case 0x03:
 		   check_displayid_datablock_revision(x[1], 0, block_rev & 1);
-			   for (i = 0; i < len / 20; i++)
+		   for (i = 0; i < len / 20; i++)
 			   parse_displayid_type_1_7_timing(&x[3 + (i * 20)], false, block_rev);
-			   break;
-		case 0x04:
+		   break;
+	case 0x04:
 		   check_displayid_datablock_revision(x[1]);
-			   for (i = 0; i < len / 11; i++)
+		   for (i = 0; i < len / 11; i++)
 			   parse_displayid_type_2_timing(&x[3 + (i * 11)]);
-			   break;
-		case 0x05:
+		   break;
+	case 0x05:
 		   check_displayid_datablock_revision(x[1], 0, block_rev & 1);
-			   for (i = 0; i < len / 3; i++)
+		   for (i = 0; i < len / 3; i++)
 			   parse_displayid_type_3_timing(&x[3 + (i * 3)]);
-			   break;
-		case 0x06:
+		   break;
+	case 0x06:
 		   check_displayid_datablock_revision(x[1], 0xc0, 1);
-			   for (i = 0; i < len; i++)
+		   for (i = 0; i < len; i++)
 			   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6, x[3 + i]);
-			   break;
-		case 0x07:
+		   break;
+	case 0x07:
 		   check_displayid_datablock_revision(x[1]);
-			   for (i = 0; i < min(len, 10) * 8; i++)
+		   for (i = 0; i < min(len, 10) * 8; i++)
 			   if (x[3 + i / 8] & (1 << (i % 8))) {
-					   char type[16];
-					   sprintf(type, "DMT 0x%02x", i + 1);
-					   print_timings("    ", find_dmt_id(i + 1), type);
-				   }
-			   break;
-		case 0x08:
+				   char type[16];
+				   sprintf(type, "DMT 0x%02x", i + 1);
+				   print_timings("    ", find_dmt_id(i + 1), type);
+			   }
+		   break;
+	case 0x08:
 		   check_displayid_datablock_revision(x[1]);
-			   for (i = 0; i < min(len, 8) * 8; i++)
+		   for (i = 0; i < min(len, 8) * 8; i++)
 			   if (x[3 + i / 8] & (1 << (i % 8))) {
-					   char type[16];
-					   sprintf(type, "VIC %3u", i + 1);
-					   print_timings("    ", find_vic_id(i + 1), type);
-				   }
-			   break;
+				   char type[16];
+				   sprintf(type, "VIC %3u", i + 1);
+				   print_timings("    ", find_vic_id(i + 1), type);
+			   }
+		   break;
 	case 0x09: parse_displayid_video_timing_range_limits(x); break;
-		case 0x0a:
+	case 0x0a:
 	case 0x0b: parse_displayid_string(x); break;
 	case 0x0c: parse_displayid_display_device(x); break;
 	case 0x0d: parse_displayid_intf_power_sequencing(x); break;
 	case 0x0e: parse_displayid_transfer_characteristics(x); break;
 	case 0x0f: parse_displayid_display_intf(x); break;
 	case 0x10: parse_displayid_stereo_display_intf(x); break;
-		case 0x11:
+	case 0x11:
 		   check_displayid_datablock_revision(x[1]);
-			   for (i = 0; i < len / 7; i++)
+		   for (i = 0; i < len / 7; i++)
 			   parse_displayid_type_5_timing(&x[3 + (i * 7)]);
-			   break;
+		   break;
 	case 0x12: parse_displayid_tiled_display_topology(x, false); break;
-		case 0x13:
+	case 0x13:
 		   check_displayid_datablock_revision(x[1]);
 		   for (i = 0; i < len; i += (x[3 + i + 2] & 0x40) ? 17 : 14)
 			   parse_displayid_type_6_timing(&x[3 + i]);
-			   break;
+		   break;
 	case 0x20: parse_displayid_product_id(x); break;
-		case 0x21:
-			   if (block_rev >= 1)
+	case 0x21:
+		   if (block_rev >= 1)
 			   check_displayid_datablock_revision(x[1], 0x80, 1);
-			   else
+		   else
 			   check_displayid_datablock_revision(x[1], 0x80, 0);
 		   parse_displayid_parameters_v2(x, block_rev);
-			   break;
-		case 0x22: {
-			   unsigned sz = 20;
+		   break;
+	case 0x22: {
+		   unsigned sz = 20;
 
-			   if (block_rev >= 2)
+		   if (block_rev >= 2)
 			   check_displayid_datablock_revision(x[1], 0x08, 2);
-			   else if (block_rev == 1)
+		   else if (block_rev == 1)
 			   check_displayid_datablock_revision(x[1], 0x08, 1);
-			   else
+		   else
 			   check_displayid_datablock_revision(x[1]);
 		   sz += (x[1] & 0x70) >> 4;
 		   if (block_rev >= 1 && (x[1] & 0x08))
-				   printf("    These timings support DSC pass-through\n");
-			   for (i = 0; i < len / sz; i++)
+			   printf("    These timings support DSC pass-through\n");
+		   for (i = 0; i < len / sz; i++)
 			   parse_displayid_type_1_7_timing(&x[3 + i * sz], true, block_rev);
-			   break;
-		}
-		case 0x23:
-			   if (block_rev)
+		   break;
+	}
+	case 0x23:
+		   if (block_rev)
 			   check_displayid_datablock_revision(x[1], 0xe8, 1);
-			   else
+		   else
 			   check_displayid_datablock_revision(x[1], 0xc8);
 		   if (x[1] & 0x08) {
-				   for (i = 0; i < len / 2; i++)
+			   for (i = 0; i < len / 2; i++)
 				   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6,
 								   x[3 + i * 2] |
 								   (x[4 + i * 2] << 8));
-			   } else {
-				   for (i = 0; i < len; i++)
+		   } else {
+			   for (i = 0; i < len; i++)
 				   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6,
 								   x[3 + i]);
-			   }
-			   break;
-		case 0x24:
+		   }
+		   break;
+	case 0x24:
 		   check_displayid_datablock_revision(x[1]);
-			   for (i = 0; i < len / 6; i++)
+		   for (i = 0; i < len / 6; i++)
 			   parse_displayid_type_9_timing(&x[3 + i * 6]);
-			   break;
+		   break;
 	case 0x25: parse_displayid_dynamic_video_timings_range_limits(x); break;
 	case 0x26: parse_displayid_interface_features(x); break;
 	case 0x27: parse_displayid_stereo_display_intf(x); break;
 	case 0x28: parse_displayid_tiled_display_topology(x, true); break;
 	case 0x29: parse_displayid_ContainerID(x); break;
 	case 0x2b: parse_displayid_adaptive_sync(x); break;
-		case 0x32: {
+	case 0x32: {
 		   unsigned sz = 6 + ((x[1] & 0x70) >> 4);
 
 		   check_displayid_datablock_revision(x[1], 0x70);
-			   for (i = 0; i < len / sz; i++)
+		   for (i = 0; i < len / sz; i++)
 			   parse_displayid_type_10_timing(&x[3 + i * sz], sz);
-			   break;
-		}
+		   break;
+	}
 	case 0x7e|kOUI_VESA: parse_displayid_vesa(x); break;
 	case 0x81: parse_displayid_cta_data_block(x); break;
 	default: hex_block("    ", x + 3 + (hasoui ? 3 : 0), (len > (hasoui ? 3 : 0)) ? len - (hasoui ? 3 : 0) : 0); break;
-		}
+	}
 
-		if ((tag == 0x00 || tag == 0x20) &&
+	if ((tag == 0x00 || tag == 0x20) &&
 		(!dispid.is_base_block || dispid.block_number > 0))
-			fail("%s is required to be the first DisplayID Data Block.\n",
-			     data_block.c_str());
+		fail("%s is required to be the first DisplayID Data Block.\n",
+		     data_block.c_str());
 
 	dispid.block_number++;
 	return len + 3;
-- 
2.24.3 (Apple Git-128)

