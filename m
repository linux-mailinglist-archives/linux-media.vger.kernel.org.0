Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E71279095
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbgIYSdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729974AbgIYSdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:33:10 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887E1C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:10 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id bw23so2241937pjb.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jsTMgeCDkQ7rQZQkBCr1xyL9bvrKdRsBGU8CcZUYgsg=;
        b=f2nPeEIrw9Q0qs/6gGT37vyz++mf0gfMQL+Gj6LvKefbU2TpXvuyGpZn4y7BnBMDk2
         qNPINUQ/WY+vwX9FvrTzxmh9dQkHx9QtORy5bCzdUkwr7BWZErEjGdNEMF7D8wkSQfrR
         nonImGmLUoq6qbCAF5RoCUnQl70Qzfx77x5+6Q85ip7fDxTjreMOiLVIMhPo8Xtrxz2t
         xpheNw74jdInCiR2Dlr3wAioe0bAprlRdWIjJr5qzKsx3Jp3fS7W3kVPsEf+MbWCMS3u
         D9Mfpum6dyXJ7nF9f12PLRLDHh7iMSYIo9bQcDX1pmNGHAeDrigpHcTQBa3aXOJHeE/5
         Xu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jsTMgeCDkQ7rQZQkBCr1xyL9bvrKdRsBGU8CcZUYgsg=;
        b=fChvJuSY5coS26Prc6R9TwOWosa8ATuA6eH1XqF7VLeK6jCMnY62hdu4fARZGkgfoH
         YViqHQMiifdOJVZgvR0IE42Dor2tFeh3gqf0fHzvIyVRp11DfQcVVjhuZhTgMt0B7Tav
         6PhR0KTz++QHDqoSs1Xr1G36nEsRl6VAwO1hvmHPG0FGehDyBIV0KFd6WMqslVU5sWbs
         9URATQ42z9IGYZLL3a0L5BTX26jjIoHvQlKFuXOU1y2Hp07LcNH0BrYKu2ZzLAYcAbxh
         0AmXQaSmEYRhYU1rShSob5UUNZLmLy77KCsI17Nzr0yweaBqDpzHLhZKhx3kURmUwr4x
         8s7g==
X-Gm-Message-State: AOAM531/nPUvotrw7/w/KjvnS6eNSoiCjUZLwUmrLdGXuHD7RmD2qYDb
        PK1xozcQUoBQzNDwJMbhq57ROg==
X-Google-Smtp-Source: ABdhPJw1Ar0qSqAN56fzAZFKqFJyBO6B5DJGCSzobbQmIdtbFekrvjMzQnrxwlLGBQMXwK6hnz6W0Q==
X-Received: by 2002:a17:90b:164e:: with SMTP id il14mr781288pjb.5.1601058790055;
        Fri, 25 Sep 2020 11:33:10 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.33.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:33:09 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 19/47] staging: media: zoran: move overlay_settings out of zoran_fh
Date:   Fri, 25 Sep 2020 18:30:29 +0000
Message-Id: <1601058657-14042-20-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
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
index 672b8d927e0f..139cfc683b98 100644
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
index 27dcf899b723..3a59aa66436f 100644
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
@@ -1433,11 +1427,11 @@ static int zoran_g_fmt_vid_overlay(struct file *file, void *__fh,
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
@@ -1710,7 +1704,7 @@ static int zoran_g_fbuf(struct file *file, void *__fh,
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

