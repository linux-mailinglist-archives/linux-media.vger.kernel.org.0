Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B61C2888CE
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388573AbgJIMeI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:34:08 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:47918 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733276AbgJIMd6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 08:33:58 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 608A8BE9F70EC95BF8F0;
        Fri,  9 Oct 2020 20:33:56 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 9 Oct 2020
 20:33:47 +0800
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
Subject: [PATCH 6/7] media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_enc_pm()
Date:   Fri, 9 Oct 2020 20:38:03 +0800
Message-ID: <20201009123804.3977562-7-yukuai3@huawei.com>
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

if of_find_device_by_node() succeed, mtk_vcodec_init_enc_pm() doesn't have
a corresponding put_device(). Thus add jump target to fix the exception
handling for this function implementation.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 26 ++++++++++++++-----
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index ee22902aaa71..1a047c25679f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -47,14 +47,16 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	node = of_parse_phandle(dev->of_node, "mediatek,larb", 1);
 	if (!node) {
 		mtk_v4l2_err("no mediatek,larb found");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_larbvenc;
 	}
 
 	pdev = of_find_device_by_node(node);
 	of_node_put(node);
 	if (!pdev) {
 		mtk_v4l2_err("no mediatek,larb device found");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_larbvenc;
 	}
 
 	pm->larbvenclt = &pdev->dev;
@@ -67,11 +69,14 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 		enc_clk->clk_info = devm_kcalloc(&pdev->dev,
 			enc_clk->clk_num, sizeof(*clk_info),
 			GFP_KERNEL);
-		if (!enc_clk->clk_info)
-			return -ENOMEM;
+		if (!enc_clk->clk_info) {
+			ret = -ENOMEM;
+			goto put_larbvenclt;
+		}
 	} else {
 		mtk_v4l2_err("Failed to get venc clock count");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_larbvenclt;
 	}
 
 	for (i = 0; i < enc_clk->clk_num; i++) {
@@ -80,17 +85,24 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 			"clock-names", i, &clk_info->clk_name);
 		if (ret) {
 			mtk_v4l2_err("venc failed to get clk name %d", i);
-			return ret;
+			goto put_larbvenclt;
 		}
 		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
 			clk_info->clk_name);
 		if (IS_ERR(clk_info->vcodec_clk)) {
 			mtk_v4l2_err("venc devm_clk_get (%d)%s fail", i,
 				clk_info->clk_name);
-			return PTR_ERR(clk_info->vcodec_clk);
+			ret = PTR_ERR(clk_info->vcodec_clk);
+			goto put_larbvenclt;
 		}
 	}
 
+	return 0;
+
+put_larbvenclt:
+	put_device(pm->larbvenclt);
+put_larbvenc:
+	put_device(pm->larbvenc);
 	return ret;
 }
 
-- 
2.25.4

