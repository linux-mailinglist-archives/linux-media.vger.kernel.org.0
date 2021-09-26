Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8593418764
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhIZIfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:13 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:43776 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229730AbhIZIfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:12 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U9QQmfBXuczbLUPbMmV5UD; Sun, 26 Sep 2021 08:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645216; bh=cxyaxxnK8vlZziWlgCEUEHzp47YRM7TOJ7SNy1QIctw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=oaI9mupkyohfKjO5V14gXwiRZd8BJ9Va58lKLsyufFxCVRXTzrwE0FE7FyimEAJEc
         Cg5Tmx7eTjzVHaztsGJUt1JkWBcX4ZqtHZzQnjAg34GrcH8WVgZ936nP7VtQQID8t5
         W+ycPPac5D4PSP9P9vpg7mosZPqxh12MSlbCudcj9kp4zN6h3CofCMVSVMbMd0OS9H
         jr7ZkmghAoazdrYBC+vobuaQq5fOBPhqbY9AgieM4vpd+I8SPAwYVNR05ePN1YkYx5
         4P9PFZ3k2+3fnRIQHRNd0aboR4aWHgiKZnNx4kZKosq8ujLFjbLYPNbskwbC0TBtwy
         JSBneuj9EBXnw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbLm6iEd; Sun, 26 Sep 2021 08:33:36 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503060
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=LIcKB4O_YFRxREVKF7IA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 08/29] edid-decode: Output block type before fail
Date:   Sun, 26 Sep 2021 01:33:09 -0700
Message-Id: <20210926083330.5206-9-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIOATl9zMXl0FJ50DkXDFGJYe7nugBSE5oX2wPChKlD0XksBv6c6X8Dw95FVxT9xU4jbesc1vc5RNEDuv+Hv4/NJmVdA93rWd8EAmPk4z2polZ0YP+US
 20jKE1jZ8LsR11RqNCnnn8k6EvElvpCut1mM8knYpdC3aR/sAfln0T6pOkOCSDAI1fvNs2j5MWXQ0FAkiHhVZ+iZG1cJoYN53i0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For extended tags, block type should be output before fail messages (duplicate failure, or missing audio failure).
For normal tags 0x04 and 0x05, fail message should appear after block type instead of block data to be consistent (and also to indicate that the failure is because of the block type and not the contents of the block).

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index f1ad041..fb2e9ea 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2078,6 +2078,9 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 		return;
 	}
 
+	if (data_block.length())
+		printf("  %s:\n", data_block.c_str());
+
 	switch (tag) {
 	case 0x700:
 	case 0x702:
@@ -2097,9 +2100,6 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	if (audio_block && !(cta.byte3 & 0x40))
 		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 
-	if (data_block.length())
-		printf("  %s:\n", data_block.c_str());
-
 	switch (tag) {
 	case 0x700: cta_vcdb(x, length); break;
 	case 0x701:
@@ -2294,17 +2294,17 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 	case 0x04:
 		data_block = "Speaker Allocation Data Block";
 		printf("  %s:\n", data_block.c_str());
-		cta_sadb(x, length);
-		audio_block = true;
 		if (duplicate)
 			fail("Only one instance of this Data Block is allowed.\n");
+		cta_sadb(x, length);
+		audio_block = true;
 		break;
 	case 0x05:
 		data_block = "VESA Display Transfer Characteristics Data Block";
 		printf("  %s:\n", data_block.c_str());
-		cta_vesa_dtcdb(x, length);
 		if (duplicate)
 			fail("Only one instance of this Data Block is allowed.\n");
+		cta_vesa_dtcdb(x, length);
 		break;
 	case 0x07:
 		data_block = "Unknown CTA-861 Data Block (extended tag truncated)";
-- 
2.24.3 (Apple Git-128)

