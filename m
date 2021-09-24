Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7176417E3C
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344774AbhIXXda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:30 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:47496 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229669AbhIXXd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:28 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id TnVOmFYAvps7PTufZmwEGz; Fri, 24 Sep 2021 23:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526313; bh=OCHOWlaS5TJW+p1WHB8fKHQA7vRlxyLRHIpIwmYt3hE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=d/VwmIwQ9LhougK4WLjAcgrm52rSA1k8gt5U39trUDlciA+MFTPSnMaAnVxefdFy1
         79tZnWSAQKO1ht3t+qOuRc5GoHuK9HHvfo/cn9i0qAz8oirTQKos4tgdn5f5oN+05d
         sGah1AH11rrRcKeloVzMZTqdDz8j27hFCjLnSMJdxtdujuIrVK9TOOVZzDaTWEYJIp
         E/VejdBQM4uk2/tY/Z7AXSWMb2L91UV+iU79uSS67PqVDwzEzxan4YrxFviLWGcxa8
         Q6hnp8tMXLAzqr0cfXbTHYaHP1Gay4OLZLXBQxXawJ+6lrzhgtZqeg1+lAb6xtzzhe
         m6txZNbHX8JRQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufZmYw75; Fri, 24 Sep 2021 23:31:53 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fe9
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=adv3DReEIzELzf3bmRAA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 04/28] edid-decode: check cta_hdr10plus length
Date:   Fri, 24 Sep 2021 16:31:25 -0700
Message-Id: <20210924233149.10028-5-joevt@shaw.ca>
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

- if the length is 0 then it cannot get Application Version. Output a fail message.
- cta_hdr10plus may output hex after "Application Version: %u". If the hex is longer than 16 characters, then more lines of hex will be output and they won't align with the first line.
Instead, always start the hex on a new line.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index cee51d7..703f8ca 100644
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
 
 static void cta_dolby_video(const unsigned char *x, unsigned length)
-- 
2.24.3 (Apple Git-128)

