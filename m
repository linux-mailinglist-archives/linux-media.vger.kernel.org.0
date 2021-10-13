Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A176942C92C
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239018AbhJMTAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238885AbhJMTA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:28 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15DDC061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:24 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r18so11617991wrg.6
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t69ZUFKfCEsgZGnzRmPlxYQUXgv1BOCmFxNcb6wIIho=;
        b=0Ln1NBouGMSfSj9igP3pCcN0vj+eBQoFV5SZaiX42BBHyggjsKQItqELTcCWeDzunc
         k1sNwx6L4ZRRaAUwc9504rNSRTfjIvg0FZj/xHXrdQ47T4PDUYDgjZYRejmxviP9ZGnu
         Ozcfd3AtZ/kwxPNqy1SE3HMa4zPECBfeDs63aueJaLoUMMP0fVhKE+2KsE4mjuXPgkQQ
         mstZxx9XeLMqUGacdDGw3E0CcnFGlR7F9iyNvDTKRVtLuqKeFqrAPhl407hyYaC5V308
         /TQDuJ42TUw0ZQqbiZfymhrW1miPZBgNkjHfrRkrB7mtfNtDapcBVi/zm4boZX5d6Pue
         VDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t69ZUFKfCEsgZGnzRmPlxYQUXgv1BOCmFxNcb6wIIho=;
        b=U8Hxz0MvFwvj3qMjkJX8jGMB04UwtUxSHgabgbFe7C7NTiTz/PhUhxI/d6z+5iuT70
         tLrrYYqaP6eo6H+Cpg8lBolqdPkvg9v2GHQEuP1EuZ1NzWf4GkFuNfSQzkJA4tkxXkKQ
         1dnG2Jqt2fCcvtd3cKINld+EQueEln17+40VUZnpnNjNhXPwAMQEpa1FNWKLBlPhHZx7
         xnjZ5BnCx+0odLavFHjJ2FfN0mU/Ly1FEwg+kvxoSsH5T1zyNkxIa1Fhnbkqri52i1Es
         k/9Xnj3nfh/+q2GTcfIR50pdougbCDaK4euo33v8yFI0l9Q57bcj9IuGYV2ox4FV2lJi
         8/xQ==
X-Gm-Message-State: AOAM5302NiI5gibIzXpJ0EI0xBtZQFCczsiVvqTHh02E+qxNIFkiNDPB
        c328RjBJHfhb96pVtgq3atOa4w==
X-Google-Smtp-Source: ABdhPJz0pMa5847WGBKt3H4NXC4dFPBtol26heJQxm4RbO8oUYmK8hiy3Hzc6vg+Kj7yCKvQ81S4mg==
X-Received: by 2002:a05:6000:1541:: with SMTP id 1mr964652wry.273.1634151503283;
        Wed, 13 Oct 2021 11:58:23 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 08/10] staging: media: zoran: move videodev alloc
Date:   Wed, 13 Oct 2021 18:58:10 +0000
Message-Id: <20211013185812.590931-9-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
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
index c37d064ff11d..31bc577f5df5 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -317,6 +317,6 @@ static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
 
 #endif
 
-int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq);
+int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir);
 void zoran_queue_exit(struct zoran *zr);
 int zr_set_buf(struct zoran *zr);
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index a079fb6e27a3..9bc5af34d909 100644
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
 
@@ -992,7 +1012,7 @@ static void zoran_remove(struct pci_dev *pdev)
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

