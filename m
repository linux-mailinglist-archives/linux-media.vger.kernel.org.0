Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC9A624519
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 16:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiKJPHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 10:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiKJPHY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 10:07:24 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C851E70C
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 07:07:22 -0800 (PST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N7Q8x50lhzJn3h;
        Thu, 10 Nov 2022 23:04:17 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 23:07:20 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 10 Nov
 2022 23:07:19 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC:     <bin.liu@mediatek.com>, <mchehab@kernel.org>,
        <matthias.bgg@gmail.com>, <kyrie.wu@mediatek.com>,
        <irui.wang@mediatek.com>, <hverkuil-cisco@xs4all.nl>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] media: mtk-jpegdec: add missing destroy_workqueue()
Date:   Thu, 10 Nov 2022 23:05:59 +0800
Message-ID: <20221110150559.390448-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

destroy_workqueue() needs be called to when driver is
unloading, fix it by using devm_add_action_or_reset()
to make workqueuedevice-managed.

Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index d98f4cdfeea9..8c07fa02fd9a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -580,6 +580,11 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
 	return 0;
 }
 
+static void mtk_jpegdec_destroy_workqueue(void *data)
+{
+	destroy_workqueue(data);
+}
+
 static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegdec_clk *jpegdec_clk;
@@ -614,6 +619,11 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 								| WQ_FREEZABLE);
 		if (!master_dev->workqueue)
 			return -EINVAL;
+
+		ret = devm_add_action_or_reset(&pdev->dev, mtk_jpegdec_destroy_workqueue,
+					       master_dev->workqueue);
+		if (ret)
+			return ret;
 	}
 
 	atomic_set(&master_dev->dechw_rdy, MTK_JPEGDEC_HW_MAX);
-- 
2.25.1

