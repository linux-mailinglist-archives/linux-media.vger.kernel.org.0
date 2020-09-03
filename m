Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8170C25CBF0
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 23:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgICVOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 17:14:32 -0400
Received: from foss.arm.com ([217.140.110.172]:41428 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgICVOb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 17:14:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAD9D1045;
        Thu,  3 Sep 2020 14:14:30 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 087773F68F;
        Thu,  3 Sep 2020 14:14:29 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     stanimir.varbanov@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: venus: core: Drop local dma_parms
Date:   Thu,  3 Sep 2020 22:14:26 +0100
Message-Id: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices"), struct platform_device already provides a
dma_parms structure, so we can save allocating another one.

Also the DMA segment size is simply a size, not a bitmask.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/media/platform/qcom/venus/core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 203c6538044f..2fa9275d75ff 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -226,13 +226,7 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (!dev->dma_parms) {
-		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
-					      GFP_KERNEL);
-		if (!dev->dma_parms)
-			return -ENOMEM;
-	}
-	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(dev, UINT_MAX);
 
 	INIT_LIST_HEAD(&core->instances);
 	mutex_init(&core->lock);
-- 
2.28.0.dirty

