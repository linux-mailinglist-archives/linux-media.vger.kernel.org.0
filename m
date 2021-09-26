Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44E2418763
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhIZIfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:14 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:37615 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229792AbhIZIfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:13 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U6mYmf0pJczbLUPbNmV5UH; Sun, 26 Sep 2021 08:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645217; bh=MYWGij0vHvYGYaXiy0PSj4CP+gM9vPRPHEwl/YD+S/4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=RwZ1MN4l1KefbxJptJu5Pk/ZxniRAsjoMaIXRrRA6nhXI4jf+KviHdMYQYv2E3Y47
         u28H9zCuMv/TT8wKcd8XN1cxo3OvvTZ3gG1bRLuFgcvLMHnABcOGJI4O56NKNNIlY3
         GxRkwDKo/VYBmYOjsgZASUmiW87EjWmCIhDxepv5NRJ3g2VAXFLPF2GstBxgWeCIgj
         XrH9KTopd+6MZBG65aEFCI4dbw8En7GFAfiswfFeVziaLudvvqVH0MTI6uGDeg5P0/
         nwf6lYpxD5N5DsZuETBaW32+V2S+NMueHYzTImH3gI4T5pHDPMU1/Aezg+P7WhkyXQ
         NLhEy6DsJx4hg==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbMm6iEr; Sun, 26 Sep 2021 08:33:37 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=61503061
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=NpxgihWcVqL9SJ54IewA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 10/29] edid-decode: Capitalize fail sentence
Date:   Sun, 26 Sep 2021 01:33:11 -0700
Message-Id: <20210926083330.5206-11-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNWIORIyqyvehAfgCntzQcLClwTSIO8HWG4PTr7A2L0V0pm7Q470aWaz76MpLaUoNqYgeXjF23lXCog6kU6Hvq6UMeAoBCmEm6XKF9nUA6UIBUHKVLbb
 QFcSkz5N4m7gJ1/hGRoXHwI82wZehx1FRLyFIBilUrcLoQ9scC3hN1diH0mFc5Pt4sMbeP1yOJQLITn5E+s4jnuWoteDGcclNAc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most fail messages are a sentence that starts with a capital letter and ends with a period.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 parse-cta-block.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
index 3b6126a..7568780 100644
--- a/parse-cta-block.cpp
+++ b/parse-cta-block.cpp
@@ -2326,7 +2326,7 @@ void edid_state::cta_block(const unsigned char *x, bool duplicate)
 
 	// See Table 52 of CTA-861-G for a description of Byte 3
 	if (audio_block && !(cta.byte3 & 0x40))
-		fail("audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
+		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
 	cta.first_block = 0;
 	cta.last_block_was_hdmi_vsdb = 0;
 }
-- 
2.24.3 (Apple Git-128)

