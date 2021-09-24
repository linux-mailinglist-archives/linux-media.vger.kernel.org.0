Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCCD417E45
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344970AbhIXXdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:35 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:36756 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344891AbhIXXdd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:33 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id Ttp4mGBlOps7PTuffmwEII; Fri, 24 Sep 2021 23:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526319; bh=7vNaskojZFKILJ4nY7QsRXfhnqTBlJ4VMzIyZlW8Y9g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Q4Wy641E7xOw49DGwoThO57E2KIT1MCazs1ZLzMt8FYduIY4J0kTP/lo/zPg2WIju
         laR0apW+IqE03+RBx7wIxJ0QFsW7x5eEwy7dinNXjyziPE3XC1laDW7rsLpHFw2wNJ
         DoelpR+DzADmKSvlw93qLGZKwul8ze8sSUSuSBin5A//qWAA3LqXtulKhGom/5t0uH
         M47gP0TDxIcsFfdwRcUS6gieObcXlBS2h1tdBqPLdB8TFgzPvRdJgwGm/ezZ7xAQsP
         uAJAviOWdZI0kcjwbqoRx+Lnh3XDcvPqiVPD9E88/6YB+7CddciuNB3tdQVcZK0FKI
         o2S4wfO4yK6vw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufemYw8Y; Fri, 24 Sep 2021 23:31:59 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fef
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=WdK-jxfRye_fENcs_bIA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 13/28] edid-decode: move unknown block warning
Date:   Fri, 24 Sep 2021 16:31:34 -0700
Message-Id: <20210924233149.10028-14-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKYBuDVrUHIqbzmr1uwk1vRUBH9dz7oHXTIlsaVonHrT8nZH6AxlbWoPUfv5OLSHAuf1WDq6c8j0bNw4sLgkRrbHf7s2sNim9esFEBi5VuRX5/u132Sl
 3l1tYtYMjOwgagJ5uPuZ4FYBDGNvQ/Kl3QkbSd5bRKBPfbmLxJfvSBNw1b/MGaP/kTjKwAZWcW5D32kXmRlejo/oQ3457MtF9Eg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also, make cta_block like cta_ext_block

First, fix the first switch statement in cta_ext_block. The first switch statement sets or clears data_block (the name of the block which is used in the Warnings and Failures section of the output).
Remove hex_block because it will be done by the third switch statement that handles outputting the contents of each block.
The "Unknown Extended CTA-861 Data Block 0x%02x.\n" warning now appears after the block name instead of after the block contents (because it's not the contents that caused the error).

Then, in cta_block:
1) Create a first switch statement like that of cta_ext_block (described above).
The "Unknown CTA-861 Data Block %u.\n" warning now appears after the block name instead of after the block contents (because it's not the contents that caused the error).
2) Create a second switch statement like that of cta_ext_block. It handles checking for duplicate blocks.
3) After checking for duplicates, check cta_byte3 / audio_block discrepancy, exactly like cta_ext_block does. These lines come from after the original switch statement of cta_block.
4) The original switch statement of cta_block has lines that are moved to the new first and second switch statements.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 82 +++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 44 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index cd7650d..be76903 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2032,6 +2032,7 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	case 0x778: data_block = "HDMI Forum EDID Extension Override Data Block"; break;
 	case 0x779: data_block = "HDMI Forum Sink Capability Data Block"; break;
 	default:
+		data_block.clear();
 		if (tag < 0x70d)
 			printf("  Unknown CTA-861 Video-Related");
 		else if (tag < 0x720)
@@ -2041,10 +2042,7 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 		else
 			printf("  Unknown CTA-861");
 		printf(" Data Block (extended tag 0x%02x)\n", tag & 0xff);
-		hex_block("    ", x, length);
-		data_block.clear();
 		warn("Unknown Extended CTA-861 Data Block 0x%02x.\n", tag & 0xff);
-		return;
 	}
 
 	if (data_block.length())
@@ -2125,7 +2123,6 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	default:
 		hex_block("    ", x, length);
 	}
-
 }
 
 void edid_state::cta_block(const unsigned char *x, bool duplicate)
@@ -2145,17 +2142,37 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	bool audio_block = false;
 
 	switch (tag) {
-	case 0x01:
-		data_block = "Audio Data Block";
-		printf("  %s:\n", data_block.c_str());
-		cta_audio_block(x, length);
-		audio_block = true;
-		break;
-	case 0x02:
-		data_block = "Video Data Block";
+	case 0x01: data_block = "Audio Data Block"; audio_block = true; break;
+	case 0x02: data_block = "Video Data Block"; break;
+	case 0x03: data_block.clear(); break;
+	case 0x04: data_block = "Speaker Allocation Data Block"; audio_block = true; break;
+	case 0x05: data_block = "VESA Display Transfer Characteristics Data Block"; break;
+
+	case 0x07: data_block.clear(); break;
+	default:
+		data_block.clear();
+		if (extended) break;
+		printf("  Unknown CTA-861 tag 0x%02x\n", tag);
+		warn("Unknown CTA-861 Data Block %u.\n", tag);
+	}
+
+	if (data_block.length())
 		printf("  %s:\n", data_block.c_str());
-		cta_svd(x, length, false);
-		break;
+
+	switch (tag) {
+	case 0x04:
+	case 0x05:
+		if (duplicate)
+			fail("Only one instance of this Data Block is allowed.\n");
+	}
+
+	// See Table 52 of CTA-861-G for a description of Byte 3
+	if (audio_block && !(cta.byte3 & 0x40))
+		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
+
+	switch (tag) {
+	case 0x01: cta_audio_block(x, length); break;
+	case 0x02: cta_svd(x, length, false); break;
 	case 0x03:
 		data_block_o("Vendor-Specific Data Block");
 		if (oui == 0x000c03) {
@@ -2189,42 +2206,19 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		}
 		hex_block("    ", x, length);
 		break;
-	case 0x04:
-		data_block = "Speaker Allocation Data Block";
-		printf("  %s:\n", data_block.c_str());
-		if (duplicate)
-			fail("Only one instance of this Data Block is allowed.\n");
-		cta_sadb(x, length);
-		audio_block = true;
-		break;
-	case 0x05:
-		data_block = "VESA Display Transfer Characteristics Data Block";
-		printf("  %s:\n", data_block.c_str());
-		if (duplicate)
-			fail("Only one instance of this Data Block is allowed.\n");
-		cta_vesa_dtcdb(x, length);
-		break;
+	case 0x04: cta_sadb(x, length); break;
+	case 0x05: cta_vesa_dtcdb(x, length); break;
 	case 0x07:
-		data_block = "Unknown CTA-861 Data Block (extended tag truncated)";
-		printf("  %s:\n", data_block.c_str());
+		printf("  Unknown CTA-861 Data Block (extended tag truncated):\n");
 		fail("Extended tag cannot have zero length.\n");
 		break;
-	default: {
-		if (extended) {
+	default:
+		if (extended)
 			cta_ext_block(tag, x, length, duplicate);
-			break;
-		}
-		printf("  Unknown CTA-861 tag 0x%02x\n", tag);
-		hex_block("    ", x, length);
-		data_block.clear();
-		warn("Unknown CTA-861 Data Block %u.\n", tag);
-		break;
-	}
+		else
+			hex_block("    ", x, length);
 	}
 
-	// See Table 52 of CTA-861-G for a description of Byte 3
-	if (audio_block && !(cta.byte3 & 0x40))
-		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 	cta.first_block = 0;
 	cta.last_block_was_hdmi_vsdb = 0;
 }
-- 
2.24.3 (Apple Git-128)

