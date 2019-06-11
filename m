Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5C0C3CC36
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 14:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389228AbfFKMvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 08:51:14 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48407 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387963AbfFKMvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 08:51:04 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hagEw-00077w-P5; Tue, 11 Jun 2019 14:51:02 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v4 05/10] media: hantro: add support for named register ranges
Date:   Tue, 11 Jun 2019 14:50:53 +0200
Message-Id: <20190611125058.13470-6-p.zabel@pengutronix.de>
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

Add support for multiple register ranges with SoC specific names.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes since v3 [1]:
 - Renamed bases to reg_bases

[1] https://patchwork.linuxtv.org/patch/56467/
---
 drivers/staging/media/hantro/hantro.h     |  8 ++++++--
 drivers/staging/media/hantro/hantro_drv.c | 24 +++++++++++++++++------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index d041d36a0805..e8eb747f22ef 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -72,6 +72,8 @@ struct hantro_irq {
  * @num_irqs:			number of irqs in the array
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
+ * @reg_names:			array of register range names
+ * @num_regs:			number of register range names in the array
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -88,6 +90,8 @@ struct hantro_variant {
 	int num_irqs;
 	const char *clk_names[HANTRO_MAX_CLOCKS];
 	int num_clocks;
+	const char * const *reg_names;
+	int num_regs;
 };
 
 /**
@@ -160,7 +164,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  * @dev:		Pointer to device for convenient logging using
  *			dev_ macros.
  * @clocks:		Array of clock handles.
- * @base:		Mapped address of VPU registers.
+ * @reg_bases:		Mapped addresses of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
@@ -178,7 +182,7 @@ struct hantro_dev {
 	struct platform_device *pdev;
 	struct device *dev;
 	struct clk_bulk_data clocks[HANTRO_MAX_CLOCKS];
-	void __iomem *base;
+	void __iomem **reg_bases;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
 
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 4507a5e87fee..fa933960687d 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -671,6 +671,7 @@ static int hantro_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct hantro_dev *vpu;
 	struct resource *res;
+	int num_bases;
 	int i, ret;
 
 	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
@@ -694,12 +695,23 @@ static int hantro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	res = platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
-	vpu->base = devm_ioremap_resource(vpu->dev, res);
-	if (IS_ERR(vpu->base))
-		return PTR_ERR(vpu->base);
-	vpu->enc_base = vpu->base + vpu->variant->enc_offset;
-	vpu->dec_base = vpu->base + vpu->variant->dec_offset;
+	num_bases = vpu->variant->num_regs ?: 1;
+	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
+				      sizeof(*vpu->reg_bases), GFP_KERNEL);
+	if (!vpu->reg_bases)
+		return -ENOMEM;
+
+	for (i = 0; i < num_bases; i++) {
+		res = vpu->variant->reg_names ?
+		      platform_get_resource_byname(vpu->pdev, IORESOURCE_MEM,
+						   vpu->variant->reg_names[i]) :
+		      platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
+		vpu->reg_bases[i] = devm_ioremap_resource(vpu->dev, res);
+		if (IS_ERR(vpu->reg_bases[i]))
+			return PTR_ERR(vpu->reg_bases[i]);
+	}
+	vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
+	vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
 
 	ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
 	if (ret) {
-- 
2.20.1

