Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D4A3CC23
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 14:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388820AbfFKMvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 08:51:05 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38029 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387931AbfFKMvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 08:51:04 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hagEw-00077w-O8; Tue, 11 Jun 2019 14:51:02 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v4 04/10] media: hantro: make irq names configurable
Date:   Tue, 11 Jun 2019 14:50:52 +0200
Message-Id: <20190611125058.13470-5-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611125058.13470-1-p.zabel@pengutronix.de>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MQ bindings will use different IRQ names ("g1" instead of
"vdpu", and "g2"), so make them configurable. This also allows to
register more than two IRQs, which will be required for i.MX8MM support
later (it will add "h1" instead of "vepu").

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/hantro/hantro.h        | 19 ++++++++---
 drivers/staging/media/hantro/hantro_drv.c    | 33 +++++++-------------
 drivers/staging/media/hantro/rk3288_vpu_hw.c |  9 ++++--
 drivers/staging/media/hantro/rk3399_vpu_hw.c | 16 ++++++++--
 4 files changed, 46 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 296b9ffad547..d041d36a0805 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -44,6 +44,17 @@ struct hantro_codec_ops;
 #define HANTRO_MPEG2_DECODER	BIT(16)
 #define HANTRO_DECODERS		0xffff0000
 
+/**
+ * struct hantro_irq - irq handler and name
+ *
+ * @name:			irq name for device tree lookup
+ * @handler:			interrupt handler
+ */
+struct hantro_irq {
+	const char *name;
+	irqreturn_t (*handler)(int irq, void *priv);
+};
+
 /**
  * struct hantro_variant - information about VPU hardware variant
  *
@@ -57,8 +68,8 @@ struct hantro_codec_ops;
  * @codec_ops:			Codec ops.
  * @init:			Initialize hardware.
  * @runtime_resume:		reenable hardware after power gating
- * @vepu_irq:			encoder interrupt handler
- * @vdpu_irq:			decoder interrupt handler
+ * @irqs:			array of irq names and interrupt handlers
+ * @num_irqs:			number of irqs in the array
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
  */
@@ -73,8 +84,8 @@ struct hantro_variant {
 	const struct hantro_codec_ops *codec_ops;
 	int (*init)(struct hantro_dev *vpu);
 	int (*runtime_resume)(struct hantro_dev *vpu);
-	irqreturn_t (*vepu_irq)(int irq, void *priv);
-	irqreturn_t (*vdpu_irq)(int irq, void *priv);
+	const struct hantro_irq *irqs;
+	int num_irqs;
 	const char *clk_names[HANTRO_MAX_CLOCKS];
 	int num_clocks;
 };
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 79c351d57200..4507a5e87fee 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -707,36 +707,25 @@ static int hantro_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (vpu->variant->vdpu_irq) {
+	for (i = 0; i < vpu->variant->num_irqs; i++) {
+		const char *irq_name = vpu->variant->irqs[i].name;
 		int irq;
 
-		irq = platform_get_irq_byname(vpu->pdev, "vdpu");
-		if (irq <= 0) {
-			dev_err(vpu->dev, "Could not get vdpu IRQ.\n");
-			return -ENXIO;
-		}
-
-		ret = devm_request_irq(vpu->dev, irq, vpu->variant->vdpu_irq,
-				       0, dev_name(vpu->dev), vpu);
-		if (ret) {
-			dev_err(vpu->dev, "Could not request vdpu IRQ.\n");
-			return ret;
-		}
-	}
-
-	if (vpu->variant->vepu_irq) {
-		int irq;
+		if (!vpu->variant->irqs[i].handler)
+			continue;
 
-		irq = platform_get_irq_byname(vpu->pdev, "vepu");
+		irq = platform_get_irq_byname(vpu->pdev, irq_name);
 		if (irq <= 0) {
-			dev_err(vpu->dev, "Could not get vepu IRQ.\n");
+			dev_err(vpu->dev, "Could not get %s IRQ.\n", irq_name);
 			return -ENXIO;
 		}
 
-		ret = devm_request_irq(vpu->dev, irq, vpu->variant->vepu_irq,
-				       0, dev_name(vpu->dev), vpu);
+		ret = devm_request_irq(vpu->dev, irq,
+				       vpu->variant->irqs[i].handler, 0,
+				       dev_name(vpu->dev), vpu);
 		if (ret) {
-			dev_err(vpu->dev, "Could not request vepu IRQ.\n");
+			dev_err(vpu->dev, "Could not request %s IRQ.\n",
+				irq_name);
 			return ret;
 		}
 	}
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index f0d3f0eec07b..c5473bc1ac29 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -161,6 +161,11 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
  * VPU variant.
  */
 
+static const struct hantro_irq rk3288_irqs[] = {
+	{ "vepu", rk3288_vepu_irq },
+	{ "vdpu", rk3288_vdpu_irq },
+};
+
 const struct hantro_variant rk3288_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3288_vpu_enc_fmts,
@@ -170,8 +175,8 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
 	.codec_ops = rk3288_vpu_codec_ops,
-	.vepu_irq = rk3288_vepu_irq,
-	.vdpu_irq = rk3288_vdpu_irq,
+	.irqs = rk3288_irqs,
+	.num_irqs = ARRAY_SIZE(rk3288_irqs),
 	.init = rk3288_vpu_hw_init,
 	.clk_names = {"aclk", "hclk"},
 	.num_clocks = 2
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index 5e51def41f57..fc52bedf3665 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -160,6 +160,11 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
  * VPU variant.
  */
 
+static const struct hantro_irq rk3399_irqs[] = {
+	{ "vepu", rk3399_vepu_irq },
+	{ "vdpu", rk3399_vdpu_irq },
+};
+
 const struct hantro_variant rk3399_vpu_variant = {
 	.enc_offset = 0x0,
 	.enc_fmts = rk3399_vpu_enc_fmts,
@@ -169,20 +174,25 @@ const struct hantro_variant rk3399_vpu_variant = {
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
-	.vepu_irq = rk3399_vepu_irq,
-	.vdpu_irq = rk3399_vdpu_irq,
+	.irqs = rk3399_irqs,
+	.num_irqs = ARRAY_SIZE(rk3399_irqs),
 	.init = rk3399_vpu_hw_init,
 	.clk_names = {"aclk", "hclk"},
 	.num_clocks = 2
 };
 
+static const struct hantro_irq rk3328_irqs[] = {
+	{ "vdpu", rk3399_vdpu_irq },
+};
+
 const struct hantro_variant rk3328_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
 	.codec = HANTRO_MPEG2_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
-	.vdpu_irq = rk3399_vdpu_irq,
+	.irqs = rk3328_irqs,
+	.num_irqs = ARRAY_SIZE(rk3328_irqs),
 	.init = rk3399_vpu_hw_init,
 	.clk_names = {"aclk", "hclk"},
 	.num_clocks = 2
-- 
2.20.1

