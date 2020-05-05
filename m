Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A18F1C4CCF
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 06:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgEEEBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 00:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgEEEBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 00:01:24 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF63FC061A10
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 21:01:23 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a31so440295pje.1
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 21:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ctoh4fSKKdbnfncF1YOVBJD74K9A/+MRfOMQ6EjpdWU=;
        b=Ii8+KtILgS8kUQw30kWi/g6X8rQQSL7btnKUADBZbiGPsB7xgLrjW/n8WdNDKbgQWN
         tD0CyhvsndPuo5olMQnHe7XkJqOToYWcqesKzfNx4Cr9zVrfqs44PzQD1F0/aSptMOBL
         eUsczSXbwqFmnb3O1kmfFjGdB5/HS/Xh7TVSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ctoh4fSKKdbnfncF1YOVBJD74K9A/+MRfOMQ6EjpdWU=;
        b=JgSftzBkIWNQnsj1HiW5VdkLKTZbINYMjNgsM+RaFxGHgIO9+BcRaCv+Q6lcrcGtoQ
         EqXUjkx74GSns7PDvy6Iu0PP4bOYq06WQvYvGihuu8Z8uFGWEoUTNm/q8Ki16sXjMdcp
         5iC0rPUeAs/ES44IyUrc5OA8iacJRgw2FLmgStu42loZYumFj+Q8KCPjLcY57GKVYNiP
         1ri2uBPREDTo4yPqmF8wrsB8s2wnG20TUZEC8ywPrzhvHIthkRIff61YrOpsu7V7+FiF
         4dmtm7VjP0OXyY2CbnvsYfJrKU9Q7wXj0Zsqxb4vTRoQ5VthvTHwcBDMNsL60RSgiqkz
         oFKg==
X-Gm-Message-State: AGi0PubOzTll11+eJBBrnrX6nwWbR0SrWnFaZOqy1IWIWL9bYAznMMzf
        un9BtMGdDp6THAPrk77woYCKjg==
X-Google-Smtp-Source: APiQypIIEru/mWi8soSg13FgeYsWH8bdQu/U7isUmQMJNW8Y7jDjPHye4EUxOyOGu5+scYfufol+BQ==
X-Received: by 2002:a17:90a:7f83:: with SMTP id m3mr525112pjl.147.1588651283555;
        Mon, 04 May 2020 21:01:23 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id w2sm565152pfc.194.2020.05.04.21.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 21:01:23 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
X-Google-Original-From: Eizan Miyamoto <eizan@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@google.com>, eizan@chromium.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v1 2/5] [media] mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during probe
Date:   Tue,  5 May 2020 14:00:45 +1000
Message-Id: <20200505125042.v1.2.Ie596e59e0a18935f0b7321ff45e5c5f2ce8082b1@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200505040048.132493-1-eizan@google.com>
References: <20200505040048.132493-1-eizan@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a cleanup to better handle errors during MDP probe.

Signed-off-by: eizan@chromium.org
Signed-off-by: Eizan Miyamoto <eizan@google.com>
---

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index aeaed2cf4458..c20ac7681c6f 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -193,13 +193,19 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mdp);
 
-	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
+		goto err_set_max_seg_size;
+	}
 
 	pm_runtime_enable(dev);
 	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
 
 	return 0;
 
+err_set_max_seg_size:
+
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.26.2.526.g744177e7f7-goog

