Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433F03ED2BA
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235890AbhHPLA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:00:59 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:52956 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235943AbhHPLA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:00:57 -0400
X-UUID: 258b15537135485e93bdfe0d5665038b-20210816
X-UUID: 258b15537135485e93bdfe0d5665038b-20210816
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2006181287; Mon, 16 Aug 2021 19:00:22 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:21 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:20 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
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
Subject: [PATCH 2/9] media: mtk-vcodec: Use component framework to manage encoder hardware
Date:   Mon, 16 Aug 2021 18:59:27 +0800
Message-ID: <20210816105934.28265-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are two venc cores for H264 inside MT8195, uses component
framework to manage each hardware so that the two cores can be
used through one venc driver.

Adds new encoder hardware mode to indicate different hardware
modes:
VENC_SINGLE_CORE_MODE means only one core, the device has its
own power/clk/irq, init_pm/request_irq helper can be used.

VENC_FRAME_RACING_MODE means more than one core inside, the core
device driver can use the init_pm/request_irq helper to
initialize their own power/clk/irq. And the master device doesn't
need use these helper anymore.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  22 ++
 .../platform/mtk-vcodec/mtk_vcodec_enc.h      |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 189 +++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 179 +++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.h   |  36 ++++
 6 files changed, 397 insertions(+), 32 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 4618d43dbbc8..661d4afeb628 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -20,6 +20,7 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 		mtk_vcodec_enc_pm.o \
 		venc_drv_if.o \
 		venc_vpu_if.o \
+		mtk_vcodec_enc_hw.o \
 
 
 mtk-vcodec-common-y := mtk_vcodec_intr.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 3f83710b4fa5..c160b9e505eb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -8,6 +8,7 @@
 #ifndef _MTK_VCODEC_DRV_H_
 #define _MTK_VCODEC_DRV_H_
 
+#include <linux/component.h>
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-ctrls.h>
@@ -92,6 +93,20 @@ enum mtk_fmt_type {
 	MTK_FMT_FRAME = 2,
 };
 
+enum mtk_venc_hw_id {
+	MTK_VENC_CORE0 = 0,
+	MTK_VENC_CORE1 = 1,
+	MTK_VENC_HW_MAX,
+};
+
+/**
+ * enmu mtk_venc_hw_mode - Used to indicate different encode mode
+ */
+enum mtk_venc_hw_mode {
+	VENC_SINGLE_CORE_MODE = 0,
+	VENC_FRAME_RACING_MODE = 1,
+};
+
 /*
  * struct mtk_video_fmt - Structure used to store information about pixelformats
  */
@@ -320,6 +335,7 @@ enum mtk_chip {
  * @output_formats: array of supported output formats
  * @num_output_formats: number of entries in output_formats
  * @core_id: stand for h264 or vp8 encode index
+ * @hw_mode: indicate encode mode
  */
 struct mtk_vcodec_enc_pdata {
 	enum mtk_chip chip;
@@ -332,6 +348,7 @@ struct mtk_vcodec_enc_pdata {
 	const struct mtk_video_fmt *output_formats;
 	size_t num_output_formats;
 	int core_id;
+	enum mtk_venc_hw_mode hw_mode;
 };
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
@@ -372,6 +389,8 @@ struct mtk_vcodec_enc_pdata {
  * @pm: power management control
  * @dec_capability: used to identify decode capability, ex: 4k
  * @enc_capability: used to identify encode capability
+ * @enc_comp_node: used to store venc component node
+ * @enc_comp_dev: used to store venc component device
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -407,6 +426,9 @@ struct mtk_vcodec_dev {
 	struct mtk_vcodec_pm pm;
 	unsigned int dec_capability;
 	unsigned int enc_capability;
+
+	struct device_node *enc_comp_node[MTK_VENC_HW_MAX];
+	void *enc_comp_dev[MTK_VENC_HW_MAX];
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
index 513ee7993e34..30b6d7f22ed7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h
@@ -21,6 +21,8 @@
 #define MTK_VENC_IRQ_STATUS_OFFSET	0x05C
 #define MTK_VENC_IRQ_ACK_OFFSET	0x060
 
+extern struct platform_driver mtk_venc_comp_driver;
+
 /**
  * struct mtk_video_enc_buf - Private data related to each VB2 buffer.
  * @m2m_buf:	M2M buffer
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 7b3e0ea4c410..f7538d4b5cbb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -26,6 +26,81 @@
 module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
 module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
 
+static const struct of_device_id mtk_venc_comp_ids[] = {
+	{
+		.compatible = "mediatek,mtk-venc-core0",
+		.data = (void *)MTK_VENC_CORE0,
+	},
+	{
+		.compatible = "mediatek,mtk-venc-core1",
+		.data = (void *)MTK_VENC_CORE1,
+	},
+	{},
+};
+
+static inline int mtk_venc_compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static inline void mtk_venc_release_of(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+
+static inline int mtk_venc_bind(struct device *dev)
+{
+	struct mtk_vcodec_dev *data = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, data);
+}
+
+static inline void mtk_venc_unbind(struct device *dev)
+{
+	struct mtk_vcodec_dev *data = dev_get_drvdata(dev);
+
+	component_unbind_all(dev, data);
+}
+
+static const struct component_master_ops mtk_venc_ops = {
+	.bind = mtk_venc_bind,
+	.unbind = mtk_venc_unbind,
+};
+
+static struct component_match *mtk_venc_match_add(struct mtk_vcodec_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	struct component_match *match = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_venc_comp_ids); i++) {
+		enum mtk_venc_hw_id comp_idx;
+		struct device_node *comp_node;
+		const struct of_device_id *of_id;
+
+		comp_node = of_find_compatible_node(NULL, NULL,
+			mtk_venc_comp_ids[i].compatible);
+		if (!comp_node)
+			continue;
+
+		of_id = of_match_node(mtk_venc_comp_ids, comp_node);
+		if (!of_id) {
+			dev_err(&pdev->dev, "Failed to get match node\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		comp_idx = (enum mtk_venc_hw_id)of_id->data;
+		dev->enc_comp_node[comp_idx] = comp_node;
+
+		component_match_add_release(&pdev->dev, &match,
+					    mtk_venc_release_of,
+					    mtk_venc_compare_of,
+					    comp_node);
+	}
+
+	return match;
+}
+
 static const struct mtk_video_fmt mtk_video_formats_output[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
@@ -239,6 +314,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
 	int ret;
+	struct component_match *match = NULL;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -264,39 +340,41 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return PTR_ERR(dev->fw_handler);
 
 	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
-	ret = mtk_vcodec_init_enc_pm(dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
-		goto err_enc_pm;
-	}
+	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE) {
+		ret = mtk_vcodec_init_enc_pm(dev);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
+			goto err_enc_pm;
+		}
 
-	pm_runtime_enable(&pdev->dev);
+		pm_runtime_enable(&pdev->dev);
 
-	dev->reg_base[dev->venc_pdata->core_id] =
-		devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(dev->reg_base[dev->venc_pdata->core_id])) {
-		ret = PTR_ERR(dev->reg_base[dev->venc_pdata->core_id]);
-		goto err_res;
-	}
+		dev->reg_base[dev->venc_pdata->core_id] =
+			devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(dev->reg_base[dev->venc_pdata->core_id])) {
+			ret = PTR_ERR(dev->reg_base[dev->venc_pdata->core_id]);
+			goto err_res;
+		}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "failed to get irq resource");
-		ret = -ENOENT;
-		goto err_res;
-	}
+		res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+		if (!res) {
+			dev_err(&pdev->dev, "failed to get irq resource");
+			ret = -ENOENT;
+			goto err_res;
+		}
 
-	dev->enc_irq = platform_get_irq(pdev, 0);
-	irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
-	ret = devm_request_irq(&pdev->dev, dev->enc_irq,
-			       mtk_vcodec_enc_irq_handler,
-			       0, pdev->name, dev);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Failed to install dev->enc_irq %d (%d) core_id (%d)",
-			dev->enc_irq, ret, dev->venc_pdata->core_id);
-		ret = -EINVAL;
-		goto err_res;
+		dev->enc_irq = platform_get_irq(pdev, 0);
+		irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
+		ret = devm_request_irq(&pdev->dev, dev->enc_irq,
+				       mtk_vcodec_enc_irq_handler,
+				       0, pdev->name, dev);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to install dev->enc_irq %d (%d) core_id (%d)",
+				dev->enc_irq, ret, dev->venc_pdata->core_id);
+			ret = -EINVAL;
+			goto err_res;
+		}
 	}
 
 	mutex_init(&dev->enc_mutex);
@@ -362,6 +440,22 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_enc_reg;
 	}
 
+	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		match = mtk_venc_match_add(dev);
+		if (IS_ERR_OR_NULL(match)) {
+			mtk_v4l2_err("match venc component failed\n");
+			ret = -EINVAL;
+			goto err_enc_reg;
+		}
+		ret = component_master_add_with_match(&pdev->dev,
+						      &mtk_venc_ops, match);
+		if (ret) {
+			mtk_v4l2_err("Failed to bring up master");
+			ret = -EINVAL;
+			goto err_enc_reg;
+		}
+	}
+
 	mtk_v4l2_debug(0, "encoder %d registered as /dev/video%d",
 		       dev->venc_pdata->core_id, vfd_enc->num);
 
@@ -376,7 +470,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_enc_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
-	mtk_vcodec_release_enc_pm(dev);
+	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE)
+		mtk_vcodec_release_enc_pm(dev);
 err_enc_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -391,6 +486,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.min_bitrate = 1,
 	.max_bitrate = 4000000,
 	.core_id = VENC_SYS,
+	.hw_mode = VENC_SINGLE_CORE_MODE,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
@@ -402,6 +498,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 4000000,
 	.core_id = VENC_LT_SYS,
+	.hw_mode = VENC_SINGLE_CORE_MODE,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
@@ -414,6 +511,7 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
 	.core_id = VENC_SYS,
+	.hw_mode = VENC_SINGLE_CORE_MODE,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
@@ -426,6 +524,7 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_id = VENC_SYS,
+	.hw_mode = VENC_SINGLE_CORE_MODE,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
@@ -438,6 +537,7 @@ static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
 	.min_bitrate = 64,
 	.max_bitrate = 100000000,
 	.core_id = VENC_SYS,
+	.hw_mode = VENC_FRAME_RACING_MODE,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
@@ -466,8 +566,15 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_enc);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_enc_pm(dev);
+
+	if (dev->venc_pdata->hw_mode == VENC_SINGLE_CORE_MODE)
+		mtk_vcodec_release_enc_pm(dev);
+
 	mtk_vcodec_fw_release(dev->fw_handler);
+
+	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE)
+		component_master_del(&pdev->dev, &mtk_venc_ops);
+
 	return 0;
 }
 
@@ -480,7 +587,25 @@ static struct platform_driver mtk_vcodec_enc_driver = {
 	},
 };
 
-module_platform_driver(mtk_vcodec_enc_driver);
+static struct platform_driver * const mtk_venc_drivers[] = {
+	&mtk_venc_comp_driver,
+	&mtk_vcodec_enc_driver,
+};
+
+static int __init mtk_venc_init(void)
+{
+	return platform_register_drivers(mtk_venc_drivers,
+					 ARRAY_SIZE(mtk_venc_drivers));
+}
+
+static void __exit mtk_venc_exit(void)
+{
+	platform_unregister_drivers(mtk_venc_drivers,
+				    ARRAY_SIZE(mtk_venc_drivers));
+}
+
+module_init(mtk_venc_init);
+module_exit(mtk_venc_exit);
 
 
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
new file mode 100644
index 000000000000..4e6a8a81ff67
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/of_platform.h>
+#include <linux/module.h>
+
+#include "mtk_vcodec_enc_hw.h"
+#include "mtk_vcodec_enc.h"
+
+static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
+{
+	if (irq_status & MTK_VENC_IRQ_STATUS_PAUSE)
+		writel(MTK_VENC_IRQ_STATUS_PAUSE, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_SWITCH)
+		writel(MTK_VENC_IRQ_STATUS_SWITCH, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_DRAM)
+		writel(MTK_VENC_IRQ_STATUS_DRAM, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_SPS)
+		writel(MTK_VENC_IRQ_STATUS_SPS, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_PPS)
+		writel(MTK_VENC_IRQ_STATUS_PPS, addr);
+
+	if (irq_status & MTK_VENC_IRQ_STATUS_FRM)
+		writel(MTK_VENC_IRQ_STATUS_FRM, addr);
+}
+
+static irqreturn_t mtk_enc_comp_irq_handler(int irq, void *priv)
+{
+	struct mtk_venc_comp_dev *dev = priv;
+	struct mtk_vcodec_ctx *ctx;
+	unsigned long flags;
+	void __iomem *addr;
+
+	spin_lock_irqsave(&dev->master_dev->irqlock, flags);
+	ctx = dev->curr_ctx;
+	spin_unlock_irqrestore(&dev->master_dev->irqlock, flags);
+	if (!ctx)
+		return IRQ_HANDLED;
+
+	addr = dev->reg_base + MTK_VENC_IRQ_ACK_OFFSET;
+	ctx->irq_status = readl(dev->reg_base + MTK_VENC_IRQ_STATUS_OFFSET);
+	clean_irq_status(ctx->irq_status, addr);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_venc_comp_bind(struct device *dev,
+			      struct device *master, void *data)
+{
+	struct mtk_venc_comp_dev *comp_dev = dev_get_drvdata(dev);
+	struct mtk_vcodec_dev *master_dev = data;
+	int i;
+
+	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
+		if (dev->of_node != master_dev->enc_comp_node[i])
+			continue;
+
+		/*add component device by order*/
+		if (comp_dev->core_id == MTK_VENC_CORE0)
+			master_dev->enc_comp_dev[MTK_VENC_CORE0] = comp_dev;
+		else if (comp_dev->core_id == MTK_VENC_CORE1)
+			master_dev->enc_comp_dev[MTK_VENC_CORE1] = comp_dev;
+		else
+			return -EINVAL;
+
+		comp_dev->master_dev = master_dev;
+		break;
+	}
+
+	if (i == MTK_VENC_HW_MAX) {
+		dev_err(dev, "Failed to get component node\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void mtk_venc_comp_unbind(struct device *dev,
+				 struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_venc_component_ops = {
+	.bind = mtk_venc_comp_bind,
+	.unbind = mtk_venc_comp_unbind,
+};
+
+static int mtk_venc_comp_probe(struct platform_device *pdev)
+{
+	struct mtk_venc_comp_dev *comp_dev;
+	int ret;
+
+	comp_dev = devm_kzalloc(&pdev->dev, sizeof(*comp_dev), GFP_KERNEL);
+	if (!comp_dev)
+		return -ENOMEM;
+
+	comp_dev->plat_dev = pdev;
+
+	comp_dev->core_id =
+		(enum mtk_venc_hw_id)of_device_get_match_data(&pdev->dev);
+
+	comp_dev->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(comp_dev->reg_base)) {
+		dev_err(&pdev->dev, "Failed to get reg base");
+		ret = PTR_ERR(comp_dev->reg_base);
+		goto err;
+	}
+
+	comp_dev->enc_irq = platform_get_irq(pdev, 0);
+	if (comp_dev->enc_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq resource");
+		ret = comp_dev->enc_irq;
+		goto err;
+	}
+
+	ret = devm_request_irq(&pdev->dev, comp_dev->enc_irq,
+			       mtk_enc_comp_irq_handler, 0,
+			       pdev->name, comp_dev);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to install comp_dev->enc_irq %d (%d)",
+			comp_dev->enc_irq, ret);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+
+	platform_set_drvdata(pdev, comp_dev);
+
+	ret = component_add(&pdev->dev, &mtk_venc_component_ops);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to add component: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+err:
+	return ret;
+}
+
+static int mtk_venc_comp_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_venc_component_ops);
+	return 0;
+}
+
+static const struct of_device_id mtk_venc_comp_ids[] = {
+	{
+		.compatible = "mediatek,mtk-venc-core0",
+		.data = (void *)MTK_VENC_CORE0,
+	},
+	{
+		.compatible = "mediatek,mtk-venc-core1",
+		.data = (void *)MTK_VENC_CORE1,
+	},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_venc_comp_ids);
+
+struct platform_driver mtk_venc_comp_driver = {
+	.probe  = mtk_venc_comp_probe,
+	.remove = mtk_venc_comp_remove,
+	.driver = {
+		.name	 = "mtk-venc-comp",
+		.of_match_table = mtk_venc_comp_ids,
+	},
+};
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
new file mode 100644
index 000000000000..f9ae97e252dc
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef _MTK_VCODEC_ENC_HW_H_
+#define _MTK_VCODEC_ENC_HW_H_
+
+#include <linux/platform_device.h>
+#include "mtk_vcodec_drv.h"
+
+/*
+ * struct mtk_venc_comp_dev - driver data
+ * @plat_dev: platform_device
+ * @master_dev: master device
+ * @pm: power management data
+ * @curr_ctx: the context that is waiting for venc hardware
+ * @reg_base: mapped address of venc registers
+ * @irq_status: venc hw irq status
+ * @enc_irq: venc device irq
+ * @core id: for venc core id: core#0, core#1...
+ */
+struct mtk_venc_comp_dev {
+	struct platform_device *plat_dev;
+	struct mtk_vcodec_dev *master_dev;
+
+	struct mtk_vcodec_pm pm;
+	struct mtk_vcodec_ctx *curr_ctx;
+
+	void __iomem *reg_base;
+	unsigned int irq_status;
+	int enc_irq;
+	int core_id;
+};
+
+#endif /* _MTK_VCODEC_ENC_HW_H_ */
-- 
2.25.1

