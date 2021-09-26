Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A39F418765
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhIZIfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:14 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:39161 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229789AbhIZIfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:14 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UOTkmIDsmps7PUPbOmzSGs; Sun, 26 Sep 2021 08:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645218; bh=nAp33AoMeyx/6b0T6CeO1LGJ7R917Se/lRndXeixL04=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OqG10YLK6tTrbNhxbIFW7lAgMukXqdB8TYGwwsQdNKBDnL8h0S9L9y4ZskPhD2gBu
         J/zEdMXv4AqZNR7o/hIZsRBzdNHJwBoWwSxIqbGjv8izhQDuY5fE2HyQpUm6MURC4O
         z7tPC2p6y9Pq4/Td4tPSqgTKcr8Ex6oV+2D5+V8ZWLRnG2LMC5OHKl5yEI+tixAapU
         ZSEcpq/Pf/rcuVJh1wZVUp3ha63pxuXD2Dmwifk/Gyj4PoRx9ZBrimJK2Fww1V8BYT
         BURb3kl+H2QSqSALyokAkCw9Do4+sa7YJTVHSMUjy6yenm6Kgy1cFZ72/AaRXsyJvt
         wIWZTlELqc7Fw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbNm6iEx; Sun, 26 Sep 2021 08:33:38 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503062
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=ZfDUfGQU7dOj8CFQmiUA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 11/29] edid-decode: make all OUI handlers the same
Date:   Sun, 26 Sep 2021 01:33:12 -0700
Message-Id: <20210926083330.5206-12-joevt@shaw.ca>
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

Because they are the same but with different block names.

For Vendor-Specific Data Block there are a couple fixes:
1) If the length is not enough to contain an OUI, then a fail is output. I have a corrupted EDID that would cause 20000+ lines of hex to be output without this check.
2) The return statement for VSDB with unknown OUI is changed to a break statement. The code after the switch statement will be executed which causes the block to be considered as a first block or as not a hdmi vsdb.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 7568780..b4645b4 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2030,6 +2030,7 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned length,
 			       bool duplicate)
 {
+	const char *block_name;
 	const char *name;
 	unsigned oui;
 	bool reverse = false;
@@ -2103,8 +2104,9 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	switch (tag) {
 	case 0x700: cta_vcdb(x, length); break;
 	case 0x701:
+		block_name = "Vendor-Specific Video Data Block";
 		if (length < 3) {
-			data_block = std::string("Vendor-Specific Video Data Block");
+			data_block = std::string(block_name);
 			fail("Invalid length %u < 3.\n", length);
 			break;
 		}
@@ -2117,15 +2119,13 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 				reverse = true;
 		}
 		if (!name) {
-			printf("  Vendor-Specific Video Data Block, OUI %s:\n",
-			       ouitohex(oui).c_str());
+			printf("  %s, OUI %s:\n", block_name, ouitohex(oui).c_str());
 			hex_block("    ", x, length);
 			data_block.clear();
-			warn("Unknown Extended Vendor-Specific Video Data Block, OUI %s.\n",
-			     ouitohex(oui).c_str());
+			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
 			break;
 		}
-		data_block = std::string("Vendor-Specific Video Data Block (") + name + ")";
+		data_block = std::string(block_name) + " (" + name + ")";
 		if (reverse)
 			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
 		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
@@ -2144,8 +2144,9 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	case 0x70e: cta_svd(x, length, true); break;
 	case 0x70f: cta_y420cmdb(x, length); break;
 	case 0x711:
+		block_name = "Vendor-Specific Audio Data Block";
 		if (length < 3) {
-			data_block = std::string("Vendor-Specific Audio Data Block");
+			data_block = std::string(block_name);
 			fail("Invalid length %u < 3.\n", length);
 			break;
 		}
@@ -2158,15 +2159,13 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 				reverse = true;
 		}
 		if (!name) {
-			printf("  Vendor-Specific Audio Data Block, OUI %s:\n",
-			       ouitohex(oui).c_str());
+			printf("  %s, OUI %s:\n", block_name, ouitohex(oui).c_str());
 			hex_block("    ", x, length);
 			data_block.clear();
-			warn("Unknown Extended Vendor-Specific Audio Data Block, OUI %s.\n",
-			     ouitohex(oui).c_str());
+			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
 			break;
 		}
-		data_block = std::string("Vendor-Specific Audio Data Block (") + name + ")";
+		data_block = std::string(block_name) + " (" + name + ")";
 		if (reverse)
 			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
 		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
@@ -2222,6 +2221,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		x++;
 	}
 
+	const char *block_name;
 	const char *name;
 	unsigned oui;
 	bool reverse = false;
@@ -2240,6 +2240,12 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		cta_svd(x, length, false);
 		break;
 	case 0x03:
+		block_name = "Vendor-Specific Data Block";
+		if (length < 3) {
+			data_block = std::string(block_name);
+			fail("Invalid length %u < 3.\n", length);
+			break;
+		}
 		oui = (x[2] << 16) + (x[1] << 8) + x[0];
 		x += 3; length -=3;
 		name = oui_name(oui);
@@ -2249,14 +2255,13 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 				reverse = true;
 		}
 		if (!name) {
-			printf("  Vendor-Specific Data Block, OUI %s:\n", ouitohex(oui).c_str());
+			printf("  %s, OUI %s:\n", block_name, ouitohex(oui).c_str());
 			hex_block("    ", x, length);
 			data_block.clear();
-			warn("Unknown Vendor-Specific Data Block, OUI %s.\n",
-			     ouitohex(oui).c_str());
-			return;
+			warn("Unknown %s, OUI %s.\n", block_name, ouitohex(oui).c_str());
+			break;
 		}
-		data_block = std::string("Vendor-Specific Data Block (") + name + ")";
+		data_block = std::string(block_name) + " (" + name + ")";
 		if (reverse)
 			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
 		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
-- 
2.24.3 (Apple Git-128)

