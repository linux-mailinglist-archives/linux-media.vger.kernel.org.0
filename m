Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57DEF1E69DA
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 20:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406057AbgE1S5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 14:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406053AbgE1S5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 14:57:35 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74876C08C5C7
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 11:57:34 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id q8so14037468pfu.5
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 11:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=FcxPXv7lMSnkbfuF5IpZvU50JAaETNG6VtQePJ1/NG8=;
        b=jH6czmqZwLgTkDACw4nodGYybIvPDvoHwCsK3ejje2snXWETCY3loNJk46qo80XeCy
         OJDd/SGzoGbhE0PHFXHp84nvKB1pAnBFkRp+vT+KYTLSlJCeIO9iCBU3YHMJ9oK1x83l
         bB5x5tcs5CD27zZuBsKfxPL1CwI83r62nG/zKSQXdgS1/s/CtLJBfhNbuWcolpK69Rdj
         liNj1RgELny+IwRms7pMf0MpmPAlJAfM0SBimjPuk/uMAGeNPUgJGJwzueUAkn/LEBeX
         elmGVUuDMu3IxLqkeRtxMZ5etexc7LMkQ1BdOSNw2b7+O1AjQfZltnCms/HAU8Bfk/fQ
         lM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=FcxPXv7lMSnkbfuF5IpZvU50JAaETNG6VtQePJ1/NG8=;
        b=h7BjnLlv2D3egliz9Z59eUMBao631/q2U5T1Z6RRS5i9tzJhhBuXZh9I2T6H9XwS0Q
         WHPQVObv6VmpMjOpyvJi0o/vkKgmTj6c8Wh04MSfC0o2GZZ9quKAyz1y2kbcS/uYt8t7
         rtadOvqvCU071smK7+PRzzKZROBWGHQt6sd5o2bRUtCsUBQt+q4quLwevwlY7iqGJr6B
         QK8wvoVvMk1GRgEJ8SbfkH77EvMfWWzfv9aF3NKIN7guuaMzOp+4CQ/B5xcJBNHgMyiU
         udvICSM0l1aqj/B3pA8pciV63BSMUVLU2YOIjUl2+olJbGhfNcIvSMxemdi3niQQSr0I
         c1pA==
X-Gm-Message-State: AOAM532bfkc3LlCzAra5ImiCI5sVxfjuaFvE8+5a5ELLH4yK1Kjj79JI
        H6PlVP1797a56O831HiauCHVjg==
X-Google-Smtp-Source: ABdhPJwwhx996SxbCG6CvZLOmM3vt07TE8u+BH79YhZel8MmI+ihU2UQRo1zbY7vZjoOjUPezUHzWQ==
X-Received: by 2002:a63:4906:: with SMTP id w6mr4405339pga.79.1590692253805;
        Thu, 28 May 2020 11:57:33 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([2401:4900:4172:de15:68e5:53c9:1b21:586d])
        by smtp.gmail.com with ESMTPSA id x22sm2538194pfr.188.2020.05.28.11.57.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 11:57:33 -0700 (PDT)
Date:   Fri, 29 May 2020 00:27:17 +0530
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com
Subject: [PATCH] vimc: debayer: Add support for ARGB format
Message-ID: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Running qcam for pixelformat 0x34324142 showed that vimc debayer does
not support it. Hence, add the support for Alpha (255).

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 .../media/test-drivers/vimc/vimc-debayer.c    | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index c3f6fef34f68..f34148717a40 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -62,6 +62,7 @@ static const u32 vimc_deb_src_mbus_codes[] = {
 	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
 	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+	MEDIA_BUS_FMT_ARGB8888_1X32
 };
 
 static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
@@ -322,15 +323,23 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
 	unsigned int i, index;
 
 	vpix = vimc_pix_map_by_code(vdeb->src_code);
-	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
-	for (i = 0; i < 3; i++) {
-		switch (vpix->pixelformat) {
-		case V4L2_PIX_FMT_RGB24:
-			vdeb->src_frame[index + i] = rgb[i];
-			break;
-		case V4L2_PIX_FMT_BGR24:
-			vdeb->src_frame[index + i] = rgb[2 - i];
-			break;
+
+	if (vpix->pixelformat == V4L2_PIX_FMT_ARGB32) {
+		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 4);
+		vdeb->src_frame[index] = 255;
+		for (i = 0; i < 3; i++)
+			vdeb->src_frame[index + i + 1] = rgb[i];
+	} else {
+		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
+		for (i = 0; i < 3; i++) {
+			switch (vpix->pixelformat) {
+			case V4L2_PIX_FMT_RGB24:
+				vdeb->src_frame[index + i] = rgb[i];
+				break;
+			case V4L2_PIX_FMT_BGR24:
+				vdeb->src_frame[index + i] = rgb[2 - i];
+				break;
+			}
 		}
 	}
 }
-- 
2.17.1

