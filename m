Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEBE107F6E
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfKWQqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:18 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.137]:37168 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfKWQqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY4iYY1T; Sat, 23 Nov 2019 09:46:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527576;
        bh=yHM15E0mgPxHjr4gDvSPEl+X3DtcLDljv/nphZkr49I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QCwQhfoVkrBXkEfxzMYEqEkQTrQUXyXYDSWflB6E6Dqzi+qQcrHQx1it6IsOvNQIs
         xZUuPP2MesetnaRE+98QXEgUbn1YzWCYOBxAedHdL+c6iDcp85zhDUDm0+Q9CzloHB
         I4jZZ7wIXdJUXyBhxgIY9QlEz2iHTtqLIBa+Opj+3jInAAKho8EISSLkuzT4/2OW8s
         a/vKzfinPSQEEIH1M1pbV5QR4kztAw2YIE5oRVkksZZ+APABqM7wa1pfp7zETrFl7L
         LRGGoBLaCioYW4H1E8vt/v5fOyO+8VKTn2UOkDJ2mwhwEDoiQgq+fqi883n/WWqIUk
         yuOoRSSVbjBCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527576;
        bh=yHM15E0mgPxHjr4gDvSPEl+X3DtcLDljv/nphZkr49I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QCwQhfoVkrBXkEfxzMYEqEkQTrQUXyXYDSWflB6E6Dqzi+qQcrHQx1it6IsOvNQIs
         xZUuPP2MesetnaRE+98QXEgUbn1YzWCYOBxAedHdL+c6iDcp85zhDUDm0+Q9CzloHB
         I4jZZ7wIXdJUXyBhxgIY9QlEz2iHTtqLIBa+Opj+3jInAAKho8EISSLkuzT4/2OW8s
         a/vKzfinPSQEEIH1M1pbV5QR4kztAw2YIE5oRVkksZZ+APABqM7wa1pfp7zETrFl7L
         LRGGoBLaCioYW4H1E8vt/v5fOyO+8VKTn2UOkDJ2mwhwEDoiQgq+fqi883n/WWqIUk
         yuOoRSSVbjBCw==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=Y0AxvjjkuhBQz6IG164A:9
 a=-zfNXOI2J4Al7ZIw:21 a=8FACJTD6ELLG4Xgd:21 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 05/10] edid-decode: output timings for YCbCr 4:2:0 cmdb
Date:   Sat, 23 Nov 2019 08:45:59 -0800
Message-Id: <20191123164604.268-6-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNqLdg9ZMaVKC21oywaFt3H2bmA4YWhViyWonWA1WjvSCAEe3Hxa+KbFs9/SNd4ZO7JkIwMXwq2UloVIL/JtoYTG6UZAghSoIQ1tAq28T9I+4o2kIusj
 94N4R7mU4NjgkzMPk420nSsXDfywUqT72ReQMGimik884sXR9gG/i2L30LqzQ1p0adqWTZp/wT2Jyvr0RrPkEFILxSRUOtiZU4g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- "YCbCr 4:2:0 capability map data block" now outputs the modes that support YCbCr 4:2:0 instead of just indexes of the modes. Indexes refer to timings in "Video Data Block".
- Warnings are included in the output if "Video Data Block" doesn't appear before "YCbCr 4:2:0 Capability Map Data Block" or if the index is outside the range defined in the "Video Data Block".
- Moved inner loop of cta_svd into a new function cta_svd_one so that it can be reused by cta_y420cmdb.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.c | 44 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/edid-decode.c b/edid-decode.c
index b833178..4d6fe29 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1454,13 +1454,10 @@ static const struct edid_cta_mode *vic_to_mode(unsigned char vic)
 	return NULL;
 }
 
-static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
+static void cta_svd_one(const unsigned char *x, int for_ycbcr420)
 {
-	unsigned i;
-
-	for (i = 0; i < n; i++)  {
 		const struct edid_cta_mode *vicmode = NULL;
-		unsigned char svd = x[i];
+		unsigned char svd = x[0];
 		unsigned char native;
 		unsigned char vic;
 		const char *mode;
@@ -1468,7 +1465,7 @@ static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
 		unsigned clock_khz = 0;
 
 		if ((svd & 0x7f) == 0)
-			continue;
+			return;
 
 		if ((svd - 1) & 0x40) {
 			vic = svd;
@@ -1511,10 +1508,23 @@ static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
 		if (vic == 1)
 			has_cta861_vic_1 = 1;
 	}
+
+static void cta_svd(const unsigned char *x, int n, int for_ycbcr420)
+{
+	for (unsigned i = 0; i < n; i++)  {
+		printf("    ");
+		cta_svd_one(x+i, for_ycbcr420);
+		printf("\n");
+	}
 }
 
+unsigned const char *last_cta_video_block_start = NULL;
+unsigned last_cta_video_block_length = 0;
+
 static void cta_video_block(const unsigned char *x, unsigned length)
 {
+	last_cta_video_block_start = x;
+	last_cta_video_block_length = length;
 	cta_svd(x, length, 0);
 }
 
@@ -1531,9 +1541,25 @@ static void cta_y420cmdb(const unsigned char *x, unsigned length)
 		uint8_t v = x[0 + i];
 		unsigned j;
 
-		for (j = 0; j < 8; j++)
-			if (v & (1 << j))
-				printf("    VSD Index %u\n", i * 8 + j);
+		for (j = 0; j < 8; j++) {
+			if (v & (1 << j)) {
+				unsigned k = i * 8 + j;
+				printf("    VSD Index %u", k + 1);
+				if (k >= last_cta_video_block_length) {
+					if (last_cta_video_block_start) {
+						printf(" (out of range)");
+					} else {
+						printf(" (missing CTA video block)");
+					}
+				}
+				else
+				{
+					printf(" ");
+					cta_svd_one(last_cta_video_block_start+k, 0);
+				}
+				printf("\n");
+			}
+		}
 	}
 }
 
-- 
2.21.0 (Apple Git-122.2)

