Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D830C3ED2BE
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbhHPLBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:01:08 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53198 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236032AbhHPLBE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:01:04 -0400
X-UUID: 1967078d2e28441aad6b1e1da8d0cb6f-20210816
X-UUID: 1967078d2e28441aad6b1e1da8d0cb6f-20210816
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1880302440; Mon, 16 Aug 2021 19:00:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:27 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 16 Aug 2021 19:00:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:26 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 3/9] media: mtk-vcodec: Rewrite venc power manage interface
Date:   Mon, 16 Aug 2021 18:59:28 +0800
Message-ID: <20210816105934.28265-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The args "struct mtk_vcodec_dev *" doesn't appropriate for
init/release_enc_pm functions because of component devices. For
master device, it has no "pm/clk" properties in dtsi, component
devices will init their own "pm/clk" instead. So rewrite the pm
interface with args "platform_device *" and "mtk_vcodec_pm*".

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  6 ++--
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 13 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 31 +++++++------------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  5 +--
 4 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index f7538d4b5cbb..9c2224b199d0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -341,7 +341,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
 	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE) {
-		ret = mtk_vcodec_init_enc_pm(dev);
+		ret = mtk_vcodec_init_enc_pm(dev->plat_dev, &dev->pm);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
 			goto err_enc_pm;
@@ -471,7 +471,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
 	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE)
-		mtk_vcodec_release_enc_pm(dev);
+		mtk_vcodec_release_enc_pm(&dev->pm);
 err_enc_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -568,7 +568,7 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 
 	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE)
-		mtk_vcodec_release_enc_pm(dev);
+		mtk_vcodec_release_enc_pm(&dev->pm);
 
 	mtk_vcodec_fw_release(dev->fw_handler);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
index 4e6a8a81ff67..2a9112b0561d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 
 #include "mtk_vcodec_enc_hw.h"
+#include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_enc.h"
 
 static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
@@ -105,6 +106,14 @@ static int mtk_venc_comp_probe(struct platform_device *pdev)
 
 	comp_dev->plat_dev = pdev;
 
+	ret = mtk_vcodec_init_enc_pm(pdev, &comp_dev->pm);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get venc component clock source!");
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
 	comp_dev->core_id =
 		(enum mtk_venc_hw_id)of_device_get_match_data(&pdev->dev);
 
@@ -146,11 +155,15 @@ static int mtk_venc_comp_probe(struct platform_device *pdev)
 
 	return 0;
 err:
+	mtk_vcodec_release_enc_pm(&comp_dev->pm);
 	return ret;
 }
 
 static int mtk_venc_comp_remove(struct platform_device *pdev)
 {
+	struct mtk_venc_comp_dev *comp_dev = platform_get_drvdata(pdev);
+
+	mtk_vcodec_release_enc_pm(&comp_dev->pm);
 	component_del(&pdev->dev, &mtk_venc_component_ops);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1b2e4930ed27..5edeb93fca84 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -13,38 +13,29 @@
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
+int mtk_vcodec_init_enc_pm(struct platform_device *pdev,
+			   struct mtk_vcodec_pm *pm)
 {
 	struct device_node *node;
-	struct platform_device *pdev;
-	struct mtk_vcodec_pm *pm;
+	struct platform_device *larb_pdev;
 	struct mtk_vcodec_clk *enc_clk;
 	struct mtk_vcodec_clk_info *clk_info;
 	int ret = 0, i = 0;
-	struct device *dev;
 
-	pdev = mtkdev->plat_dev;
-	pm = &mtkdev->pm;
-	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
-	pm->mtkdev = mtkdev;
-	pm->dev = &pdev->dev;
-	dev = &pdev->dev;
-	enc_clk = &pm->venc_clk;
-
-	node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
+	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
 	if (!node) {
 		mtk_v4l2_err("no mediatek,larb found");
 		return -ENODEV;
 	}
-	pdev = of_find_device_by_node(node);
+	larb_pdev = of_find_device_by_node(node);
 	of_node_put(node);
-	if (!pdev) {
+	if (!larb_pdev) {
 		mtk_v4l2_err("no mediatek,larb device found");
 		return -ENODEV;
 	}
-	pm->larbvenc = &pdev->dev;
-	pdev = mtkdev->plat_dev;
+	pm->larbvenc = &larb_pdev->dev;
 	pm->dev = &pdev->dev;
+	enc_clk = &pm->venc_clk;
 
 	enc_clk->clk_num = of_property_count_strings(pdev->dev.of_node,
 		"clock-names");
@@ -87,10 +78,10 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	return ret;
 }
 
-void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
+void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm)
 {
-	pm_runtime_disable(mtkdev->pm.dev);
-	put_device(mtkdev->pm.larbvenc);
+	pm_runtime_disable(pm->dev);
+	put_device(pm->larbvenc);
 }
 
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index b7ecdfd74823..f4a4aa441185 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -9,8 +9,9 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *dev);
-void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_init_enc_pm(struct platform_device *pdev,
+			   struct mtk_vcodec_pm *pm);
+void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm);
 
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
-- 
2.25.1

