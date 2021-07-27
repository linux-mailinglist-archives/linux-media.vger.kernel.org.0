Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A0C3D72B8
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 12:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbhG0KLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 06:11:39 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:56578 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236103AbhG0KLg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 06:11:36 -0400
X-UUID: 7ff413f0f54f4d69ac6794845da9efef-20210727
X-UUID: 7ff413f0f54f4d69ac6794845da9efef-20210727
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2051952558; Tue, 27 Jul 2021 18:11:32 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 18:11:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Jul 2021 18:11:29 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3, 04/15] media: mtk-vcodec: Use component framework to manage each hardware information
Date:   Tue, 27 Jul 2021 18:10:40 +0800
Message-ID: <20210727101051.24418-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210727101051.24418-1-yunfei.dong@mediatek.com>
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Uses component framework to manage each hardware information which
includes irq/power/clk. The hardware includes LAT0, LAT1 and CORE.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v3:
1: fix of_node_put no correctly
2: remove useless functions
3: change is_support_comp to is_comp_supported
4: fix some coding comments
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 211 +++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 184 +++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  44 ++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  24 ++
 6 files changed, 431 insertions(+), 34 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index ca8e9e7a9c4e..edeb3b66e9e9 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -15,6 +15,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
+		mtk_vcodec_dec_hw.o \
 
 mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		venc/venc_h264_if.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 9fbd24186c1a..c509224cbff4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -66,6 +66,7 @@ extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
 extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
 
+extern struct platform_driver mtk_vdec_comp_driver;
 
 /*
  * mtk_vdec_lock/mtk_vdec_unlock are for ctx instance to
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e8b2a6355b3e..a3653d40a579 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -5,6 +5,7 @@
  *         Tiffany Lin <tiffany.lin@mediatek.com>
  */
 
+#include <linux/component.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -23,14 +24,92 @@
 #include "mtk_vcodec_util.h"
 #include "mtk_vcodec_fw.h"
 
-#define VDEC_HW_ACTIVE	0x10
-#define VDEC_IRQ_CFG	0x11
-#define VDEC_IRQ_CLR	0x10
-#define VDEC_IRQ_CFG_REG	0xa4
-
 module_param(mtk_v4l2_dbg_level, int, 0644);
 module_param(mtk_vcodec_dbg, bool, 0644);
 
+static struct of_device_id mtk_vdec_drv_ids[] = {
+	{
+		.compatible = "mediatek,mtk-vcodec-lat",
+		.data = (void *)MTK_VDEC_LAT0,
+	},
+	{
+		.compatible = "mediatek,mtk-vcodec-core",
+		.data = (void *)MTK_VDEC_CORE,
+	},
+	{},
+};
+
+static inline int mtk_vdec_compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static inline void mtk_vdec_release_of(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+
+static inline int mtk_vdec_bind(struct device *dev)
+{
+	struct mtk_vcodec_dev *data = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, data);
+}
+
+static inline void mtk_vdec_unbind(struct device *dev)
+{
+	struct mtk_vcodec_dev *data = dev_get_drvdata(dev);
+
+	component_unbind_all(dev, data);
+}
+
+static const struct component_master_ops mtk_vdec_ops = {
+   .bind = mtk_vdec_bind,
+   .unbind = mtk_vdec_unbind,
+};
+
+static struct component_match *mtk_vcodec_match_add(
+	struct mtk_vcodec_dev *vdec_dev)
+ {
+	struct platform_device *pdev = vdec_dev->plat_dev;
+	struct component_match *match = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_vdec_drv_ids); i++) {
+		struct device_node *comp_node;
+		enum mtk_vdec_hw_id comp_idx;
+		const struct of_device_id *of_id;
+
+		comp_node = of_find_compatible_node(NULL, NULL,
+			mtk_vdec_drv_ids[i].compatible);
+		if (!comp_node)
+			continue;
+
+		if (!of_device_is_available(comp_node)) {
+			of_node_put(comp_node);
+			dev_err(&pdev->dev, "Fail to get MMSYS node\n");
+			continue;
+		}
+
+		of_id = &mtk_vdec_drv_ids[i];
+		if (!of_id) {
+			dev_err(&pdev->dev, "Failed to get match node\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		comp_idx = (enum mtk_vdec_hw_id)of_id->data;
+		mtk_v4l2_debug(4, "Get component:hw_id(%d),vdec_dev(0x%p),comp_node(0x%p)\n",
+			comp_idx, vdec_dev, comp_node);
+		vdec_dev->component_node[comp_idx] = comp_node;
+
+		component_match_add_release(&pdev->dev, &match, mtk_vdec_release_of,
+			mtk_vdec_compare_of, comp_node);
+		of_node_put(comp_node);
+	}
+
+   return match;
+}
+
 static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -95,6 +174,59 @@ static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
 	return ret;
 }
 
+static int mtk_vcodec_init_master(struct mtk_vcodec_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	struct component_match *match;
+	int ret;
+
+	match = mtk_vcodec_match_add(dev);
+	if (IS_ERR_OR_NULL(match))
+		return -EINVAL;
+
+	platform_set_drvdata(pdev, dev);
+	ret = component_master_add_with_match(&pdev->dev, &mtk_vdec_ops, match);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	ret = mtk_vcodec_get_reg_bases(dev);
+	if (ret)
+		return ret;
+
+	if (!dev->is_comp_supported) {
+		dev->dec_irq = platform_get_irq(pdev, 0);
+		if (dev->dec_irq < 0) {
+			dev_err(&pdev->dev, "failed to get irq number");
+			return dev->dec_irq;
+		}
+
+		irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
+		ret = devm_request_irq(&pdev->dev, dev->dec_irq,
+				mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to install dev->dec_irq %d (%d)",
+				dev->dec_irq, ret);
+			return ret;
+		}
+
+		ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to get mt vcodec clock source");
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -220,9 +352,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev;
 	struct video_device *vfd_dec;
-	struct resource *res;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
+	struct device_node *comp_node;
 	int ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -249,31 +381,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
-	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
-		goto err_dec_pm;
-	}
-
-	ret = mtk_vcodec_get_reg_bases(dev);
-	if (ret)
-		goto err_res;
-
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "failed to get irq resource");
-		ret = -ENOENT;
-		goto err_res;
-	}
+	comp_node =
+		of_find_compatible_node(NULL, NULL, "mediatek,mtk-vcodec-core");
+	if (!comp_node)
+		dev->is_comp_supported = false;
+	else
+		dev->is_comp_supported = true;
+	of_node_put(comp_node);
 
-	dev->dec_irq = platform_get_irq(pdev, 0);
-	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
-	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
-			mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
+	ret = mtk_vcodec_init_dec_params(dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
-			dev->dec_irq,
-			ret);
+		dev_err(&pdev->dev, "Failed to init pm and registers");
 		goto err_res;
 	}
 
@@ -311,7 +429,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		MTK_VCODEC_DEC_NAME);
 	video_set_drvdata(vfd_dec, dev);
 	dev->vfd_dec = vfd_dec;
-	platform_set_drvdata(pdev, dev);
 
 	dev->m2m_dev_dec = v4l2_m2m_init(&mtk_vdec_m2m_ops);
 	if (IS_ERR((__force void *)dev->m2m_dev_dec)) {
@@ -362,8 +479,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
 		vfd_dec->num);
 
-	return 0;
+	if (dev->is_comp_supported) {
+		ret = mtk_vcodec_init_master(dev);
+		if (ret < 0)
+			goto err_component_match;
+	} else {
+		platform_set_drvdata(pdev, dev);
+	}
 
+	return 0;
+err_component_match:
+	video_unregister_device(vfd_dec);
 err_dec_reg:
 	if (dev->vdec_pdata->uses_stateless_api)
 		media_device_unregister(&dev->mdev_dec);
@@ -379,9 +505,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_dec_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
-	mtk_vcodec_release_dec_pm(&dev->pm);
-err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
+
 	return ret;
 }
 
@@ -436,7 +561,25 @@ static struct platform_driver mtk_vcodec_dec_driver = {
 	},
 };
 
-module_platform_driver(mtk_vcodec_dec_driver);
+static struct platform_driver * const mtk_vdec_drivers[] = {
+	&mtk_vdec_comp_driver,
+	&mtk_vcodec_dec_driver,
+};
+
+static int __init mtk_vdec_init(void)
+{
+	return platform_register_drivers(mtk_vdec_drivers,
+					 ARRAY_SIZE(mtk_vdec_drivers));
+}
+
+static void __exit mtk_vdec_exit(void)
+{
+	platform_unregister_drivers(mtk_vdec_drivers,
+				    ARRAY_SIZE(mtk_vdec_drivers));
+}
+
+module_init(mtk_vdec_init);
+module_exit(mtk_vdec_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Mediatek video codec V4L2 decoder driver");
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
new file mode 100644
index 000000000000..5e1b7670ba5b
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include <linux/component.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+#include "mtk_vcodec_drv.h"
+#include "mtk_vcodec_dec.h"
+#include "mtk_vcodec_dec_hw.h"
+#include "mtk_vcodec_dec_pm.h"
+#include "mtk_vcodec_intr.h"
+#include "mtk_vcodec_util.h"
+
+static int mtk_vdec_comp_bind(struct device *dev, struct device *master,
+	void *data)
+{
+	struct mtk_vdec_comp_dev *comp_dev = dev_get_drvdata(dev);
+	struct mtk_vcodec_dev *master_dev = data;
+	int i;
+
+	for (i = 0; i < MTK_VDEC_HW_MAX; i++) {
+		if (dev->of_node != master_dev->component_node[i])
+			continue;
+
+		master_dev->comp_dev[i] = comp_dev;
+		comp_dev->comp_idx = i;
+		comp_dev->master_dev = master_dev;
+		break;
+	}
+
+	if (i == MTK_VDEC_HW_MAX) {
+		dev_err(dev, "Failed to get component node\n");
+		return -EINVAL;
+	}
+
+	comp_dev->reg_base[VDEC_COMP_SYS] =
+		master_dev->reg_base[VDEC_COMP_SYS];
+	return 0;
+}
+
+static void mtk_vdec_comp_unbind(struct device *dev, struct device *master,
+	void *data)
+{
+	struct mtk_vdec_comp_dev *comp_dev = dev_get_drvdata(dev);
+
+	comp_dev->reg_base[VDEC_COMP_SYS] = NULL;
+}
+
+static const struct component_ops mtk_vdec_hw_component_ops = {
+	.bind = mtk_vdec_comp_bind,
+	.unbind = mtk_vdec_comp_unbind,
+};
+
+static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
+{
+	struct mtk_vdec_comp_dev *dev = priv;
+	struct mtk_vcodec_ctx *ctx;
+	u32 cg_status;
+	unsigned int dec_done_status;
+	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_COMP_MISC] +
+					VDEC_IRQ_CFG_REG;
+
+	ctx = mtk_vcodec_get_curr_ctx(dev->master_dev);
+
+	/* check if HW active or not */
+	cg_status = readl(dev->reg_base[VDEC_COMP_SYS]);
+	if ((cg_status & VDEC_HW_ACTIVE) != 0) {
+		mtk_v4l2_err("vdec active is not 0x0 (0x%08x)",
+			cg_status);
+		return IRQ_HANDLED;
+	}
+
+	dec_done_status = readl(vdec_misc_addr);
+	if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
+		MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
+		return IRQ_HANDLED;
+
+	/* clear interrupt */
+	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
+	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
+
+	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
+
+	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
+		ctx->id, dec_done_status);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_vdec_comp_init_irq(struct mtk_vdec_comp_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	dev->dec_irq = platform_get_irq(pdev, 0);
+	if (dev->dec_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq resource");
+		return dev->dec_irq;
+	}
+
+	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
+				mtk_vdec_comp_irq_handler, 0, pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d (%d)",
+			dev->dec_irq, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_vdec_comp_probe(struct platform_device *pdev)
+{
+	struct mtk_vdec_comp_dev *dev;
+	int ret;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->plat_dev = pdev;
+	ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
+		return ret;
+	}
+
+	dev->reg_base[VDEC_COMP_MISC] =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR((__force void *)dev->reg_base[VDEC_COMP_MISC])) {
+		ret = PTR_ERR((__force void *)dev->reg_base[VDEC_COMP_MISC]);
+		goto err;
+	}
+
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+
+	ret = mtk_vdec_comp_init_irq(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register irq handler.\n");
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, dev);
+
+	ret = component_add(&pdev->dev, &mtk_vdec_hw_component_ops);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add component: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+err:
+	mtk_vcodec_release_dec_pm(&dev->pm);
+	return ret;
+}
+
+static const struct of_device_id mtk_vdec_comp_ids[] = {
+	{
+		.compatible = "mediatek,mtk-vcodec-lat",
+	},
+	{
+		.compatible = "mediatek,mtk-vcodec-core",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_vdec_comp_ids);
+
+struct platform_driver mtk_vdec_comp_driver = {
+	.probe	= mtk_vdec_comp_probe,
+	.driver	= {
+		.name	= "mtk-vdec-comp",
+		.of_match_table = mtk_vdec_comp_ids,
+	},
+};
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
new file mode 100644
index 000000000000..60c97dff0959
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef _MTK_VCODEC_DEC_HW_H_
+#define _MTK_VCODEC_DEC_HW_H_
+
+#include <linux/io.h>
+#include <linux/platform_device.h>
+
+#include "mtk_vcodec_drv.h"
+
+/**
+ * enum mtk_comp_hw_reg_idx - component register base index
+ */
+enum mtk_comp_hw_reg_idx {
+	VDEC_COMP_SYS,
+	VDEC_COMP_MISC,
+	VDEC_COMP_MAX
+};
+
+/**
+ * struct mtk_vdec_comp_dev - component framwork driver data
+ * @plat_dev: platform device
+ * @master_dev: master device
+ * @reg_base: Mapped address of MTK Vcodec registers.
+ *
+ * @dec_irq: decoder irq resource
+ * @pm: power management control
+ * @comp_idx: component index
+ */
+struct mtk_vdec_comp_dev {
+	struct platform_device *plat_dev;
+	struct mtk_vcodec_dev *master_dev;
+	void __iomem *reg_base[VDEC_COMP_MAX];
+
+	int dec_irq;
+	struct mtk_vcodec_pm pm;
+	int comp_idx;
+};
+
+#endif /* _MTK_VCODEC_DEC_HW_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 973b0b3649c6..d6bb723db106 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -17,6 +17,11 @@
 #include <media/videobuf2-core.h>
 #include "mtk_vcodec_util.h"
 
+#define VDEC_HW_ACTIVE	0x10
+#define VDEC_IRQ_CFG	0x11
+#define VDEC_IRQ_CLR	0x10
+#define VDEC_IRQ_CFG_REG	0xa4
+
 #define MTK_VCODEC_DRV_NAME	"mtk_vcodec_drv"
 #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
 #define MTK_VCODEC_ENC_NAME	"mtk-vcodec-enc"
@@ -93,6 +98,17 @@ enum mtk_fmt_type {
 	MTK_FMT_FRAME = 2,
 };
 
+/**
+ * struct mtk_vdec_hw_id - Hardware index used to separate
+ *                         different hardware
+ */
+enum mtk_vdec_hw_id {
+	MTK_VDEC_CORE,
+	MTK_VDEC_LAT0,
+	MTK_VDEC_LAT1,
+	MTK_VDEC_HW_MAX,
+ };
+
 /*
  * struct mtk_video_fmt - Structure used to store information about pixelformats
  */
@@ -404,6 +420,7 @@ struct mtk_vcodec_enc_pdata {
  *
  * @fw_handler: used to communicate with the firmware.
  * @id_counter: used to identify current opened instance
+ * @is_comp_supported: true: using compoent framework, false: not support
  *
  * @decode_workqueue: decode work queue
  * @encode_workqueue: encode work queue
@@ -422,6 +439,9 @@ struct mtk_vcodec_enc_pdata {
  * @pm: power management control
  * @dec_capability: used to identify decode capability, ex: 4k
  * @enc_capability: used to identify encode capability
+ *
+ * @comp_dev: component hardware device
+ * @component_node: component node
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -442,6 +462,7 @@ struct mtk_vcodec_dev {
 	struct mtk_vcodec_fw *fw_handler;
 
 	unsigned long id_counter;
+	bool is_comp_supported;
 
 	struct workqueue_struct *decode_workqueue;
 	struct workqueue_struct *encode_workqueue;
@@ -459,6 +480,9 @@ struct mtk_vcodec_dev {
 	struct mtk_vcodec_pm pm;
 	unsigned int dec_capability;
 	unsigned int enc_capability;
+
+	void *comp_dev[MTK_VDEC_HW_MAX];
+	struct device_node *component_node[MTK_VDEC_HW_MAX];
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
-- 
2.25.1

