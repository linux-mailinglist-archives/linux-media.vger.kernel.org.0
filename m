Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED0241875F
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhIZIfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:10 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:39161 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229710AbhIZIfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:10 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UEfmmHVpnps7PUPbKmzSGj; Sun, 26 Sep 2021 08:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645214; bh=gpMQCUiAoUBInqFer6nzvC+KEO+kz0NlrPrqMyZg8jg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IuMuUxUJSNXEHo4ZZ4ZfzgkjoG6zbfS/nJvxYVsXgM8qLtWaTAAgov59mW+9NJqux
         Q33ABGQuKMG7jIr8ywe20kWmxnGVM8t/si3lUb4YYBF4lAOxSHAzckirX0Os5I7PTD
         Ht3S9AuLb3nr5Ij7i6OyOi9/jppOib78dTQTbg0cUtVWFKtypvUa7/v9nFtpJ7VF2F
         MziPRof9JgMuLPetwXLILmFvVhO3TpsCNZhhjQqg9/yyrE6tCv63LNpOYt+faTP15H
         GFcDVOJX0UflOHqk1Ti7InUygNIRg92t2Saey725pEV4SbKEgI1jvp2fEfSxK5TcSv
         7c8NrrugnxzDQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbJm6iEP; Sun, 26 Sep 2021 08:33:34 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6150305e
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=adv3DReEIzELzf3bmRAA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 04/29] edid-decode: check cta_hdr10plus length
Date:   Sun, 26 Sep 2021 01:33:05 -0700
Message-Id: <20210926083330.5206-5-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLFoTLRz3bL6MEACqf5noFWedrUsQesKX3P2nBg2JMk54cJSGqwKRlDp2CFqCHORbp/agYABii3BsPR6oukkXGjAhcw5OlXKJ4k5WbETDh+sHTQU6QCW
 C/3SBgAZihneSmLIN1UUbsmBolvT9QmP4T6NhvWk5qnv07YJ9fUiS1iEHlxEFTQ9YNt4vcopluRqCyTXqKk8fMgI0a0AlMezoO4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- if the length is 0 then it cannot get Application Version. Output a fail message.
- cta_hdr10plus may output hex after "Application Version: %u". If the hex is longer than 16 characters, then more lines of hex will be output and they won't align with the first line.
Instead, always start the hex on a new line.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index f018df5..6607426 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -1133,11 +1133,12 @@ static void cta_microsoft(const unsigned char *x, unsigned length)
 
 static void cta_hdr10plus(const unsigned char *x, unsigned length)
 {
-	printf("    Application Version: %u", x[0]);
-	if (length > 1)
-		hex_block("  ", x + 1, length - 1);
-	else
-		printf("\n");
+	if (length == 0) {
+		fail("Empty Data Block with length %u.\n", length);
+		return;
+	}
+	printf("    Application Version: %u\n", x[0]);
+	hex_block("    ", x + 1, length - 1);
 }
 
 // Convert a PQ value (0-1) to cd/m^2 aka nits (0-10000)
-- 
2.24.3 (Apple Git-128)

