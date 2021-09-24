Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F270417E49
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345042AbhIXXdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:37 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:59094 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344513AbhIXXdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:35 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id TmS9mdUgbczbLTufhmRrXA; Fri, 24 Sep 2021 23:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526321; bh=15t4dSO2n+HTMshAC6WcrVaeMEz/b8PwXrKWEMOM0Cc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=t5qOCOGQA0OmRYR7wY9AsIjnEZgkWpnD9ze3+0lKbh9QFUXZpxKWfOYUkOI2ss8MZ
         hka0OsEEpXDqYpeV5mEMDF1rH1f+TrSUJT9SOjQ7lgco8Gl3JxdopJaQZfAw3i/mzs
         wwZEMOtvqUa2SNXE03OvT8ArjrVagSBuRyHM+V0+egQ+5Pty4Kzfwx3OhO16AN/ew8
         T1gb0DGnBlfDM1jzRFlJNAiWfE70utq7oONhBK2Vh3/lAKpTKFxye5rTjdw+z80TGv
         2K6c7kAzSdPn6Kmkxm5i+5N5yjpH9kn2PXo7YJsOj/p2VzNqudS0SsQ411vmJ5RLox
         lE2FAFXllCGQA==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufgmYw96; Fri, 24 Sep 2021 23:32:01 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5ff1
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=Kq4NL1YokvzOOEXvYrsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 17/28] edid-decode: replace first_block with block_number
Date:   Fri, 24 Sep 2021 16:31:38 -0700
Message-Id: <20210924233149.10028-18-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJWioHSR1SplWo4vsWdWc3U/ECCBExBc6d0craFupfbS3k0InQ3EZ6sNf/+CJ8fHx9D1ziu/qywlW7l4ldKNK5wpWnFlX0AkbdxY9husqjERz22CHSfZ
 8TPj59ma2aKmCDSWqf5d1sLwlvfv4+F/kN8GBi3LTegFhknPT4bLJC/oRb//ixNZQm7zrnKvw4pKSI2sgmN6OjTFb180knhMkLk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

track progress instead of milestones.

With a flag like first_block, you can only know if you're at the first block or not.
But with a progressing value like block_number, you can know when you're at the first block or second block etc. and you can know how many blocks have been done.
We'll also replace last_block_was_hdmi_vsdb in a later commit.
Both of these changes will cleanup the hdmi block.


Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.h       |  5 +++--
 parse-cta-block.cpp | 10 +++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/edid-decode.h b/edid-decode.h
index 8cb5ee7..52d555b 100644
--- a/edid-decode.h
+++ b/edid-decode.h
@@ -154,7 +154,8 @@ struct edid_state {
 		cta.has_vic_1 = cta.first_svd_might_be_preferred = cta.has_sldb =
 			cta.has_hdmi = cta.has_vcdb = cta.has_vfpdb = false;
 		cta.last_block_was_hdmi_vsdb = cta.have_hf_vsdb = cta.have_hf_scdb = false;
-		cta.first_block = cta.first_svd = true;
+		cta.block_number = 0;
+		cta.first_svd = true;
 		cta.supported_hdmi_vic_codes = cta.supported_hdmi_vic_vsb_codes = 0;
 		memset(cta.vics, 0, sizeof(cta.vics));
 		memset(cta.preparsed_has_vic, 0, sizeof(cta.preparsed_has_vic));
@@ -259,7 +260,7 @@ struct edid_state {
 		unsigned short preparsed_phys_addr;
 		bool last_block_was_hdmi_vsdb;
 		bool have_hf_vsdb, have_hf_scdb;
-		bool first_block;
+		unsigned block_number;
 		bool first_svd;
 		unsigned supported_hdmi_vic_codes;
 		unsigned supported_hdmi_vic_vsb_codes;
diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 48d0013..66d8e4a 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2095,7 +2095,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		if (oui == 0x000c03) {
 			cta_hdmi_block(x, length);
 			cta.last_block_was_hdmi_vsdb = 1;
-			cta.first_block = 0;
+			cta.block_number++;
 			// The HDMI OUI is present, so this EDID represents an HDMI
 			// interface. And HDMI interfaces must use EDID version 1.3
 			// according to the HDMI Specification, so check for this.
@@ -2158,7 +2158,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x778:
 		cta_hf_eeodb(x, length);
 		// This must be the first CTA-861 block
-		if (!cta.first_block)
+		if (cta.block_number > 0)
 			fail("Block starts at a wrong offset.\n");
 		break;
 	case 0x779:
@@ -2180,7 +2180,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		hex_block("    ", x, length);
 	}
 
-	cta.first_block = 0;
+	cta.block_number++;
 	cta.last_block_was_hdmi_vsdb = 0;
 }
 
@@ -2297,11 +2297,11 @@ void edid_state::parse_cta_block(const unsigned char *x)
 //				msg(!cta.has_hdmi, "If YCbCr support is indicated, then both 4:2:2 and 4:4:4 %s be supported.\n",
 //				    cta.has_hdmi ? "shall" : "should");
 			printf("  Native detailed modes: %u\n", x[3] & 0x0f);
-			if (cta.first_block)
+			if (cta.block_number == 0)
 				cta.byte3 = x[3];
 			else if (x[3] != cta.byte3)
 				fail("Byte 3 must be the same for all CTA-861 Extension Blocks.\n");
-			if (cta.first_block) {
+			if (cta.block_number == 0) {
 				unsigned native_dtds = x[3] & 0x0f;
 
 				cta.native_timings.clear();
-- 
2.24.3 (Apple Git-128)

