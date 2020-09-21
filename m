Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB082272065
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgIUKVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgIUKVQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:16 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CBDC061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:16 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l15so11153419wmh.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GuupeKfcO/+rf9Qb6r8f2KQJXgchvtoxnNFe6M9/a1Y=;
        b=tuGiHopegBqrIUp8HpoCeuXo5y5bglOeDyrrrfZ4Tzuh9U6lqCJj5fXQgy9gzZfIPm
         Jw4YULN3OQk6sfQjCoMYyu5tVlL2tYnotZQgDONkBlgCqkIb4AhNP3X0AOl7eUv0Z2jl
         o2z1CC2zmeBOl2meNu+J+6u5Us1CMuzlG9sdM50i75y3fZUHRNnbclBHy+Jg0CeDlEcD
         5iBiCB8zjIBZ1ORIsNPQ+CrFmBBcfzagv/J1U1g85HIeFeuV9iXHtqKiqoSoTqAj1Rjb
         idMoqYHxE1jLGDP9DOthGbMEi8+gvkkB/cx/HsgkwS181mW4GGcxEE1mBbCR2jW3U0+h
         EBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GuupeKfcO/+rf9Qb6r8f2KQJXgchvtoxnNFe6M9/a1Y=;
        b=NMveSMhnTKjue/wGat6p05R4wKxeUWz6y10Z7E4Zkh7bjtaODkyvotSVYlqyGPql9U
         KoA2qTfRSKsfugOVfXMxJUAXUoT2smopY66ddkdbfWvClGzJtTwFp3DuPRBpVgN11/As
         0lseu9QSEFDl1Rx4QTTNhgYVGQ+JXbrPe7Um9ww2V3IIK9uQfBApnkVG7N5R3R9isSUS
         RKjT8K0SuH8A4xr+ykxLX1b9CcH4/u+hZA+RdgcEy/ob0Blj2/t5DJS9HfmkvpT5aSZH
         JGCEY0eJBUZmhYw7JJLVRl7otsS76R3yOdwsoIDcrz16hh2+iYOkwzci2dw1V95F2Cg1
         ugDw==
X-Gm-Message-State: AOAM531ZNcAA65hj/GJiXIXTgeMn47/TapNUNsvyp5v+/PEeiwwLsiu5
        KhZfXgSzGd02u+t6in4RcUYU8w==
X-Google-Smtp-Source: ABdhPJxwp9O9hoZ+3in9xQ4Y1T0r6FX0PptcT7wQM++3JiwL83ORl7DTznIAAiqeYXT/IUV9yd/l7A==
X-Received: by 2002:a1c:bdc4:: with SMTP id n187mr29267185wmf.109.1600683674831;
        Mon, 21 Sep 2020 03:21:14 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:14 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 45/49] staging: media: zoran: fix use of buffer_size and sizeimage
Date:   Mon, 21 Sep 2020 10:20:20 +0000
Message-Id: <1600683624-5863-46-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
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
index 3bfeb1e00563..e4688891d307 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -852,6 +852,8 @@ void zoran_open_init_params(struct zoran *zr)
 	if (i)
 		pci_err(zr->pci_dev, "%s internal error\n", __func__);
 
+	zr->buffer_size = zr->v4l_settings.bytesperline * zr->v4l_settings.height;
+
 	clear_interrupt_counters(zr);
 }
 
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 46bf8b32d57a..47f397ff190f 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -407,6 +407,8 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 	bpp = (format->depth + 7) / 8;
 
+	zr->buffer_size = height * width * bpp;
+
 	/* Check against available buffer size */
 	if (height * width * bpp > zr->buffer_size) {
 		pci_err(zr->pci_dev, "%s - video buffer size (%d kB) is too small\n",
@@ -1090,7 +1092,7 @@ static int zoran_g_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 	fmt->fmt.pix.width = zr->jpg_settings.img_width / zr->jpg_settings.HorDcm;
 	fmt->fmt.pix.height = zr->jpg_settings.img_height * 2 /
 		(zr->jpg_settings.VerDcm * zr->jpg_settings.TmpDcm);
-	fmt->fmt.pix.sizeimage = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
+	fmt->fmt.pix.sizeimage = zr->buffer_size;
 	fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_MJPEG;
 	if (zr->jpg_settings.TmpDcm == 1)
 		fmt->fmt.pix.field = (zr->jpg_settings.odd_even ?
@@ -1114,7 +1116,7 @@ static int zoran_g_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
 
 	fmt->fmt.pix.width = zr->v4l_settings.width;
 	fmt->fmt.pix.height = zr->v4l_settings.height;
-	fmt->fmt.pix.sizeimage = zr->v4l_settings.bytesperline * zr->v4l_settings.height;
+	fmt->fmt.pix.sizeimage = zr->buffer_size;
 	fmt->fmt.pix.pixelformat = zr->v4l_settings.format->fourcc;
 	fmt->fmt.pix.colorspace = zr->v4l_settings.format->colorspace;
 	fmt->fmt.pix.bytesperline = zr->v4l_settings.bytesperline;
@@ -1183,6 +1185,7 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM);
 
 	fmt->fmt.pix.sizeimage = zoran_v4l2_calc_bufsize(&settings);
+	zr->buffer_size = fmt->fmt.pix.sizeimage;
 	fmt->fmt.pix.bytesperline = 0;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
 	return res;
@@ -1337,7 +1340,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
 
 	/* tell the user the results/missing stuff */
 	fmt->fmt.pix.bytesperline = zr->v4l_settings.bytesperline;
-	fmt->fmt.pix.sizeimage = zr->v4l_settings.height * zr->v4l_settings.bytesperline;
+	fmt->fmt.pix.sizeimage = zr->buffer_size;
 	fmt->fmt.pix.colorspace = zr->v4l_settings.format->colorspace;
 	if (BUZ_MAX_HEIGHT < (zr->v4l_settings.height * 2))
 		fmt->fmt.pix.field = V4L2_FIELD_INTERLACED;
-- 
2.26.2

