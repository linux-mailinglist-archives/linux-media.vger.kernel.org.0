Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE8241876F
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhIZIgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:36:21 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:43776 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229561AbhIZIgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:36:20 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id U6HQmeyzZczbLUPcSmV5Vc; Sun, 26 Sep 2021 08:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645284; bh=eg36BMeLWY/KD9OprJp23smtNkXEzx7j16ZWQmnIlfY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Y964CXB3md42nCWv3kXrvyKdUxHVEKxurpPWhKtnHyEFB3yZpTZvcLqlEsAd+mtaj
         Tf1bxiI6034Ls5ZVoklClyWTe2C0JS3JAx+FnWgYiah8jcag8K2yEk5Xf9SAlWZVAd
         9eNcyoSIFCfQy6mXzRlIFsCTl/+nBPfYBSqteLVJ1yOROgivWRqCCfrKMlaeV+JGuO
         sjWTIMnWB7nS5wUgNpelzp6H6UkLLoF2TVBy1wub1AUj1Q+Xt4cd+d9e/R8+TXMLOE
         BZ3DqVKMdyuPD9yMv9zSZtAZRVUF7l87AfN1a0Lz0jTemkxk5056vvkd808r7/P2aS
         bUGrKLVO2QTpQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPcQm9l35U9pxUPcRmdRIs; Sun, 26 Sep 2021 08:34:44 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=615030a4
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=13305_vfhJ9_Lek99XsA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 20/29] edid-decode: displayid_block len fixes
Date:   Sun, 26 Sep 2021 01:33:21 -0700
Message-Id: <20210926083330.5206-21-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMJmqFOUP5QcCIvRiYJ9+llvI47OQBVtgC8AuGoreFWffCn8acAZm3DCUmBYOY964MLnFkEy27cmA8zAVjCAU9DORNRVb/PvI4JoPRmsCcgg2Pa1DfmH
 QNkN2n2J2ioYdILE6pEs4lANasMkwOLUEPIw0KyhCFZcv7TXs2//uYxpZoYAJ7P3pW8UMpyKafHtGLzJ/1W5mWPHdXbdo3M27oc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Calculate len early like we do for CTA blocks (set to zero if there's no bytes remaining to get len). We'll use this for OUI errors later.
- The return value of the displayid_block function is now the entire length of the DisplayID data block. Returning length will thus terminate the loop in parse_displayid_block, so we don't need the 0xff magic number.
- Bug fix: For the "Not enough bytes remain (%d) for a DisplayID data block or the DisplayID filler is non-0.\n" fail message, if length remaining is only 1 then don't check the byte beyond that. Also change "or" to "and" in that message.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 17f1805..c090056 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1656,6 +1656,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 	unsigned i;
 	unsigned tag = x[0];
 		unsigned oui = 0;
+	unsigned len = (length < 3) ? 0 : x[2];
 
 		switch (tag) {
 		// DisplayID 1.3:
@@ -1732,18 +1733,17 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 
 		if (length < 3) {
 			// report a problem when the remaining bytes are not 0.
-		if (tag || x[1]) {
-				fail("Not enough bytes remain (%d) for a DisplayID data block or the DisplayID filler is non-0.\n", length);
+		if (tag || (length > 1 && x[1])) {
+			fail("Not enough bytes remain (%d) for a DisplayID data block and the DisplayID filler is non-0.\n", length);
 			}
-		return 0xff;
+		return length;
 		}
 
 	unsigned block_rev = x[1] & 0x07;
-	unsigned len = x[2];
 
 		if (length < len + 3) {
 			fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
-		return 0xff;
+		return length;
 		}
 
 		if (!tag && !len) {
@@ -1751,7 +1751,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 		if (!memchk(x, length)) {
 				fail("Non-0 filler bytes in the DisplayID block.\n");
 			}
-		return 0xff;
+		return length;
 		}
 
 		printf("  %s:\n", data_block.c_str());
@@ -1867,7 +1867,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 	case 0x27: parse_displayid_stereo_display_intf(x); break;
 	case 0x28: parse_displayid_tiled_display_topology(x, true); break;
 	case 0x29: parse_displayid_ContainerID(x); break;
-	case 0x2b: parse_displayid_adaptive_sync(x + offset); break;
+	case 0x2b: parse_displayid_adaptive_sync(x); break;
 		case 0x32: {
 		   unsigned sz = 6 + ((x[1] & 0x70) >> 4);
 
@@ -1892,7 +1892,7 @@ unsigned edid_state::displayid_block(const unsigned version, const unsigned char
 			     data_block.c_str());
 
 	dispid.block_number++;
-	return len;
+	return len + 3;
 }
 
 void edid_state::parse_displayid_block(const unsigned char *x)
@@ -1932,12 +1932,10 @@ void edid_state::parse_displayid_block(const unsigned char *x)
 		length = 121;
 	}
 
-	unsigned offset = 5;
-	while (length > 0) {
-		unsigned len = displayid_block(version, x + offset, length);
-		if (len == 0xff) break;
-		length -= len + 3;
-		offset += len + 3;
+	unsigned len;
+	for (const unsigned char *y = x + 5; length > 0; y += len) {
+		len = displayid_block(version, y, length);
+		length -= len;
 	}
 
 	/*
-- 
2.24.3 (Apple Git-128)

