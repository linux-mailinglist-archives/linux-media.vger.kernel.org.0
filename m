Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1903418761
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhIZIfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:11 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229730AbhIZIfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:11 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U6mYmf0pJczbLUPbLmV5U9; Sun, 26 Sep 2021 08:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645215; bh=wdkOL7mRmZXM5cZIdE/n+C/nxawk/Weu4v15MsU89H8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lzubybFAZopCF2UmbAvOxroPaLDlqbB5YRhcyEUg4LWErzDrlInwxjAp02OZ7EE0V
         oStq0XCfET/EbpRBVNmFp2SOcVjcEsT0SUbqa2nb2cKlmADIHQVWriJrpvbVCK+TvN
         otxdzbna1wH99lfPeeBeylvcr53dpkx9dbA9/XIijNEnrdfPLCJ7OkkKbWteoSHXrq
         xJYe43EeRMEFab9CPOaD8TRt50EP/KHdxLGMlJ35/APrmbGid/ItA2vz4m9AfKGG08
         2sDptn7H01CMl+6rQedRPUs5WzYI9FglmpT3yVz9VVcbaUx8Q0z03y/0Ng3KJhlsdH
         BXwa9GKJeOeWg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbKm6iEV; Sun, 26 Sep 2021 08:33:35 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6150305f
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=HJMu6jesDG4n_MRZF-gA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 06/29] edid-decode: Replace return with break in switch
Date:   Sun, 26 Sep 2021 01:33:07 -0700
Message-Id: <20210926083330.5206-7-joevt@shaw.ca>
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

Use break to leave a switch instead of return.
Move code that was after switch to default statement in switch.
This way, we can move switch or have other code after switch.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 51 +++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 042b933..bba3af2 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2101,12 +2101,12 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 		printf("  %s:\n", data_block.c_str());
 
 	switch (x[0]) {
-	case 0x00: cta_vcdb(x + 1, length); return;
+	case 0x00: cta_vcdb(x + 1, length); break;
 	case 0x01:
 		if (length < 3) {
 			data_block = std::string("Vendor-Specific Video Data Block");
 			fail("Invalid length %u < 3.\n", length);
-			return;
+			break;
 		}
 		oui = (x[3] << 16) + (x[2] << 8) + x[1];
 		name = oui_name(oui);
@@ -2122,7 +2122,7 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 			data_block.clear();
 			warn("Unknown Extended Vendor-Specific Video Data Block, OUI %s.\n",
 			     ouitohex(oui).c_str());
-			return;
+			break;
 		}
 		data_block = std::string("Vendor-Specific Video Data Block (") + name + ")";
 		if (reverse)
@@ -2134,19 +2134,19 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 			cta_dolby_video(x + 4, length - 3);
 		else
 			hex_block("    ", x + 4, length - 3);
-		return;
-	case 0x02: cta_vesa_vdddb(x + 1, length); return;
-	case 0x05: cta_colorimetry_block(x + 1, length); return;
-	case 0x06: cta_hdr_static_metadata_block(x + 1, length); return;
-	case 0x07: cta_hdr_dyn_metadata_block(x + 1, length); return;
-	case 0x0d: cta_vfpdb(x + 1, length); return;
-	case 0x0e: cta_svd(x + 1, length, true); return;
-	case 0x0f: cta_y420cmdb(x + 1, length); return;
+		break;
+	case 0x02: cta_vesa_vdddb(x + 1, length); break;
+	case 0x05: cta_colorimetry_block(x + 1, length); break;
+	case 0x06: cta_hdr_static_metadata_block(x + 1, length); break;
+	case 0x07: cta_hdr_dyn_metadata_block(x + 1, length); break;
+	case 0x0d: cta_vfpdb(x + 1, length); break;
+	case 0x0e: cta_svd(x + 1, length, true); break;
+	case 0x0f: cta_y420cmdb(x + 1, length); break;
 	case 0x11:
 		if (length < 3) {
 			data_block = std::string("Vendor-Specific Audio Data Block");
 			fail("Invalid length %u < 3.\n", length);
-			return;
+			break;
 		}
 		oui = (x[3] << 16) + (x[2] << 8) + x[1];
 		name = oui_name(oui);
@@ -2162,7 +2162,7 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 			data_block.clear();
 			warn("Unknown Extended Vendor-Specific Audio Data Block, OUI %s.\n",
 			     ouitohex(oui).c_str());
-			return;
+			break;
 		}
 		data_block = std::string("Vendor-Specific Audio Data Block (") + name + ")";
 		if (reverse)
@@ -2172,20 +2172,20 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 			cta_dolby_audio(x + 4, length - 3);
 		else
 			hex_block("    ", x + 4, length - 3);
-		return;
-	case 0x12: cta_hdmi_audio_block(x + 1, length); return;
-	case 0x13: cta_rcdb(x + 1, length); return;
-	case 0x14: cta_sldb(x + 1, length); return;
-	case 0x20: cta_ifdb(x + 1, length); return;
-	case 0x34: cta_displayid_type_7(x + 1, length); return;
-	case 0x35: cta_displayid_type_8(x + 1, length); return;
-	case 0x42: cta_displayid_type_10(x + 1, length); return;
+		break;
+	case 0x12: cta_hdmi_audio_block(x + 1, length); break;
+	case 0x13: cta_rcdb(x + 1, length); break;
+	case 0x14: cta_sldb(x + 1, length); break;
+	case 0x20: cta_ifdb(x + 1, length); break;
+	case 0x34: cta_displayid_type_7(x + 1, length); break;
+	case 0x35: cta_displayid_type_8(x + 1, length); break;
+	case 0x42: cta_displayid_type_10(x + 1, length); break;
 	case 0x78:
 		cta_hf_eeodb(x + 1, length);
 		// This must be the first CTA-861 block
 		if (!cta.first_block)
 			fail("Block starts at a wrong offset.\n");
-		return;
+		break;
 	case 0x79:
 		if (!cta.last_block_was_hdmi_vsdb)
 			fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB.\n");
@@ -2194,16 +2194,17 @@ void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
 		if (length < 2) {
 			data_block = std::string("HDMI Forum SCDB");
 			fail("Invalid length %u < 2.\n", length);
-			return;
+			break;
 		}
 		if (x[1] || x[2])
 			printf("  Non-zero SCDB reserved fields!\n");
 		cta_hf_scdb(x + 3, length - 2);
 		cta.have_hf_scdb = 1;
-		return;
+		break;
+	default:
+		hex_block("    ", x + 1, length);
 	}
 
-	hex_block("    ", x + 1, length);
 }
 
 void edid_state::cta_block(const unsigned char *x, bool duplicate)
-- 
2.24.3 (Apple Git-128)

