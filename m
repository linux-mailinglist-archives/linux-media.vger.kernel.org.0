Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5DF417E3B
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344720AbhIXXda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:30 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:59094 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239410AbhIXXd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:27 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id ToZ0mdih8czbLTufZmRrVD; Fri, 24 Sep 2021 23:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526313; bh=tihaJdtv8y1u0lU78O43XcIJHACcC9FBwa5mJo7Nyac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Jl2oS3FtP8IgJFINqiTw4JIKonj0v4186iOSJfB28ufSerAsRSiwURILF6igUWHkr
         6pyeoGWGvdu8V8Nex2RyiTEDE/YXj0nq30Mbwhnf8nX7yusl8YC8Nlqx6QDWY1UyxD
         bvS/PxKwE085BD1TCfChmfORCf9+teTSYYcaXpEMx/HcA9NWMUuySp37pZxap3D3fk
         9HVR8Pf79QUls9MaYoGyyRAnK5+3cVct4VP/fR7e+cScshHfkXG5p3a8WALcjBfxbB
         V+CnZ9b+opvNYQckuhpUzBWF620jmi8Mkh1edvdZtTvp+4X3iOr01pKy/dYePsaP9d
         HnEQO1rN4XJ6g==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufYmYw6z; Fri, 24 Sep 2021 23:31:53 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fe9
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=r_64EQOmvbVPSZJ-B9QA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 03/28] edid-decode: exclude oui from _block functions
Date:   Fri, 24 Sep 2021 16:31:24 -0700
Message-Id: <20210924233149.10028-4-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLlUgT/goOIKzhixfEgheIqPOADi9TkwfmNw8AgXKb6Zl6Lq7fKeIzoLxcwbkgNV0qP111K79RFi240/PdmxBHjPp+/gw5LP6Fvnemiqmvltue1gEkFD
 NoxCB94hZSd4/I4iauW2AA3s5YxZS0Z3LOToT+DqztJ+EoMytm99w/EH8n7UUrUYz2XoBCTqq9CO9zjMKFb0tZe5Qtb/ukl0Un0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cta_hdmi_block is the only function that has oui included. Make it like all the other functions by increasing x by 3 (the size of the oui) and decreasing length by the same amount.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 48 ++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 4edaa1d..cee51d7 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -652,57 +652,57 @@ void edid_state::cta_hdmi_block(const unsigned char *x, unsigned length)
 {
 	unsigned len_vic, len_3d;
 
-	if (length < 4) {
+	if (length < 1) {
 		fail("Empty Data Block with length %u.\n", length);
 		return;
 	}
-	printf("    Source physical address: %x.%x.%x.%x\n", x[3] >> 4, x[3] & 0x0f,
-	       x[4] >> 4, x[4] & 0x0f);
+	printf("    Source physical address: %x.%x.%x.%x\n", x[0] >> 4, x[0] & 0x0f,
+	       x[1] >> 4, x[1] & 0x0f);
 
-	if (length < 6)
+	if (length < 3)
 		return;
 
-	if (x[5] & 0x80)
+	if (x[2] & 0x80)
 		printf("    Supports_AI\n");
-	if (x[5] & 0x40)
+	if (x[2] & 0x40)
 		printf("    DC_48bit\n");
-	if (x[5] & 0x20)
+	if (x[2] & 0x20)
 		printf("    DC_36bit\n");
-	if (x[5] & 0x10)
+	if (x[2] & 0x10)
 		printf("    DC_30bit\n");
-	if (x[5] & 0x08)
+	if (x[2] & 0x08)
 		printf("    DC_Y444\n");
 	/* two reserved bits */
-	if (x[5] & 0x01)
+	if (x[2] & 0x01)
 		printf("    DVI_Dual\n");
 
-	if (length < 7)
+	if (length < 4)
 		return;
 
-	printf("    Maximum TMDS clock: %u MHz\n", x[6] * 5);
-	if (x[6] * 5 > 340)
+	printf("    Maximum TMDS clock: %u MHz\n", x[3] * 5);
+	if (x[3] * 5 > 340)
 		fail("HDMI VSDB Max TMDS rate is > 340.\n");
 
-	if (length < 8)
+	if (length < 5)
 		return;
 
-	if (x[7] & 0x0f) {
+	if (x[4] & 0x0f) {
 		printf("    Supported Content Types:\n");
-		if (x[7] & 0x01)
+		if (x[4] & 0x01)
 			printf("      Graphics\n");
-		if (x[7] & 0x02)
+		if (x[4] & 0x02)
 			printf("      Photo\n");
-		if (x[7] & 0x04)
+		if (x[4] & 0x04)
 			printf("      Cinema\n");
-		if (x[7] & 0x08)
+		if (x[4] & 0x08)
 			printf("      Game\n");
 	}
 
-	unsigned b = 8;
-	if (x[7] & 0x80) {
+	unsigned b = 5;
+	if (x[4] & 0x80) {
 		hdmi_latency(x[b], x[b + 1], false);
 
-		if (x[7] & 0x40) {
+		if (x[4] & 0x40) {
 			if (x[b] == x[b + 2] &&
 			    x[b + 1] == x[b + 3])
 				warn("Progressive and Interlaced latency values are identical, no need for both.\n");
@@ -712,7 +712,7 @@ void edid_state::cta_hdmi_block(const unsigned char *x, unsigned length)
 		b += 2;
 	}
 
-	if (!(x[7] & 0x20))
+	if (!(x[4] & 0x20))
 		return;
 
 	bool mask = false;
@@ -2212,7 +2212,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
 		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
 		if (oui == 0x000c03) {
-			cta_hdmi_block(x + 1, length);
+			cta_hdmi_block(x + 4, length - 3);
 			cta.last_block_was_hdmi_vsdb = 1;
 			cta.first_block = 0;
 			// The HDMI OUI is present, so this EDID represents an HDMI
-- 
2.24.3 (Apple Git-128)

