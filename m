Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B0D2790A9
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgIYSeV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729754AbgIYSeU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B371CC0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x123so4006523pfc.7
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=33lB1n6MsJA8y1Cur/ULNq8jI1FuG8FB/2UR30PG+gU=;
        b=v+by3Sm5hf9KgoKt1yqOfMTlq/YrLRAqeJhU+akW0/r2L1rNqiRJAVaUTKe152bhlE
         6OnECoDtIUrh7Ty1RWqmfUIhUWT8qXlOA4YMuE/3Is4K0hG6C76rSi0f/pw8dp7BEBgU
         vshjZeheMuC3hi/tAn2CQnu4g2Q5MFyDnNvbS5jerKvV+UrBBmFmToBxuLe1iy7eNi4D
         0pETojEd3cUqmtrNGs6aQpLp/w7SA7K8lcJxZ4LsqvSiC5nh5k60JVH+COTF57I51T34
         MmmcOyr4rryjwXKnhfoQ8lig06k2DaFGIWoSpDWs3iMMaix0ZT2e15QQYzSDmkIuLX5A
         agvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=33lB1n6MsJA8y1Cur/ULNq8jI1FuG8FB/2UR30PG+gU=;
        b=AcwtjuRDQxulMbho/8d1USVa+ndGXKYUaWStq6UOjmRe585N3pMyxDgv9Zgk7EKCUA
         8GUv0kwtkdx8+OZlmu8tWuQ/6MxBN5pzsRZ/ItYGzlYjwrIZMmPeBQPAOlE9IjEDgiIa
         VaGfR0iOtvHdAf357rgEco2ozcYt6DVtoSTlF2As18oVwcydFmQIMamRYmnK9IKPdSP1
         gN5a57pRU/rvuqtbF9k3bl7BJjVTwARQgMsjzeELaI+o6O7f91KnVM6/VuoPk38eR2dn
         tBT9Gj/ZBTCgd0WZATyK8IIi5D9al6sO65NnqrumuWestzciQZMzCQ3h0QVABYsQrd5F
         Vxbg==
X-Gm-Message-State: AOAM530yaxxT5YEfiyp3se3ZYbw01zXrLQVa5FTsC9EfZcNT3p3DVILZ
        6m7FaNshZwGMU6GA7cra67Zj1A==
X-Google-Smtp-Source: ABdhPJzI8D0FfG2yohm1Szf25h+WuVFA8LA4/tvF6/4fOPFUmOPwPsOyyMAX31jksGcEIHQWbNVIAQ==
X-Received: by 2002:a17:902:e9d1:b029:d2:221f:9970 with SMTP id 17-20020a170902e9d1b02900d2221f9970mr688729plk.5.1601058860325;
        Fri, 25 Sep 2020 11:34:20 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:19 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 31/47] staging: media: zoran: use devm_ioremap
Date:   Fri, 25 Sep 2020 18:30:41 +0000
Message-Id: <1601058657-14042-32-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using devm_ioremap simplify code.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index f4639324bace..147bef1df33c 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1010,7 +1010,6 @@ static void zoran_remove(struct pci_dev *pdev)
 	pci_free_irq(zr->pci_dev, 0, zr);
 	/* unmap and free memory */
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
-	iounmap(zr->zr36057_mem);
 	pci_release_regions(pdev);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
@@ -1165,7 +1164,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto zr_unreg;
 
-	zr->zr36057_mem = pci_ioremap_bar(zr->pci_dev, 0);
+	zr->zr36057_mem = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
 	if (!zr->zr36057_mem) {
 		pci_err(pdev, "%s() - ioremap failed\n", __func__);
 		goto zr_pci_release;
@@ -1181,7 +1180,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		} else {
 			pci_err(pdev, "%s - cannot assign IRQ, error code %d\n", __func__, result);
 		}
-		goto zr_unmap;
+		goto zr_pci_release;
 	}
 
 	/* set PCI latency timer */
@@ -1284,8 +1283,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 zr_free_irq:
 	btwrite(0, ZR36057_SPGPPCR);
 	pci_free_irq(zr->pci_dev, 0, zr);
-zr_unmap:
-	iounmap(zr->zr36057_mem);
 zr_pci_release:
 	pci_release_regions(pdev);
 zr_unreg:
-- 
2.26.2

