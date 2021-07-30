Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149C93DB175
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 04:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbhG3Cym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 22:54:42 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50896 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235022AbhG3Cyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 22:54:41 -0400
X-UUID: bc12429d94b84cc7a9980c1a7e1fa7d4-20210730
X-UUID: bc12429d94b84cc7a9980c1a7e1fa7d4-20210730
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1634193771; Fri, 30 Jul 2021 10:54:35 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:54:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 10:54:29 +0800
From:   Yong Wu <yong.wu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
        <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, <anan.sun@mediatek.com>,
        <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
        <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>,
        <anthony.huang@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v7 06/12] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
Date:   Fri, 30 Jul 2021 10:52:32 +0800
Message-ID: <20210730025238.22456-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MediaTek IOMMU has already added the device_link between the consumer
and smi-larb device. If the mdp device call the pm_runtime_get_sync,
the smi-larb's pm_runtime_get_sync also be called automatically.

CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
CC: Houlong Wei <houlong.wei@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com> # on mt8173
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
 3 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index de2d425efdd1..5e0ea83a9f7f 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -13,7 +13,6 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-#include <soc/mediatek/smi.h>
 #include <linux/pm_runtime.h>
 
 #include "mtk_mdp_comp.h"
@@ -57,13 +56,6 @@ int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
 	int status, err;
 
-	if (comp->larb_dev) {
-		err = mtk_smi_larb_get(comp->larb_dev);
-		if (err)
-			dev_err(comp->dev,
-				"failed to get larb, err %d.\n", err);
-	}
-
 	err = pm_runtime_get_sync(comp->dev);
 	if (err < 0) {
 		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
@@ -146,9 +138,6 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 			continue;
 		clk_disable_unprepare(comp->clk[i]);
 	}
-
-	if (comp->larb_dev)
-		mtk_smi_larb_put(comp->larb_dev);
 }
 
 /*
@@ -236,9 +225,6 @@ static const struct component_ops mtk_mdp_component_ops = {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 {
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
-	int ret;
 	int i;
 	struct device_node *node = dev->of_node;
 	enum mtk_mdp_comp_type comp_type =
@@ -252,8 +238,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 		if (IS_ERR(comp->clk[i])) {
 			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get clock\n");
-			ret = PTR_ERR(comp->clk[i]);
-			goto err;
+			return PTR_ERR(comp->clk[i]);
 		}
 
 		/* Only RDMA needs two clocks */
@@ -261,36 +246,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 			break;
 	}
 
-	/* Only DMA capable components need the LARB property */
-	comp->larb_dev = NULL;
-	if (comp_type != MTK_MDP_RDMA &&
-	    comp_type != MTK_MDP_WDMA &&
-	    comp_type != MTK_MDP_WROT)
-		return 0;
-
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev,
-			"Missing mediadek,larb phandle in %pOF node\n", node);
-		ret = -EINVAL;
-		goto err;
-	}
-
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		ret = -EPROBE_DEFER;
-		goto err;
-	}
-	of_node_put(larb_node);
-
-	comp->larb_dev = &larb_pdev->dev;
-
 	return 0;
-
-err:
-	return ret;
 }
 
 static int mtk_mdp_comp_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 5201c47f7baa..2bd229cc7eae 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -11,13 +11,11 @@
  * struct mtk_mdp_comp - the MDP's function component data
  * @node:	list node to track sibing MDP components
  * @clk:	clocks required for component
- * @larb_dev:	SMI device required for component
  * @dev:	component's device
  */
 struct mtk_mdp_comp {
 	struct list_head	node;
 	struct clk		*clk[2];
-	struct device           *larb_dev;
 	struct device		*dev;
 };
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index e1fb39231248..be7d35b3e3ff 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
-#include <soc/mediatek/smi.h>
 
 #include "mtk_mdp_comp.h"
 #include "mtk_mdp_core.h"
-- 
2.18.0

