Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0928641876C
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhIZIfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:21 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:51462 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229876AbhIZIfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:20 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U8Srmf7ImczbLUPbRmV5UV; Sun, 26 Sep 2021 08:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645221; bh=X+ZNxfdytYuQ+kOgdpzqONaAfXCrd1KgFpphs3NQJP8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FjrtBDog0QxVw0H+JmcZo1mYK7LE78wxT2Bw1A27Psa0U+orkMR5IzHKXHsGKVyX5
         LjBrnASbvEhkJXShroabKmMz4IuUHXy0wrW7yuoavV8LwUuIbpvxbsIv28KHz4UARQ
         +JMKads/BSaEK5y6Qu3bAjbS1LcgNEHKAmLHkEL1W3YHBw/X4z5WUo9qNURdX/Xnh6
         tdPQwaqvWnNcj1wsNc7/y44X2IfQnqhVu/Y0Lnn9FCbcfA2pI9nTBO8FtAsQhpA1xu
         1kSbfPLQBxlydu5SZu3K4MZGZOa8LKOzH9tyJjKtPsVv4VGXz6KickIz/hL6I5AZwL
         2FTHP63KnmQow==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbQm6iFL; Sun, 26 Sep 2021 08:33:41 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503065
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=Kq4NL1YokvzOOEXvYrsA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 17/29] edid-decode: replace first_block with block_number
Date:   Sun, 26 Sep 2021 01:33:18 -0700
Message-Id: <20210926083330.5206-18-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGWXBY4HvalrRx/3DaJvAGBBeTSVFDda6tc4rcB80y3y6T1C4yyoE9uROdofOyHrUP1OnGZqSYavEPTHEUUqpyL7Qw59Q+VBuzgMostAsbRCXk651a4b
 b6dBlsTsmtihdblvjJ+XMS5hLiayLoTIJE0HmaqWTbldUVK+KARyuPRZxqOsSe55AzSKJ4OaymBISk/QCClR46HlIYSBiSzjGZw=
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
index ccf8558..dbc00c2 100644
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
index 607e42b..13b3b73 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2131,7 +2131,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		if (oui == 0x000c03) {
 			cta_hdmi_block(x, length);
 			cta.last_block_was_hdmi_vsdb = 1;
-			cta.first_block = 0;
+			cta.block_number++;
 			// The HDMI OUI is present, so this EDID represents an HDMI
 			// interface. And HDMI interfaces must use EDID version 1.3
 			// according to the HDMI Specification, so check for this.
@@ -2194,7 +2194,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x778:
 		cta_hf_eeodb(x, length);
 		// This must be the first CTA-861 block
-		if (!cta.first_block)
+		if (cta.block_number > 0)
 			fail("Block starts at a wrong offset.\n");
 		break;
 	case 0x779:
@@ -2216,7 +2216,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 		hex_block("    ", x, length);
 	}
 
-	cta.first_block = 0;
+	cta.block_number++;
 	cta.last_block_was_hdmi_vsdb = 0;
 }
 
@@ -2333,11 +2333,11 @@ void edid_state::parse_cta_block(const unsigned char *x)
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

