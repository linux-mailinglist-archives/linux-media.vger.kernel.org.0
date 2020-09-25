Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB2A2790BB
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbgIYSfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728353AbgIYSfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:14 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9DAC0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:13 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w7so4023463pfi.4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p5l6EaviuFGA1zFFnY0XdYdtQpoI5EcNFWrJRwNgpVY=;
        b=zet2hqgATH4NLGylP6g8DiOpWCgBcVtrRlUrLySmCZJugdUgUnlBzVtRfAwLquXKh2
         jRw5tcum14d9IAiAwH7eeprx05iP/qZB7ppp5umjVjAtoTUxuzwJdfjWaI0zX51WV32m
         rFOMmTaUv90ZqiTxiywopf1J1IWIXnAgvS8jZFnxAQxF/rfMMEJ/Cx1j1CA/G2931eIJ
         oZZdeot/nFN8EM7v0zfFyNOlI9x1GLcG6ni6YO5OqDcOY+G+Ctv+yPmD48OWfWsjGM97
         4MBfMtHI7mNdXY2dlzq8s/QwW4veoj07NDgKBnbKxPtuxtxYlNkKlxMlTA510h+OIw2d
         lhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p5l6EaviuFGA1zFFnY0XdYdtQpoI5EcNFWrJRwNgpVY=;
        b=tWKkVJV0+rsb9jmyo28pAawjw0ISlFasSNB+mjBOgyTZf5HvQ7/LyomzBv2dWOCpAA
         MwJdeWn7lpz0R5+0LZhSCmrwqJEWDD9xKA6t8PT/2VDYo4qN85K2aJ0VEowrsXVNl0QC
         CcSqIRtNw9vkYmg9otEMjuzps7VIAwa1ykpNvsy4FWGiGVlq6wD7just7FOvEnKx0t72
         dn0lwORLAuIDj6+ZkcPV1K13axXKZiCB91mBhpxH7g7BI3Nhrvvm7Xl4iyxmXrlDiLGj
         v9vltsbdEoHpIN4JnIFLLpMWmAyTR3cwlSG7UHhC2nXebLw8/JSD++XHRKvv9POu3UWA
         wfug==
X-Gm-Message-State: AOAM531mxnkrVMSt7TBZpX/XaOK0Tcn3jFaL5bVxJrMaVZXe4X2sbKTD
        kLvdpvKIIHweLStzS5SWEjrkGQ==
X-Google-Smtp-Source: ABdhPJzEgrB4BG0H/Uyfeg4c0tqS3TcXP7zO3k6gJ0gznak5aoItK346p4wpbQ2koFwLYguODlA1Eg==
X-Received: by 2002:a63:121f:: with SMTP id h31mr258623pgl.274.1601058913507;
        Fri, 25 Sep 2020 11:35:13 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.35.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:12 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 40/47] staging: media: zoran: remove framebuffer support
Date:   Fri, 25 Sep 2020 18:30:50 +0000
Message-Id: <1601058657-14042-41-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
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
index 0a193283eefc..28a403257bb9 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -900,12 +900,6 @@ static int zr36057_init(struct zoran *zr)
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
index 43f7c0c02876..bcbe2c78ea16 100644
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
@@ -1403,47 +1361,6 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
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
@@ -2235,8 +2152,6 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
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

