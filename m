Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A70417E40
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344909AbhIXXdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:32 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:59094 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235822AbhIXXda (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:30 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id ToZ0mdih9czbLTufcmRrVz; Fri, 24 Sep 2021 23:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526316; bh=zHJDbv+mDHrDWTEwNQK/6L7qOIgCFbuDZwKtfkHs4jQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=X75iW65STjLq3GiyLaoxrM6IvPCBRU6Sz5skbTa5gpL1Yik3AtibUO236Zerupeai
         2Zuqa4d6ZAj+Q+OVdyCtUb+OCygpQ+fHFJeZ36iEeYliLX15opKQ23ks6PA17Pbe6x
         NHU/HJTECxIamUze5jxVxWEKIJzMoPbV2DXwtDWwiJ1436BIlEvBl5bx0xRqhud7FX
         co04LO4bT08wyRIVHPRuKv8KwmzeW38XJxtoVOmlggOqMiWLl7QlCe/aZpoIJEDKB5
         +hyHXSlok6h4Xd6qBeZvHeAfEpMzmStKFY7EyYOXmaY+NhgKLsalA5AdmMv6gkSemO
         VOurOOhI/t5ig==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufbmYw7e; Fri, 24 Sep 2021 23:31:56 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fec
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=LIcKB4O_YFRxREVKF7IA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 08/28] edid-decode: Output block type before fail
Date:   Fri, 24 Sep 2021 16:31:29 -0700
Message-Id: <20210924233149.10028-9-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM6vBya/JtPlqJ+3uLcUigZfWUzkRgLkDxv1WIQbXKP7tmE5PDW+lA9IEQ86cic8KGcDtoTnYhDxmLA/BGnnZQuE/Yzv1yem24vkwOmMr2qQ2gCiTml1
 id+7ZjHOMXk32mRqvXK8VZ8iMx68SUnM1j7fqHALam9+x1HqaR93fEc3Mc2ZDscNolqIEjwgafv7TyxQ/4U91SYMV0X2BYp/bVc=
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
index 130fe9e..d6c797d 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2042,6 +2042,9 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 		return;
 	}
 
+	if (data_block.length())
+		printf("  %s:\n", data_block.c_str());
+
 	switch (tag) {
 	case 0x700:
 	case 0x702:
@@ -2061,9 +2064,6 @@ void edid_state::cta_ext_block(unsigned tag, const unsigned char *x, unsigned le
 	if (audio_block && !(cta.byte3 & 0x40))
 		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 
-	if (data_block.length())
-		printf("  %s:\n", data_block.c_str());
-
 	switch (tag) {
 	case 0x700: cta_vcdb(x, length); break;
 	case 0x701:
@@ -2258,17 +2258,17 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
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

