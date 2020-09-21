Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39530272052
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgIUKVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgIUKU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:58 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C56C0613D4
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:53 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g4so12117098wrs.5
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=acYsfKeNEhwhXW64kid3uQVciTvV530pHLdvT4EkhOs=;
        b=MFapb0WZTnmZYxo/+ryk7zdccjz6X8FBC93cC1U5HlCKki9ha2cSi3/VTHvApm0A9F
         wfiYdm4LoJZpmcdspQW5rXIUp4KdTf24gG6LCv8QKR/eDOQU/hM68PeLcOP7Jnz4myiY
         tLTQzBsHQ0aBLHl8ns3/1xf4IyCPx1erDnQFt/OJef4UL2mifCBtZaVEYvrXL6H7w3mU
         TgpwpaEo+eoBKjQ2AbiGiz7tbTI2JU+whjLg8pNMCWxQUdLtcpthYcVUK5H4KCwLpKdC
         D0sJhAmn4Dm1mKQEVY+WDIm7ki/+8fIIr9UVktSVOCuQv/WjtWty1dre9WaZGWug3QVg
         0CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=acYsfKeNEhwhXW64kid3uQVciTvV530pHLdvT4EkhOs=;
        b=eegFmWVcr6ti5bQ2+hewTkoVqkSTZgZ+3ywYHWDAOAOOK0DAaci3+a+ZHrQFI9rhEt
         KOHgphUMVIgtoVPGQja9zMWANb9zShyVLJwMP6vn59JKbxBBb/YjSMHuBPP8HrZtgmK/
         cNX4gwVvHTRkzY3dDhxJIOKlx+XcZnk80UZD6hqQS6dkzlb7GJW/guOCBDm0mUZYwQ36
         ag3G4QEB+PPHSPhjCOLvLmGHAa1NalDPghfK452DrkXhWA35327KOV1uhOf9vUy91WyG
         TZHwAwKV9607jLPB0A5QGmGP2W2QZhAQ81R1SLguE9uYQ6EH6KQrsasUAgeoGPLKnmKx
         BMzA==
X-Gm-Message-State: AOAM531mNqY9CCfBuBpTjy9QFOiZ6OjkS/v7HjPZKlaUwyvbvbsnxDsU
        C3Hajd3fg5axnJ+/GLdiN4VBvA==
X-Google-Smtp-Source: ABdhPJwOqwj2DdxlPUUYHqY5YZyaVArlb2cPryKJCMnUYXsMB4+IKBo3UJpF0CE4yHthYegYqPMXLQ==
X-Received: by 2002:a5d:630a:: with SMTP id i10mr50490903wru.137.1600683651707;
        Mon, 21 Sep 2020 03:20:51 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:51 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 20/49] staging: media: zoran: move overlay_settings out of zoran_fh
Date:   Mon, 21 Sep 2020 10:19:55 +0000
Message-Id: <1600683624-5863-21-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to get rid of zoran_fh, so move the overlay_settings directly in the
zoran structure.
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |  1 -
 drivers/staging/media/zoran/zoran_device.c |  8 ++---
 drivers/staging/media/zoran/zoran_driver.c | 40 +++++++++-------------
 3 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 7e6e03563a2a..e9fef23a720c 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -211,7 +211,6 @@ struct zoran_fh {
 
 	enum zoran_map_mode map_mode;		/* Flag which bufferset will map by next mmap() */
 
-	struct zoran_overlay_settings overlay_settings;
 	u32 *overlay_mask;			/* overlay mask */
 	enum zoran_lock_activity overlay_active;/* feature currently in use? */
 
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 4f9b28e63ac0..e81316ac6521 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -508,10 +508,10 @@ void write_overlay_mask(struct zoran_fh *fh, struct v4l2_clip *vp, int count)
 			height += y;
 			y = 0;
 		}
-		if (x + width > fh->overlay_settings.width)
-			width = fh->overlay_settings.width - x;
-		if (y + height > fh->overlay_settings.height)
-			height = fh->overlay_settings.height - y;
+		if (x + width > zr->overlay_settings.width)
+			width = zr->overlay_settings.width - x;
+		if (y + height > zr->overlay_settings.height)
+			height = zr->overlay_settings.height - y;
 
 		/* ignore degenerate clips */
 		if (height <= 0)
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index f0ceda9a3d44..77cd2c07c394 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -744,9 +744,7 @@ static void zoran_open_init_session(struct zoran_fh *fh)
 	map_mode_raw(fh);
 
 	/* take over the card's current settings */
-	fh->overlay_settings = zr->overlay_settings;
-	fh->overlay_settings.is_set = 0;
-	fh->overlay_settings.format = zr->overlay_settings.format;
+	zr->overlay_settings.is_set = 0;
 	fh->overlay_active = ZORAN_FREE;
 
 	/* buffers */
@@ -1005,7 +1003,7 @@ static int setup_window(struct zoran_fh *fh, int x, int y, int width, int height
 		return -EINVAL;
 	}
 
-	if (!fh->overlay_settings.format) {
+	if (!zr->overlay_settings.format) {
 		pci_err(zr->pci_dev, "%s - no overlay format set\n", __func__);
 		return -EINVAL;
 	}
@@ -1043,11 +1041,11 @@ static int setup_window(struct zoran_fh *fh, int x, int y, int width, int height
 		return -EINVAL;
 	}
 
-	fh->overlay_settings.x = x;
-	fh->overlay_settings.y = y;
-	fh->overlay_settings.width = width;
-	fh->overlay_settings.height = height;
-	fh->overlay_settings.clipcount = clipcount;
+	zr->overlay_settings.x = x;
+	zr->overlay_settings.y = y;
+	zr->overlay_settings.width = width;
+	zr->overlay_settings.height = height;
+	zr->overlay_settings.clipcount = clipcount;
 
 	/*
 	 * If an overlay is running, we have to switch it off
@@ -1069,7 +1067,7 @@ static int setup_window(struct zoran_fh *fh, int x, int y, int width, int height
 	 */
 	if (bitmap) {
 		/* fake value - it just means we want clips */
-		fh->overlay_settings.clipcount = 1;
+		zr->overlay_settings.clipcount = 1;
 
 		if (copy_from_user(fh->overlay_mask, bitmap,
 				   (width * height + 7) / 8)) {
@@ -1091,10 +1089,7 @@ static int setup_window(struct zoran_fh *fh, int x, int y, int width, int height
 		vfree(vcp);
 	}
 
-	fh->overlay_settings.is_set = 1;
-	if (fh->overlay_active != ZORAN_FREE &&
-	    zr->overlay_active != ZORAN_FREE)
-		zr->overlay_settings = fh->overlay_settings;
+	zr->overlay_settings.is_set = 1;
 
 	if (on)
 		zr36057_overlay(zr, 1);
@@ -1135,18 +1130,17 @@ static int setup_overlay(struct zoran_fh *fh, int on)
 			zr36057_overlay(zr, 0);
 		zr->overlay_mask = NULL;
 	} else {
-		if (!zr->vbuf_base || !fh->overlay_settings.is_set) {
+		if (!zr->vbuf_base || !zr->overlay_settings.is_set) {
 			pci_err(zr->pci_dev, "%s - buffer or window not set\n", __func__);
 			return -EINVAL;
 		}
-		if (!fh->overlay_settings.format) {
+		if (!zr->overlay_settings.format) {
 			pci_err(zr->pci_dev, "%s - no overlay format set\n", __func__);
 			return -EINVAL;
 		}
 		zr->overlay_active = fh->overlay_active = ZORAN_LOCKED;
 		zr->v4l_overlay_active = 1;
 		zr->overlay_mask = fh->overlay_mask;
-		zr->overlay_settings = fh->overlay_settings;
 		if (!zr->v4l_memgrab_active)
 			zr36057_overlay(zr, 1);
 		/*
@@ -1430,11 +1424,11 @@ static int zoran_g_fmt_vid_overlay(struct file *file, void *__fh,
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
 
-	fmt->fmt.win.w.left = fh->overlay_settings.x;
-	fmt->fmt.win.w.top = fh->overlay_settings.y;
-	fmt->fmt.win.w.width = fh->overlay_settings.width;
-	fmt->fmt.win.w.height = fh->overlay_settings.height;
-	if (fh->overlay_settings.width * 2 > BUZ_MAX_HEIGHT)
+	fmt->fmt.win.w.left = zr->overlay_settings.x;
+	fmt->fmt.win.w.top = zr->overlay_settings.y;
+	fmt->fmt.win.w.width = zr->overlay_settings.width;
+	fmt->fmt.win.w.height = zr->overlay_settings.height;
+	if (zr->overlay_settings.width * 2 > BUZ_MAX_HEIGHT)
 		fmt->fmt.win.field = V4L2_FIELD_INTERLACED;
 	else
 		fmt->fmt.win.field = V4L2_FIELD_TOP;
@@ -1703,7 +1697,7 @@ static int zoran_g_fbuf(struct file *file, void *__fh,
 	fb->fmt.width = zr->vbuf_width;
 	fb->fmt.height = zr->vbuf_height;
 	if (zr->overlay_settings.format)
-		fb->fmt.pixelformat = fh->overlay_settings.format->fourcc;
+		fb->fmt.pixelformat = zr->overlay_settings.format->fourcc;
 	fb->fmt.bytesperline = zr->vbuf_bytesperline;
 	fb->fmt.colorspace = V4L2_COLORSPACE_SRGB;
 	fb->fmt.field = V4L2_FIELD_INTERLACED;
-- 
2.26.2

