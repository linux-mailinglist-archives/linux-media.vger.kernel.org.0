Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B9C272074
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgIUKVu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbgIUKVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3920AC0613CF
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:13 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t10so12134578wrv.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mJHxmatwliiILb7dsJ+xU9dZGkpFAiokQ09uJSwZTko=;
        b=YY36+18NrSi43hiI1GypE3L3g7YkZYC4dvqcoG7y95SOj1DcWqwIToU6gOxxryf9q8
         aXDMUATQCVAArDmi3knlOtzdjOhVud7zU1UPPGGZlBStGw/sDaSo2uRZUQ1izWMJ+w7S
         lsJnR06Z4Y8Y+aa8LX/PXD0W4IvLdrLpfAaeW3R19RfP536Wke1u2HSxxqjNC0hF5NVt
         t2QKRUmmeD3UAhu1FJ+i77IN9m+MF9l+VGp7G0ThCesVk4TBYgJ+DLCznQ+LJdeYQ0HC
         WVS8QATv415OnmoScSh8oUTMTzFcJI2mDyUkzVqgJ8GxzVAv2R3W8PQNKcsaHLNWk6Y1
         YMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mJHxmatwliiILb7dsJ+xU9dZGkpFAiokQ09uJSwZTko=;
        b=KHL9nb8yVpkA9BAe4Jp6BOoSw1MjNlzIK9wPtK0FrDkxGMJYaSxpVwWHhCjR+FOBEg
         2ciyARrK4vAtRekOKG3kCqdnIqKjk+keedCs8ugq5UAbN58JClwMtU+fvSKzBND80w7d
         vNpbvYme48Rz/RFVB3KkEZFKOnRzhoAMBFGV01ltJ/V/4mg3gxQb4ZXI+xUB4bNkJVyC
         QGakkFePDEqhujxeH//kXaRbA7QxytGlY0DsF1lB7yF1287mIKU7mKxRVsfCbgfu/IOI
         4FtjDPvx4Cas9L66a+SHNyZgbcygq0b5A/B3A9ZMXojKZIa3QhUoSf1XpWyCdRlAvmhW
         LLAQ==
X-Gm-Message-State: AOAM5312YBJcaDSguPzogyn5kEDpQL8phdZyxycq/e7FVzuVzZfZsMR7
        mFjfQrGpuWzJQl1zbi4thUrb4w==
X-Google-Smtp-Source: ABdhPJwtsP6qs8zegG7/DtdHTKeW1KXJsBuEqLj+EEMBeNJc/0krxjR0o43Of5KJoFWEVdN8Jioegw==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr49998455wrp.37.1600683671890;
        Mon, 21 Sep 2020 03:21:11 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:11 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 42/49] staging: media: zoran: remove framebuffer support
Date:   Mon, 21 Sep 2020 10:20:17 +0000
Message-Id: <1600683624-5863-43-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framebuffer support is obsolete, so let's reduce code size.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |  4 -
 drivers/staging/media/zoran/zoran_card.c   |  6 --
 drivers/staging/media/zoran/zoran_driver.c | 85 ----------------------
 3 files changed, 95 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 294e52d78e1b..0246635e0eac 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -299,10 +299,6 @@ struct zoran {
 
 	/* Current buffer params */
 	unsigned int buffer_size;
-	void *vbuf_base;
-	int vbuf_height, vbuf_width;
-	int vbuf_depth;
-	int vbuf_bytesperline;
 
 	wait_queue_head_t v4l_capq;
 
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index ab16a70a7451..530dd326ad94 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -895,12 +895,6 @@ static int zr36057_init(struct zoran *zr)
 	zr->jpg_buffers.allocated = 0;
 	zr->v4l_buffers.allocated = 0;
 
-	zr->vbuf_base = (void *)vidmem;
-	zr->vbuf_width = 0;
-	zr->vbuf_height = 0;
-	zr->vbuf_depth = 0;
-	zr->vbuf_bytesperline = 0;
-
 	/* Avoid nonsense settings from user for default input/norm */
 	if (default_norm < 0 || default_norm > 2)
 		default_norm = 0;
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 1efec2edd72f..0b4bfc184b57 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -881,48 +881,6 @@ static int zoran_close(struct file *file)
 	return 0;
 }
 
-static int setup_fbuffer(struct zoran_fh *fh, void *base, const struct zoran_format *fmt,
-			 int width, int height, int bytesperline)
-{
-	struct zoran *zr = fh->zr;
-
-	/* (Ronald) v4l/v4l2 guidelines */
-	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_RAWIO))
-		return -EPERM;
-
-	/*
-	 * Don't allow frame buffer overlay if PCI or AGP is buggy, or on
-	   ALi Magik (that needs very low latency while the card needs a
-	   higher value always)
-	 */
-
-	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
-		return -ENXIO;
-
-	/* we need a bytesperline value, even if not given */
-	if (!bytesperline)
-		bytesperline = width * ((fmt->depth + 7) & ~7) / 8;
-
-	if (height <= 0 || width <= 0 || bytesperline <= 0) {
-		pci_err(zr->pci_dev, "%s - invalid height/width/bpl value (%d|%d|%d)\n",
-			__func__, width, height, bytesperline);
-		return -EINVAL;
-	}
-	if (bytesperline & 3) {
-		pci_err(zr->pci_dev, "%s - bytesperline (%d) must be 4-byte aligned\n",
-			__func__, bytesperline);
-		return -EINVAL;
-	}
-
-	zr->vbuf_base = (void *)((unsigned long)base & ~3);
-	zr->vbuf_height = height;
-	zr->vbuf_width = width;
-	zr->vbuf_depth = fmt->depth;
-	zr->vbuf_bytesperline = bytesperline;
-
-	return 0;
-}
-
 /* get the status of a buffer in the clients buffer queue */
 static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 				    struct v4l2_buffer *buf, int num)
@@ -1388,47 +1346,6 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
 	return res;
 }
 
-static int zoran_g_fbuf(struct file *file, void *__fh,
-			struct v4l2_framebuffer *fb)
-{
-	struct zoran *zr = video_drvdata(file);
-
-	memset(fb, 0, sizeof(*fb));
-	fb->base = zr->vbuf_base;
-	fb->fmt.width = zr->vbuf_width;
-	fb->fmt.height = zr->vbuf_height;
-	fb->fmt.bytesperline = zr->vbuf_bytesperline;
-	fb->fmt.colorspace = V4L2_COLORSPACE_SRGB;
-	fb->fmt.field = V4L2_FIELD_INTERLACED;
-	fb->capability = V4L2_FBUF_CAP_LIST_CLIPPING;
-
-	return 0;
-}
-
-static int zoran_s_fbuf(struct file *file, void *__fh,
-			const struct v4l2_framebuffer *fb)
-{
-	struct zoran *zr = video_drvdata(file);
-	struct zoran_fh *fh = __fh;
-	int i, res = 0;
-	__le32 printformat = __cpu_to_le32(fb->fmt.pixelformat);
-
-	for (i = 0; i < NUM_FORMATS; i++)
-		if (zoran_formats[i].fourcc == fb->fmt.pixelformat)
-			break;
-	if (i == NUM_FORMATS) {
-		pci_err(zr->pci_dev, "VIDIOC_S_FBUF - format=0x%x (%4.4s) not allowed\n",
-			fb->fmt.pixelformat,
-			(char *)&printformat);
-		return -EINVAL;
-	}
-
-	res = setup_fbuffer(fh, fb->base, &zoran_formats[i], fb->fmt.width,
-			    fb->fmt.height, fb->fmt.bytesperline);
-
-	return res;
-}
-
 static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type type);
 
 static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffers *req)
@@ -2218,8 +2135,6 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 /*	.vidioc_enum_output		    = zoran_enum_output,
 	.vidioc_g_output		    = zoran_g_output,
 	.vidioc_s_output		    = zoran_s_output,*/
-	.vidioc_g_fbuf			    = zoran_g_fbuf,
-	.vidioc_s_fbuf			    = zoran_s_fbuf,
 	.vidioc_g_std			    = zoran_g_std,
 	.vidioc_s_std			    = zoran_s_std,
 	.vidioc_g_jpegcomp		    = zoran_g_jpegcomp,
-- 
2.26.2

