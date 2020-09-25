Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CFC2790C0
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729807AbgIYSfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729722AbgIYSfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:31 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF31C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:31 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d9so4022035pfd.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ilmDn91LW3u8nqKT07CUOhcD4W51+rQiqE8eqpt0HcI=;
        b=HjCPwpVruGyqX0YXyuViN6wgxL+Kvf6UMMShAej/amwLNfHXdX302rXjgjUvuUzD0j
         0JAViXwLIz1DGDdUILPJXnICXDy88zQpXcz+skicRK1apWu9AXHv7MJQDvUNQ+Tcon3a
         Kldb5l7tb83VTzCalIDCYQ/yq24zhxkoPZSLd4HtsVYz4zKTj+d9R5nnPLEIzeCyOSM9
         eBeFeNdXP78FXqD/tRVrH7rHChva1lfPl9gwWap7TnOXsz2OEN0hLBTa7lCJs31CVt/K
         a4QQAUEDBVgC9f4+gRxHjnRNRjAr7R9WIySNhXi+ycI71Aob3kw/p/Dt+WpA98n/kJnq
         ht5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ilmDn91LW3u8nqKT07CUOhcD4W51+rQiqE8eqpt0HcI=;
        b=Xm7wxV35ydYuJ66ARYBLDc2lcc8r4a3V+fZ/yX/ClIPT8NBD/qwHBC1v3e1RAGwKtm
         T5BGsTA/9DbAfcuJ41axZ3HLqQnaAJtpSa0gaSqtDNaD1JNvFRVUG/4r7vA2WIQOCCgw
         T7j5uJ3EEXIBDXG7Y8eYiWtuOWeoeAQWz5Qhj3mRN9SG9c5SaZpcr9Vr8SrDaWEFMoeL
         ODzzyaNq7ls5zfjM+gayDNb1Epzz2hA+8Ce+vdxQ3ayg/gvAqblHxkmsFwhhEho/L03q
         0ON7puOBJldS8cNCmp62vwYdGVbBKkkqV/PhqkC/P3gAf/itPcBIIMpdmgw+Ma1b3A0T
         jFiA==
X-Gm-Message-State: AOAM531JBnTUUlmkupceuTdC0shFbIezlWI0mfCi97Bm0xLQwBaXKSye
        2rn20Rs66cqZc8B9OQY+LY2Pug==
X-Google-Smtp-Source: ABdhPJyUY4cOZlGnr0YOqOt3S3c5y52NsRI62sbyy3cf3OMhDLyMLTjAUaFrGsXPscSADi+qTnarvw==
X-Received: by 2002:a63:2547:: with SMTP id l68mr219087pgl.241.1601058931025;
        Fri, 25 Sep 2020 11:35:31 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.35.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:30 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 43/47] staging: media: zoran: fix use of buffer_size and sizeimage
Date:   Fri, 25 Sep 2020 18:30:53 +0000
Message-Id: <1601058657-14042-44-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

buffer_size was not set when it should be.
Furthermore, use it instead of recalculate it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c   | 2 ++
 drivers/staging/media/zoran/zoran_driver.c | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 89fbc114c368..d7b3efa9e39f 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -857,6 +857,8 @@ void zoran_open_init_params(struct zoran *zr)
 	if (i)
 		pci_err(zr->pci_dev, "%s internal error\n", __func__);
 
+	zr->buffer_size = zr->v4l_settings.bytesperline * zr->v4l_settings.height;
+
 	clear_interrupt_counters(zr);
 }
 
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 5dacbeac790b..021073ba08e6 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -407,6 +407,8 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 	bpp = (format->depth + 7) / 8;
 
+	zr->buffer_size = height * width * bpp;
+
 	/* Check against available buffer size */
 	if (height * width * bpp > zr->buffer_size) {
 		pci_err(zr->pci_dev, "%s - video buffer size (%d kB) is too small\n",
@@ -1100,7 +1102,7 @@ static int zoran_g_fmt_vid_out(struct file *file, void *__fh,
 	fmt->fmt.pix.width = zr->jpg_settings.img_width / zr->jpg_settings.HorDcm;
 	fmt->fmt.pix.height = zr->jpg_settings.img_height * 2 /
 		(zr->jpg_settings.VerDcm * zr->jpg_settings.TmpDcm);
-	fmt->fmt.pix.sizeimage = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
+	fmt->fmt.pix.sizeimage = zr->buffer_size;
 	fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_MJPEG;
 	if (zr->jpg_settings.TmpDcm == 1)
 		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
@@ -1125,7 +1127,7 @@ static int zoran_g_fmt_vid_cap(struct file *file, void *__fh,
 
 	fmt->fmt.pix.width = zr->v4l_settings.width;
 	fmt->fmt.pix.height = zr->v4l_settings.height;
-	fmt->fmt.pix.sizeimage = zr->v4l_settings.bytesperline * zr->v4l_settings.height;
+	fmt->fmt.pix.sizeimage = zr->buffer_size;
 	fmt->fmt.pix.pixelformat = zr->v4l_settings.format->fourcc;
 	fmt->fmt.pix.colorspace = zr->v4l_settings.format->colorspace;
 	fmt->fmt.pix.bytesperline = zr->v4l_settings.bytesperline;
@@ -1194,6 +1196,7 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM);
 
 	fmt->fmt.pix.sizeimage = zoran_v4l2_calc_bufsize(&settings);
+	zr->buffer_size = fmt->fmt.pix.sizeimage;
 	fmt->fmt.pix.bytesperline = 0;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
 	return res;
@@ -1352,7 +1355,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 
 	/* tell the user the results/missing stuff */
 	fmt->fmt.pix.bytesperline = zr->v4l_settings.bytesperline;
-	fmt->fmt.pix.sizeimage = zr->v4l_settings.height * zr->v4l_settings.bytesperline;
+	fmt->fmt.pix.sizeimage = zr->buffer_size;
 	fmt->fmt.pix.colorspace = zr->v4l_settings.format->colorspace;
 	if (BUZ_MAX_HEIGHT < (zr->v4l_settings.height * 2))
 		fmt->fmt.pix.field = V4L2_FIELD_INTERLACED;
-- 
2.26.2

