Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798DF324B66
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 08:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbhBYHif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 02:38:35 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:38934 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234375AbhBYHiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 02:38:22 -0500
X-UUID: ebf340639fd443a9bb8b2f65c3813ef7-20210225
X-UUID: ebf340639fd443a9bb8b2f65c3813ef7-20210225
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1013521500; Thu, 25 Feb 2021 15:36:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Feb 2021 15:36:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 15:36:15 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, <yong.wu@mediatek.com>
CC:     Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2,3/3] media: mtk-vcodec: Separating mtk encoder driver
Date:   Thu, 25 Feb 2021 15:36:03 +0800
Message-ID: <20210225073603.5881-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210225073603.5881-1-irui.wang@mediatek.com>
References: <20210225073603.5881-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MTK H264 Encoder(VENC_SYS) and VP8 Encoder(VENC_LT_SYS) are two
independent hardware instance. They have their owner interrupt,
register mapping, and special clocks.

This patch separates them into two devices. This is a preparing
patch for adding device_link between the larbs and venc-device.
It's mainly for fixing the problem:
https://lkml.org/lkml/2019/9/3/316

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
Change since v1:
- use the same name for both devices instead of using "name" member
- rename compatible for backward compatibility
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  18 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 108 +++++++-----------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  40 +------
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   4 +-
 5 files changed, 67 insertions(+), 110 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 3dd010cba23e..869d958d2b99 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -193,7 +193,6 @@ struct mtk_vcodec_pm {
 
 	struct mtk_vcodec_clk	venc_clk;
 	struct device	*larbvenc;
-	struct device	*larbvenclt;
 	struct device	*dev;
 	struct mtk_vcodec_dev	*mtkdev;
 };
@@ -311,25 +310,25 @@ enum mtk_chip {
  * @chip: chip this encoder is compatible with
  *
  * @uses_ext: whether the encoder uses the extended firmware messaging format
- * @has_lt_irq: whether the encoder uses the LT irq
  * @min_birate: minimum supported encoding bitrate
  * @max_bitrate: maximum supported encoding bitrate
  * @capture_formats: array of supported capture formats
  * @num_capture_formats: number of entries in capture_formats
  * @output_formats: array of supported output formats
  * @num_output_formats: number of entries in output_formats
+ * @core_id: stand for h264 or vp8 encode index
  */
 struct mtk_vcodec_enc_pdata {
 	enum mtk_chip chip;
 
 	bool uses_ext;
-	bool has_lt_irq;
 	unsigned long min_bitrate;
 	unsigned long max_bitrate;
 	const struct mtk_video_fmt *capture_formats;
 	size_t num_capture_formats;
 	const struct mtk_video_fmt *output_formats;
 	size_t num_output_formats;
+	int core_id;
 };
 
 #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
@@ -361,7 +360,6 @@ struct mtk_vcodec_enc_pdata {
  *
  * @dec_irq: decoder irq resource
  * @enc_irq: h264 encoder irq resource
- * @enc_lt_irq: vp8 encoder irq resource
  *
  * @dec_mutex: decoder hardware lock
  * @enc_mutex: encoder hardware lock.
@@ -397,7 +395,6 @@ struct mtk_vcodec_dev {
 
 	int dec_irq;
 	int enc_irq;
-	int enc_lt_irq;
 
 	struct mutex dec_mutex;
 	struct mutex enc_mutex;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 8c917969c2f1..4831052f475d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 #include <soc/mediatek/smi.h>
+#include <linux/pm_runtime.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_enc.h"
@@ -787,7 +788,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	  */
 	if ((ctx->state == MTK_STATE_ABORT) || (ctx->state == MTK_STATE_FREE)) {
 		ret = -EIO;
-		goto err_set_param;
+		goto err_start_stream;
 	}
 
 	/* Do the initialization when both start_streaming have been called */
@@ -799,6 +800,12 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 			return 0;
 	}
 
+	ret = pm_runtime_resume_and_get(&ctx->dev->plat_dev->dev);
+	if (ret < 0) {
+		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
+		goto err_start_stream;
+	}
+
 	mtk_venc_set_param(ctx, &param);
 	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
 	if (ret) {
@@ -825,6 +832,11 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 err_set_param:
+	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
+	if (ret < 0)
+		mtk_v4l2_err("pm_runtime_put fail %d", ret);
+
+err_start_stream:
 	for (i = 0; i < q->num_buffers; ++i) {
 		struct vb2_buffer *buf = vb2_get_buffer(q, i);
 
@@ -878,6 +890,10 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 	if (ret)
 		mtk_v4l2_err("venc_if_deinit failed=%d", ret);
 
+	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
+	if (ret < 0)
+		mtk_v4l2_err("pm_runtime_put fail %d", ret);
+
 	ctx->state = MTK_STATE_FREE;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index be3842e6ca47..7d7b8cfc2cc5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -49,12 +49,15 @@ static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
 	},
 };
 
-static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
+static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_avc[] =  {
 	{
 		.fourcc = V4L2_PIX_FMT_H264,
 		.type = MTK_FMT_ENC,
 		.num_planes = 1,
 	},
+};
+
+static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_vp8[] =  {
 	{
 		.fourcc = V4L2_PIX_FMT_VP8,
 		.type = MTK_FMT_ENC,
@@ -110,10 +113,11 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
 	ctx = dev->curr_ctx;
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 
-	mtk_v4l2_debug(1, "id=%d", ctx->id);
-	addr = dev->reg_base[VENC_SYS] + MTK_VENC_IRQ_ACK_OFFSET;
+	mtk_v4l2_debug(1, "id=%d coreid:%d", ctx->id, dev->venc_pdata->core_id);
+	addr = dev->reg_base[dev->venc_pdata->core_id] +
+				MTK_VENC_IRQ_ACK_OFFSET;
 
-	ctx->irq_status = readl(dev->reg_base[VENC_SYS] +
+	ctx->irq_status = readl(dev->reg_base[dev->venc_pdata->core_id] +
 				(MTK_VENC_IRQ_STATUS_OFFSET));
 
 	clean_irq_status(ctx->irq_status, addr);
@@ -122,29 +126,6 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t mtk_vcodec_enc_lt_irq_handler(int irq, void *priv)
-{
-	struct mtk_vcodec_dev *dev = priv;
-	struct mtk_vcodec_ctx *ctx;
-	unsigned long flags;
-	void __iomem *addr;
-
-	spin_lock_irqsave(&dev->irqlock, flags);
-	ctx = dev->curr_ctx;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
-
-	mtk_v4l2_debug(1, "id=%d", ctx->id);
-	ctx->irq_status = readl(dev->reg_base[VENC_LT_SYS] +
-				(MTK_VENC_IRQ_STATUS_OFFSET));
-
-	addr = dev->reg_base[VENC_LT_SYS] + MTK_VENC_IRQ_ACK_OFFSET;
-
-	clean_irq_status(ctx->irq_status, addr);
-
-	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
-	return IRQ_HANDLED;
-}
-
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -293,17 +274,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
 	ret = mtk_vcodec_init_enc_pm(dev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to get mt vcodec clock source!");
+		dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
 		goto err_enc_pm;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->reg_base[VENC_SYS] = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR((__force void *)dev->reg_base[VENC_SYS])) {
-		ret = PTR_ERR((__force void *)dev->reg_base[VENC_SYS]);
+	pm_runtime_enable(&pdev->dev);
+
+	dev->reg_base[dev->venc_pdata->core_id] =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dev->reg_base[dev->venc_pdata->core_id])) {
+		ret = PTR_ERR(dev->reg_base[dev->venc_pdata->core_id]);
 		goto err_res;
 	}
-	mtk_v4l2_debug(2, "reg[%d] base=0x%p", VENC_SYS, dev->reg_base[VENC_SYS]);
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (res == NULL) {
@@ -318,37 +300,13 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 			       mtk_vcodec_enc_irq_handler,
 			       0, pdev->name, dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to install dev->enc_irq %d (%d)",
-			dev->enc_irq,
-			ret);
+		dev_err(&pdev->dev,
+			"Failed to install dev->enc_irq %d (%d) core_id (%d)",
+			dev->enc_irq, ret, dev->venc_pdata->core_id);
 		ret = -EINVAL;
 		goto err_res;
 	}
 
-	if (dev->venc_pdata->has_lt_irq) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		dev->reg_base[VENC_LT_SYS] = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR((__force void *)dev->reg_base[VENC_LT_SYS])) {
-			ret = PTR_ERR((__force void *)dev->reg_base[VENC_LT_SYS]);
-			goto err_res;
-		}
-		mtk_v4l2_debug(2, "reg[%d] base=0x%p", VENC_LT_SYS, dev->reg_base[VENC_LT_SYS]);
-
-		dev->enc_lt_irq = platform_get_irq(pdev, 1);
-		irq_set_status_flags(dev->enc_lt_irq, IRQ_NOAUTOEN);
-		ret = devm_request_irq(&pdev->dev,
-				       dev->enc_lt_irq,
-				       mtk_vcodec_enc_lt_irq_handler,
-				       0, pdev->name, dev);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"Failed to install dev->enc_lt_irq %d (%d)",
-				dev->enc_lt_irq, ret);
-			ret = -EINVAL;
-			goto err_res;
-		}
-	}
-
 	mutex_init(&dev->enc_mutex);
 	mutex_init(&dev->dev_mutex);
 	spin_lock_init(&dev->irqlock);
@@ -409,8 +367,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_enc_reg;
 	}
 
-	mtk_v4l2_debug(0, "encoder registered as /dev/video%d",
-			vfd_enc->num);
+	mtk_v4l2_debug(0, "encoder %d registered as /dev/video%d",
+		       dev->venc_pdata->core_id, vfd_enc->num);
 
 	return 0;
 
@@ -429,20 +387,30 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
+static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 	.chip = MTK_MT8173,
-	.has_lt_irq = true,
-	.capture_formats = mtk_video_formats_capture_mt8173,
-	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173),
+	.capture_formats = mtk_video_formats_capture_mt8173_avc,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173_avc),
 	.output_formats = mtk_video_formats_output_mt8173,
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
 	.min_bitrate = 1,
 	.max_bitrate = 4000000,
+	.core_id = VENC_SYS,
+};
+
+static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
+	.chip = MTK_MT8173,
+	.capture_formats = mtk_video_formats_capture_mt8173_vp8,
+	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173_vp8),
+	.output_formats = mtk_video_formats_output_mt8173,
+	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
+	.min_bitrate = 64,
+	.max_bitrate = 4000000,
+	.core_id = VENC_LT_SYS,
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.chip = MTK_MT8183,
-	.has_lt_irq = false,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_mt8183,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
@@ -451,10 +419,14 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
 	.min_bitrate = 64,
 	.max_bitrate = 40000000,
+	.core_id = VENC_SYS,
 };
 
 static const struct of_device_id mtk_vcodec_enc_match[] = {
-	{.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
+	{.compatible = "mediatek,mt8173-vcodec-enc",
+			.data = &mt8173_avc_pdata},
+	{.compatible = "mediatek,mt8173-vcodec-enc-vp8",
+			.data = &mt8173_vp8_pdata},
 	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
 	{},
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 3b7c54d6aa8f..1b2e4930ed27 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -43,23 +43,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 		return -ENODEV;
 	}
 	pm->larbvenc = &pdev->dev;
-
-	node = of_parse_phandle(dev->of_node, "mediatek,larb", 1);
-	if (!node) {
-		mtk_v4l2_err("no mediatek,larb found");
-		ret = -ENODEV;
-		goto put_larbvenc;
-	}
-
-	pdev = of_find_device_by_node(node);
-	of_node_put(node);
-	if (!pdev) {
-		mtk_v4l2_err("no mediatek,larb device found");
-		ret = -ENODEV;
-		goto put_larbvenc;
-	}
-
-	pm->larbvenclt = &pdev->dev;
 	pdev = mtkdev->plat_dev;
 	pm->dev = &pdev->dev;
 
@@ -71,12 +54,12 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 			GFP_KERNEL);
 		if (!enc_clk->clk_info) {
 			ret = -ENOMEM;
-			goto put_larbvenclt;
+			goto put_larbvenc;
 		}
 	} else {
 		mtk_v4l2_err("Failed to get venc clock count");
 		ret = -EINVAL;
-		goto put_larbvenclt;
+		goto put_larbvenc;
 	}
 
 	for (i = 0; i < enc_clk->clk_num; i++) {
@@ -85,7 +68,7 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 			"clock-names", i, &clk_info->clk_name);
 		if (ret) {
 			mtk_v4l2_err("venc failed to get clk name %d", i);
-			goto put_larbvenclt;
+			goto put_larbvenc;
 		}
 		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
 			clk_info->clk_name);
@@ -93,14 +76,12 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 			mtk_v4l2_err("venc devm_clk_get (%d)%s fail", i,
 				clk_info->clk_name);
 			ret = PTR_ERR(clk_info->vcodec_clk);
-			goto put_larbvenclt;
+			goto put_larbvenc;
 		}
 	}
 
 	return 0;
 
-put_larbvenclt:
-	put_device(pm->larbvenclt);
 put_larbvenc:
 	put_device(pm->larbvenc);
 	return ret;
@@ -108,7 +89,7 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 
 void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
 {
-	put_device(mtkdev->pm.larbvenclt);
+	pm_runtime_disable(mtkdev->pm.dev);
 	put_device(mtkdev->pm.larbvenc);
 }
 
@@ -130,18 +111,10 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
 	ret = mtk_smi_larb_get(pm->larbvenc);
 	if (ret) {
 		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
-		goto larbvencerr;
-	}
-	ret = mtk_smi_larb_get(pm->larbvenclt);
-	if (ret) {
-		mtk_v4l2_err("mtk_smi_larb_get larb4 fail %d", ret);
-		goto larbvenclterr;
+		goto clkerr;
 	}
 	return;
 
-larbvenclterr:
-	mtk_smi_larb_put(pm->larbvenc);
-larbvencerr:
 clkerr:
 	for (i -= 1; i >= 0; i--)
 		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
@@ -153,7 +126,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
 	int i = 0;
 
 	mtk_smi_larb_put(pm->larbvenc);
-	mtk_smi_larb_put(pm->larbvenclt);
 	for (i = enc_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
 }
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 11abb191ada5..8267a9c4fd25 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -367,7 +367,7 @@ static int vp8_enc_encode(void *handle,
 
 	mtk_vcodec_debug_enter(inst);
 
-	enable_irq(ctx->dev->enc_lt_irq);
+	enable_irq(ctx->dev->enc_irq);
 
 	switch (opt) {
 	case VENC_START_OPT_ENCODE_FRAME:
@@ -386,7 +386,7 @@ static int vp8_enc_encode(void *handle,
 
 encode_err:
 
-	disable_irq(ctx->dev->enc_lt_irq);
+	disable_irq(ctx->dev->enc_irq);
 	mtk_vcodec_debug_leave(inst);
 
 	return ret;
-- 
2.25.1

