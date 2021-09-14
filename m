Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E9640AD5B
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbhINMT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:19:59 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:57301 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232631AbhINMT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:19:58 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Sep 2021 08:19:58 EDT
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PqodmL4uWczbLQ7Himm22j; Tue, 14 Sep 2021 12:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621494; bh=DAbD8Je9xqbVKhf8rihFPcGAUd77SdVWkTcvlYbjWlI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=fmdp1I/IWFy11GKmTrSB8ZSAq+CffbfcSA2Jjk5/KfAHbv0Hpra/lmwqfxdyoiEUn
         V1OrHKsA5FkhzuIL8mF3SpUdhreE8jdhXUkrIvoGIm70LaOtWaiUFPiXEBFoIC8gIP
         EcHPggs1n8eQMHJkO5I0US9nZbGXVRBUCL1B+exqnzHVKK9RUxQ8ry5ku8yMqDRD48
         EO4GdYq48oj6pIiXPI1GnLDcBliViFMG/sbaN5juQKjBy/ea1mnbuEXWp45K36t8v6
         vgG6qLO+DASXUxjwCHPVxzS5mU9LYRN1JwvSSWchb87WTryK3d56gEn8++PFseCSnM
         HWB3ulD81aguw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hhmpv0a; Tue, 14 Sep 2021 12:11:34 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409176
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=O8lNxtBUwQlDx__LHswA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 04/11] edid-decode: add bounds checking
Date:   Tue, 14 Sep 2021 05:11:22 -0700
Message-Id: <20210914121129.51451-5-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGNgsy3UaltUbouhe8WgPYFBvOGJS9DNYYGgmGOoFpgsVjFzQ2PmoE62ACfwzcm2G0vwahbgEwMwf3vbf/Ay8NqOQkA1ddBfPlTtY/0Q8epgK/d5PmD7
 NdXPdP4sZtfCEpA/M46a9PiUzpWuPShUVTtV0jLCwEh+SKH0gFlFvh8k0dIQY4hgAx71B8mlfUiw9Xhmb5sPQsIFmHWMg7h8+eA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-vtb-ext-block.cpp | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/parse-vtb-ext-block.cpp b/parse-vtb-ext-block.cpp
index 05d54f4..edfe887 100644
--- a/parse-vtb-ext-block.cpp
+++ b/parse-vtb-ext-block.cpp
@@ -17,16 +17,21 @@ void edid_state::parse_vtb_ext_block(const unsigned char *x)
 	unsigned num_cvt = x[3];
 	unsigned num_st = x[4];
 
+	const unsigned char *y = x + 0x7f;
 	x += 5;
 	if (num_dtd) {
 		printf("  Detailed Timing Descriptors:\n");
-		for (unsigned i = 0; i < num_dtd; i++, x += 18)
+		for (unsigned i = 0; i < num_dtd; i++, x += 18) {
+			if (x + 18 > y) { fail("Not enough bytes remain for more DTBs in the VTB-EXT\n"); return; }
 			detailed_timings("    ", x, false);
+		}
 	}
 	if (num_cvt) {
 		printf("  Coordinated Video Timings:\n");
-		for (unsigned i = 0; i < num_cvt; i++, x += 3)
+		for (unsigned i = 0; i < num_cvt; i++, x += 3) {
+			if (x + 3 > y) { fail("Not enough bytes remain for more CVTs in the VTB-EXT\n"); return; }
 			detailed_cvt_descriptor("    ", x, false);
+		}
 	}
 	if (num_st) {
 		// Note: the VTB-EXT standard has a mistake in the example EDID
@@ -36,7 +41,9 @@ void edid_state::parse_vtb_ext_block(const unsigned char *x)
 		//
 		// The documentation itself is correct, though.
 		printf("  Standard Timings:\n");
-		for (unsigned i = 0; i < num_st; i++, x += 2)
+		for (unsigned i = 0; i < num_st; i++, x += 2) {
+			if (x + 2 > y) { fail("Not enough bytes remain for more STs in the VTB-EXT\n"); return; }
 			print_standard_timing("    ", x[0], x[1], true);
+		}
 	}
 }
-- 
2.24.3 (Apple Git-128)

