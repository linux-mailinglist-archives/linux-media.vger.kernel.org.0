Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6794005A7
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 21:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349611AbhICTRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 15:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350992AbhICTRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 15:17:07 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442ECC06129E
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 12:16:00 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso229747wmb.2
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jby0eLjR5fmSKbW72710HBIYKVjDctkxsujqObkX5uc=;
        b=SLrh1Ztnx76ROB0fnOkF9sq/3061TM75qGghhTwjHU7aVBVsFH34XLtDuaCmwHsciA
         L3w2dPnz7s9n12CDnbjqMvX8OHv9XtA4MbOB39nrtRcGA8GLMjMUcrHzHiKHw9VfPPpu
         MyM+vXkTcMO96kAFb9dh6RdXObQSEgDdtSu9v9skocWYqFMeWXcuyRyPZKO5fgl/ZjIo
         uMqExE5dFkfvqYoKwnJd7RvE/+OvXbnbIoavLJNQDUJic9scKNahB30RkKW44uau5HYW
         pxgJkXAuUNUSbPW7LYaDv+WZh39QL53omTLi6qtDqWKjrsg+sOrfWDo1Xc53rou4CNxS
         bpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jby0eLjR5fmSKbW72710HBIYKVjDctkxsujqObkX5uc=;
        b=jRdyLn7jcwrYV1B+nQbZRb+SMGLopc6S4Tg+Hu6AzPTf3/Uz6bYccjc5/dOgMEcdQz
         XsNnirxGTw6csqJ/hdcM8B6h+1nl7+VUewcB2XyUoo2Y56a81cg4D/l1IKtEIFcaj1dI
         VqywWSAKamgLS+bx+MOwn2yhWZprcbS1drgsa9kdKmqQdP5VcHkRjeK+QRqgZLcruujs
         Us8k4IevrjxYCXOsnZ8jcjq7zb4K4wyiZMo8w4W8u0LuHdt1BvOG5a57Ka6p9HUtUgYl
         96T+Qq1EKNjJMfpC3TZh5u/jW6a8IHxVZUumpExPasBvD6rVLSmax+TCbD+aBF02XIcl
         R52g==
X-Gm-Message-State: AOAM531x6XKuRi0mzoQnOrC5Tg0Cx5SwheSEZxajjESsfuyeVUy38pwc
        8l/a2+lCLkL/E5VDBMPxppqXlw==
X-Google-Smtp-Source: ABdhPJwXG5M1Mk0eJ6FksUuALeL6vSMK3n32rsWqZkETWrvrszwYnICGAXTKMsv07xv+bmkMo8F6EQ==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr232742wmj.163.1630696558558;
        Fri, 03 Sep 2021 12:15:58 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a133sm253397wme.5.2021.09.03.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:15:58 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 8/8] staging: media: zoran: move videodev alloc
Date:   Fri,  3 Sep 2021 19:15:40 +0000
Message-Id: <20210903191540.3052775-9-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903191540.3052775-1-clabbe@baylibre.com>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move some code out of zr36057_init() and create new functions for handling zr->video_dev.
This permit to ease code reading and fix a zr->video_dev memory leak.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |  2 +-
 drivers/staging/media/zoran/zoran_card.c   | 80 ++++++++++++++--------
 drivers/staging/media/zoran/zoran_driver.c |  5 +-
 3 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 8c271005f14d..45f2d4d862b3 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -318,6 +318,6 @@ static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
 
 #endif
 
-int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq);
+int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir);
 void zoran_queue_exit(struct zoran *zr);
 int zr_set_buf(struct zoran *zr);
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index ed74f04994da..0b3afd8a702e 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -828,6 +828,52 @@ int zoran_check_jpg_settings(struct zoran *zr,
 	return 0;
 }
 
+static int zoran_init_video_device(struct zoran *zr, struct video_device *video_dev, int dir)
+{
+	int err;
+
+	/* Now add the template and register the device unit. */
+	*video_dev = zoran_template;
+	video_dev->v4l2_dev = &zr->v4l2_dev;
+	video_dev->lock = &zr->lock;
+	video_dev->device_caps = V4L2_CAP_STREAMING | dir;
+
+	strscpy(video_dev->name, ZR_DEVNAME(zr), sizeof(video_dev->name));
+	/*
+	 * It's not a mem2mem device, but you can both capture and output from one and the same
+	 * device. This should really be split up into two device nodes, but that's a job for
+	 * another day.
+	 */
+	video_dev->vfl_dir = VFL_DIR_M2M;
+	zoran_queue_init(zr, &zr->vq, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+
+	err = video_register_device(video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
+	if (err < 0)
+		return err;
+	video_set_drvdata(video_dev, zr);
+	return 0;
+}
+
+static void zoran_exit_video_devices(struct zoran *zr)
+{
+	video_unregister_device(zr->video_dev);
+	kfree(zr->video_dev);
+}
+
+static int zoran_init_video_devices(struct zoran *zr)
+{
+	int err;
+
+	zr->video_dev = video_device_alloc();
+	if (!zr->video_dev)
+		return -ENOMEM;
+
+	err = zoran_init_video_device(zr, zr->video_dev, V4L2_CAP_VIDEO_CAPTURE);
+	if (err)
+		kfree(zr->video_dev);
+	return err;
+}
+
 void zoran_open_init_params(struct zoran *zr)
 {
 	int i;
@@ -899,17 +945,11 @@ static int zr36057_init(struct zoran *zr)
 	zoran_open_init_params(zr);
 
 	/* allocate memory *before* doing anything to the hardware in case allocation fails */
-	zr->video_dev = video_device_alloc();
-	if (!zr->video_dev) {
-		err = -ENOMEM;
-		goto exit;
-	}
 	zr->stat_com = dma_alloc_coherent(&zr->pci_dev->dev,
 					  BUZ_NUM_STAT_COM * sizeof(u32),
 					  &zr->p_sc, GFP_KERNEL);
 	if (!zr->stat_com) {
-		err = -ENOMEM;
-		goto exit_video;
+		return -ENOMEM;
 	}
 	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
 		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
@@ -922,26 +962,9 @@ static int zr36057_init(struct zoran *zr)
 		goto exit_statcom;
 	}
 
-	/* Now add the template and register the device unit. */
-	*zr->video_dev = zoran_template;
-	zr->video_dev->v4l2_dev = &zr->v4l2_dev;
-	zr->video_dev->lock = &zr->lock;
-	zr->video_dev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
-
-	strscpy(zr->video_dev->name, ZR_DEVNAME(zr), sizeof(zr->video_dev->name));
-	/*
-	 * It's not a mem2mem device, but you can both capture and output from one and the same
-	 * device. This should really be split up into two device nodes, but that's a job for
-	 * another day.
-	 */
-	zr->video_dev->vfl_dir = VFL_DIR_M2M;
-
-	zoran_queue_init(zr, &zr->vq);
-
-	err = video_register_device(zr->video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
-	if (err < 0)
+	err = zoran_init_video_devices(zr);
+	if (err)
 		goto exit_statcomb;
-	video_set_drvdata(zr->video_dev, zr);
 
 	zoran_init_hardware(zr);
 	if (!pass_through) {
@@ -956,9 +979,6 @@ static int zr36057_init(struct zoran *zr)
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, zr->stat_comb, zr->p_scb);
 exit_statcom:
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
-exit_video:
-	kfree(zr->video_dev);
-exit:
 	return err;
 }
 
@@ -990,7 +1010,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, zr->stat_comb, zr->p_scb);
 	pci_release_regions(pdev);
 	pci_disable_device(zr->pci_dev);
-	video_unregister_device(zr->video_dev);
+	zoran_exit_video_devices(zr);
 exit_free:
 	v4l2_ctrl_handler_free(&zr->hdl);
 	v4l2_device_unregister(&zr->v4l2_dev);
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 46382e43f1bf..551db338c7f7 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1008,7 +1008,7 @@ static const struct vb2_ops zr_video_qops = {
 	.wait_finish            = vb2_ops_wait_finish,
 };
 
-int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq)
+int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir)
 {
 	int err;
 
@@ -1016,7 +1016,8 @@ int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq)
 	INIT_LIST_HEAD(&zr->queued_bufs);
 
 	vq->dev = &zr->pci_dev->dev;
-	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vq->type = dir;
+
 	vq->io_modes = VB2_USERPTR | VB2_DMABUF | VB2_MMAP | VB2_READ | VB2_WRITE;
 	vq->drv_priv = zr;
 	vq->buf_struct_size = sizeof(struct zr_buffer);
-- 
2.32.0

