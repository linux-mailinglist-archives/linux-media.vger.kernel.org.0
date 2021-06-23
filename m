Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2C23B14C4
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhFWHiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:38:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:32792 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230189AbhFWHiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:38:20 -0400
X-UUID: 7ecef9c80dd74b319bfc22e54ffb7d48-20210623
X-UUID: 7ecef9c80dd74b319bfc22e54ffb7d48-20210623
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 655790490; Wed, 23 Jun 2021 15:35:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:35:56 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <acourbot@chromium.org>,
        <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
        <srv_heupstream@mediatek.com>, <frederic.chen@mediatek.com>
Subject: [RFC PATCH V0 03/10] media: mtk-mdp3: revise suspend strategy
Date:   Wed, 23 Jun 2021 15:35:42 +0800
Message-ID: <20210623073549.24170-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

1.The wait queue check for incomplete running task
  should be put in mdp_suspend instead of mdp_pm_suspend;
  Due to mdp_suspend could be called while task is running;
  Add error return value in suspend fail situation.
2.modify dma modules' power control from larb device to modules'
  device self;
  For support real mdp_pm_suspend callback.

Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 36 ++++++++-----------
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  2 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 34 +++++-------------
 3 files changed, 23 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 3033cd32340c..23dd413f3423 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -1039,8 +1039,8 @@ void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 {
 	int i, err;
 
-	if (comp->larb_dev) {
-		err = pm_runtime_get_sync(comp->larb_dev);
+	if (comp->comp_dev) {
+		err = pm_runtime_get_sync(comp->comp_dev);
 		if (err < 0)
 			dev_err(dev,
 				"Failed to get larb, err %d. type:%d id:%d\n",
@@ -1068,8 +1068,8 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
 		clk_disable_unprepare(comp->clks[i]);
 	}
 
-	if (comp->larb_dev)
-		pm_runtime_put(comp->larb_dev);
+	if (comp->comp_dev)
+		pm_runtime_put(comp->comp_dev);
 }
 
 static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
@@ -1153,8 +1153,7 @@ static int mdp_comp_init(struct device *dev, struct mdp_dev *mdp,
 			 struct device_node *node, struct mdp_comp *comp,
 			 enum mdp_comp_id id)
 {
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
+	struct platform_device *pdev;
 	int i;
 
 	if (id < 0 || id >= MDP_MAX_COMP_COUNT) {
@@ -1176,29 +1175,22 @@ static int mdp_comp_init(struct device *dev, struct mdp_dev *mdp,
 
 	mdp_get_subsys_id(dev, node, comp);
 
-	/* Only DMA capable components need the LARB property */
-	comp->larb_dev = NULL;
+	/* Only DMA capable components need the pm control */
+	comp->comp_dev = NULL;
 	if (comp->type != MDP_COMP_TYPE_RDMA &&
 	    comp->type != MDP_COMP_TYPE_WROT &&
 		comp->type != MDP_COMP_TYPE_WDMA)
 		return 0;
 
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev, "Missing mediatek,larb phandle in %pOF node\n",
-			node);
-		return -EINVAL;
-	}
-
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		return -EPROBE_DEFER;
+	pdev = of_find_device_by_node(node);
+	if (!pdev) {
+		dev_warn(dev, "can't find platform device of node:%s\n",
+			 node->name);
+		return -ENODEV;
 	}
-	of_node_put(larb_node);
 
-	comp->larb_dev = &larb_pdev->dev;
+	comp->comp_dev = &pdev->dev;
+	pm_runtime_enable(comp->comp_dev);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 77d2c3e989c4..27d58dc51dce 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -113,7 +113,7 @@ struct mdp_comp {
 	phys_addr_t			reg_base;
 	u8				subsys_id;
 	struct clk			*clks[2];
-	struct device			*larb_dev;
+	struct device			*comp_dev;
 	enum mdp_comp_type		type;
 	enum mdp_comp_id		id;
 	u32				alias_id;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 4a59dec8cfd9..eaf5b07e720f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -152,7 +152,6 @@ static int mdp_probe(struct platform_device *pdev)
 #endif
 
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
-	pm_runtime_enable(dev);
 
 	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
 	if (ret) {
@@ -212,7 +211,7 @@ static int mdp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused mdp_pm_suspend(struct device *dev)
+static int __maybe_unused mdp_suspend(struct device *dev)
 {
 	struct mdp_dev *mdp = dev_get_drvdata(dev);
 	int ret;
@@ -222,19 +221,19 @@ static int __maybe_unused mdp_pm_suspend(struct device *dev)
 	if (atomic_read(&mdp->job_count)) {
 		ret = wait_event_timeout(mdp->callback_wq,
 					 !atomic_read(&mdp->job_count),
-					 HZ);
-		if (ret == 0)
+					 2 * HZ);
+		if (ret == 0) {
 			dev_err(dev,
-				"%s:flushed cmdq task incomplete\n",
-				__func__);
-		else//need to remove
-			pr_err("%s:ret=%d\n", __func__, ret);
+				"%s:flushed cmdq task incomplete, count=%d\n",
+				__func__, atomic_read(&mdp->job_count));
+			return -EBUSY;
+		}
 	}
 
 	return 0;
 }
 
-static int __maybe_unused mdp_pm_resume(struct device *dev)
+static int __maybe_unused mdp_resume(struct device *dev)
 {
 	struct mdp_dev *mdp = dev_get_drvdata(dev);
 
@@ -243,25 +242,8 @@ static int __maybe_unused mdp_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mdp_suspend(struct device *dev)
-{
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return mdp_pm_suspend(dev);
-}
-
-static int __maybe_unused mdp_resume(struct device *dev)
-{
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	return mdp_pm_resume(dev);
-}
-
 static const struct dev_pm_ops mdp_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(mdp_suspend, mdp_resume)
-	SET_RUNTIME_PM_OPS(mdp_pm_suspend, mdp_pm_resume, NULL)
 };
 
 static struct platform_driver mdp_driver = {
-- 
2.18.0

