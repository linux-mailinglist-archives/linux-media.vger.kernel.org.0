Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F79740AD64
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbhINMUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:04 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:37605 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232884AbhINMUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:20:01 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id Q4EUm0M5Rps7PQ7HkmGPV8; Tue, 14 Sep 2021 12:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621496; bh=SctABPA34YBxBrr/4QVTApaycLX0mMdsaOxib+u1UxY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=VL8+7j9GWRvaaH4SEmHhqEJAtyhd1qfUFr+Ed95NUVbCDFNFzmWTVpENsobxstgET
         hurhrHJ7Z6oq8V+QLae5vNEEHlkiXY3ZAq/Fvs3/o4s6Vbvh2oVszyZaKt1eTfZ+zB
         gAf1c+saxT4w5pgwhbzGuem/wE+i+Se25rzxlo8lyAi1XN4Boo10Sbollmm6Gn+rTC
         Z3a8jYqO4UD5GXyi3Z+YV9ISGZJtLTPhgFntoeTQXg/Z6WD8oc/T4emvObMayAm1El
         CVXDHIBd1HWGzQf6CobuWHIluIkDjzH3+grOqy8SXiwDvYfQgssHEvM6nNsObFFjvF
         UtLKuEZAIiEOg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hkmpv1P; Tue, 14 Sep 2021 12:11:36 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409178
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=77ANNSRXFWH3LhZW9EwA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 10/11] edid-decode: add warnings to VESA VSDB
Date:   Tue, 14 Sep 2021 05:11:28 -0700
Message-Id: <20210914121129.51451-11-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCBo+5f51KZNHw1xvYOgvbBduSeJ+uOq0zi97Rxx6bi4luMWUak0yUu4tFACLvKcnEloO0wNApxyMonPULTX6lLZb8XoIzknMY7j8SQ2K2/pLFqZwWso
 VrzPEfMa9CjASfVcflrwP/aI+mKogi22RT1w6MY7SY/7GlolTqUDu5xJIVZ3T/CnQ5/a3vXCLvwA2ZfjesSbs+RmZu0vM97ryho=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add warnings for VESA vendor specific datablock (bits that should be zero and reserved values).

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-displayid-block.cpp | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
index 8f4e366..5c81294 100644
--- a/parse-displayid-block.cpp
+++ b/parse-displayid-block.cpp
@@ -1461,22 +1461,37 @@ void edid_state::parse_displayid_vesa(const unsigned char *x)
 	unsigned len = x[2];
 	x += 6;
 	printf("    Data Structure Type: ");
-	switch (x[0] & 0x07) {
-	case 0x00: printf("eDP\n"); break;
-	case 0x01: printf("DP\n"); break;
-	default: printf("Reserved\n"); break;
+	switch (x[0] & 7) {
+	case 0: printf("eDP\n"); break;
+	case 1: printf("DP\n"); break;
+	default: printf("Reserved (%d)\n", x[0] & 7); break;
 	}
+
+	if ((x[0] >> 3) & 15)
+		warn("Reserved bits 6:3 (%d) are not 0.\n", (x[0] >> 3) & 15);
+
 	printf("    Default Colorspace and EOTF Handling: %s\n",
 	       (x[0] & 0x80) ? "Native as specified in the Display Parameters DB" : "sRGB");
+
 	printf("    Number of Pixels in Hor Pix Cnt Overlapping an Adjacent Panel: %u\n",
 	       x[1] & 0xf);
+	if ((x[1] & 0xf) > 8)
+		warn("Number of Pixels in Hor Pix Cnt Overlapping an Adjacent Panel exceeds 8.\n");
+
+	if ((x[1] >> 4) & 1)
+		warn("Reserved bit 4 is not 0.\n");
+
 	printf("    Multi-SST Operation: ");
-	switch ((x[1] >> 5) & 0x03) {
-	case 0x00: printf("Not Supported\n"); break;
-	case 0x01: printf("Two Streams (number of links shall be 2 or 4)\n"); break;
-	case 0x02: printf("Four Streams (number of links shall be 4)\n"); break;
-	case 0x03: printf("Reserved\n"); break;
+	switch ((x[1] >> 5) & 3) {
+	case 0: printf("Not Supported\n"); break;
+	case 1: printf("Two Streams (number of links shall be 2 or 4)\n"); break;
+	case 2: printf("Four Streams (number of links shall be 4)\n"); break;
+	case 3: printf("Reserved\n"); warn("Invalid option for Multi-SST Operation.\n"); break;
 	}
+
+	if ((x[1] >> 7) & 1)
+		warn("Reserved bit 7 is not 0.\n");
+
 	if (len >= 7) {
 		double bpp = (x[2] & 0x3f) + (x[3] & 0x0f) / 16.0;
 		printf("    Pass through timing's target DSC bits per pixel: %.4f\n", bpp);
-- 
2.24.3 (Apple Git-128)

