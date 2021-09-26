Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4841B418762
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhIZIfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:12 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229716AbhIZIfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:12 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U8Srmf7ImczbLUPbLmV5UA; Sun, 26 Sep 2021 08:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645215; bh=IeG+TOkGXSbHeUsXujnXeXAEfg1Y72ROA6DPtfl4sg8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZVBHBtwDxGmJZYN9q+06yfmx2qGRpFYqqLVP5mw31SReVafqod3+/kYDx5rbwjUUG
         N3mibIcPbCvLy0ehde4QPRghOL4o2aARm/JscCWGgLS7Q5ho5RBJIljC867ho+6D6i
         3IsIyW7UVuUWLd9jf8I7FDgxuxYnPu4bmwNSbgoPqG5bQaWi4kTZE8g4DmwSaufkRC
         LM8P0FI8k/INfcFlek1y3JGux5No5bVhwynLrYy0jEu33wXas2YOXlqklRxaqcALKp
         bnp/HpwQCDSg05BaSOaSXQL33+JEFsNFNMpbmPwZyo9QhcaaTFzrnJrCWWcaRexiZw
         gqDtBx1HRk3sQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbLm6iEY; Sun, 26 Sep 2021 08:33:35 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6150305f
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=_UliggVT9reaaKrPQY0A:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 07/29] edid-decode: extended tag length check
Date:   Sun, 26 Sep 2021 01:33:08 -0700
Message-Id: <20210926083330.5206-8-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDj+u4Nplv7rCIWEO8fSNAHUhse0sWW7L1c1b8VNooIKeApJNtz20q+KTHy7q10ZDWcMiJYKfkluw5pMjlJExmDuMnYicmLNwN7xT8LD0RY0Xj8Z2wON
 YN79n8UCzbIhb7GAfJAFiJelA+UWiwzaIqjl5ZCVFU4i2sYXYcT4DQdZCvBm+aSzhNpp+y160Rofk6osHkIdtmcWFmcdwiY12l0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change:
- Don't read extended tag if length of extended block is zero. Report a fail in that case.

Modifications that don't change behavior but help with the above change or with changes in later commits:
- Differentiate extended tags from normal tags by adding 0x700 to the extended tag byte.
- Increase x after parsing each byte (the tag/length byte and the extended tag byte). Decrease length if there's an extended byte.
- Change cta_ext_block so that x parameter points to byte after the extended tag. Since x points to after extended tag, pass the extended tag as a parameter.
- After reading an OUI, increase x by 3 and decrease length by 3.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.h       |   2 +-
 parse-cta-block.cpp | 208 ++++++++++++++++++++++++--------------------
 2 files changed, 113 insertions(+), 97 deletions(-)

diff --git a/edid-decode.h b/edid-decode.h
index aef2bab..57cb6e6 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -344,7 +344,7 @@ struct edid_state {
 	void cta_displayid_type_7(const unsigned char *x, unsigned length);
 	void cta_displayid_type_8(const unsigned char *x, unsigned length);
 	void cta_displayid_type_10(const unsigned char *x, unsigned length);
-	void cta_ext_block(const unsigned char *x, unsigned length, bool duplicate);
+	void cta_ext_block(unsigned tag, const unsigned char *x, unsigned length, bool duplicate);
 	void cta_block(const unsigned char *x, bool duplicate);
 	void preparse_cta_block(const unsigned char *x);
 	void parse_cta_block(const unsigned char *x);
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index bba3af2..f1ad041 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2027,7 +2027,7 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 	}
 }
 
-void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
+void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned length,
 			       bool duplicate)
 {
 	const char *name;
@@ -2035,60 +2035,60 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 	bool reverse = false;
 	bool audio_block = false;
 
-	switch (x[0]) {
-	case 0x00: data_block = "Video Capability Data Block"; break;
-	case 0x01: data_block.clear(); break;
-	case 0x02: data_block = "VESA Video Display Device Data Block"; break;
-	case 0x03: data_block = "VESA Video Timing Block Extension"; break;
-	case 0x04: data_block = "Reserved for HDMI Video Data Block"; break;
-	case 0x05: data_block = "Colorimetry Data Block"; break;
-	case 0x06: data_block = "HDR Static Metadata Data Block"; break;
-	case 0x07: data_block = "HDR Dynamic Metadata Data Block"; break;
-
-	case 0x0d: data_block = "Video Format Preference Data Block"; break;
-	case 0x0e: data_block = "YCbCr 4:2:0 Video Data Block"; break;
-	case 0x0f: data_block = "YCbCr 4:2:0 Capability Map Data Block"; break;
-	case 0x10: data_block = "Reserved for CTA-861 Miscellaneous Audio Fields"; break;
-	case 0x11: data_block.clear(); audio_block = true; break;
-	case 0x12: data_block = "HDMI Audio Data Block"; audio_block = true; break;
-	case 0x13: data_block = "Room Configuration Data Block"; audio_block = true; break;
-	case 0x14: data_block = "Speaker Location Data Block"; audio_block = true; break;
-
-	case 0x20: data_block = "InfoFrame Data Block"; break;
-
-	case 0x34: data_block = "DisplayID Type VII Video Timing Data Block"; break;
-	case 0x35: data_block = "DisplayID Type VIII Video Timing Data Block"; break;
-	case 0x42: data_block = "DisplayID Type X Video Timing Data Block"; break;
-
-	case 0x78: data_block = "HDMI Forum EDID Extension Override Data Block"; break;
-	case 0x79: data_block = "HDMI Forum Sink Capability Data Block"; break;
+	switch (tag) {
+	case 0x700: data_block = "Video Capability Data Block"; break;
+	case 0x701: data_block.clear(); break;
+	case 0x702: data_block = "VESA Video Display Device Data Block"; break;
+	case 0x703: data_block = "VESA Video Timing Block Extension"; break;
+	case 0x704: data_block = "Reserved for HDMI Video Data Block"; break;
+	case 0x705: data_block = "Colorimetry Data Block"; break;
+	case 0x706: data_block = "HDR Static Metadata Data Block"; break;
+	case 0x707: data_block = "HDR Dynamic Metadata Data Block"; break;
+
+	case 0x70d: data_block = "Video Format Preference Data Block"; break;
+	case 0x70e: data_block = "YCbCr 4:2:0 Video Data Block"; break;
+	case 0x70f: data_block = "YCbCr 4:2:0 Capability Map Data Block"; break;
+	case 0x710: data_block = "Reserved for CTA-861 Miscellaneous Audio Fields"; break;
+	case 0x711: data_block.clear(); audio_block = true; break;
+	case 0x712: data_block = "HDMI Audio Data Block"; audio_block = true; break;
+	case 0x713: data_block = "Room Configuration Data Block"; audio_block = true; break;
+	case 0x714: data_block = "Speaker Location Data Block"; audio_block = true; break;
+
+	case 0x720: data_block = "InfoFrame Data Block"; break;
+
+	case 0x734: data_block = "DisplayID Type VII Video Timing Data Block"; break;
+	case 0x735: data_block = "DisplayID Type VIII Video Timing Data Block"; break;
+	case 0x742: data_block = "DisplayID Type X Video Timing Data Block"; break;
+
+	case 0x778: data_block = "HDMI Forum EDID Extension Override Data Block"; break;
+	case 0x779: data_block = "HDMI Forum Sink Capability Data Block"; break;
 	default:
-		if (x[0] <= 12)
+		if (tag < 0x70d)
 			printf("  Unknown CTA-861 Video-Related");
-		else if (x[0] <= 31)
+		else if (tag < 0x720)
 			printf("  Unknown CTA-861 Audio-Related");
-		else if (x[0] >= 120 && x[0] <= 127)
+		else if (tag >= 0x778 && tag <= 0x77f)
 			printf("  Unknown CTA-861 HDMI-Related");
 		else
 			printf("  Unknown CTA-861");
-		printf(" Data Block (extended tag 0x%02x, length %u)\n", x[0], length);
-		hex_block("    ", x + 1, length);
+		printf(" Data Block (extended tag 0x%02x)\n", tag & 0xff);
+		hex_block("    ", x, length);
 		data_block.clear();
-		warn("Unknown Extended CTA-861 Data Block 0x%02x.\n", x[0]);
+		warn("Unknown Extended CTA-861 Data Block 0x%02x.\n", tag & 0xff);
 		return;
 	}
 
-	switch (x[0]) {
-	case 0x00:
-	case 0x02:
-	case 0x05:
-	case 0x06:
-	case 0x0d:
-	case 0x0f:
-	case 0x12:
-	case 0x13:
-	case 0x78:
-	case 0x79:
+	switch (tag) {
+	case 0x700:
+	case 0x702:
+	case 0x705:
+	case 0x706:
+	case 0x70d:
+	case 0x70f:
+	case 0x712:
+	case 0x713:
+	case 0x778:
+	case 0x779:
 		if (duplicate)
 			fail("Only one instance of this Data Block is allowed.\n");
 	}
@@ -2100,15 +2100,16 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 	if (data_block.length())
 		printf("  %s:\n", data_block.c_str());
 
-	switch (x[0]) {
-	case 0x00: cta_vcdb(x + 1, length); break;
-	case 0x01:
+	switch (tag) {
+	case 0x700: cta_vcdb(x, length); break;
+	case 0x701:
 		if (length < 3) {
 			data_block = std::string("Vendor-Specific Video Data Block");
 			fail("Invalid length %u < 3.\n", length);
 			break;
 		}
-		oui = (x[3] << 16) + (x[2] << 8) + x[1];
+		oui = (x[2] << 16) + (x[1] << 8) + x[0];
+		x += 3; length -=3;
 		name = oui_name(oui);
 		if (!name) {
 			name = oui_name(oui, true);
@@ -2118,7 +2119,7 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 		if (!name) {
 			printf("  Vendor-Specific Video Data Block, OUI %s:\n",
 			       ouitohex(oui).c_str());
-			hex_block("    ", x + 4, length - 3);
+			hex_block("    ", x, length);
 			data_block.clear();
 			warn("Unknown Extended Vendor-Specific Video Data Block, OUI %s.\n",
 			     ouitohex(oui).c_str());
@@ -2129,26 +2130,27 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
 		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
 		if (oui == 0x90848b)
-			cta_hdr10plus(x + 4, length - 3);
+			cta_hdr10plus(x, length);
 		else if (oui == 0x00d046)
-			cta_dolby_video(x + 4, length - 3);
+			cta_dolby_video(x, length);
 		else
-			hex_block("    ", x + 4, length - 3);
+			hex_block("    ", x, length);
 		break;
-	case 0x02: cta_vesa_vdddb(x + 1, length); break;
-	case 0x05: cta_colorimetry_block(x + 1, length); break;
-	case 0x06: cta_hdr_static_metadata_block(x + 1, length); break;
-	case 0x07: cta_hdr_dyn_metadata_block(x + 1, length); break;
-	case 0x0d: cta_vfpdb(x + 1, length); break;
-	case 0x0e: cta_svd(x + 1, length, true); break;
-	case 0x0f: cta_y420cmdb(x + 1, length); break;
-	case 0x11:
+	case 0x702: cta_vesa_vdddb(x, length); break;
+	case 0x705: cta_colorimetry_block(x, length); break;
+	case 0x706: cta_hdr_static_metadata_block(x, length); break;
+	case 0x707: cta_hdr_dyn_metadata_block(x, length); break;
+	case 0x70d: cta_vfpdb(x, length); break;
+	case 0x70e: cta_svd(x, length, true); break;
+	case 0x70f: cta_y420cmdb(x, length); break;
+	case 0x711:
 		if (length < 3) {
 			data_block = std::string("Vendor-Specific Audio Data Block");
 			fail("Invalid length %u < 3.\n", length);
 			break;
 		}
-		oui = (x[3] << 16) + (x[2] << 8) + x[1];
+		oui = (x[2] << 16) + (x[1] << 8) + x[0];
+		x += 3; length -=3;
 		name = oui_name(oui);
 		if (!name) {
 			name = oui_name(oui, true);
@@ -2158,7 +2160,7 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 		if (!name) {
 			printf("  Vendor-Specific Audio Data Block, OUI %s:\n",
 			       ouitohex(oui).c_str());
-			hex_block("    ", x + 4, length - 3);
+			hex_block("    ", x, length);
 			data_block.clear();
 			warn("Unknown Extended Vendor-Specific Audio Data Block, OUI %s.\n",
 			     ouitohex(oui).c_str());
@@ -2169,24 +2171,24 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
 		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
 		if (oui == 0x00d046)
-			cta_dolby_audio(x + 4, length - 3);
+			cta_dolby_audio(x, length);
 		else
-			hex_block("    ", x + 4, length - 3);
+			hex_block("    ", x, length);
 		break;
-	case 0x12: cta_hdmi_audio_block(x + 1, length); break;
-	case 0x13: cta_rcdb(x + 1, length); break;
-	case 0x14: cta_sldb(x + 1, length); break;
-	case 0x20: cta_ifdb(x + 1, length); break;
-	case 0x34: cta_displayid_type_7(x + 1, length); break;
-	case 0x35: cta_displayid_type_8(x + 1, length); break;
-	case 0x42: cta_displayid_type_10(x + 1, length); break;
-	case 0x78:
-		cta_hf_eeodb(x + 1, length);
+	case 0x712: cta_hdmi_audio_block(x, length); break;
+	case 0x713: cta_rcdb(x, length); break;
+	case 0x714: cta_sldb(x, length); break;
+	case 0x720: cta_ifdb(x, length); break;
+	case 0x734: cta_displayid_type_7(x, length); break;
+	case 0x735: cta_displayid_type_8(x, length); break;
+	case 0x742: cta_displayid_type_10(x, length); break;
+	case 0x778:
+		cta_hf_eeodb(x, length);
 		// This must be the first CTA-861 block
 		if (!cta.first_block)
 			fail("Block starts at a wrong offset.\n");
 		break;
-	case 0x79:
+	case 0x779:
 		if (!cta.last_block_was_hdmi_vsdb)
 			fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB.\n");
 		if (cta.have_hf_scdb || cta.have_hf_vsdb)
@@ -2196,13 +2198,13 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 			fail("Invalid length %u < 2.\n", length);
 			break;
 		}
-		if (x[1] || x[2])
+		if (x[0] || x[1])
 			printf("  Non-zero SCDB reserved fields!\n");
-		cta_hf_scdb(x + 3, length - 2);
+		cta_hf_scdb(x + 2, length - 2);
 		cta.have_hf_scdb = 1;
 		break;
 	default:
-		hex_block("    ", x + 1, length);
+		hex_block("    ", x, length);
 	}
 
 }
@@ -2210,25 +2212,36 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 void edid_state::cta_block(const unsigned char *x, bool duplicate)
 {
 	unsigned length = x[0] & 0x1f;
+	unsigned tag=(x[0] & 0xe0) >> 5;
+	unsigned extended = (tag == 0x07) ? 1 : 0;
+	x++;
+	if (extended && length) {
+		tag <<= 8;
+		tag |= x[0];
+		length--;
+		x++;
+	}
+
 	const char *name;
 	unsigned oui;
 	bool reverse = false;
 	bool audio_block = false;
 
-	switch ((x[0] & 0xe0) >> 5) {
+	switch (tag) {
 	case 0x01:
 		data_block = "Audio Data Block";
 		printf("  %s:\n", data_block.c_str());
-		cta_audio_block(x + 1, length);
+		cta_audio_block(x, length);
 		audio_block = true;
 		break;
 	case 0x02:
 		data_block = "Video Data Block";
 		printf("  %s:\n", data_block.c_str());
-		cta_svd(x + 1, length, false);
+		cta_svd(x, length, false);
 		break;
 	case 0x03:
-		oui = (x[3] << 16) + (x[2] << 8) + x[1];
+		oui = (x[2] << 16) + (x[1] << 8) + x[0];
+		x += 3; length -=3;
 		name = oui_name(oui);
 		if (!name) {
 			name = oui_name(oui, true);
@@ -2237,7 +2250,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		}
 		if (!name) {
 			printf("  Vendor-Specific Data Block, OUI %s:\n", ouitohex(oui).c_str());
-			hex_block("    ", x + 4, length - 3);
+			hex_block("    ", x, length);
 			data_block.clear();
 			warn("Unknown Vendor-Specific Data Block, OUI %s.\n",
 			     ouitohex(oui).c_str());
@@ -2248,7 +2261,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
 		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
 		if (oui == 0x000c03) {
-			cta_hdmi_block(x + 4, length - 3);
+			cta_hdmi_block(x, length);
 			cta.last_block_was_hdmi_vsdb = 1;
 			cta.first_block = 0;
 			// The HDMI OUI is present, so this EDID represents an HDMI
@@ -2264,24 +2277,24 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n");
 			if (cta.have_hf_scdb || cta.have_hf_vsdb)
 				fail("Duplicate HDMI Forum VSDB/SCDB.\n");
-			cta_hf_scdb(x + 4, length - 3);
+			cta_hf_scdb(x, length);
 			cta.have_hf_vsdb = 1;
 			break;
 		}
 		if (oui == 0x00001a) {
-			cta_amd(x + 4, length - 3);
+			cta_amd(x, length);
 			break;
 		}
 		if (oui == 0xca125c && length == 0x15) {
-			cta_microsoft(x + 4, length - 3);
+			cta_microsoft(x, length);
 			break;
 		}
-		hex_block("    ", x + 4, length - 3);
+		hex_block("    ", x, length);
 		break;
 	case 0x04:
 		data_block = "Speaker Allocation Data Block";
 		printf("  %s:\n", data_block.c_str());
-		cta_sadb(x + 1, length);
+		cta_sadb(x, length);
 		audio_block = true;
 		if (duplicate)
 			fail("Only one instance of this Data Block is allowed.\n");
@@ -2289,19 +2302,22 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x05:
 		data_block = "VESA Display Transfer Characteristics Data Block";
 		printf("  %s:\n", data_block.c_str());
-		cta_vesa_dtcdb(x + 1, length);
+		cta_vesa_dtcdb(x, length);
 		if (duplicate)
 			fail("Only one instance of this Data Block is allowed.\n");
 		break;
 	case 0x07:
-		cta_ext_block(x + 1, length - 1, duplicate);
+		data_block = "Unknown CTA-861 Data Block (extended tag truncated)";
+		printf("  %s:\n", data_block.c_str());
+		fail("Extended tag cannot have zero length.\n");
 		break;
 	default: {
-		unsigned tag = (*x & 0xe0) >> 5;
-		unsigned length = *x & 0x1f;
-
-		printf("  Unknown CTA-861 tag 0x%02x, length %u\n", tag, length);
-		hex_block("    ", x + 1, length);
+		if (extended) {
+			cta_ext_block(tag, x, length, duplicate);
+			break;
+		}
+		printf("  Unknown CTA-861 tag 0x%02x\n", tag);
+		hex_block("    ", x, length);
 		data_block.clear();
 		warn("Unknown CTA-861 Data Block %u.\n", tag);
 		break;
-- 
2.24.3 (Apple Git-128)

