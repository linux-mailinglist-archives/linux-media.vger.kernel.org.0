Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694C42790AB
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730094AbgIYSe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbgIYSe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:26 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95969C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:26 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id jw11so2161512pjb.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Mu/0FQjMJVfM9fUQVyncIBYRdlwubKZ9Y+KVohkSjQg=;
        b=DnFXQYBFVXbbd04Jl7J8lhM2CyKMvutu0uQxQybdPEl0ertUHJpaDA98FzUxTuB4rO
         BF/r6Q51tA7B0QVDIYJyLKN77l5JSHwZr4oEhmLv4gIaCrAZtqrCBFEP/LH8wD4MuUFL
         LVxP7kG/MrsHrCsPAqmZGFwS854M2VH09HEJvuEjQfhMKpxk5W0ichTtATYKtAAWS0E0
         a0eRgU26W8ybiHIoT8tAKCi4r5IhDwB+MI+Hdu2NdSmytjKkrwjvh/dFaBmAGHusebCM
         zsr2THKoUR9eP9yKtetN61yL9VGzNr9zU+8kuRrjw/3b1MQIXnIsKgDz5GnKdQ/PKrmJ
         OkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Mu/0FQjMJVfM9fUQVyncIBYRdlwubKZ9Y+KVohkSjQg=;
        b=A1IZLQA0IzgKfCQoaK0z8VNTJxiNpxnilqwBAfmR5PwONN5FlmzpcuuvbXl3LRKA3L
         dfbWTXLQ6Rh9jYcFzvrhW+tyfMtZ4Nm6w0Np7nvFypfGwWIlxH3/5UvDopRnFpR02xV0
         jNDpwrBUKsHgU6AFcAIGWPj9MJSd6CLe6HxjI2lYjaVTUIZKI+QMN5ndrTlyzdpKOuTI
         KQCZa81cCVzaEaaRwt1sx/LI22WrZ77rPoSJs24gESiqsycamFnwpDVEVhKmwoKNwr2A
         U8uWgBacZKXkuPwC3HV1VA8eR4wYlP3bEWlLuvzWGq1MZkPVXjuij6biX7jtGDQSycJD
         DRhQ==
X-Gm-Message-State: AOAM5312Z9fBlel1/NNRmQ59AWuoLgDMhHz0PXJJA+tYXC4ZuYfP/e7H
        3CmdiSUzw3AZ0cGU6cSr/CWVrQ==
X-Google-Smtp-Source: ABdhPJxhu7axivX74AqqlShaMLp3f7vw9dRngLPHb9SIgeC1+pypkhaNJLfB8RQRKTmMlQZYoKNDcQ==
X-Received: by 2002:a17:90a:f018:: with SMTP id bt24mr824508pjb.140.1601058866140;
        Fri, 25 Sep 2020 11:34:26 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:25 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 32/47] staging: media: zoran: add stat_com buffer
Date:   Fri, 25 Sep 2020 18:30:42 +0000
Message-Id: <1601058657-14042-33-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds the allocation of the stat_com buffer which be used
later.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h      |  2 ++
 drivers/staging/media/zoran/zoran_card.c | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 87ca324f6ec2..c73b7e7fd5e1 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -357,6 +357,8 @@ struct zoran {
 	wait_queue_head_t test_q;
 
 	dma_addr_t p_sc;
+	__le32 *stat_comb;
+	dma_addr_t p_scb;
 };
 
 static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 147bef1df33c..756705a34e2b 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -951,6 +951,14 @@ static int zr36057_init(struct zoran *zr)
 	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
 		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
 
+	zr->stat_comb = dma_alloc_coherent(&zr->pci_dev->dev,
+					   BUZ_NUM_STAT_COM * sizeof(u32) * 2,
+					   &zr->p_scb, GFP_KERNEL);
+	if (!zr->stat_comb) {
+		err = -ENOMEM;
+		goto exit_statcom;
+	}
+
 	/* Now add the template and register the device unit. */
 	*zr->video_dev = zoran_template;
 	zr->video_dev->v4l2_dev = &zr->v4l2_dev;
@@ -964,7 +972,7 @@ static int zr36057_init(struct zoran *zr)
 	zr->video_dev->vfl_dir = VFL_DIR_M2M;
 	err = video_register_device(zr->video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
 	if (err < 0)
-		goto exit_statcom;
+		goto exit_statcomb;
 	video_set_drvdata(zr->video_dev, zr);
 
 	zoran_init_hardware(zr);
@@ -979,6 +987,8 @@ static int zr36057_init(struct zoran *zr)
 	zr->initialized = 1;
 	return 0;
 
+exit_statcomb:
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, zr->stat_comb, zr->p_scb);
 exit_statcom:
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
 exit_video:
@@ -1010,6 +1020,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	pci_free_irq(zr->pci_dev, 0, zr);
 	/* unmap and free memory */
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, zr->stat_comb, zr->p_scb);
 	pci_release_regions(pdev);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
-- 
2.26.2

