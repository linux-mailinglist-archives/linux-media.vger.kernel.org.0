Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9721B3B14D2
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhFWHie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:38:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:32810 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230202AbhFWHiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:38:22 -0400
X-UUID: e215b238cadd4e8598a42ad26459be46-20210623
X-UUID: e215b238cadd4e8598a42ad26459be46-20210623
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1782219528; Wed, 23 Jun 2021 15:35:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:35:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:35:57 +0800
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
Subject: [RFC PATCH V0 08/10] media: mtk-mdp3: remove illegal device node usage
Date:   Wed, 23 Jun 2021 15:35:47 +0800
Message-ID: <20210623073549.24170-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is used for review before send upstream patch.
From Rob Herring's review comment: device node can't use same
register address as other nodes'.
Remove illegal device nodes in device tree.
MDP's sub component init need to do corresponding modification.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 224 +++++++++++++-----
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |   2 +-
 2 files changed, 163 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 157ef9408ed3..e89fd02bb556 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -1016,23 +1016,15 @@ static const struct of_device_id mdp_comp_dt_ids[] = {
 	{}
 };
 
-static int mdp_comp_get_id(struct device *dev, struct device_node *node,
-			   enum mdp_comp_type type)
+static int mdp_comp_get_id(enum mdp_comp_type type, u32 alias_id)
 {
-	u32 alias_id;
-	int i, ret;
-
-	ret = of_property_read_u32(node, "mediatek,mdp-id", &alias_id);
-	if (ret)
-		return ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(mdp_comp_matches); i++)
 		if (mdp_comp_matches[i].type == type &&
 		    mdp_comp_matches[i].alias_id == alias_id)
 			return i;
-
-	dev_err(dev, "Failed to get id. type: %d, alias: %d\n", type, alias_id);
-	return -EINVAL;
+	return -ENODEV;
 }
 
 void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
@@ -1143,33 +1135,10 @@ static void __mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 	comp->reg_base = base;
 }
 
-static int mdp_mm_init(struct mdp_dev *mdp,
-		       struct mdp_comp *comp, const char *ref_name)
+static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
+			 struct mdp_comp *comp, enum mdp_comp_id id)
 {
-	struct device_node *node;
 	struct device *dev = &mdp->pdev->dev;
-
-	node = of_parse_phandle(dev->of_node, ref_name, 0);
-	if (!node) {
-		dev_err(dev, "Failed to parse dt %s\n", ref_name);
-		return -EINVAL;
-	}
-
-	__mdp_comp_init(mdp, node, comp);
-	mdp_get_subsys_id(dev, node, comp);
-	of_node_put(node);
-	if (!comp->reg_base) {
-		dev_err(dev, "Failed to init %s base\n", ref_name);
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static int mdp_comp_init(struct device *dev, struct mdp_dev *mdp,
-			 struct device_node *node, struct mdp_comp *comp,
-			 enum mdp_comp_id id)
-{
-	struct platform_device *pdev;
 	int i;
 
 	if (id < 0 || id >= MDP_MAX_COMP_COUNT) {
@@ -1191,32 +1160,140 @@ static int mdp_comp_init(struct device *dev, struct mdp_dev *mdp,
 
 	mdp_get_subsys_id(dev, node, comp);
 
-	/* Only DMA capable components need the pm control */
-	comp->comp_dev = NULL;
-	if (comp->type != MDP_COMP_TYPE_RDMA &&
-	    comp->type != MDP_COMP_TYPE_WROT &&
-		comp->type != MDP_COMP_TYPE_WDMA)
-		return 0;
+	return 0;
+}
 
-	pdev = of_find_device_by_node(node);
-	if (!pdev) {
-		dev_warn(dev, "can't find platform device of node:%s\n",
-			 node->name);
-		return -ENODEV;
+static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
+					struct device_node *node,
+					enum mdp_comp_id id)
+{
+	struct device *dev = &mdp->pdev->dev;
+	struct mdp_comp *comp;
+	int ret;
+
+	if (mdp->comp[id])
+		return ERR_PTR(-EEXIST);
+
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+	if (!comp)
+		return ERR_PTR(-ENOMEM);
+
+	ret = mdp_comp_init(mdp, node, comp, id);
+	if (ret) {
+		kfree(comp);
+		return ERR_PTR(ret);
 	}
+	mdp->comp[id] = comp;
+
+	dev_info(dev, "%s type:%d alias:%d id:%d base:%#x regs:%p\n",
+		dev->of_node->name, comp->type, comp->alias_id, id,
+		(u32)comp->reg_base, comp->regs);
+	return comp;
+}
 
-	comp->comp_dev = &pdev->dev;
-	pm_runtime_enable(comp->comp_dev);
+static int mdp_sub_comps_create(struct mdp_dev *mdp, struct device_node *node)
+{
+	struct device *dev = &mdp->pdev->dev;
+	struct property *prop;
+	const char *name;
+	int index = 0;
+
+	of_property_for_each_string(node, "mdp-comps", prop, name) {
+		const struct of_device_id *matches = mdp_comp_dt_ids;
+		enum mdp_comp_type type = MDP_COMP_NONE;
+		u32 alias_id;
+		int id, ret;
+		struct mdp_comp *comp;
 
+		for (; matches->compatible[0]; matches++) {
+			if (of_compat_cmp(name, matches->compatible,
+				strlen(matches->compatible)) == 0) {
+				type = (enum mdp_comp_type)matches->data;
+				break;
+			}
+		}
+
+		ret = of_property_read_u32_index(node, "mdp-comp-ids",
+			index, &alias_id);
+		if (ret) {
+			dev_warn(dev, "Skipping unknown component %s\n", name);
+			return ret;
+		}
+
+		id = mdp_comp_get_id(type, alias_id);
+		if (id < 0) {
+			dev_err(dev, "Failed to get component id: "
+				"%s type %d, alias %d\n", name, type, alias_id);
+			return -ENODEV;
+		}
+
+		comp = mdp_comp_create(mdp, node, id);
+		if (IS_ERR(comp))
+			return PTR_ERR(comp);
+
+		index++;
+	}
 	return 0;
 }
 
 static void mdp_comp_deinit(struct mdp_comp *comp)
 {
-	iounmap(comp->regs);
+	if (!comp)
+		return;
+
+	if (comp->regs)
+		iounmap(comp->regs);
 	/* of_node_put(comp->dev_node); */
 }
 
+static int mdp_imgi_init(struct mdp_dev *mdp, const char *ref_name)
+{
+	struct device_node *node;
+	struct device *dev = &mdp->pdev->dev;
+	int ret;
+
+	node = of_parse_phandle(dev->of_node, ref_name, 0);
+	if (!node) {
+		dev_err(dev, "Failed to parse dt %s\n", ref_name);
+		return -EINVAL;
+	}
+
+	ret = mdp_sub_comps_create(mdp, node);
+	of_node_put(node);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mdp_mm_init(struct mdp_dev *mdp, struct mdp_comp *comp,
+		       const char *ref_name)
+{
+	struct device_node *node;
+	struct device *dev = &mdp->pdev->dev;
+	int ret;
+
+	node = of_parse_phandle(dev->of_node, ref_name, 0);
+	if (!node) {
+		dev_err(dev, "Failed to parse dt %s\n", ref_name);
+		return -EINVAL;
+	}
+
+	__mdp_comp_init(mdp, node, comp);
+	mdp_get_subsys_id(dev, node, comp);
+	if (!comp->reg_base) {
+		dev_err(dev, "Failed to init %s base\n", ref_name);
+		of_node_put(node);
+		return -EINVAL;
+	}
+
+	ret = mdp_sub_comps_create(mdp, node);
+	of_node_put(node);
+	if (ret)
+		return ret;
+	return 0;
+}
+
 void mdp_component_deinit(struct mdp_dev *mdp)
 {
 	int i;
@@ -1235,6 +1312,8 @@ int mdp_component_init(struct mdp_dev *mdp)
 {
 	struct device *dev = &mdp->pdev->dev;
 	struct device_node *node, *parent;
+	struct platform_device *pdev;
+	u32 alias_id;
 	int i, ret;
 
 	for (i = RDMA0_SOF; i < MDP_MAX_EVENT_COUNT; i++) {
@@ -1260,7 +1339,11 @@ int mdp_component_init(struct mdp_dev *mdp)
 
 	ret = mdp_mm_init(mdp, &mdp->mm_mutex, "mediatek,mm-mutex");
 	if (ret)
-		goto err_init_mm;
+		goto err_init_comps;
+
+	ret = mdp_imgi_init(mdp, "mediatek,imgsys");
+	if (ret)
+		goto err_init_comps;
 
 	parent = dev->of_node->parent;
 	/* Iterate over sibling MDP function blocks */
@@ -1281,27 +1364,44 @@ int mdp_component_init(struct mdp_dev *mdp)
 		}
 
 		type = (enum mdp_comp_type)of_id->data;
-		id = mdp_comp_get_id(dev, node, type);
-		if (id < 0) {
+		ret = of_property_read_u32(node, "mediatek,mdp-id", &alias_id);
+		if (ret) {
 			dev_warn(dev, "Skipping unknown component %pOF\n",
 				 node);
 			continue;
 		}
+		id = mdp_comp_get_id(type, alias_id);
+		if (id < 0) {
+			dev_err(dev,
+				"Fail to get component id: type %d alias %d\n",
+				type, alias_id);
+			continue;
+		}
 
-		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
-		if (!comp) {
-			ret = -ENOMEM;
+		comp = mdp_comp_create(mdp, node, id);
+		if (IS_ERR(comp))
 			goto err_init_comps;
-		}
-		mdp->comp[id] = comp;
 
-		ret = mdp_comp_init(dev, mdp, node, comp, id);
+		ret = mdp_sub_comps_create(mdp, node);
 		if (ret)
 			goto err_init_comps;
 
-		dev_info(dev, "%s type:%d alias:%d id:%d base:%#x regs:%p\n",
-			 of_id->compatible, type, comp->alias_id, id,
-			(u32)comp->reg_base, comp->regs);
+		/* Only DMA capable components need the pm control */
+		comp->comp_dev = NULL;
+		if (comp->type != MDP_COMP_TYPE_RDMA &&
+		    comp->type != MDP_COMP_TYPE_WROT &&
+			comp->type != MDP_COMP_TYPE_WDMA)
+			continue;
+
+		pdev = of_find_device_by_node(node);
+		if (!pdev) {
+			dev_warn(dev, "can't find platform device of node:%s\n",
+				 node->name);
+			return -ENODEV;
+		}
+
+		comp->comp_dev = &pdev->dev;
+		pm_runtime_enable(comp->comp_dev);
 	}
 	return 0;
 
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index f201bced3c06..f5d514a51236 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -112,7 +112,7 @@ struct mdp_comp {
 	void __iomem			*regs;
 	phys_addr_t			reg_base;
 	u8				subsys_id;
-	struct clk			*clks[2];
+	struct clk			*clks[4];
 	struct device			*comp_dev;
 	enum mdp_comp_type		type;
 	enum mdp_comp_id		id;
-- 
2.18.0

