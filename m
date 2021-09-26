Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77F1418769
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhIZIfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:16 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229839AbhIZIfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:15 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U8Srmf7IlczbLUPbPmV5UO; Sun, 26 Sep 2021 08:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645219; bh=sbHFubHuQ3iiojuyiXpxmDuwGpNgmWqADL8bV2qEjFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QVdO9K17tXvKWlm3t2rKC2P8pQrLTJuN2DviiMldcmlckGEn4alOdtCrVJVKVacTm
         FdKZldh57zsfaJMgijPHPSBXwJUWcGjaaB7Bedvkitr3Ab7QhfFJzDlt7y/K6vwXjX
         B6eA1u4jZmqDEUo/fS8ZAdBi/L7LMpE8ch6/lRQ3HSYkBk1U5CLQg9KxQzEzc+hZh+
         lgoQAwwxNBj4R7LS3RrXsd9yFOc1ogDxlur1gAG8YnpG0Oo9BlNyYxyDcqOWnVKaUn
         VbO7Uc3UPVwNUhZfW0uGEcTd9AvMUu/DBGLDndWGh+sc1s04HwtQq7IMVIQWYk5Dtr
         Q/R5P8xt+kzfw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbPm6iFB; Sun, 26 Sep 2021 08:33:39 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503063
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=RNklyZuhyY-evRvoHewA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 14/29] edid-decode: remove cta_ext_block
Date:   Sun, 26 Sep 2021 01:33:15 -0700
Message-Id: <20210926083330.5206-15-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLWqyMiRrzWtt7TlSBHSBgadNoiD9KrVh5lYWiIHC8GB8yBvRBun3f4h7+fAqMjsD6DmSET3fH72xTTvWI/t5zIfZl1R3QqerJZkQVRAaw/wp8owNpRD
 On5ORw4a/Tmvttu+TjzHoXMSjXj5DDhU8MNty2c+CUcl0E1rUG0AnJZO/21yKbqTriBSq4L0X9ZXjRlINovI6DZipnEv26A97z4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since cta_ext_block is exactly like cta_block now, we can move its code (mostly without modification) to cta_block. This way it's easier to ensure that the blocks are handled consistently (order of statements, including fails, warnings, defaults, etc.)

This change should not affect output.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.h       |   1 -
 parse-cta-block.cpp | 187 +++++++++++++++++++-------------------------
 2 files changed, 80 insertions(+), 108 deletions(-)

diff --git a/edid-decode.h b/edid-decode.h
index 2409718..ccf8558 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -346,7 +346,6 @@ struct edid_state {
 	void cta_displayid_type_7(const unsigned char *x, unsigned length);
 	void cta_displayid_type_8(const unsigned char *x, unsigned length);
 	void cta_displayid_type_10(const unsigned char *x, unsigned length);
-	void cta_ext_block(unsigned tag, const unsigned char *x, unsigned length, bool duplicate);
 	void cta_block(const unsigned char *x, bool duplicate);
 	void preparse_cta_block(const unsigned char *x);
 	void parse_cta_block(const unsigned char *x);
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 3503cd1..79354c5 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2034,13 +2034,31 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 		length -= (length < 3) ? length : 3; \
 	} while(0)
 
-void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned length,
-			       bool duplicate)
+void edid_state::cta_block(const unsigned char *x, bool duplicate)
 {
+	unsigned length = x[0] & 0x1f;
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
 	unsigned oui;
 	bool audio_block = false;
 
 	switch (tag) {
+	case 0x01: data_block = "Audio Data Block"; audio_block = true; break;
+	case 0x02: data_block = "Video Data Block"; break;
+	case 0x03: data_block.clear(); break;
+	case 0x04: data_block = "Speaker Allocation Data Block"; audio_block = true; break;
+	case 0x05: data_block = "VESA Display Transfer Characteristics Data Block"; break;
+
+	case 0x07: data_block.clear(); break;
+
 	case 0x700: data_block = "Video Capability Data Block"; break;
 	case 0x701: data_block.clear(); break;
 	case 0x702: data_block = "VESA Video Display Device Data Block"; break;
@@ -2067,24 +2085,33 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 
 	case 0x778: data_block = "HDMI Forum EDID Extension Override Data Block"; break;
 	case 0x779: data_block = "HDMI Forum Sink Capability Data Block"; break;
+
 	default:
 		data_block.clear();
-		if (tag < 0x70d)
-			printf("  Unknown CTA-861 Video-Related");
-		else if (tag < 0x720)
-			printf("  Unknown CTA-861 Audio-Related");
-		else if (tag >= 0x778 && tag <= 0x77f)
-			printf("  Unknown CTA-861 HDMI-Related");
-		else
-			printf("  Unknown CTA-861");
-		printf(" Data Block (extended tag 0x%02x)\n", tag & 0xff);
-		warn("Unknown Extended CTA-861 Data Block 0x%02x.\n", tag & 0xff);
+		if (tag < 0x700) {
+			printf("  Unknown CTA-861 tag 0x%02x\n", tag);
+			warn("Unknown CTA-861 Data Block %u.\n", tag);
+		}
+		else {
+			if (tag < 0x70d)
+				printf("  Unknown CTA-861 Video-Related");
+			else if (tag < 0x720)
+				printf("  Unknown CTA-861 Audio-Related");
+			else if (tag >= 0x778 && tag <= 0x77f)
+				printf("  Unknown CTA-861 HDMI-Related");
+			else
+				printf("  Unknown CTA-861");
+			printf(" Data Block (extended tag 0x%02x)\n", tag & 0xff);
+			warn("Unknown Extended CTA-861 Data Block 0x%02x.\n", tag & 0xff);
+		}
 	}
 
 	if (data_block.length())
 		printf("  %s:\n", data_block.c_str());
 
 	switch (tag) {
+	case 0x04:
+	case 0x05:
 	case 0x700:
 	case 0x702:
 	case 0x705:
@@ -2104,6 +2131,47 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 
 	switch (tag) {
+	case 0x01: cta_audio_block(x, length); break;
+	case 0x02: cta_svd(x, length, false); break;
+	case 0x03:
+		data_block_o("Vendor-Specific Data Block");
+		if (oui == 0x000c03) {
+			cta_hdmi_block(x, length);
+			cta.last_block_was_hdmi_vsdb = 1;
+			cta.first_block = 0;
+			// The HDMI OUI is present, so this EDID represents an HDMI
+			// interface. And HDMI interfaces must use EDID version 1.3
+			// according to the HDMI Specification, so check for this.
+			if (base.edid_minor != 3)
+				fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\n",
+				     base.edid_minor);
+			return;
+		}
+		if (oui == 0xc45dd8) {
+			if (!cta.last_block_was_hdmi_vsdb)
+				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n");
+			if (cta.have_hf_scdb || cta.have_hf_vsdb)
+				fail("Duplicate HDMI Forum VSDB/SCDB.\n");
+			cta_hf_scdb(x, length);
+			cta.have_hf_vsdb = 1;
+			break;
+		}
+		if (oui == 0x00001a) {
+			cta_amd(x, length);
+			break;
+		}
+		if (oui == 0xca125c && length == 0x12) {
+			cta_microsoft(x, length);
+			break;
+		}
+		hex_block("    ", x, length);
+		break;
+	case 0x04: cta_sadb(x, length); break;
+	case 0x05: cta_vesa_dtcdb(x, length); break;
+	case 0x07:
+		printf("  Unknown CTA-861 Data Block (extended tag truncated):\n");
+		fail("Extended tag cannot have zero length.\n");
+		break;
 	case 0x700: cta_vcdb(x, length); break;
 	case 0x701:
 		data_block_o("Vendor-Specific Video Data Block");
@@ -2159,101 +2227,6 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	default:
 		hex_block("    ", x, length);
 	}
-}
-
-void edid_state::cta_block(const unsigned char *x, bool duplicate)
-{
-	unsigned length = x[0] & 0x1f;
-	unsigned tag=(x[0] & 0xe0) >> 5;
-	unsigned extended = (tag == 0x07) ? 1 : 0;
-	x++;
-	if (extended && length) {
-		tag <<= 8;
-		tag |= x[0];
-		length--;
-		x++;
-	}
-
-	unsigned oui;
-	bool audio_block = false;
-
-	switch (tag) {
-	case 0x01: data_block = "Audio Data Block"; audio_block = true; break;
-	case 0x02: data_block = "Video Data Block"; break;
-	case 0x03: data_block.clear(); break;
-	case 0x04: data_block = "Speaker Allocation Data Block"; audio_block = true; break;
-	case 0x05: data_block = "VESA Display Transfer Characteristics Data Block"; break;
-
-	case 0x07: data_block.clear(); break;
-	default:
-		data_block.clear();
-		if (extended) break;
-		printf("  Unknown CTA-861 tag 0x%02x\n", tag);
-		warn("Unknown CTA-861 Data Block %u.\n", tag);
-	}
-
-	if (data_block.length())
-		printf("  %s:\n", data_block.c_str());
-
-	switch (tag) {
-	case 0x04:
-	case 0x05:
-		if (duplicate)
-			fail("Only one instance of this Data Block is allowed.\n");
-	}
-
-	// See Table 52 of CTA-861-G for a description of Byte 3
-	if (audio_block && !(cta.byte3 & 0x40))
-		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
-
-	switch (tag) {
-	case 0x01: cta_audio_block(x, length); break;
-	case 0x02: cta_svd(x, length, false); break;
-	case 0x03:
-		data_block_o("Vendor-Specific Data Block");
-		if (oui == 0x000c03) {
-			cta_hdmi_block(x, length);
-			cta.last_block_was_hdmi_vsdb = 1;
-			cta.first_block = 0;
-			// The HDMI OUI is present, so this EDID represents an HDMI
-			// interface. And HDMI interfaces must use EDID version 1.3
-			// according to the HDMI Specification, so check for this.
-			if (base.edid_minor != 3)
-				fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\n",
-				     base.edid_minor);
-			return;
-		}
-		if (oui == 0xc45dd8) {
-			if (!cta.last_block_was_hdmi_vsdb)
-				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n");
-			if (cta.have_hf_scdb || cta.have_hf_vsdb)
-				fail("Duplicate HDMI Forum VSDB/SCDB.\n");
-			cta_hf_scdb(x, length);
-			cta.have_hf_vsdb = 1;
-			break;
-		}
-		if (oui == 0x00001a) {
-			cta_amd(x, length);
-			break;
-		}
-		if (oui == 0xca125c && length == 0x12) {
-			cta_microsoft(x, length);
-			break;
-		}
-		hex_block("    ", x, length);
-		break;
-	case 0x04: cta_sadb(x, length); break;
-	case 0x05: cta_vesa_dtcdb(x, length); break;
-	case 0x07:
-		printf("  Unknown CTA-861 Data Block (extended tag truncated):\n");
-		fail("Extended tag cannot have zero length.\n");
-		break;
-	default:
-		if (extended)
-			cta_ext_block(tag, x, length, duplicate);
-		else
-			hex_block("    ", x, length);
-	}
 
 	cta.first_block = 0;
 	cta.last_block_was_hdmi_vsdb = 0;
-- 
2.24.3 (Apple Git-128)

