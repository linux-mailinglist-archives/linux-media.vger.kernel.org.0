Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC6F8547DFC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 05:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238434AbiFMDW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jun 2022 23:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238382AbiFMDWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jun 2022 23:22:52 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923BB1B7A2;
        Sun, 12 Jun 2022 20:22:48 -0700 (PDT)
X-UUID: 576cfeb5946e450ebfe4ccd389785fc5-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:67955e22-f50f-48ec-9dbf-8216ae3473d1,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:cd527837-84c0-4f9a-9fbd-acd4a0e9ad0f,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:0,BEC:nil
X-UUID: 576cfeb5946e450ebfe4ccd389785fc5-20220613
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 757850075; Mon, 13 Jun 2022 11:22:44 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 13 Jun 2022 11:22:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jun 2022 11:22:41 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        <angelogioacchino.delregno@collabora.com>,
        <nicolas.dufresne@collabora.com>, <wenst@chromium.org>
CC:     <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
        <maoguang.meng@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: [V3,3/8] media: mtk-jpegdec: manage jpegdec multi-hardware
Date:   Mon, 13 Jun 2022 11:22:27 +0800
Message-ID: <20220613032232.23187-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613032232.23187-1-irui.wang@mediatek.com>
References: <20220613032232.23187-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: kyrie wu <kyrie.wu@mediatek.com>

manage each hardware information, including irq/clk/power.
the hardware includes HW0/HW1/HW2.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/Makefile |   5 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  16 ++
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  37 ++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 168 ++++++++++++++++++
 4 files changed, 224 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/Makefile b/drivers/media/platform/mediatek/jpeg/Makefile
index 69703db4b0a5..26e84852523e 100644
--- a/drivers/media/platform/mediatek/jpeg/Makefile
+++ b/drivers/media/platform/mediatek/jpeg/Makefile
@@ -1,9 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_VIDEO_MEDIATEK_JPEG) += mtk_jpeg.o \
-	mtk-jpeg-enc-hw.o
+	mtk-jpeg-enc-hw.o \
+	mtk-jpeg-dec-hw.o
 
 mtk_jpeg-y := mtk_jpeg_core.o \
-		 mtk_jpeg_dec_hw.o \
 		 mtk_jpeg_dec_parse.o
 
 mtk-jpeg-enc-hw-y := mtk_jpeg_enc_hw.o
+mtk-jpeg-dec-hw-y := mtk_jpeg_dec_hw.o
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 028e89dba546..6afed679f37b 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1700,6 +1700,18 @@ static const struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 };
 
+static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
+	.is_multihw = true,
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+};
+
 #if defined(CONFIG_OF)
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
@@ -1718,6 +1730,10 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mt8195-jpgenc",
 		.data = &mtk8195_jpegenc_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8195-jpgdec",
+		.data = &mtk8195_jpegdec_drvdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 5eebbd0d927a..41b6037c58b5 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -103,6 +103,13 @@ enum mtk_jpegenc_hw_id {
 	MTK_JPEGENC_HW_MAX,
 };
 
+enum mtk_jpegdec_hw_id {
+	MTK_JPEGDEC_HW0,
+	MTK_JPEGDEC_HW1,
+	MTK_JPEGDEC_HW2,
+	MTK_JPEGDEC_HW_MAX,
+};
+
 /**
  * struct mtk_vcodec_clk - Structure used to store vcodec clock information
  */
@@ -111,6 +118,14 @@ struct mtk_jpegenc_clk {
 	int clk_num;
 };
 
+/**
+ * struct mtk_vcodec_clk - Structure used to store vcodec clock information
+ */
+struct mtk_jpegdec_clk {
+	struct clk_bulk_data *clks;
+	int clk_num;
+};
+
 /**
  * struct mtk_jpegenc_comp_dev - JPEG COREX abstraction
  * @dev:		JPEG device
@@ -141,6 +156,25 @@ struct mtk_jpegenc_comp_dev {
 	spinlock_t hw_lock;
 };
 
+/**
+ * struct mtk_jpegdec_comp_dev - JPEG COREX abstraction
+ * @dev:		        JPEG device
+ * @plat_dev:		    platform device data
+ * @reg_base:		    JPEG registers mapping
+ * @master_dev:		    mtk_jpeg_dev device
+ * @jdec_clk:	        mtk_jpegdec_clk
+ * @jpegdec_irq:	    jpeg decode irq num
+ */
+struct mtk_jpegdec_comp_dev {
+	struct device *dev;
+	struct platform_device *plat_dev;
+	void __iomem *reg_base;
+	struct mtk_jpeg_dev *master_dev;
+	struct mtk_jpegdec_clk jdec_clk;
+	int jpegdec_irq;
+	int hw_id;
+};
+
 /**
  * struct mtk_jpeg_dev - JPEG IP abstraction
  * @lock:		the mutex protecting this structure
@@ -171,6 +205,9 @@ struct mtk_jpeg_dev {
 	void __iomem *reg_encbase[MTK_JPEGENC_HW_MAX];
 	struct mtk_jpegenc_comp_dev *enc_hw_dev[MTK_JPEGENC_HW_MAX];
 	wait_queue_head_t enc_hw_wq;
+
+	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
+	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index d2f25f43e852..37f72bcc6320 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -5,9 +5,24 @@
  *         Rick Chang <rick.chang@mediatek.com>
  */
 
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <media/media-device.h>
 #include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-event.h>
 
 #include "mtk_jpeg_core.h"
 #include "mtk_jpeg_dec_hw.h"
@@ -24,6 +39,16 @@ enum mtk_jpeg_color {
 	MTK_JPEG_COLOR_400		= 0x00110000
 };
 
+#if defined(CONFIG_OF)
+static const struct of_device_id mtk_jpegdec_hw_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-jpgdec-hw",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
+#endif
+
 static inline int mtk_jpeg_verify_align(u32 val, int align, u32 reg)
 {
 	if (val & (align - 1)) {
@@ -414,3 +439,146 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_dec_set_config);
+
+static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
+{
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_src_buf *jpeg_src_buf;
+	enum vb2_buffer_state buf_state;
+	struct mtk_jpeg_ctx *ctx;
+	u32 dec_irq_ret;
+	u32 irq_status;
+	int i;
+
+	struct mtk_jpegdec_comp_dev *jpeg = priv;
+	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
+
+	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
+	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
+	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
+		mtk_jpeg_dec_reset(jpeg->reg_base);
+	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE)
+		return IRQ_NONE;
+
+	ctx = v4l2_m2m_get_curr_priv(master_jpeg->m2m_dev);
+	if (!ctx) {
+		dev_err(jpeg->dev, "Context is NULL\n");
+		return IRQ_HANDLED;
+	}
+
+	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	dst_buf->vb2_buf.timestamp = src_buf->vb2_buf.timestamp;
+	jpeg_src_buf =
+		container_of(src_buf, struct mtk_jpeg_src_buf, b);
+
+	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
+		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
+				      jpeg_src_buf->dec_param.comp_size[i]);
+
+	buf_state = VB2_BUF_STATE_DONE;
+
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	v4l2_m2m_buf_done(dst_buf, buf_state);
+	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	pm_runtime_put(ctx->jpeg->dev);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	dev->jpegdec_irq = platform_get_irq(pdev, 0);
+	if (dev->jpegdec_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq resource");
+		return dev->jpegdec_irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev,
+			       dev->jpegdec_irq,
+			       mtk_jpegdec_hw_irq_handler,
+			       0,
+			       pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to devm_request_irq %d (%d)",
+			dev->jpegdec_irq, ret);
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
+{
+	struct mtk_jpegdec_clk *jpegdec_clk;
+	struct mtk_jpeg_dev *master_dev;
+	struct mtk_jpegdec_comp_dev *dev;
+	int ret;
+
+	struct device *decs = &pdev->dev;
+
+	if (!decs->parent)
+		return -EPROBE_DEFER;
+
+	master_dev = dev_get_drvdata(decs->parent);
+	if (!master_dev)
+		return -EPROBE_DEFER;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->plat_dev = pdev;
+	dev->dev = &pdev->dev;
+	jpegdec_clk = &dev->jdec_clk;
+
+	jpegdec_clk->clk_num = devm_clk_bulk_get_all(&pdev->dev,
+						     &jpegdec_clk->clks);
+	if (jpegdec_clk->clk_num < 0)
+		return dev_err_probe(&pdev->dev,
+				      jpegdec_clk->clk_num,
+				      "Failed to get jpegdec clock count.\n");
+
+	dev->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->reg_base))
+		return PTR_ERR(dev->reg_base);
+
+	ret = mtk_jpegdec_hw_init_irq(dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev,
+				     ret,
+				     "Failed to register JPEGDEC irq handler.\n");
+
+	of_property_read_u32(decs->of_node, "mediatek,hw-id",
+			     &dev->hw_id);
+
+	if (dev->hw_id >= 0 || dev->hw_id < MTK_JPEGDEC_HW_MAX) {
+		master_dev->dec_hw_dev[dev->hw_id] = dev;
+		master_dev->reg_decbase[dev->hw_id] = dev->reg_base;
+		dev->master_dev = master_dev;
+	} else {
+		return dev_err_probe(&pdev->dev, dev->hw_id,
+				     "Invalid hw id\n");
+	}
+
+	platform_set_drvdata(pdev, dev);
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+struct platform_driver mtk_jpegdec_hw_driver = {
+	.probe = mtk_jpegdec_hw_probe,
+	.driver = {
+		.name = "mtk-jpegdec-hw",
+		.of_match_table = of_match_ptr(mtk_jpegdec_hw_ids),
+	},
+};
+
+module_platform_driver(mtk_jpegdec_hw_driver);
+
+MODULE_DESCRIPTION("MediaTek JPEG decode HW driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0

