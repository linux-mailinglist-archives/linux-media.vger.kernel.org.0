Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52971418767
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhIZIfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:15 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:43776 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229813AbhIZIfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:14 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U8Srmf7ImczbLUPbOmV5UJ; Sun, 26 Sep 2021 08:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645218; bh=9dyqK7oic0IBf8wro9GV+2jTpq0NP5bZMc9d9xWqazM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=e1I0Q1g0xznaA18sRAqq4UAjzU5SoOjAm1yFuzmiyHF4pYP0fNAxlDlQeujOgkX+P
         pAhkvEqH5EomzMmdfIh9lURYkTk/JQmiBjizZp+ewZ9s58pexPRl+HdYK/h0Eo3Sen
         KInUGfCyi6XiSTqZqpMG4RA0XVeRZDp4o8h1VIWOI1as1ZCUGbPDdvnCVyFeMd28eW
         pCDX7aaRHSDyH6fb5b33r13jrJ7fYVy9Vx4xGxHgaZts4DWI2xv/ENDxnLTQv/ix25
         s9nu8Q+copNpqDTVvM5VtPBCkZvtBuNSyCLpSvgelbFY/CuuwiGPWtzkExJR1C8By5
         RTwZ85w8/GI6Q==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbOm6iF1; Sun, 26 Sep 2021 08:33:38 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503062
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=9WAPh8486Br8_YOXBiUA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 12/29] edid-decode: move OUI parsing to separate function
Date:   Sun, 26 Sep 2021 01:33:13 -0700
Message-Id: <20210926083330.5206-13-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFQEtdGkPyR7HojCR5aSKfJ0WtCYp9U5nbd32We80nuxb6WpIbAjZm+AX+4GHWjE4WytjJdSJJ7y26xFUozQ139qcmx60QvuszFvdKj/2e+firTjv1Al
 xRdrr6oInN37ljyuj4T2f4+Nt9/YRHsR0jCyCW1dnY7fRh3f4iABLckKeteJiRkqqepPn2465mnUcdNXDuwnEZKJCUyvTcbZ1yk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since all three occurrences of OUI parsing are the same in parse-cta-block.cpp, we can move them to a separate function in edid-decode.cpp (because we may want to use the function for non-CTA parsing as well).

data_block_oui contains identical code except for the following:
1) The warning for unknown OUI name is output after the block name instead of after the block contents.

Other changes that don't affect output:
- oui is set to 0 if the OUI is unknown so that it can't lead to executing any known OUI code by the caller.
- A macro is used to call data_block_oui. It updates x and length appropriately for the caller.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp     | 34 +++++++++++++++++
 edid-decode.h       |  2 +
 parse-cta-block.cpp | 91 +++++----------------------------------------
 3 files changed, 46 insertions(+), 81 deletions(-)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index d77646d..ec903f9 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -679,6 +679,40 @@ const char *oui_name(unsigned oui, bool reverse)
 	}
 }
 
+void edid_state::data_block_oui(const char *block_name, const unsigned char *x, unsigned length, unsigned *ouinum)
+{
+	const char *name;
+	unsigned oui = 0;
+	bool reverse = false;
+
+	if (length < 3) {
+		data_block = std::string(block_name);
+		fail("Invalid length %u < 3.\n", length);
+	}
+	else {
+		oui = (x[2] << 16) + (x[1] << 8) + x[0];
+		x += 3; length -=3;
+		name = oui_name(oui);
+		if (!name) {
+			name = oui_name(oui, true);
+			if (name)
+				reverse = true;
+		}
+		if (!name) {
+			printf("  %s, OUI %s:\n", block_name, ouitohex(oui).c_str());
+			data_block.clear();
+			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
+		}
+		else {
+			data_block = std::string(block_name) + " (" + name + ")";
+			if (reverse)
+				fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
+			printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
+		}
+	}
+	if (ouinum) *ouinum = oui;
+}
+
 std::string ouitohex(unsigned oui)
 {
 	char buf[32];
diff --git a/edid-decode.h b/edid-decode.h
index 57cb6e6..2409718 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -331,6 +331,8 @@ struct edid_state {
 	void list_dmts();
 	void list_established_timings();
 
+	void data_block_oui(const char *block_name, const unsigned char *x, unsigned length, unsigned *ouinum);
+
 	void print_vic_index(const char *prefix, unsigned idx, const char *suffix, bool ycbcr420 = false);
 	void hdmi_latency(unsigned char vid_lat, unsigned char aud_lat, bool is_ilaced);
 	void cta_vcdb(const unsigned char *x, unsigned length);
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index b4645b4..0000249 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2027,13 +2027,17 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 	}
 }
 
+#define data_block_o(n) \
+	do { \
+		data_block_oui(n, x, length, &oui); \
+		x += (length < 3) ? length : 3; \
+		length -= (length < 3) ? length : 3; \
+	} while(0)
+
 void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned length,
 			       bool duplicate)
 {
-	const char *block_name;
-	const char *name;
 	unsigned oui;
-	bool reverse = false;
 	bool audio_block = false;
 
 	switch (tag) {
@@ -2104,31 +2108,7 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	switch (tag) {
 	case 0x700: cta_vcdb(x, length); break;
 	case 0x701:
-		block_name = "Vendor-Specific Video Data Block";
-		if (length < 3) {
-			data_block = std::string(block_name);
-			fail("Invalid length %u < 3.\n", length);
-			break;
-		}
-		oui = (x[2] << 16) + (x[1] << 8) + x[0];
-		x += 3; length -=3;
-		name = oui_name(oui);
-		if (!name) {
-			name = oui_name(oui, true);
-			if (name)
-				reverse = true;
-		}
-		if (!name) {
-			printf("  %s, OUI %s:\n", block_name, ouitohex(oui).c_str());
-			hex_block("    ", x, length);
-			data_block.clear();
-			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
-			break;
-		}
-		data_block = std::string(block_name) + " (" + name + ")";
-		if (reverse)
-			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
-		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
+		data_block_o("Vendor-Specific Video Data Block");
 		if (oui == 0x90848b)
 			cta_hdr10plus(x, length);
 		else if (oui == 0x00d046)
@@ -2144,31 +2124,7 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	case 0x70e: cta_svd(x, length, true); break;
 	case 0x70f: cta_y420cmdb(x, length); break;
 	case 0x711:
-		block_name = "Vendor-Specific Audio Data Block";
-		if (length < 3) {
-			data_block = std::string(block_name);
-			fail("Invalid length %u < 3.\n", length);
-			break;
-		}
-		oui = (x[2] << 16) + (x[1] << 8) + x[0];
-		x += 3; length -=3;
-		name = oui_name(oui);
-		if (!name) {
-			name = oui_name(oui, true);
-			if (name)
-				reverse = true;
-		}
-		if (!name) {
-			printf("  %s, OUI %s:\n", block_name, ouitohex(oui).c_str());
-			hex_block("    ", x, length);
-			data_block.clear();
-			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
-			break;
-		}
-		data_block = std::string(block_name) + " (" + name + ")";
-		if (reverse)
-			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
-		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
+		data_block_o("Vendor-Specific Audio Data Block");
 		if (oui == 0x00d046)
 			cta_dolby_audio(x, length);
 		else
@@ -2221,10 +2177,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		x++;
 	}
 
-	const char *block_name;
-	const char *name;
 	unsigned oui;
-	bool reverse = false;
 	bool audio_block = false;
 
 	switch (tag) {
@@ -2240,31 +2193,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		cta_svd(x, length, false);
 		break;
 	case 0x03:
-		block_name = "Vendor-Specific Data Block";
-		if (length < 3) {
-			data_block = std::string(block_name);
-			fail("Invalid length %u < 3.\n", length);
-			break;
-		}
-		oui = (x[2] << 16) + (x[1] << 8) + x[0];
-		x += 3; length -=3;
-		name = oui_name(oui);
-		if (!name) {
-			name = oui_name(oui, true);
-			if (name)
-				reverse = true;
-		}
-		if (!name) {
-			printf("  %s, OUI %s:\n", block_name, ouitohex(oui).c_str());
-			hex_block("    ", x, length);
-			data_block.clear();
-			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
-			break;
-		}
-		data_block = std::string(block_name) + " (" + name + ")";
-		if (reverse)
-			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
-		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
+		data_block_o("Vendor-Specific Data Block");
 		if (oui == 0x000c03) {
 			cta_hdmi_block(x, length);
 			cta.last_block_was_hdmi_vsdb = 1;
-- 
2.24.3 (Apple Git-128)

