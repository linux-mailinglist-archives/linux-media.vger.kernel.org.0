Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D2F5B9DD9
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 16:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiIOO4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 10:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiIOO4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 10:56:18 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5867B84EF4
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 07:56:17 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MT0ZM70bGznVDl;
        Thu, 15 Sep 2022 22:53:31 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 22:56:14 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 22:56:14 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>,
        <laurent.pinchart@ideasonboard.com>
Subject: [PATCH -next 07/13] media: stm32-dcmi: Switch to use dev_err_probe() helper
Date:   Thu, 15 Sep 2022 23:03:18 +0800
Message-ID: <20220915150324.688062-8-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915150324.688062-1-yangyingliang@huawei.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the probe path, dev_err() can be replace with dev_err_probe()
which will check if error code is -EPROBE_DEFER.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 27 +++++++-------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 2ca95ab2b0fe..ec138843d090 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1946,12 +1946,9 @@ static int dcmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dcmi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(dcmi->rstc)) {
-		if (PTR_ERR(dcmi->rstc) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get reset control\n");
-
-		return PTR_ERR(dcmi->rstc);
-	}
+	if (IS_ERR(dcmi->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dcmi->rstc),
+				     "Could not get reset control\n");
 
 	/* Get bus characteristics from devicetree */
 	np = of_graph_get_next_endpoint(np, NULL);
@@ -2003,20 +2000,14 @@ static int dcmi_probe(struct platform_device *pdev)
 	}
 
 	mclk = devm_clk_get(&pdev->dev, "mclk");
-	if (IS_ERR(mclk)) {
-		if (PTR_ERR(mclk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Unable to get mclk\n");
-		return PTR_ERR(mclk);
-	}
+	if (IS_ERR(mclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
+				     "Unable to get mclk\n");
 
 	chan = dma_request_chan(&pdev->dev, "tx");
-	if (IS_ERR(chan)) {
-		ret = PTR_ERR(chan);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"Failed to request DMA channel: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(chan))
+		return dev_err_probe(&pdev->dev, PTR_ERR(chan),
+				     "Failed to request DMA channel\n");
 
 	dcmi->dma_max_burst = UINT_MAX;
 	ret = dma_get_slave_caps(chan, &caps);
-- 
2.25.1

