Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640D62888CA
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733241AbgJIMd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:33:56 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47904 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730142AbgJIMd4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 08:33:56 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 688D11796B7DAEA600FB;
        Fri,  9 Oct 2020 20:33:51 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 9 Oct 2020
 20:33:45 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <rick.chang@mediatek.com>, <bin.liu@mediatek.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
        <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
        <hverkuil-cisco@xs4all.nl>, <jcliang@chromium.org>,
        <minghsiu.tsai@mediatek.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH 4/7] media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_dec_pm()
Date:   Fri, 9 Oct 2020 20:38:01 +0800
Message-ID: <20201009123804.3977562-5-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201009123804.3977562-1-yukuai3@huawei.com>
References: <20201009123804.3977562-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

if of_find_device_by_node() succeed, mtk_vcodec_init_dec_pm() doesn't have
a corresponding put_device(). Thus add jump target to fix the exception
handling for this function implementation.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c    | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 36dfe3fc056a..f6a6b42865fb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -47,11 +47,14 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 		dec_clk->clk_info = devm_kcalloc(&pdev->dev,
 			dec_clk->clk_num, sizeof(*clk_info),
 			GFP_KERNEL);
-		if (!dec_clk->clk_info)
-			return -ENOMEM;
+		if (!dec_clk->clk_info) {
+			ret = -ENOMEM;
+			goto put_device;
+		}
 	} else {
 		mtk_v4l2_err("Failed to get vdec clock count");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_device;
 	}
 
 	for (i = 0; i < dec_clk->clk_num; i++) {
@@ -60,19 +63,22 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 			"clock-names", i, &clk_info->clk_name);
 		if (ret) {
 			mtk_v4l2_err("Failed to get clock name id = %d", i);
-			return ret;
+			goto put_device;
 		}
 		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
 			clk_info->clk_name);
 		if (IS_ERR(clk_info->vcodec_clk)) {
 			mtk_v4l2_err("devm_clk_get (%d)%s fail", i,
 				clk_info->clk_name);
-			return PTR_ERR(clk_info->vcodec_clk);
+			ret = PTR_ERR(clk_info->vcodec_clk);
+			goto put_device;
 		}
 	}
 
 	pm_runtime_enable(&pdev->dev);
-
+	return 0;
+put_device:
+	put_device(pm->larbvdec);
 	return ret;
 }
 
-- 
2.25.4

