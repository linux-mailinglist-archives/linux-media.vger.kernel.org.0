Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E23340AD65
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhINMUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:05 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:57301 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232883AbhINMUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:20:01 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Sep 2021 08:19:58 EDT
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PqoemL4ueczbLQ7Hkmm237; Tue, 14 Sep 2021 12:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621496; bh=WE7WlClLMnckclIOD2RLuKF2mC/Xymy49zqFOatsrQ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=I4+ksfllfJHczDLQpFMO2dChmI7KjdihUMLBEhATsr3jxhG4zo+elfh67hzA1s6b4
         ej6ycHvCW7tEGOZ386V2qf0P1/om2P0m3y6dsa1oX8iSnpvpgGZj1l4iZzVgedjcJr
         qTNmVy5ilkPUUbv0LHUrjJRgrcrhaM2LMYa69th0kQcrBqmHO7C5NLwarXwgip+Fca
         W4F6QRsFySQ4amJM3qqijLwpFXE1D3Ise3rlKn61rRSPBpCCvaWhK3+US/G7U0FCqg
         zRXmwNBJnB8omfcQFyFRhnwEqvNi8L5GaeLv1KKt3X+evN7lmc06+7QF3O0h7x+tYU
         jftPrD2yFkiuA==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hjmpv1B; Tue, 14 Sep 2021 12:11:36 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409178
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=CaOe0OiltPeIXg3nyRAA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 08/11] edid-decode: output full frequencies for 4:2:0
Date:   Tue, 14 Sep 2021 05:11:26 -0700
Message-Id: <20210914121129.51451-9-joevt@shaw.ca>
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

Don't half hfreq for 4:2:0 timings - the character clock is halved, but the number of characters per line is also halved (two luminance values per character for 4:2:0), so there's no change in hfreq.
Don't half pixel clock because it looks weird. Character clock is halved but the number of pixels remains the same (two luminance values per character for 4:2:0).
Continue to use the half hfreq and half pixel clock for the ranges calculations because some non-HDMI 2.0 displays have max pixel clock halved when they have 4:2:0 modes and because other reasons that lead to adding this code in the first place?

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index 6aa93fb..0c83e0e 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -513,6 +513,7 @@ bool edid_state::print_timings(const char *prefix, const struct timings *t,
 	if (t->interlaced)
 		vact /= 2;
 
+	double out_hor_freq_khz = hor_freq_khz;
 	if (t->ycbcr420)
 		hor_freq_khz /= 2;
 
@@ -558,6 +559,7 @@ bool edid_state::print_timings(const char *prefix, const struct timings *t,
 		dtd_max_vsize_mm = t->vsize_mm;
 	if (!s.empty())
 		s = " (" + s + ")";
+	unsigned out_pixclk_khz = t->pixclk_khz;
 	unsigned pixclk_khz = t->pixclk_khz / (t->ycbcr420 ? 2 : 1);
 
 	char buf[10];
@@ -568,8 +570,8 @@ bool edid_state::print_timings(const char *prefix, const struct timings *t,
 	       t->hact, buf,
 	       refresh,
 	       t->hratio, t->vratio,
-	       hor_freq_khz,
-	       pixclk_khz / 1000.0,
+	       out_hor_freq_khz,
+	       out_pixclk_khz / 1000.0,
 	       s.c_str());
 
 	unsigned len = strlen(prefix) + 2;
-- 
2.24.3 (Apple Git-128)

