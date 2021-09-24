Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5B9417E43
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344937AbhIXXde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:34 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:59094 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237796AbhIXXdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:31 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id TmS9mdUgZczbLTufdmRrWS; Fri, 24 Sep 2021 23:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526317; bh=Ws1U4uOXinc+F+m9CV0Jdvr6mjZcBzQpilPBISSmpQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DHHTisk1wvfXeWErJ5DMg22ihlSmC3iZICMcZM4Z1sym2IfonrrHxwFqMYfk21+Hf
         yaApIrOL+D8qwq3/RV4gtKYDO/z5FkAjM+FCsu427vVYxNVNDENwjv8kWl4vJIqVxT
         7rea5a2Dmh7lx122uhl76z1hViOcGHUfkwKAutDj35j1ZI3iGlO9N7ISg+9RV85xhC
         Y1HiGEoNWy6al/+xtV+mItzmBQz819OwyqsZg2H+LjksBxWm/BnIQMfAwVlLWwJZCX
         52Tz8/9tjSPFQr00xkIOblczWVRXWPdd+5o6UFKMaGQoqcjjDYBk3j8hBzCSPx4yez
         x31Pc/DRe0Jhw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufdmYw8L; Fri, 24 Sep 2021 23:31:57 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fed
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=ZfDUfGQU7dOj8CFQmiUA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 11/28] edid-decode: make all OUI handlers the same
Date:   Fri, 24 Sep 2021 16:31:32 -0700
Message-Id: <20210924233149.10028-12-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEDQkhdjIYg7nExYycgyZ2Vrie7Z+cZ6rM7H5c+9vQoVa1JGni6NqMNrT9cHtpvF7JqXdOkaNoES8DSY9KZ1JrkbIeRiynmHQzeISvdY9ktKx+XvycSp
 t2N/2tgrpN6ay4c3wc7gVjWt3ksuhafZkhCquSVl8mKgyRDa0inasC/opaqeNPWANjmjC0+f8Nmq1y5B1qa3agxcUJ71jFhrHSg=
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
index 975381f..2c83a35 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -1994,6 +1994,7 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
 void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned length,
 			       bool duplicate)
 {
+	const char *block_name;
 	const char *name;
 	unsigned oui;
 	bool reverse = false;
@@ -2067,8 +2068,9 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
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
@@ -2081,15 +2083,13 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
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
@@ -2108,8 +2108,9 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
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
@@ -2122,15 +2123,13 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
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
@@ -2186,6 +2185,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		x++;
 	}
 
+	const char *block_name;
 	const char *name;
 	unsigned oui;
 	bool reverse = false;
@@ -2204,6 +2204,12 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
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
@@ -2213,14 +2219,13 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
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

