Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5938B41876E
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhIZIfW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:22 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:37615 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229906AbhIZIfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:20 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UP1ZmgGnWczbLUPbSmV5UW; Sun, 26 Sep 2021 08:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645222; bh=KrtvXEboYOGDEsNsPOIjz4HW6i6GSAhJ7rJp5dws268=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=m7zq/8rTtWVQXRLHDbKND9LawrCR80zNXhKrv+ackzSfn/uEG7vvOvBZhqaQ7qHmA
         TVd3+pkogDZOSC92luM5EB3kbrmdRmuWPyaGst/O5lsyKaIB1KESAZB8HiUWWExmQv
         pfWNfbfXFHQeXOARVLSmzowkXKfVLlE7l0aUTOIkijviKfJXGciD0H4bcr/DV/27Im
         QuPgy8wNzD9HNjSi2EPgwWZ5+FT5A4/gcDGepAcq6P0WZO8ufzC065UuqV45fnBc4L
         f2W6ADkm63C6yWE86EjHGyy3PmZgkMV8KCgpySz/lC/x8gwQBFEluXehFzOYJSH6OH
         ZF+lCAa9JO5sA==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbSm6iFT; Sun, 26 Sep 2021 08:33:42 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503066
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=v-YZYUOcdODyg3dACn4A:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 19/29] edid-decode: remove offset from displayid_block
Date:   Sun, 26 Sep 2021 01:33:20 -0700
Message-Id: <20210926083330.5206-20-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEgJBw9xcn6NOBDfW8FMXxOY71iElWgLG6O8NvM9GTPoo1eCA7OSF8jEjx4saWz5Ty/y6OM0YVtTLXaQXkXeoP2F35M/wgxehSMZgDbAwijy0RerK5ye
 m6wPfo8zfCUoHdnhVCAjvYLXotZJPDZxd6F3Y/aIPGCNs9QjQLW3SI6GfMnw02t27yykn/lyOvCqChL4JDmF3H4r/pY+U2rDyNk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the function so that x points to the start of the DisplayID block.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.h             |   2 +-
 parse-displayid-block.cpp | 136 +++++++++++++++++++-------------------
 2 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/edid-decode.h b/edid-decode.h
index 4636978..c53dba3 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -395,7 +395,7 @@ struct edid_state {
 	void parse_displayid_type_10_timing(const unsigned char *x, unsigned sz,
 					    bool is_cta = false);
 	void preparse_displayid_block(const unsigned char *x);
-	unsigned displayid_block(const unsigned version, const unsigned char *x, unsigned offset, unsigned length);
+	unsigned displayid_block(const unsigned version, const unsigned char *x, unsigned length);
 	void parse_displayid_block(const unsigned char *x);
 	void parse_displayid_vesa(const unsigned char *x);
 	void parse_displayid_cta_data_block(const unsigned char *x);
diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 0a996bd..17f1805 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1651,10 +1651,10 @@ void edid_state::preparse_displayid_block(const unsigned char *x)
 	}
 }
 
-unsigned edid_state::displayid_block(const unsigned version, const unsigned char *x, unsigned offset, unsigned length)
+unsigned edid_state::displayid_block(const unsigned version, const unsigned char *x, unsigned length)
 {
 	unsigned i;
-		unsigned tag = x[offset];
+	unsigned tag = x[0];
 		unsigned oui = 0;
 
 		switch (tag) {
@@ -1698,7 +1698,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		case 0x7f: // DisplayID 1.3
 			if ((tag == 0x7e && version >= 0x20) ||
 			    (tag == 0x7f && version < 0x20)) {
-				oui = (x[offset + 3] << 16) + (x[offset + 4] << 8) + x[offset + 5];
+			oui = (x[3] << 16) + (x[4] << 8) + x[5];
 				const char *name = oui_name(oui);
 				bool reversed = false;
 
@@ -1732,14 +1732,14 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 
 		if (length < 3) {
 			// report a problem when the remaining bytes are not 0.
-			if (tag || x[offset + 1]) {
+		if (tag || x[1]) {
 				fail("Not enough bytes remain (%d) for a DisplayID data block or the DisplayID filler is non-0.\n", length);
 			}
 		return 0xff;
 		}
 
-		unsigned block_rev = x[offset + 1] & 0x07;
-		unsigned len = x[offset + 2];
+	unsigned block_rev = x[1] & 0x07;
+	unsigned len = x[2];
 
 		if (length < len + 3) {
 			fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
@@ -1748,7 +1748,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 
 		if (!tag && !len) {
 			// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
-			if (!memchk(x + offset, length)) {
+		if (!memchk(x, length)) {
 				fail("Non-0 filler bytes in the DisplayID block.\n");
 			}
 		return 0xff;
@@ -1757,133 +1757,133 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		printf("  %s:\n", data_block.c_str());
 
 		switch (tag) {
-		case 0x00: parse_displayid_product_id(x + offset); break;
-		case 0x01: parse_displayid_parameters(x + offset); break;
-		case 0x02: parse_displayid_color_characteristics(x + offset); break;
+	case 0x00: parse_displayid_product_id(x); break;
+	case 0x01: parse_displayid_parameters(x); break;
+	case 0x02: parse_displayid_color_characteristics(x); break;
 		case 0x03:
-			   check_displayid_datablock_revision(x[offset + 1], 0, block_rev & 1);
+		   check_displayid_datablock_revision(x[1], 0, block_rev & 1);
 			   for (i = 0; i < len / 20; i++)
-				   parse_displayid_type_1_7_timing(&x[offset + 3 + (i * 20)], false, block_rev);
+			   parse_displayid_type_1_7_timing(&x[3 + (i * 20)], false, block_rev);
 			   break;
 		case 0x04:
-			   check_displayid_datablock_revision(x[offset + 1]);
+		   check_displayid_datablock_revision(x[1]);
 			   for (i = 0; i < len / 11; i++)
-				   parse_displayid_type_2_timing(&x[offset + 3 + (i * 11)]);
+			   parse_displayid_type_2_timing(&x[3 + (i * 11)]);
 			   break;
 		case 0x05:
-			   check_displayid_datablock_revision(x[offset + 1], 0, block_rev & 1);
+		   check_displayid_datablock_revision(x[1], 0, block_rev & 1);
 			   for (i = 0; i < len / 3; i++)
-				   parse_displayid_type_3_timing(&x[offset + 3 + (i * 3)]);
+			   parse_displayid_type_3_timing(&x[3 + (i * 3)]);
 			   break;
 		case 0x06:
-			   check_displayid_datablock_revision(x[offset + 1], 0xc0, 1);
+		   check_displayid_datablock_revision(x[1], 0xc0, 1);
 			   for (i = 0; i < len; i++)
-				   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6, x[offset + 3 + i]);
+			   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6, x[3 + i]);
 			   break;
 		case 0x07:
-			   check_displayid_datablock_revision(x[offset + 1]);
+		   check_displayid_datablock_revision(x[1]);
 			   for (i = 0; i < min(len, 10) * 8; i++)
-				   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
+			   if (x[3 + i / 8] & (1 << (i % 8))) {
 					   char type[16];
 					   sprintf(type, "DMT 0x%02x", i + 1);
 					   print_timings("    ", find_dmt_id(i + 1), type);
 				   }
 			   break;
 		case 0x08:
-			   check_displayid_datablock_revision(x[offset + 1]);
+		   check_displayid_datablock_revision(x[1]);
 			   for (i = 0; i < min(len, 8) * 8; i++)
-				   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
+			   if (x[3 + i / 8] & (1 << (i % 8))) {
 					   char type[16];
 					   sprintf(type, "VIC %3u", i + 1);
 					   print_timings("    ", find_vic_id(i + 1), type);
 				   }
 			   break;
-		case 0x09: parse_displayid_video_timing_range_limits(x + offset); break;
+	case 0x09: parse_displayid_video_timing_range_limits(x); break;
 		case 0x0a:
-		case 0x0b: parse_displayid_string(x + offset); break;
-		case 0x0c: parse_displayid_display_device(x + offset); break;
-		case 0x0d: parse_displayid_intf_power_sequencing(x + offset); break;
-		case 0x0e: parse_displayid_transfer_characteristics(x + offset); break;
-		case 0x0f: parse_displayid_display_intf(x + offset); break;
-		case 0x10: parse_displayid_stereo_display_intf(x + offset); break;
+	case 0x0b: parse_displayid_string(x); break;
+	case 0x0c: parse_displayid_display_device(x); break;
+	case 0x0d: parse_displayid_intf_power_sequencing(x); break;
+	case 0x0e: parse_displayid_transfer_characteristics(x); break;
+	case 0x0f: parse_displayid_display_intf(x); break;
+	case 0x10: parse_displayid_stereo_display_intf(x); break;
 		case 0x11:
-			   check_displayid_datablock_revision(x[offset + 1]);
+		   check_displayid_datablock_revision(x[1]);
 			   for (i = 0; i < len / 7; i++)
-				   parse_displayid_type_5_timing(&x[offset + 3 + (i * 7)]);
+			   parse_displayid_type_5_timing(&x[3 + (i * 7)]);
 			   break;
-		case 0x12: parse_displayid_tiled_display_topology(x + offset, false); break;
+	case 0x12: parse_displayid_tiled_display_topology(x, false); break;
 		case 0x13:
-			   check_displayid_datablock_revision(x[offset + 1]);
-			   for (i = 0; i < len; i += (x[offset + 3 + i + 2] & 0x40) ? 17 : 14)
-				   parse_displayid_type_6_timing(&x[offset + 3 + i]);
+		   check_displayid_datablock_revision(x[1]);
+		   for (i = 0; i < len; i += (x[3 + i + 2] & 0x40) ? 17 : 14)
+			   parse_displayid_type_6_timing(&x[3 + i]);
 			   break;
-		case 0x20: parse_displayid_product_id(x + offset); break;
+	case 0x20: parse_displayid_product_id(x); break;
 		case 0x21:
 			   if (block_rev >= 1)
-				   check_displayid_datablock_revision(x[offset + 1], 0x80, 1);
+			   check_displayid_datablock_revision(x[1], 0x80, 1);
 			   else
-				   check_displayid_datablock_revision(x[offset + 1], 0x80, 0);
-			   parse_displayid_parameters_v2(x + offset, block_rev);
+			   check_displayid_datablock_revision(x[1], 0x80, 0);
+		   parse_displayid_parameters_v2(x, block_rev);
 			   break;
 		case 0x22: {
 			   unsigned sz = 20;
 
 			   if (block_rev >= 2)
-				   check_displayid_datablock_revision(x[offset + 1], 0x08, 2);
+			   check_displayid_datablock_revision(x[1], 0x08, 2);
 			   else if (block_rev == 1)
-				   check_displayid_datablock_revision(x[offset + 1], 0x08, 1);
+			   check_displayid_datablock_revision(x[1], 0x08, 1);
 			   else
-				   check_displayid_datablock_revision(x[offset + 1]);
-			   sz += (x[offset + 1] & 0x70) >> 4;
-			   if (block_rev >= 1 && (x[offset + 1] & 0x08))
+			   check_displayid_datablock_revision(x[1]);
+		   sz += (x[1] & 0x70) >> 4;
+		   if (block_rev >= 1 && (x[1] & 0x08))
 				   printf("    These timings support DSC pass-through\n");
 			   for (i = 0; i < len / sz; i++)
-				   parse_displayid_type_1_7_timing(&x[offset + 3 + i * sz], true, block_rev);
+			   parse_displayid_type_1_7_timing(&x[3 + i * sz], true, block_rev);
 			   break;
 		}
 		case 0x23:
 			   if (block_rev)
-				   check_displayid_datablock_revision(x[offset + 1], 0xe8, 1);
+			   check_displayid_datablock_revision(x[1], 0xe8, 1);
 			   else
-				   check_displayid_datablock_revision(x[offset + 1], 0xc8);
-			   if (x[offset + 1] & 0x08) {
+			   check_displayid_datablock_revision(x[1], 0xc8);
+		   if (x[1] & 0x08) {
 				   for (i = 0; i < len / 2; i++)
-					   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
-									   x[offset + 3 + i * 2] |
-									   (x[offset + 4 + i * 2] << 8));
+				   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6,
+								   x[3 + i * 2] |
+								   (x[4 + i * 2] << 8));
 			   } else {
 				   for (i = 0; i < len; i++)
-					   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
-									   x[offset + 3 + i]);
+				   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6,
+								   x[3 + i]);
 			   }
 			   break;
 		case 0x24:
-			   check_displayid_datablock_revision(x[offset + 1]);
+		   check_displayid_datablock_revision(x[1]);
 			   for (i = 0; i < len / 6; i++)
-				   parse_displayid_type_9_timing(&x[offset + 3 + i * 6]);
+			   parse_displayid_type_9_timing(&x[3 + i * 6]);
 			   break;
-		case 0x25: parse_displayid_dynamic_video_timings_range_limits(x + offset); break;
-		case 0x26: parse_displayid_interface_features(x + offset); break;
-		case 0x27: parse_displayid_stereo_display_intf(x + offset); break;
-		case 0x28: parse_displayid_tiled_display_topology(x + offset, true); break;
-		case 0x29: parse_displayid_ContainerID(x + offset); break;
-		case 0x2b: parse_displayid_adaptive_sync(x + offset); break;
+	case 0x25: parse_displayid_dynamic_video_timings_range_limits(x); break;
+	case 0x26: parse_displayid_interface_features(x); break;
+	case 0x27: parse_displayid_stereo_display_intf(x); break;
+	case 0x28: parse_displayid_tiled_display_topology(x, true); break;
+	case 0x29: parse_displayid_ContainerID(x); break;
+	case 0x2b: parse_displayid_adaptive_sync(x + offset); break;
 		case 0x32: {
-			   unsigned sz = 6 + ((x[offset + 1] & 0x70) >> 4);
+		   unsigned sz = 6 + ((x[1] & 0x70) >> 4);
 
-			   check_displayid_datablock_revision(x[offset + 1], 0x70);
+		   check_displayid_datablock_revision(x[1], 0x70);
 			   for (i = 0; i < len / sz; i++)
-				   parse_displayid_type_10_timing(&x[offset + 3 + i * sz], sz);
+			   parse_displayid_type_10_timing(&x[3 + i * sz], sz);
 			   break;
 		}
-		case 0x81: parse_displayid_cta_data_block(x + offset); break;
+	case 0x81: parse_displayid_cta_data_block(x); break;
 		case 0x7e:
 			if (oui == 0x3a0292) {
-				parse_displayid_vesa(x + offset);
+			parse_displayid_vesa(x);
 				break;
 			}
 			// fall-through
-		default: hex_block("    ", x + offset + 3, len); break;
+	default: hex_block("    ", x + 3, len); break;
 		}
 
 		if ((tag == 0x00 || tag == 0x20) &&
@@ -1934,7 +1934,7 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 
 	unsigned offset = 5;
 	while (length > 0) {
-		unsigned len = displayid_block(version, x, offset, length);
+		unsigned len = displayid_block(version, x + offset, length);
 		if (len == 0xff) break;
 		length -= len + 3;
 		offset += len + 3;
-- 
2.24.3 (Apple Git-128)

