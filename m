Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8596141876B
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhIZIfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:21 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:43776 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229874AbhIZIfR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:17 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UEfnmfZ1KczbLUPbQmV5US; Sun, 26 Sep 2021 08:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645220; bh=iUUkQmnDGHZ1jEllC8QPebZ4N2NNK/S5fqHXV1yws74=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=waoh2n/Um7D9b+K55E/jMh4FMKh63l5XwYGsiJ8Jnhtux0nr+4S5GMsotrrga+Lw4
         cA4edDCkb73a3sgvO7zBvn5BhhqZgwDWMZ92cxgQ8fwfU/SS6dzHaH56Iy1IdV4PvE
         jTk/zJzGQ1fxmacYyIJgbOStjLdEi3htzN3ViouL31clIu3ktFE42qcmSZqT78QLBG
         OY5vKckXqJfiF1FNTC9IVwaJ7TztxfQw9XFIyHXA6KY43v2HAvjap20/ECE26XwXCO
         kwq/w/3lrGmXtEJ1pqY3h0EoHSrxsxb2ICwz+f/pmO18artrAtMSG0OYhf18eXHnza
         cxaq1HrVpzR/w==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbQm6iFH; Sun, 26 Sep 2021 08:33:40 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503064
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=iaj4zWktxohYcnrZrbkA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 16/29] edid-decode: move audio fail/warn messages
Date:   Sun, 26 Sep 2021 01:33:17 -0700
Message-Id: <20210926083330.5206-17-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIKedk/vO9v2MlsS9rBm6JDEQFBBPVGfN3SYJRLjTpZqjbx2srqQbtioKjSnrTi470QZWnyj4qmDQlCYgWoiOz++yWJeTPfQGgsGeEtg+SrHcAdgzCYM
 ZedvgP+Ej+88skuRaDX4/ccZmJL53ZH07G7oasjbIts5Hp7W6sg8PUrJ8MHX5spbRwTzG2RH4LYs5PRGANHHFjufJ1jG+bMLC6U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For tag 0x711, the "Audio information is present" fail message appears before the block name. Output the block name before any fail/warning messages related to the block.

For tags that are supposed to have an OUI but are not long enough:
- Output the block name before the "Invalid length" fail message. The fail message should include the block name but we don't want cta_block to output data_block so clear it after the fail, before exiting.

For tags with a 3 byte OUI:
- Since we are calling data_block_oui early (before data_block is output in cta_block), don't output block name in data_block_oui - cta_block will do that for us.
- data_block now includes the OUI (the block name in the failure/warning section will match block name in the EDID section).

Probably things would be simpler if we always set data_block to the block name, then have fail/warning messages that don't include the block name so they don't look redundant in the failures/warnings sections. For example we could have something like:
Unknown CTA-861 Data Block (tag 0x00): Invalid tag.
Vendor-Specific Data Block, OUI $$-$$-$$: Unknown OUI.
etc.

Sample corrupted EDID (combination of vizio-e65e0-hdmi and /System/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-593a/DisplayProductID-1018:edid-patches):
00ffffffffffff00593a181001010101001a0103808f50782a6a6da4554f9e270e474aa5ce00d1c0010101010101010101010101010104740030f2705a80b0588a0048684200001e023a801871382d40582c450048684200001e000000fc004536352d45310a202020202020000000fd00174c0f8c26000a202020202020014502035171575f645d625e631022201f2105041307060302111215160132570600000000000000000000090707150750830100006f030c002000383ca05b5b0060010000000061666065e3060f01e305e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ea

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp     |  6 +++---
 parse-cta-block.cpp | 11 ++++-------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index ec903f9..666a2c6 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -686,12 +686,13 @@ void edid_state::data_block_oui(const char *block_name, const unsigned char *x,
 	bool reverse = false;
 
 	if (length < 3) {
+		printf("  %s:\n", block_name);
 		data_block = std::string(block_name);
 		fail("Invalid length %u < 3.\n", length);
+		data_block.clear();
 	}
 	else {
 		oui = (x[2] << 16) + (x[1] << 8) + x[0];
-		x += 3; length -=3;
 		name = oui_name(oui);
 		if (!name) {
 			name = oui_name(oui, true);
@@ -704,10 +705,9 @@ void edid_state::data_block_oui(const char *block_name, const unsigned char *x,
 			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
 		}
 		else {
-			data_block = std::string(block_name) + " (" + name + ")";
+			data_block = std::string(block_name) + " (" + name + "), OUI " + ouitohex(oui);
 			if (reverse)
 				fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
-			printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
 		}
 	}
 	if (ouinum) *ouinum = oui;
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 16c7bee..607e42b 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2049,18 +2049,19 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 
 	unsigned oui;
 	bool audio_block = false;
+	data_block.clear();
 
 	switch (tag) {
 	case 0x01: data_block = "Audio Data Block"; audio_block = true; break;
 	case 0x02: data_block = "Video Data Block"; break;
-	case 0x03: data_block.clear(); break;
+	case 0x03: data_block_o("Vendor-Specific Data Block"); break;
 	case 0x04: data_block = "Speaker Allocation Data Block"; audio_block = true; break;
 	case 0x05: data_block = "VESA Display Transfer Characteristics Data Block"; break;
 
 	case 0x07: data_block = "Unknown CTA-861 Data Block (extended tag truncated)"; break;
 
 	case 0x700: data_block = "Video Capability Data Block"; break;
-	case 0x701: data_block.clear(); break;
+	case 0x701: data_block_o("Vendor-Specific Video Data Block"); break;
 	case 0x702: data_block = "VESA Video Display Device Data Block"; break;
 	case 0x703: data_block = "VESA Video Timing Block Extension"; break;
 	case 0x704: data_block = "Reserved for HDMI Video Data Block"; break;
@@ -2072,7 +2073,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x70e: data_block = "YCbCr 4:2:0 Video Data Block"; break;
 	case 0x70f: data_block = "YCbCr 4:2:0 Capability Map Data Block"; break;
 	case 0x710: data_block = "Reserved for CTA-861 Miscellaneous Audio Fields"; break;
-	case 0x711: data_block.clear(); audio_block = true; break;
+	case 0x711: data_block_o("Vendor-Specific Audio Data Block"); audio_block = true; break;
 	case 0x712: data_block = "HDMI Audio Data Block"; audio_block = true; break;
 	case 0x713: data_block = "Room Configuration Data Block"; audio_block = true; break;
 	case 0x714: data_block = "Speaker Location Data Block"; audio_block = true; break;
@@ -2087,7 +2088,6 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x779: data_block = "HDMI Forum Sink Capability Data Block"; break;
 
 	default:
-		data_block.clear();
 		std::string unknown_name;
 		     if (tag < 0x700) unknown_name = "Unknown CTA-861 Data Block";
 		else if (tag < 0x70d) unknown_name = "Unknown CTA-861 Video-Related Data Block";
@@ -2128,7 +2128,6 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x01: cta_audio_block(x, length); break;
 	case 0x02: cta_svd(x, length, false); break;
 	case 0x03:
-		data_block_o("Vendor-Specific Data Block");
 		if (oui == 0x000c03) {
 			cta_hdmi_block(x, length);
 			cta.last_block_was_hdmi_vsdb = 1;
@@ -2165,7 +2164,6 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x07: fail("Extended tag cannot have zero length.\n"); break;
 	case 0x700: cta_vcdb(x, length); break;
 	case 0x701:
-		data_block_o("Vendor-Specific Video Data Block");
 		if (oui == 0x90848b)
 			cta_hdr10plus(x, length);
 		else if (oui == 0x00d046)
@@ -2181,7 +2179,6 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x70e: cta_svd(x, length, true); break;
 	case 0x70f: cta_y420cmdb(x, length); break;
 	case 0x711:
-		data_block_o("Vendor-Specific Audio Data Block");
 		if (oui == 0x00d046)
 			cta_dolby_audio(x, length);
 		else
-- 
2.24.3 (Apple Git-128)

