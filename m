Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1443B454F
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 16:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhFYOOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 10:14:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58524 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbhFYOOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 10:14:36 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:42b6:51ca:7d52:50ad])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 48C341F4475A;
        Fri, 25 Jun 2021 15:12:13 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca, cphealy@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 6/9] media: hantro: create ops for variants
Date:   Fri, 25 Jun 2021 16:11:40 +0200
Message-Id: <20210625141143.577998-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
References: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move init() and runtime_resume() prototypes from struct hantro_variant
to the new struct hantro_variant_ops.
That will allow to add more variant dedicated operations in cleaner way.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro.h         | 17 ++++++++---
 drivers/staging/media/hantro/hantro_drv.c     |  6 ++--
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 11 ++++---
 .../staging/media/hantro/rockchip_vpu_hw.c    | 30 +++++++++++++------
 .../staging/media/hantro/sama5d4_vdec_hw.c    |  6 +++-
 5 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 6a21d1e95b34..6b9a3a96d584 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -49,6 +49,17 @@ struct hantro_irq {
 	irqreturn_t (*handler)(int irq, void *priv);
 };
 
+/**
+ * struct hantro_variant_ops - variant operations
+ *
+ * @init:			Initialize hardware.
+ * @runtime_resume:		reenable hardware after power gating
+ */
+struct hantro_variant_ops {
+	int (*init)(struct hantro_dev *vpu);
+	int (*runtime_resume)(struct hantro_dev *vpu);
+};
+
 /**
  * struct hantro_variant - information about VPU hardware variant
  *
@@ -62,8 +73,6 @@ struct hantro_irq {
  * @num_postproc_fmts:		Number of post-processor formats.
  * @codec:			Supported codecs
  * @codec_ops:			Codec ops.
- * @init:			Initialize hardware.
- * @runtime_resume:		reenable hardware after power gating
  * @irqs:			array of irq names and interrupt handlers
  * @num_irqs:			number of irqs in the array
  * @clk_names:			array of clock names
@@ -71,6 +80,7 @@ struct hantro_irq {
  * @reg_names:			array of register range names
  * @num_regs:			number of register range names in the array
  * @postproc_regs:		&struct hantro_postproc_regs pointer
+ * @ops:			variant operations
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -83,8 +93,6 @@ struct hantro_variant {
 	unsigned int num_postproc_fmts;
 	unsigned int codec;
 	const struct hantro_codec_ops *codec_ops;
-	int (*init)(struct hantro_dev *vpu);
-	int (*runtime_resume)(struct hantro_dev *vpu);
 	const struct hantro_irq *irqs;
 	int num_irqs;
 	const char * const *clk_names;
@@ -92,6 +100,7 @@ struct hantro_variant {
 	const char * const *reg_names;
 	int num_regs;
 	const struct hantro_postproc_regs *postproc_regs;
+	struct hantro_variant_ops *ops;
 };
 
 /**
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 7121e6a6ca5b..8ad074a464fe 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -946,7 +946,7 @@ static int hantro_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = vpu->variant->init(vpu);
+	ret = vpu->variant->ops->init(vpu);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init VPU hardware\n");
 		return ret;
@@ -1043,8 +1043,8 @@ static int hantro_runtime_resume(struct device *dev)
 {
 	struct hantro_dev *vpu = dev_get_drvdata(dev);
 
-	if (vpu->variant->runtime_resume)
-		return vpu->variant->runtime_resume(vpu);
+	if (vpu->variant->ops->runtime_resume)
+		return vpu->variant->ops->runtime_resume(vpu);
 
 	return 0;
 }
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 65bcf46740d7..2e8cf32efb79 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -275,6 +275,11 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
 
 static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
 
+static struct hantro_variant_ops imx8mq_vpu_variant_ops = {
+	.init = imx8mq_vpu_hw_init,
+	.runtime_resume = imx8mq_runtime_resume,
+};
+
 const struct hantro_variant imx8mq_vpu_variant = {
 	.dec_fmts = imx8m_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
@@ -284,12 +289,11 @@ const struct hantro_variant imx8mq_vpu_variant = {
 	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
 		 HANTRO_H264_DECODER,
 	.codec_ops = imx8mq_vpu_codec_ops,
-	.init = imx8mq_vpu_hw_init,
-	.runtime_resume = imx8mq_runtime_resume,
 	.irqs = imx8mq_irqs,
 	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
 	.clk_names = imx8mq_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
+	.ops = &imx8mq_vpu_variant_ops,
 };
 
 const struct hantro_variant imx8mq_vpu_g2_variant = {
@@ -298,10 +302,9 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
 	.codec = HANTRO_HEVC_DECODER,
 	.codec_ops = imx8mq_vpu_g2_codec_ops,
-	.init = imx8mq_vpu_hw_init,
-	.runtime_resume = imx8mq_runtime_resume,
 	.irqs = imx8mq_g2_irqs,
 	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
 	.clk_names = imx8mq_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
+	.ops = &imx8mq_vpu_variant_ops,
 };
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index 3ccc16413f42..8e86408d87bb 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -433,6 +433,10 @@ static const char * const rockchip_vpu_clk_names[] = {
 	"aclk", "hclk"
 };
 
+static struct hantro_variant_ops rk3036_vpu_variant_ops = {
+	.init = rk3036_vpu_hw_init,
+};
+
 const struct hantro_variant rk3036_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3066_vpu_dec_fmts,
@@ -445,9 +449,13 @@ const struct hantro_variant rk3036_vpu_variant = {
 	.codec_ops = rk3036_vpu_codec_ops,
 	.irqs = rockchip_vdpu1_irqs,
 	.num_irqs = ARRAY_SIZE(rockchip_vdpu1_irqs),
-	.init = rk3036_vpu_hw_init,
 	.clk_names = rockchip_vpu_clk_names,
-	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
+	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names),
+	.ops = &rk3036_vpu_variant_ops,
+};
+
+static struct hantro_variant_ops rk3066_vpu_variant_ops = {
+	.init = rk3066_vpu_hw_init,
 };
 
 /*
@@ -470,9 +478,13 @@ const struct hantro_variant rk3066_vpu_variant = {
 	.codec_ops = rk3066_vpu_codec_ops,
 	.irqs = rockchip_vpu1_irqs,
 	.num_irqs = ARRAY_SIZE(rockchip_vpu1_irqs),
-	.init = rk3066_vpu_hw_init,
 	.clk_names = rk3066_vpu_clk_names,
-	.num_clocks = ARRAY_SIZE(rk3066_vpu_clk_names)
+	.num_clocks = ARRAY_SIZE(rk3066_vpu_clk_names),
+	.ops = &rk3066_vpu_variant_ops,
+};
+
+static struct hantro_variant_ops rk33xx_vpu_variant_ops = {
+	.init = rockchip_vpu_hw_init,
 };
 
 const struct hantro_variant rk3288_vpu_variant = {
@@ -490,9 +502,9 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.codec_ops = rk3288_vpu_codec_ops,
 	.irqs = rockchip_vpu1_irqs,
 	.num_irqs = ARRAY_SIZE(rockchip_vpu1_irqs),
-	.init = rockchip_vpu_hw_init,
 	.clk_names = rockchip_vpu_clk_names,
-	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
+	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names),
+	.ops = &rk33xx_vpu_variant_ops,
 };
 
 const struct hantro_variant rk3328_vpu_variant = {
@@ -503,9 +515,9 @@ const struct hantro_variant rk3328_vpu_variant = {
 	.codec_ops = rk3399_vpu_codec_ops,
 	.irqs = rockchip_vdpu2_irqs,
 	.num_irqs = ARRAY_SIZE(rockchip_vdpu2_irqs),
-	.init = rockchip_vpu_hw_init,
 	.clk_names = rockchip_vpu_clk_names,
 	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names),
+	.ops = &rk33xx_vpu_variant_ops,
 };
 
 const struct hantro_variant rk3399_vpu_variant = {
@@ -520,7 +532,7 @@ const struct hantro_variant rk3399_vpu_variant = {
 	.codec_ops = rk3399_vpu_codec_ops,
 	.irqs = rockchip_vpu2_irqs,
 	.num_irqs = ARRAY_SIZE(rockchip_vpu2_irqs),
-	.init = rockchip_vpu_hw_init,
 	.clk_names = rockchip_vpu_clk_names,
-	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
+	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names),
+	.ops = &rk33xx_vpu_variant_ops,
 };
diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
index 58ae72c2b723..9f071a9cd08f 100644
--- a/drivers/staging/media/hantro/sama5d4_vdec_hw.c
+++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
@@ -100,6 +100,10 @@ static const struct hantro_irq sama5d4_irqs[] = {
 
 static const char * const sama5d4_clk_names[] = { "vdec_clk" };
 
+static struct hantro_variant_ops sama5d4_vdec_variant_ops = {
+	.init = sama5d4_hw_init,
+};
+
 const struct hantro_variant sama5d4_vdec_variant = {
 	.dec_fmts = sama5d4_vdec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(sama5d4_vdec_fmts),
@@ -109,9 +113,9 @@ const struct hantro_variant sama5d4_vdec_variant = {
 	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
 		 HANTRO_H264_DECODER,
 	.codec_ops = sama5d4_vdec_codec_ops,
-	.init = sama5d4_hw_init,
 	.irqs = sama5d4_irqs,
 	.num_irqs = ARRAY_SIZE(sama5d4_irqs),
 	.clk_names = sama5d4_clk_names,
 	.num_clocks = ARRAY_SIZE(sama5d4_clk_names),
+	.ops = &sama5d4_vdec_variant_ops,
 };
-- 
2.25.1

