Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD6F40AD62
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhINMUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:03 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:34036 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232866AbhINMUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:20:00 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id Q0nlmM30cczbLQ7Hjmm22x; Tue, 14 Sep 2021 12:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621495; bh=Qu77yPJ3BhCeRFsPqJ6nRpuxMCL/uorTy2R4ZO+5ehc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IHtDVl05FSwLGYmewCdotDQYw9PrzFcYi9CXRTRUKem/7KUv9PL8bRw0CvqOkVJHL
         K4kyTy/phmyirBgDDSPlzmrsZSoGLH/li28ZL5LErxQrdexmMjn6AkFCg8nuIINERy
         xkrPtd68910LXpPkw/TGB8DBV9n37mtl6CyDo9vDCxER2OWeqUgHsJsyw049oYttYo
         Cz1feZP1DC+B/61h6VgAwXXU5EY/8pbQa71LRbGiagTv6p2UANnXG5q6KsADyjbLRP
         s7/ZQLsCzmv4jbN9Dc/8fJm0gZTp7Qa92b7ZtXCShvhfYRd69BDMx+Bl8eJiOGRmm3
         ULdUSmqFE6JGw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hjmpv17; Tue, 14 Sep 2021 12:11:35 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409177
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=41Rq9C0vzQrajn4Quh8A:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 07/11] edid-decode: always linefeed after hex_block
Date:   Tue, 14 Sep 2021 05:11:25 -0700
Message-Id: <20210914121129.51451-8-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNrjUQAZyNVYZxAgiJFVPxcFej2K5CIOnSPeakpm7sfQfeTpkFkOLj7J3vOkbCvNL9yNJ1lsSd7Syzhb5KuMjakAiJlryVfFGfv5znRcvMxigs4qv7it
 Ge1OUTz46QGbHveQ88Tj6+oLvdRJQ3cBHf796IO+y8ZTRhhJI2v8s55yGgK2qnT3bGP11uStngMfFkG/prjNDwHWvSQqP8OeCXs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hex_block should not return without printing a newline (which occurs when the length is zero). This causes a missing newline after "Application Version: 1" with cta_hdr10plus for an EDID I have.
Any place that calls hex_block will have the same problem if it's possible for the length to be zero.

In other words, a hex_block needs to have a linefeed even if it has zero length, because the caller assumes it will go to the next line as it does when the hex block is not zero length.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index 2316abc..6aa93fb 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -698,8 +698,10 @@ void hex_block(const char *prefix, const unsigned char *x,
 {
 	unsigned i, j;
 
-	if (!length)
+	if (!length) {
+		printf("\n");
 		return;
+	}
 
 	for (i = 0; i < length; i += step) {
 		unsigned len = min(step, length - i);
-- 
2.24.3 (Apple Git-128)

