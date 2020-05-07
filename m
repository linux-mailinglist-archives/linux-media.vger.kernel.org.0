Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58111C8695
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 12:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgEGKYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 06:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726007AbgEGKYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 06:24:32 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49949C061A10
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 03:24:32 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r4so2650567pgg.4
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 03:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uayLP2IQIIMajpdlHbzdkBKHnRVFxtyMOMcfphNpLD0=;
        b=GNMgHUHacwUvRBlDY0qArxRb4Pu+eWtZHMaGVHLWsilTyL8VGV+tTJxWb2nMRZdoEr
         xamhmauOh8CrNbLvXypYcr9cM5xkCl36Xi5ODaECqcmO8/fbNNAhFJBSKsPF8+d+2rW6
         t52imrK2WKyuJMQ4xYUNExzjoG8mXm/7OAnQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uayLP2IQIIMajpdlHbzdkBKHnRVFxtyMOMcfphNpLD0=;
        b=QkE0pBl0+na5J78PKrQAfLKJ2qSSGNSrD3dFJndPReAtQOlEhYTcwmq4uuOihXB154
         FZIXNc5mMnW/M3SK2Jxd3qxTho2DerPvA4zpVOKRJCIcO10eYR/Qr9DyTS3CatYnPamu
         eNuwYB5fzK684R6QljArodzD3a69Oo7wryGQs0knSEKsVGbJlgW1a+/aRp9J54TvzmRq
         f5vjB4dUEkjVqlHnnSzquF3JpWjTGhrzEvnP5esQ1ayk+dXLxSQF+yBMsVIOji3fDMAe
         yI9IHC4qoqqcSdY9Oeis06UOwO8mzXdZc2xTpTQnm8d2zKRwQu7/WIdokY2YCcL4DewA
         9a4A==
X-Gm-Message-State: AGi0PuZXR8vI6xj5/6IxyCLjQ4r7cU3dWkHZS7Hk7kafDA5MVH1TrWbp
        XweCaElvu6sVp/6GhFe5gH0pNg==
X-Google-Smtp-Source: APiQypLYecQMcanYHXpWS67HlqoWpLrEJDzi2gez5ZNWrCDgTREBk/pph4o5wU3OqaQZOryRyKhRBw==
X-Received: by 2002:a63:a61:: with SMTP id z33mr10826593pgk.440.1588847071729;
        Thu, 07 May 2020 03:24:31 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id 6sm4503318pfj.123.2020.05.07.03.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 03:24:31 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/5] [media] mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during probe
Date:   Thu,  7 May 2020 20:23:44 +1000
Message-Id: <20200507202337.v3.2.If340fa06d86053aaea25841b36741fe69c3126dd@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200507102345.81849-1-eizan@chromium.org>
References: <20200507102345.81849-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a cleanup to better handle errors during MDP probe.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2:
- remove unnecessary error handling labels in favor of err_m2m_register

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index aeaed2cf4458..9b24b8d46eb7 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -193,7 +193,11 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mdp);
 
-	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
+		goto err_m2m_register;
+	}
 
 	pm_runtime_enable(dev);
 	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
-- 
2.26.2.526.g744177e7f7-goog

