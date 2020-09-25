Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833BB279098
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbgIYSde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729686AbgIYSde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:33:34 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36061C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:34 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so4006959pfd.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bWoBtuj1a3OWnukIH+6aFRxvQnbnVbFdKWkrBtcBHUs=;
        b=JtZSThmcnDELzXKqu6dB8Yz51iMzscfQM8Kcdqbzs33Xwssi3YI7oR3KmY8MpVfgj9
         J0cTBM7SAAIAtSuoJdpW/6VhztVMVo//l3NwOzSYIkd5kkclA8g176Gf2ceZYZNKwTzm
         wmQeVFvOCLadZ0rIjhKH0LarQXZEEwFbrmMIyvnr1lN7Dznki1qPC+dXdskZhIyeHndH
         GBSn241rkrBFiYlVwYqdX00Wunmd6J+aGCfV2v4QgDG61y1zTks9Aps1qJiyFxidfhWq
         6WTxSTrhn/sBLDjV9CjEm6axbEWTphu2ObU7eJ365lvgLtSxI0EOxlKkQQO0Gx+mcQGT
         S8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bWoBtuj1a3OWnukIH+6aFRxvQnbnVbFdKWkrBtcBHUs=;
        b=OMxY578e1dn4rLAfIQRhEB6k5RLhgeYPr6yTaRYbKwyBFacwPbgp+kN+KT9ElPAobE
         8bTYINDdtaGBXJWYtAUiNAPhBM0mtKq2QHxGrHD22a7Ne4Hy/EN1Hvy538sqlEf4Laz6
         Ia+KSHokMOqeutYZNsjxx9EP3dJR5RiPZ9g2vXIh/eAV7BTK1jwBLa714veR83Nxa17A
         IXzo9po6uL1Uo+5pK795QU24KIo++CqX2U12bpYVdrvaQ4OPnrdJPOF6ewuXgypTfMtp
         3o6268jUljJ5pCy0/N0GvXsKZMAnoqYGiqGsN2tjdTIKJhUmllTueiLZtpX2j5koIb9R
         390w==
X-Gm-Message-State: AOAM5318f0OyefvhI25HMgC0fKaJ4JUhibuXZgOdkQ/0sjWnkfC8IpZQ
        lMMY1rbsuJs2OvmefGJqGKlJYA==
X-Google-Smtp-Source: ABdhPJyN302LQLPpJTJCVZY6pg5hfwvc06wPwY4BdZrLWxUbaMx3hxN//HP95gPxpA5WjK4UeWLYew==
X-Received: by 2002:a63:4703:: with SMTP id u3mr249392pga.322.1601058813796;
        Fri, 25 Sep 2020 11:33:33 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.33.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:33:33 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 23/47] staging: media: zoran: Use DMA coherent for stat_com
Date:   Fri, 25 Sep 2020 18:30:33 +0000
Message-Id: <1601058657-14042-24-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using a fragile virt_to_bus, let's use proper DMA coherent
for the stat_com entry.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |  2 ++
 drivers/staging/media/zoran/zoran_card.c   | 22 +++++++++++++++-------
 drivers/staging/media/zoran/zoran_device.c |  3 +--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index aa2a8f688a01..8f3faa4eb60f 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -351,6 +351,8 @@ struct zoran {
 	unsigned long frame_num;
 
 	wait_queue_head_t test_q;
+
+	dma_addr_t p_sc;
 };
 
 static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 5919803a6a5e..9fe2bc2b036a 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -936,11 +936,17 @@ static int zr36057_init(struct zoran *zr)
 	zoran_open_init_params(zr);
 
 	/* allocate memory *before* doing anything to the hardware in case allocation fails */
-	zr->stat_com = kzalloc(BUZ_NUM_STAT_COM * 4, GFP_KERNEL);
 	zr->video_dev = video_device_alloc();
-	if (!zr->stat_com || !zr->video_dev) {
+	if (!zr->video_dev) {
 		err = -ENOMEM;
-		goto exit_free;
+		goto exit;
+	}
+	zr->stat_com = dma_alloc_coherent(&zr->pci_dev->dev,
+					  BUZ_NUM_STAT_COM * sizeof(u32),
+					  &zr->p_sc, GFP_KERNEL);
+	if (!zr->stat_com) {
+		err = -ENOMEM;
+		goto exit_video;
 	}
 	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
 		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
@@ -958,7 +964,7 @@ static int zr36057_init(struct zoran *zr)
 	zr->video_dev->vfl_dir = VFL_DIR_M2M;
 	err = video_register_device(zr->video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
 	if (err < 0)
-		goto exit_free;
+		goto exit_statcom;
 	video_set_drvdata(zr->video_dev, zr);
 
 	zoran_init_hardware(zr);
@@ -973,9 +979,11 @@ static int zr36057_init(struct zoran *zr)
 	zr->initialized = 1;
 	return 0;
 
-exit_free:
-	kfree(zr->stat_com);
+exit_statcom:
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
+exit_video:
 	kfree(zr->video_dev);
+exit:
 	return err;
 }
 
@@ -1009,7 +1017,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	btwrite(0, ZR36057_SPGPPCR);
 	free_irq(zr->pci_dev->irq, zr);
 	/* unmap and free memory */
-	kfree(zr->stat_com);
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
 	iounmap(zr->zr36057_mem);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 627ebda33cc8..0ecb044f8e8f 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -579,8 +579,7 @@ static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 	//btor(ZR36057_VFESPFR_VCLKPol, ZR36057_VFESPFR);
 
 	/* code base address */
-	reg = virt_to_bus(zr->stat_com);
-	btwrite(reg, ZR36057_JCBA);
+	btwrite(zr->p_sc, ZR36057_JCBA);
 
 	/* FIFO threshold (FIFO is 160. double words) */
 	/* NOTE: decimal values here */
-- 
2.26.2

