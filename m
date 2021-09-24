Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5ECF417E42
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 01:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344792AbhIXXdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 19:33:33 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:47496 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229669AbhIXXdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 19:33:31 -0400
Received: from shw-obgw-4001a.ext.cloudfilter.net ([10.228.9.142])
        by cmsmtp with ESMTP
        id ToZ0mFfKQps7PTufdmwEHp; Fri, 24 Sep 2021 23:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632526317; bh=eqwFPrmf1gZNGD91W4eIkqTUQwT3XzLJWOEnHYr9ARE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jV/L3M4gSZfS5+0gGhq2/B0f/pvD86xP4NuJZG2EuqVLtkBr7VE+m31m2jtWZoqB/
         XrZCiGgx27afF3VbtQTDNyxdWomoH1APMsPtMTI4AS+mP4v3+MgUJRMkSkLC6/D5rf
         P9w0LzBHXrg92VN1Mm59fxwHM0TqBq84mOG00vOqYKjzAcP0EOiJBAM0mAZ/AJIcaY
         AEgG3AjCcPx1uzZ6m/C4K+2MJ3naGSVG1biJP5Wul4fuVYuVThxxXZz25cDQCfz26/
         YItZ5DRQnM4iK8m/YWudwWzXxGH1146O9vUkZVBfPL/QQH+7Tb2PAcUYTIjZRnwD1v
         l3pgl+p0YKnVQ==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id TufVmyJPGU9pxTufdmYw8C; Fri, 24 Sep 2021 23:31:57 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Bbi7bph2 c=1 sm=1 tr=0 ts=614e5fed
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=gigR4BUTONd-mMATnp8A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 10/28] edid-decode: Capitalize fail sentence
Date:   Fri, 24 Sep 2021 16:31:31 -0700
Message-Id: <20210924233149.10028-11-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
References: <20210924233149.10028-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEDQkhdjIYg7nExYycgyZ2Vrie7Z+cZ6rM7H5c+9vQoVa1JGni6NqMNrT9cHtpvF7JqXdOkaNoES8DSY9KZ1JrkbIeRiynmHQzeISvdY9ktKx+XvycSp
 t2N/2tgrpN6ay4c3wc7gVjWt3ksuhafZkhCquSVl8mKgyRDa0inasC/opaqeNPWANjmjC0+f8Nmq1y5B1qa3agxcUJ71jFhrHSg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most fail messages are a sentence that starts with a capital letter and ends with a period.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index ea55c99..975381f 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2290,7 +2290,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 
 	// See Table 52 of CTA-861-G for a description of Byte 3
 	if (audio_block && !(cta.byte3 & 0x40))
-		fail("audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
+		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 	cta.first_block = 0;
 	cta.last_block_was_hdmi_vsdb = 0;
 }
-- 
2.24.3 (Apple Git-128)

