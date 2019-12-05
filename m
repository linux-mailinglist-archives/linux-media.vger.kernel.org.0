Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A90113C6C
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 08:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfLEHeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 02:34:24 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:36167 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfLEHeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 02:34:24 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id cleQi8c1NRnrKcleUi9Y2V; Thu, 05 Dec 2019 00:34:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1575531258;
        bh=ckBuL8koxkerxl8B9sPaJFfUnE+2bKHA16dfvRlqZyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ErAieLMDR6w80rlZY+NatB5WXhF6G6CDe/dUcWKFIUkdGB8cJZD0gEMnn3I2D7INf
         aB/uWJtuw75o7KK6eidU+LjHaX75ehzzDq2TtdaZUO/gGPuLoDJRzEI2AtEubHkRxd
         0xFQTBRWhS4WZ/kPE1vyPO/0LZ91KavTK6IYuFetTIq8CHQefWp2jD6N74e+H/iDSv
         wdOdyjvb7mLvTRqSeSbIQy1To1DBVADsQPNSioYU/6Ft7Re0pjOD2CBzT8NEhb2EtJ
         66MCZ1fCxoX3oJ5Spp7R805NA74d5j3+/h00RVEbxaojBzpnfFBZxuzYUkWIYLA4rH
         5vuJxMQA7OhxQ==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=NkkpCSOSCSmbDrRmHikA:9
 a=XlzQoAgWNp1CfoM_:21 a=I-tnMgcYzh4RlgPL:21 a=itKHPHTafuwA:10
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 4/5] edid-decode: CTA extension block cleanup
Date:   Wed,  4 Dec 2019 23:34:13 -0800
Message-Id: <20191205073414.53672-4-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191205073414.53672-1-joevt@shaw.ca>
References: <20191205073414.53672-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNRI+2yjonfkxDYFUh+DoQZcda613OpF0rHNVmDO9sa+XCCITWfYq1AbNTewEU5yr7FjT9a/mz74d5y3Tr70uw8baeFfGUQiqgKY8696Niy2pyHU1dfD
 6ZmCgEa8Mlb1HQMLkq6niES9CIK05wGDz/04Cbm/SYRVlhRmFNAAboAcVUolDAS+FLPEQn2xb6UaVQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduced tag parsing code.
Added OUI min block length checks.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.h       |   1 +
 parse-cta-block.cpp | 336 ++++++++++++++++++--------------------------
 2 files changed, 138 insertions(+), 199 deletions(-)

diff --git a/edid-decode.h b/edid-decode.h
index 83ded83..758bdcf 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -111,6 +111,7 @@ struct edid_state {
 	void cta_y420cmdb(const unsigned char *x, unsigned length);
 	void cta_vfpdb(const unsigned char *x, unsigned length);
 	void cta_hdmi_block(const unsigned char *x, unsigned length);
+	void cta_oui(const char *block_name, const unsigned char *x, unsigned length, unsigned *ouinum);
 	void cta_block(const unsigned char *x);
 	void preparse_cta_block(const unsigned char *x);
 	void parse_cta_block(const unsigned char *x);
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index dea87c1..e52822a 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -375,6 +375,11 @@ void edid_state::cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
 
 		if (vic == 1 && !for_ycbcr420)
 			has_cta861_vic_1 = 1;
+
+		// vics and has_vic are basically the same (if has_vic was not bool), except vics
+		// is built after preparse (during parse) which allows errors for duplicates to be
+		// output in parse order. has_vic is built during preparse and is used when vics
+		// from other blocks need to be checked.
 		if (++vics[vic][for_ycbcr420] == 2)
 			fail("Duplicate %sVIC %u\n", for_ycbcr420 ? "YCbCr 4:2:0 " : "", vic);
 		if (for_ycbcr420 && has_vic[0][vic])
@@ -485,7 +490,6 @@ void edid_state::cta_hdmi_block(const unsigned char *x, unsigned length)
 {
 	unsigned len_vic, len_3d;
 
-	printf(" (HDMI)\n");
 	printf("    Source physical address %u.%u.%u.%u\n", x[3] >> 4, x[3] & 0x0f,
 	       x[4] >> 4, x[4] & 0x0f);
 
@@ -1228,10 +1232,20 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 		x += 4;
 	}
 }
+const unsigned kOUI_Unknown   = 1<<12;
+const unsigned kOUI_HDMI      = 2<<12;
+const unsigned kOUI_HDMIForum = 3<<12;
+const unsigned kOUI_HDR10     = 4<<12;
 
-static const char *oui_name(unsigned oui)
+static const char *oui_name(unsigned oui, unsigned *ouinum = NULL)
 {
+	unsigned ouinumscratch;
+	if (!ouinum) ouinum = &ouinumscratch;
+	*ouinum = kOUI_Unknown;
 	switch (oui) {
+	case 0x000c03: *ouinum = kOUI_HDMI      ; return "HDMI";
+	case 0xc45dd8: *ouinum = kOUI_HDMIForum ; return "HDMI Forum";
+	case 0x90848b: *ouinum = kOUI_HDR10     ; return "HDR10+";
 	case 0x00001a: return "AMD";
 	case 0x00044b: return "NVIDIA";
 	case 0x000c6e: return "ASUS";
@@ -1244,212 +1258,136 @@ static const char *oui_name(unsigned oui)
 	}
 }
 
+void edid_state::cta_oui(const char *block_name, const unsigned char *x, unsigned length, unsigned *ouinum)
+{
+	char buf[10];
+	unsigned oui;
+
+	if (length < 3) {
+		oui = 0xffffffff;
+		sprintf(buf, "?");
+	} else {
+		oui = (x[2] << 16) + (x[1] << 8) + x[0];
+		sprintf(buf, "0x%06x", oui);
+	}
+	
+	const char *ouiname = oui_name(oui, ouinum);
+	std::string name = std::string(block_name) + ", OUI " + buf;
+	if (ouiname) name += std::string(" (") + ouiname + ")";
+	data_block = name;
+	
+	if (oui == 0xffffffff)
+		fail("CTA data block is not long enough to contain an OUI\n");
+}
+
+#define data_block_o(n) cta_oui(n, x + 1 + extended, length - extended, &ouinum)
+
 void edid_state::cta_block(const unsigned char *x)
 {
-	static int last_block_was_hdmi_vsdb;
-	static int have_hf_vsdb, have_hf_scdb;
-	static int first_block = 1;
+	static unsigned previous_cta_tag = 0;
+	static bool have_hf_vsdb = false;
+	static bool have_hf_scdb = false;
+	static unsigned cta_block_number = 0;
+
 	unsigned length = x[0] & 0x1f;
-	const char *name;
-	unsigned oui;
+	unsigned ouinum = 0;
+	unsigned tag=(x[0] & 0xe0) >> 5;
+	unsigned extended = tag == 0x07 ? 1 : 0;
+	if (extended) tag = 0x700 + x[1];
+
+	switch (tag) {
+	case 0x001: data_block = "Audio Data Block"; break;
+	case 0x002: data_block = "Video Data Block"; break;
+	case 0x003: data_block_o("Vendor-Specific Data Block"); break;
+	case 0x004: data_block = "Speaker Allocation Data Block"; break;
+	case 0x005: data_block = "VESA DTC Data Block"; break; // not implemented
+
+	case 0x700: data_block = "Video Capability Data Block"; break;
+	case 0x701: data_block_o("Vendor-Specific Video Data Block"); break;
+	case 0x702: data_block = "VESA Video Display Device Data Block"; break; // not implemented
+	case 0x703: data_block = "VESA Video Timing Block Extension"; break; // not implemented
+	case 0x704: data_block = "Reserved for HDMI Video Data Block"; break; // reserved
+	case 0x705: data_block = "Colorimetry Data Block"; break;
+	case 0x706: data_block = "HDR Static Metadata Data Block"; break;
+	case 0x707: data_block = "HDR Dynamic Metadata Data Block"; break;
+
+	case 0x70d: data_block = "Video Format Preference Data Block"; break;
+	case 0x70e: data_block = "YCbCr 4:2:0 Video Data Block"; break;
+	case 0x70f: data_block = "YCbCr 4:2:0 Capability Map Data Block"; break;
+	case 0x710: data_block = "Reserved for CTA Miscellaneous Audio Fields"; break; // reserved
+	case 0x711: data_block_o("Vendor-Specific Audio Data Block"); break; // no vendors implemented
+	case 0x712: data_block = "HDMI Audio Data Block"; break;
+	case 0x713: data_block = "Room Configuration Data Block"; break;
+	case 0x714: data_block = "Speaker Location Data Block"; break;
+
+	case 0x720: data_block = "InfoFrame Data Block"; break;
+
+	case 0x778: data_block = "HDMI Forum EDID Extension Override Data Block"; break;
+	case 0x779: data_block = "HDMI Forum Sink Capability Data Block"; break;
+	default:
+		     if (tag < 0x700) data_block = "Unknown CTA Data Block";
+		else if (tag < 0x70d) data_block = "Unknown CTA Video-Related Data Block";
+		else if (tag < 0x720) data_block = "Unknown CTA Audio-Related Data Block";
+		else if (tag < 0x778) data_block = "Unknown CTA Data Block";
+		else if (tag < 0x780) data_block = "Unknown CTA HDMI-Related Data Block";
+		else                  data_block = "Unknown CTA Data Block";
+		data_block += std::string(" (") + (extended ? "extended " : "") + "tag " + utohex(tag & 0xff) + ")";
+	}
 
-	switch ((x[0] & 0xe0) >> 5) {
-	case 0x01:
-		data_block = "Audio Data Block";
-		printf("  %s\n", data_block.c_str());
-		cta_audio_block(x + 1, length);
+	printf("  %s\n", data_block.c_str());
+	
+	tag |= ouinum;
+	switch (tag) {
+	case 0x001: cta_audio_block(x + 1, length); break;
+	case 0x002: cta_svd(x + 1, length, 0); break;
+	case 0x003|kOUI_HDMI:
+		cta_hdmi_block(x + 1, length);
+		if (edid_minor != 3)
+			fail("The HDMI Specification uses EDID 1.3, not 1.%u\n", edid_minor);
 		break;
-	case 0x02:
-		data_block = "Video Data Block";
-		printf("  %s\n", data_block.c_str());
-		cta_svd(x + 1, length, 0);
+	case 0x003|kOUI_HDMIForum:
+		if (previous_cta_tag != (0x003|kOUI_HDMI))
+			fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB\n");
+		if (have_hf_scdb || have_hf_vsdb)
+			fail("Duplicate HDMI Forum VSDB/SCDB\n");
+		cta_hf_scdb(x + 4, length - 3);
+		have_hf_vsdb = true;
 		break;
-	case 0x03:
-		oui = (x[3] << 16) + (x[2] << 8) + x[1];
-		printf("  Vendor-Specific Data Block, OUI 0x%06x", oui);
-		name = oui_name(oui);
-		if (oui == 0x000c03) {
-			data_block = "Vendor-Specific Data Block (HDMI)";
-			cta_hdmi_block(x + 1, length);
-			last_block_was_hdmi_vsdb = 1;
-			first_block = 0;
-			if (edid_minor != 3)
-				fail("The HDMI Specification uses EDID 1.3, not 1.%u\n", edid_minor);
-			return;
-		}
-		if (oui == 0xc45dd8) {
-			data_block = "Vendor-Specific Data Block (HDMI Forum)";
-			if (!last_block_was_hdmi_vsdb)
-				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB\n");
-			if (have_hf_scdb || have_hf_vsdb)
-				fail("Duplicate HDMI Forum VSDB/SCDB\n");
-			printf(" (HDMI Forum)\n");
-			cta_hf_scdb(x + 4, length - 3);
-			have_hf_vsdb = 1;
-		} else if (name) {
-			data_block = std::string("Vendor-Specific Data Block (") + name + ")";
-			printf(" (%s)\n", name);
-			hex_block("    ", x + 4, length - 3);
-		} else {
-			printf("\n");
-			hex_block("    ", x + 4, length - 3);
-			data_block.clear();
-			warn("Unknown Vendor-Specific Data Block, OUI 0x%06x\n", oui);
-		}
-		break;
-	case 0x04:
-		data_block = "Speaker Allocation Data Block";
-		printf("  %s\n", data_block.c_str());
-		cta_sadb(x + 1, length);
-		break;
-	case 0x05:
-		printf("  VESA DTC Data Block\n");
-		hex_block("  ", x + 1, length);
-		break;
-	case 0x07:
-		printf("  Extended tag: ");
-		switch (x[1]) {
-		case 0x00:
-			data_block = "Video Capability Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_vcdb(x + 2, length - 1);
-			break;
-		case 0x01:
-			oui = (x[4] << 16) + (x[3] << 8) + x[2];
-			printf("Vendor-Specific Video Data Block, OUI 0x%06x", oui);
-			name = oui_name(oui);
-			if (oui == 0x90848b) {
-				data_block = "Vendor-Specific Video Data Block (HDR10+)";
-				printf(" (HDR10+)\n");
-				cta_hdr10plus(x + 5, length - 4);
-			} else if (name) {
-				data_block = std::string("Vendor-Specific Data Block (") + name + ")";
-				printf(" (%s)\n", name);
-				hex_block("    ", x + 5, length - 4);
-			} else {
-				printf("\n");
-				hex_block("    ", x + 5, length - 4);
-				data_block.clear();
-				warn("Unknown Extended Vendor-Specific Data Block, OUI 0x%06x\n", oui);
-			}
-			break;
-		case 0x02:
-			printf("VESA Video Display Device Data Block\n");
-			hex_block("  ", x + 2, length - 1);
-			break;
-		case 0x03:
-			printf("VESA Video Timing Block Extension\n");
-			hex_block("  ", x + 2, length - 1);
-			break;
-		case 0x04:
-			printf("Reserved for HDMI Video Data Block\n");
-			hex_block("  ", x + 2, length - 1);
-			break;
-		case 0x05:
-			data_block = "Colorimetry Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_colorimetry_block(x + 2, length - 1);
-			break;
-		case 0x06:
-			data_block = "HDR Static Metadata Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_hdr_static_metadata_block(x + 2, length - 1);
-			break;
-		case 0x07:
-			data_block = "HDR Dynamic Metadata Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_hdr_dyn_metadata_block(x + 2, length - 1);
-			break;
-		case 0x0d:
-			data_block = "Video Format Preference Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_vfpdb(x + 2, length - 1);
-			break;
-		case 0x0e:
-			data_block = "YCbCr 4:2:0 Video Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_svd(x + 2, length - 1, 1);
-			break;
-		case 0x0f:
-			data_block = "YCbCr 4:2:0 Capability Map Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_y420cmdb(x + 2, length - 1);
-			break;
-		case 0x10:
-			printf("Reserved for CTA Miscellaneous Audio Fields\n");
-			hex_block("  ", x + 2, length - 1);
-			break;
-		case 0x11:
-			printf("Vendor-Specific Audio Data Block\n");
-			hex_block("  ", x + 2, length - 1);
-			break;
-		case 0x12:
-			data_block = "HDMI Audio Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_hdmi_audio_block(x + 2, length - 1);
-			break;
-		case 0x13:
-			data_block = "Room Configuration Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_rcdb(x + 2, length - 1);
-			break;
-		case 0x14:
-			data_block = "Speaker Location Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_sldb(x + 2, length - 1);
-			break;
-		case 0x20:
-			printf("InfoFrame Data Block\n");
-			cta_ifdb(x + 2, length - 1);
-			break;
-		case 0x78:
-			data_block = "HDMI Forum EDID Extension Override Data Block";
-			printf("%s\n", data_block.c_str());
-			cta_hf_eeodb(x + 2, length - 1);
-			// This must be the first CTA block
-			if (!first_block)
-				fail("Block starts at a wrong offset\n");
-			break;
-		case 0x79:
-			data_block = "HDMI Forum Sink Capability Data Block";
-			printf("%s\n", data_block.c_str());
-			if (!last_block_was_hdmi_vsdb)
-				fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB\n");
-			if (have_hf_scdb || have_hf_vsdb)
-				fail("Duplicate HDMI Forum VSDB/SCDB\n");
-			if (x[2] || x[3])
-				printf("  Non-zero SCDB reserved fields!\n");
-			cta_hf_scdb(x + 4, length - 3);
-			have_hf_scdb = 1;
-			break;
-		default:
-			if (x[1] <= 12)
-				printf("Unknown CTA Video-Related");
-			else if (x[1] <= 31)
-				printf("Unknown CTA Audio-Related");
-			else if (x[1] >= 120 && x[1] <= 127)
-				printf("Unknown CTA HDMI-Related");
-			else
-				printf("Unknown CTA");
-			printf(" Data Block (extended tag 0x%02x, length %u)\n", x[1], length - 1);
-			hex_block("    ", x + 2, length - 1);
-			data_block.clear();
-			warn("Unknown Extended CTA Data Block 0x%02x\n", x[1]);
-			break;
-		}
+	case 0x004: cta_sadb(x + 1, length); break;
+	case 0x700: cta_vcdb(x + 2, length - 1); break;
+	case 0x701|kOUI_HDR10: cta_hdr10plus(x + 5, length - 4); break;
+	case 0x705: cta_colorimetry_block(x + 2, length - 1); break;
+	case 0x706: cta_hdr_static_metadata_block(x + 2, length - 1); break;
+	case 0x707: cta_hdr_dyn_metadata_block(x + 2, length - 1); break;
+	case 0x70d: cta_vfpdb(x + 2, length - 1); break;
+	case 0x70e: cta_svd(x + 2, length - 1, 1); break;
+	case 0x70f: cta_y420cmdb(x + 2, length - 1); break;
+	case 0x712: cta_hdmi_audio_block(x + 2, length - 1); break;
+	case 0x713: cta_rcdb(x + 2, length - 1); break;
+	case 0x714: cta_sldb(x + 2, length - 1); break;
+	case 0x720: cta_ifdb(x + 2, length - 1); break;
+	case 0x778: 
+		cta_hf_eeodb(x + 2, length - 1);
+		// This must be the first CTA block
+		if (cta_block_number != 0)
+			fail("Block starts at a wrong offset\n");
 		break;
-	default: {
-		unsigned tag = (*x & 0xe0) >> 5;
-		unsigned length = *x & 0x1f;
-		printf("  Unknown CTA tag 0x%02x, length %u\n", tag, length);
-		hex_block("    ", x + 1, length);
-		data_block.clear();
-		warn("Unknown CTA Data Block %u\n", tag);
+	case 0x779:
+		if (previous_cta_tag != (0x003|kOUI_HDMI))
+			fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB\n");
+		if (have_hf_scdb || have_hf_vsdb)
+			fail("Duplicate HDMI Forum VSDB/SCDB\n");
+		if (x[2] || x[3])
+			printf("    Non-zero SCDB reserved fields!\n");
+		cta_hf_scdb(x + 4, length - 3);
+		have_hf_scdb = true;
 		break;
+	default:
+		warn("Unknown %s\n", data_block.c_str());
+		hex_block("    ", x + 1 + extended + (ouinum ? 3 : 0), length - (extended + (ouinum ? 3 : 0)));
 	}
-	}
-	first_block = 0;
-	last_block_was_hdmi_vsdb = 0;
+	cta_block_number++;
+	previous_cta_tag = tag;
 }
 
 void edid_state::preparse_cta_block(const unsigned char *x)
-- 
2.21.0 (Apple Git-122.2)

