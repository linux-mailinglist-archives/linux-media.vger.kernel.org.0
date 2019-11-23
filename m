Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16764107F71
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfKWQqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:18 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:37148 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfKWQqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY4iYY1e; Sat, 23 Nov 2019 09:46:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527577;
        bh=+DvTZw0HCG61wE7UVXahKaZLea8jmyMj2TeQ9lVUMEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=wXIBedy3bcMEKlOBqn/yFz+E86YoR68+CUn1xPIl5E7mHY7ITekRBlu5Je8143tPC
         ht5TFnpm8i9tmnNriWf8X4/9HIHrvIv+dmu/POQDbEs892F21CqbCuOrWwgKb1r0zp
         PWajdhHSvroFi3oYXa8128LnxqG9LGsGHsOCFQOkrYytDYl2uyDpQdSUejIhgxd5rh
         I6tsPhHNHVCRpWGe1ElwVa/UVW9XBVyze+t3lqvNMlrDLXnFd1Otgb11SBsONbojcX
         HgFVIeNCo6pGLnAybtKfQ7UoZV1KnstsGgZwLjMBLJfZZu5icrh7MNIHBF2pvgk+kJ
         n8g8clYPD7vPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527577;
        bh=+DvTZw0HCG61wE7UVXahKaZLea8jmyMj2TeQ9lVUMEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=wXIBedy3bcMEKlOBqn/yFz+E86YoR68+CUn1xPIl5E7mHY7ITekRBlu5Je8143tPC
         ht5TFnpm8i9tmnNriWf8X4/9HIHrvIv+dmu/POQDbEs892F21CqbCuOrWwgKb1r0zp
         PWajdhHSvroFi3oYXa8128LnxqG9LGsGHsOCFQOkrYytDYl2uyDpQdSUejIhgxd5rh
         I6tsPhHNHVCRpWGe1ElwVa/UVW9XBVyze+t3lqvNMlrDLXnFd1Otgb11SBsONbojcX
         HgFVIeNCo6pGLnAybtKfQ7UoZV1KnstsGgZwLjMBLJfZZu5icrh7MNIHBF2pvgk+kJ
         n8g8clYPD7vPw==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=gBTKqA94KM4qIfOADQQA:9
 a=U9RPtI0sKH2XMvbP:21 a=mG_VuKtMimwJnITi:21 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 07/10] edid-decode: cleanup printf format string compiler warnings
Date:   Sat, 23 Nov 2019 08:46:01 -0800
Message-Id: <20191123164604.268-8-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHTxCG5BBpoqkDnryCe3eCAVNgzieEoKks7Hy73AmgTyK49aGkASM0AptWx4zV0Y8/jCwTFs5TrkkPIvdUsEt8sAo2NJLu50eliXViL5HtWazze6AqWL
 Ivc6cXFbpMN03Fh9mDgFJ+K5GGdyM6+/x80ISUtFMbStwXc+2qSB8FbbObvaYMRraG+3FdMCaFn7dspV4UaztgaiH0wPQVZ6HWw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In current versions of macOS, $(CC) in Makefile is gcc but gcc points to clang. clang complains when h is used for char or int (h is usually for short).

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/edid-decode.c b/edid-decode.c
index ce404cd..a40ee96 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1127,13 +1127,13 @@ static int do_checksum(const unsigned char *x, size_t len)
 	unsigned char sum = 0;
 	unsigned i;
 
-	printf("Checksum: 0x%hx", check);
+	printf("Checksum: 0x%hhx", check);
 
 	for (i = 0; i < len-1; i++)
 		sum += x[i];
 
 	if ((unsigned char)(check + sum) != 0) {
-		printf(" (should be 0x%hx)\n", -sum & 0xff);
+		printf(" (should be 0x%x)\n", -sum & 0xff);
 		return 0;
 	}
 
@@ -3286,7 +3286,7 @@ static int edid_from_file(const char *from_file, const char *to_file,
 	}
 
 	cur_block = "EDID Structure Version & Revision";
-	printf("EDID version: %hd.%hd\n", edid[0x12], edid[0x13]);
+	printf("EDID version: %hhu.%hhu\n", edid[0x12], edid[0x13]);
 	if (edid[0x12] == 1) {
 		if (edid[0x13] > 4) {
 			printf("Claims > 1.4, assuming 1.4 conformance\n");
@@ -3321,12 +3321,12 @@ static int edid_from_file(const char *from_file, const char *to_file,
 		if (edid[0x11] <= 0x0f) {
 			fail("bad year of manufacture\n");
 		} else if (edid[0x10] == 0xff) {
-			printf("Model year %hu\n", edid[0x11] + 1990);
+			printf("Model year %u\n", edid[0x11] + 1990);
 		} else if (edid[0x11] + 90 <= ptm->tm_year + 1) {
 			if (edid[0x10])
-				printf("Made in week %hu of %hu\n", edid[0x10], edid[0x11] + 1990);
+				printf("Made in week %hhu of %u\n", edid[0x10], edid[0x11] + 1990);
 			else
-				printf("Made in year %hu\n", edid[0x11] + 1990);
+				printf("Made in year %u\n", edid[0x11] + 1990);
 		} else {
 			fail("bad year of manufacture\n");
 		}
-- 
2.21.0 (Apple Git-122.2)

