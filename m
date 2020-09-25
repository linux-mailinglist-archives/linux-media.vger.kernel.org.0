Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9269527908A
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbgIYSdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729666AbgIYSc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:32:58 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C620DC0613D4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:58 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k133so3299929pgc.7
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xUDsyw9R3jJxj15EJT3or+kmYeDPoBgPCSAmh4oHLlM=;
        b=BBycQb0D91/nmiwyygHNPlNfHifcum4tKV6GorDkw9Z5pbKXoaNDP9Y0Qzgy0NkNoh
         EbOo1ku2FcsZRu50t55M49heETGvcLCTQnLxL0wEebGPJI1vcumPV7SDgR65M4iTaLDR
         +vaJKm11ty5A0d3ONsLzc5eWFD9zIOdgW7RvkKRG9u9lGfrZeZxfemUuDatimcAvIDM7
         PyFA6oOehqvHaRtfx1Hvth9l36O4ysdlHT5owyMCsQSMaraH2arKyaEMIEqjLOtA6k19
         F36NWnraNDx6HvOr0bGNXnEsW/fq8FQRpqKwUiSOTpiDJC+tH12oGdoouWJBliuVVzkQ
         m3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xUDsyw9R3jJxj15EJT3or+kmYeDPoBgPCSAmh4oHLlM=;
        b=dF6zLOHHD9ONrfv9+FSk7sD1JXcR/ECd8kvomCFA6gLxeYIDbXsPcm3rUt0LdVR7jm
         qVhFMrN7FLGQgbt5/CS0ALdy7jfXPvN1y/iYWkDqCgUOtZTOpFUWJKkOu4d5s4NBXs5r
         AptHg6/zH3omz0OlKDu/3ITkC0//1h1PU5tHY6nLAiN3natUUoCKYGIpF5Jffwl9u/uJ
         F0dAr3QRe+wtc9dvJlVkiDV9xItUcWatmW+amUIsTQ1KaMzvV8z8qQHwFER+zDN2P+CR
         wr4HaRXp0nG9bKRkWZkPXkWTe2RHQ5I08pucVv0JVUds2m+c/jBRIpyXp5nYwzqmFspi
         223g==
X-Gm-Message-State: AOAM530a8lsQVbl6Om1ekXeWjzArxNSpY3YoFhbgG2de6UzeaVMkmUxL
        hZidXkJ+SkPzMs2thRboU5LptA==
X-Google-Smtp-Source: ABdhPJwJaGFBJ+3ed5U7vIW0ALXG4mNqgNrOLtumDezaWWnOQIKnqKHm/rcmsSOrTyCQJrVG+8pBHQ==
X-Received: by 2002:a63:c74e:: with SMTP id v14mr241196pgg.186.1601058778335;
        Fri, 25 Sep 2020 11:32:58 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.32.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:32:57 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 17/47] staging: media: zoran: move v4l_settings out of zoran_fh
Date:   Fri, 25 Sep 2020 18:30:27 +0000
Message-Id: <1601058657-14042-18-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to get rid of zoran_fh, so move the v4l_settings directly in the
zoran structure.
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |  1 -
 drivers/staging/media/zoran/zoran_driver.c | 38 ++++++++++------------
 2 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 97933c550113..a529b49888c6 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -217,7 +217,6 @@ struct zoran_fh {
 
 	struct zoran_buffer_col buffers;	/* buffers' info */
 
-	struct zoran_v4l_settings v4l_settings;	/* structure with a lot of things to play with */
 	struct zoran_jpg_settings jpg_settings;	/* structure with a lot of things to play with */
 };
 
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 2a00a3a72dad..e60db53c0359 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -432,10 +432,10 @@ static int zoran_v4l_set_format(struct zoran_fh *fh, int width, int height,
 		return -EINVAL;
 	}
 
-	fh->v4l_settings.width = width;
-	fh->v4l_settings.height = height;
-	fh->v4l_settings.format = format;
-	fh->v4l_settings.bytesperline = bpp * fh->v4l_settings.width;
+	zr->v4l_settings.width = width;
+	zr->v4l_settings.height = height;
+	zr->v4l_settings.format = format;
+	zr->v4l_settings.bytesperline = bpp * zr->v4l_settings.width;
 
 	return 0;
 }
@@ -489,7 +489,7 @@ static int zoran_v4l_queue_frame(struct zoran_fh *fh, int num)
 			zr->v4l_pend[zr->v4l_pend_head++ & V4L_MASK_FRAME] = num;
 			zr->v4l_buffers.buffer[num].state = BUZ_STATE_PEND;
 			zr->v4l_buffers.buffer[num].bs.length =
-			    fh->v4l_settings.bytesperline *
+			    zr->v4l_settings.bytesperline *
 			    zr->v4l_settings.height;
 			fh->buffers.buffer[num] = zr->v4l_buffers.buffer[num];
 			break;
@@ -751,8 +751,6 @@ static void zoran_open_init_session(struct zoran_fh *fh)
 	fh->overlay_settings.format = zr->overlay_settings.format;
 	fh->overlay_active = ZORAN_FREE;
 
-	/* v4l settings */
-	fh->v4l_settings = zr->v4l_settings;
 	/* jpg settings */
 	fh->jpg_settings = zr->jpg_settings;
 
@@ -1205,7 +1203,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 			buf->flags |= V4L2_BUF_FLAG_QUEUED;
 		}
 
-		if (fh->v4l_settings.height <= BUZ_MAX_HEIGHT / 2)
+		if (zr->v4l_settings.height <= BUZ_MAX_HEIGHT / 2)
 			buf->field = V4L2_FIELD_TOP;
 		else
 			buf->field = V4L2_FIELD_INTERLACED;
@@ -1421,14 +1419,13 @@ static int zoran_g_fmt_vid_cap(struct file *file, void *__fh,
 	if (fh->map_mode != ZORAN_MAP_MODE_RAW)
 		return zoran_g_fmt_vid_out(file, fh, fmt);
 
-	fmt->fmt.pix.width = fh->v4l_settings.width;
-	fmt->fmt.pix.height = fh->v4l_settings.height;
-	fmt->fmt.pix.sizeimage = fh->v4l_settings.bytesperline *
-					fh->v4l_settings.height;
-	fmt->fmt.pix.pixelformat = fh->v4l_settings.format->fourcc;
-	fmt->fmt.pix.colorspace = fh->v4l_settings.format->colorspace;
-	fmt->fmt.pix.bytesperline = fh->v4l_settings.bytesperline;
-	if (BUZ_MAX_HEIGHT < (fh->v4l_settings.height * 2))
+	fmt->fmt.pix.width = zr->v4l_settings.width;
+	fmt->fmt.pix.height = zr->v4l_settings.height;
+	fmt->fmt.pix.sizeimage = zr->v4l_settings.bytesperline * zr->v4l_settings.height;
+	fmt->fmt.pix.pixelformat = zr->v4l_settings.format->fourcc;
+	fmt->fmt.pix.colorspace = zr->v4l_settings.format->colorspace;
+	fmt->fmt.pix.bytesperline = zr->v4l_settings.bytesperline;
+	if (BUZ_MAX_HEIGHT < (zr->v4l_settings.height * 2))
 		fmt->fmt.pix.field = V4L2_FIELD_INTERLACED;
 	else
 		fmt->fmt.pix.field = V4L2_FIELD_TOP;
@@ -1698,10 +1695,10 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 		return res;
 
 	/* tell the user the results/missing stuff */
-	fmt->fmt.pix.bytesperline = fh->v4l_settings.bytesperline;
-	fmt->fmt.pix.sizeimage = fh->v4l_settings.height * fh->v4l_settings.bytesperline;
-	fmt->fmt.pix.colorspace = fh->v4l_settings.format->colorspace;
-	if (BUZ_MAX_HEIGHT < (fh->v4l_settings.height * 2))
+	fmt->fmt.pix.bytesperline = zr->v4l_settings.bytesperline;
+	fmt->fmt.pix.sizeimage = zr->v4l_settings.height * zr->v4l_settings.bytesperline;
+	fmt->fmt.pix.colorspace = zr->v4l_settings.format->colorspace;
+	if (BUZ_MAX_HEIGHT < (zr->v4l_settings.height * 2))
 		fmt->fmt.pix.field = V4L2_FIELD_INTERLACED;
 	else
 		fmt->fmt.pix.field = V4L2_FIELD_TOP;
@@ -1968,7 +1965,6 @@ static int zoran_streamon(struct file *file, void *__fh, enum v4l2_buf_type type
 		}
 
 		zr->v4l_buffers.active = fh->buffers.active = ZORAN_LOCKED;
-		zr->v4l_settings = fh->v4l_settings;
 
 		zr->v4l_sync_tail = zr->v4l_pend_tail;
 		if (!zr->v4l_memgrab_active &&
-- 
2.26.2

