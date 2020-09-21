Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B6C272095
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgIUKXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgIUKUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:51 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242E4C0613D0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:51 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id s13so11552144wmh.4
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vl6OTebBvkB4fdbT234fIR/40NpEOt314dUuABCDll4=;
        b=WFgjWee5tAmAd1qRQcGAeSltT4caQXzjsAIKam+mcOztmDIR83/XyI3xW+hXWmc6H0
         ztufoQ/FW87bsXe5I6eEUk1UBdzW9NNXvu88hj2PAD0A910DzQRTUL/YH6pf0dpFJ69H
         T/KUelScDdiGNe5f7t1pMOUXoFiKeLOYsh2xyadC2FRSol4vbOSdF8EBNy0uKGDprvOB
         ous2BtfSAcG8bFn2fNBVMbFAweBvfuwxeLBTgE5qs+hlGVovIhwnsxwN2ZK4CQ0OLIYP
         jvNgSM5S1JIMOA9pjBOjLl1rbZlbtun2DfWZxl+DlBzCuSgRZVz2Sc/Q5IQTvdVhZXXL
         49Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vl6OTebBvkB4fdbT234fIR/40NpEOt314dUuABCDll4=;
        b=b3dFfSkmf/wE4EC3707y9xg3mpZkIQRoUZx8AVslqWKuBst/2KfZG2egAQz3bqT8Pj
         iwES5kbCvcn2JU341jQg98uSseSdEFbasV5tJPfFs9VNF2hTdH97BiBf1bjAIxEQ02lB
         2Gr+XR3lxZy9uPAgfJh7mYOOZjrrxnxvnGcU05hmm433RLwbt5lNe/4qjpXesg5DAFyU
         XIzG04+/RlIBpiOtUgZp/HBojmnMseJNkMySDNWzQe6iCZMyhFob+URIlc2W5Hnrycxz
         tjOHlIrmReBuGe808inqezSaNXRBXhYBlEIVCCKh/o6f2YdT/420nCZGRz9RDDzekLjo
         iOyw==
X-Gm-Message-State: AOAM533B8El5u7EINHrSS3yZQOuICfMc6WceF+FvZtxNtveKVbHSOHZr
        w6qaTNllLpiPy5Zq5OzLul9mZg==
X-Google-Smtp-Source: ABdhPJxEoI9cVv901ZdVCjiPjzQzjnNTltkT1xg7WUelID5zgl2gGP6kyipgnMsU1MRU7KUyfpLjFA==
X-Received: by 2002:a05:600c:220f:: with SMTP id z15mr16338168wml.87.1600683649861;
        Mon, 21 Sep 2020 03:20:49 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:49 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 18/49] staging: media: zoran: move v4l_settings out of zoran_fh
Date:   Mon, 21 Sep 2020 10:19:53 +0000
Message-Id: <1600683624-5863-19-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
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
index a97faf54e19d..984f1dde99d2 100644
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
@@ -1418,14 +1416,13 @@ static int zoran_g_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
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
@@ -1691,10 +1688,10 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
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
@@ -1961,7 +1958,6 @@ static int zoran_streamon(struct file *file, void *__fh, enum v4l2_buf_type type
 		}
 
 		zr->v4l_buffers.active = fh->buffers.active = ZORAN_LOCKED;
-		zr->v4l_settings = fh->v4l_settings;
 
 		zr->v4l_sync_tail = zr->v4l_pend_tail;
 		if (!zr->v4l_memgrab_active &&
-- 
2.26.2

