Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C760E272091
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgIUKXK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgIUKU7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:59 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8ED8C0613DD
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:56 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y15so12016108wmi.0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AP/XqtDTUKt4yJ0ASxePcyGSZvxUdYkBiARpAfmeNO4=;
        b=0gkErDheeGjztlrRvZ/Es3bFNzrJNLgywBc/bMxB79jS5SuFqExN763HDwrpjfawAW
         /tK97cTawr7pTm7w6amKyxAyBW7VaPFzdor19W6x7hIN7b/K0betYlvkXPGjBqfw0cj8
         XASuvPHYNaxO/uitvF6UIEpyDMnCKngyZo383TckofuE53Nfmag/XAyg1uDVBJGGBGjt
         0yWCgamzV0yYSZ79iZLGgu39s0Bzfc/pP1B1mKNWVKQOGME2TDxL0VghAdxOrgM7cvAW
         2nw7djGo6Z7WfonsQBvYu4V5jnXw3UpadepGhNLHx2xR8hTzGjgUzKaNXGUH4/9XtCOo
         yIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AP/XqtDTUKt4yJ0ASxePcyGSZvxUdYkBiARpAfmeNO4=;
        b=gOOLQON0Vcm5M0c7ztbCI1IrteV79ecG1MzPWRWkG7klAzLOWshakkPm2rjks+zOCP
         aY0tRG5rdHvmc1l7kNwk3TQ4nveEuHIN7BNd4DnoDQG5A/H43BQw16k0i7RxqLZugUcF
         trB3NYhnB1+W7dIee64l0a7ImLvqih9UYF3n1hJbNaW6cAruZNVckSAKmxeIknNgxXkr
         VCW0lT5YR1CjTdPF4DQADJE9VNO3lbU/23ZoZpulvRTwQs4sPgPUlvv8/MU90y2jQfp/
         dSR52Ra1oSo4/4PS1V1azd2WPFljtnDyigPlGtoT75jzfbm1EP4bmWn7QOJDR4YX6gWP
         x8Hw==
X-Gm-Message-State: AOAM533sO8W5D6PPsKTO4JWUXFxZqivCimcU6GA8B6JGYAlSsSZ0ji2e
        4ZR4r5X9dxOn+tqPcuUNM92y7A==
X-Google-Smtp-Source: ABdhPJxlYgiJf9kz7Mv2tj9VbWR0BjfFaLonl0Gw6TmnDDV//GmMsjbTozmNdlfGxUXxY32DmOQYdA==
X-Received: by 2002:a7b:c103:: with SMTP id w3mr28044636wmi.24.1600683655521;
        Mon, 21 Sep 2020 03:20:55 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:54 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 24/49] staging: media: zoran: Use DMA coherent for stat_com
Date:   Mon, 21 Sep 2020 10:19:59 +0000
Message-Id: <1600683624-5863-25-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using a fragile virt_to_bus, let's use proper DMA coherent
for the stat_com entry.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        |  2 ++
 drivers/staging/media/zoran/zoran_card.c   | 20 +++++++++++++-------
 drivers/staging/media/zoran/zoran_device.c |  3 +--
 3 files changed, 16 insertions(+), 9 deletions(-)

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
index 3a7895be3341..a8d23bf126c3 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -931,11 +931,15 @@ static int zr36057_init(struct zoran *zr)
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
+	zr->stat_com = dma_alloc_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), &zr->p_sc, GFP_KERNEL);
+	if (!zr->stat_com) {
+		err = -ENOMEM;
+		goto exit_video;
 	}
 	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
 		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
@@ -953,7 +957,7 @@ static int zr36057_init(struct zoran *zr)
 	zr->video_dev->vfl_dir = VFL_DIR_M2M;
 	err = video_register_device(zr->video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
 	if (err < 0)
-		goto exit_free;
+		goto exit_statcom;
 	video_set_drvdata(zr->video_dev, zr);
 
 	zoran_init_hardware(zr);
@@ -968,9 +972,11 @@ static int zr36057_init(struct zoran *zr)
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
 
@@ -1004,7 +1010,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	btwrite(0, ZR36057_SPGPPCR);
 	free_irq(zr->pci_dev->irq, zr);
 	/* unmap and free memory */
-	kfree(zr->stat_com);
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
 	iounmap(zr->zr36057_mem);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index e3104b534471..3a353130afb9 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -576,8 +576,7 @@ static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 	//btor(ZR36057_VFESPFR_VCLKPol, ZR36057_VFESPFR);
 
 	/* code base address */
-	reg = virt_to_bus(zr->stat_com);
-	btwrite(reg, ZR36057_JCBA);
+	btwrite(zr->p_sc, ZR36057_JCBA);
 
 	/* FIFO threshold (FIFO is 160. double words) */
 	/* NOTE: decimal values here */
-- 
2.26.2

