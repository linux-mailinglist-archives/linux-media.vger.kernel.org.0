Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9AA299B9
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 16:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404097AbfEXOFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 10:05:34 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54567 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403976AbfEXOF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 10:05:26 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hUAp3-0002Dk-E0; Fri, 24 May 2019 16:05:25 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 06/10] media: hantro: add support for named register ranges
Date:   Fri, 24 May 2019 16:04:55 +0200
Message-Id: <20190524140459.4002-7-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524140459.4002-1-p.zabel@pengutronix.de>
References: <20190524140459.4002-1-p.zabel@pengutronix.de>
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

Add support for multiple register ranges with SoC specific names.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro.h     |  7 ++++++-
 drivers/staging/media/hantro/hantro_drv.c | 25 +++++++++++++++++------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index ca4d3a9fdd05..70a1cfee0281 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -27,6 +27,7 @@
 
 #define HANTRO_MAX_CLOCKS		4
 #define HANTRO_MAX_IRQS			3
+#define HANTRO_MAX_REG_RANGES		4
 
 #define MPEG2_MB_DIM			16
 #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
@@ -63,6 +64,8 @@ struct hantro_codec_ops;
  * @num_irqs:			number of irqs in the arrays
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
+ * @reg_names:			array of register range names
+ * @num_regs:			number of register range names in the array
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -80,6 +83,8 @@ struct hantro_variant {
 	int num_irqs;
 	const char *clk_names[HANTRO_MAX_CLOCKS];
 	int num_clocks;
+	const char *reg_names[HANTRO_MAX_REG_RANGES];
+	int num_regs;
 };
 
 /**
@@ -170,7 +175,7 @@ struct hantro_dev {
 	struct platform_device *pdev;
 	struct device *dev;
 	struct clk_bulk_data clocks[HANTRO_MAX_CLOCKS];
-	void __iomem *base;
+	void __iomem *base[HANTRO_MAX_REG_RANGES];
 	void __iomem *enc_base;
 	void __iomem *dec_base;
 
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index b6e5c8e99dd8..b5aeaa7ff804 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -694,12 +694,25 @@ static int hantro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	res = platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
-	vpu->base = devm_ioremap_resource(vpu->dev, res);
-	if (IS_ERR(vpu->base))
-		return PTR_ERR(vpu->base);
-	vpu->enc_base = vpu->base + vpu->variant->enc_offset;
-	vpu->dec_base = vpu->base + vpu->variant->dec_offset;
+	if (vpu->variant->num_regs) {
+		for (i = 0; i < vpu->variant->num_regs; i++) {
+			const char *reg_name = vpu->variant->reg_names[i];
+
+			res = platform_get_resource_byname(vpu->pdev,
+							   IORESOURCE_MEM,
+							   reg_name);
+			vpu->base[i] = devm_ioremap_resource(vpu->dev, res);
+			if (IS_ERR(vpu->base[i]))
+				return PTR_ERR(vpu->base[i]);
+		}
+	} else {
+		res = platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
+		vpu->base[0] = devm_ioremap_resource(vpu->dev, res);
+		if (IS_ERR(vpu->base[0]))
+			return PTR_ERR(vpu->base[0]);
+		vpu->enc_base = vpu->base[0] + vpu->variant->enc_offset;
+		vpu->dec_base = vpu->base[0] + vpu->variant->dec_offset;
+	}
 
 	ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
 	if (ret) {
-- 
2.20.1

