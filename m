Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881BF27205B
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgIUKVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgIUKVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:05 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2CA6C061755
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:04 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g4so12117687wrs.5
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fZV35x1Iz2E43SPidCPc9QQFeH1eHhufPHV6/Pg1brc=;
        b=tduwWF0NtI3cn20DkNi9IESemUfiGeLBLMBfv0DPvHLkobph7WNzojhd59us8p09ZB
         zjK7P5nC4xgxT5ywKK7G3V0K6G2nDZfWvqGsMTmwT4XFLRcwBvTs5NEXzr3+oq9aJePj
         PThFY0Zyv9HP4Oaf/fb00JGfj19WkQXnS0Y/NP2m4PtU9gs6d9GJLawogoqLfUZw7hVb
         fEi5SS4XNtT83PnqsbU/q5pXWnjUzvq5euMg+rdyB1fqMzq1DEFnkfA7+uVg5yOvDPjL
         ER6SBAHKGXt5Qi++YmjJ3KlbprPmuQKQPaZ5mz+QFiGVDQxfpL0+FBN5TiogzU7bZ7ta
         vzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fZV35x1Iz2E43SPidCPc9QQFeH1eHhufPHV6/Pg1brc=;
        b=WtldyX+vlwMQussoLO7UFgWVtb4t1pjMF4qb6AR9J7NGU5ggPMCNAeJBjrf/flDP7D
         0pjQr8+U8M9o734vypDCWuqVZTtzZGre7noGtflXdQn5aeFd+ezoNJisgxSn6tnSxK8G
         i7h7yNyLBZyJvDbou4jjeKbHRzwm9HS110brdmc2UWdlg5+sg1ejS+Ym4g8ME6HWdHGx
         JI2sAUsXeMIxEvcyN5ONiuAe+jbTxDSl1GO6kEO9vSN06Iu7gEH4d2UBRQgKi+yykVOR
         dQPZIEfWjxFBIDErtRKvkcFHtAsiGszdk0mIA/12kqzTUaiqATWYMoUVkjYWTwcE+/zL
         gbww==
X-Gm-Message-State: AOAM530RHRK50Jm8v13W882n2pyNLpxnKhkndkvDxzlf9gvCf9vUVU3z
        7/TtwPK09rfDLcVTd+JqpyEVoQ==
X-Google-Smtp-Source: ABdhPJzkPKV30xQ7dnOo7B95UCRnoif+Ufxh0naKl1mhkBaiRw4uyZ9JrUV/tYWZKK0s6aP/1XkYSQ==
X-Received: by 2002:adf:9405:: with SMTP id 5mr28243515wrq.51.1600683663492;
        Mon, 21 Sep 2020 03:21:03 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:02 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 33/49] staging: media: zoran: add stat_com buffer
Date:   Mon, 21 Sep 2020 10:20:08 +0000
Message-Id: <1600683624-5863-34-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds the allocation of the stat_com buffer which be used
later.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h      |  2 ++
 drivers/staging/media/zoran/zoran_card.c | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index 36305aaabd7d..b841f532e6bb 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -944,6 +944,12 @@ static int zr36057_init(struct zoran *zr)
 	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
 		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
 
+	zr->stat_comb = dma_alloc_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, &zr->p_scb, GFP_KERNEL);
+	if (!zr->stat_comb) {
+		err = -ENOMEM;
+		goto exit_statcom;
+	}
+
 	/* Now add the template and register the device unit. */
 	*zr->video_dev = zoran_template;
 	zr->video_dev->v4l2_dev = &zr->v4l2_dev;
@@ -957,7 +963,7 @@ static int zr36057_init(struct zoran *zr)
 	zr->video_dev->vfl_dir = VFL_DIR_M2M;
 	err = video_register_device(zr->video_dev, VFL_TYPE_VIDEO, video_nr[zr->id]);
 	if (err < 0)
-		goto exit_statcom;
+		goto exit_statcomb;
 	video_set_drvdata(zr->video_dev, zr);
 
 	zoran_init_hardware(zr);
@@ -972,6 +978,8 @@ static int zr36057_init(struct zoran *zr)
 	zr->initialized = 1;
 	return 0;
 
+exit_statcomb:
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, zr->stat_comb, zr->p_scb);
 exit_statcom:
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
 exit_video:
@@ -1003,6 +1011,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	pci_free_irq(zr->pci_dev, 0, zr);
 	/* unmap and free memory */
 	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32), zr->stat_com, zr->p_sc);
+	dma_free_coherent(&zr->pci_dev->dev, BUZ_NUM_STAT_COM * sizeof(u32) * 2, zr->stat_comb, zr->p_scb);
 	pci_release_regions(pdev);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
-- 
2.26.2

