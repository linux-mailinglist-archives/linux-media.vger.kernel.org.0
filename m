Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1A7C706745
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 13:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjEQL45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 07:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjEQL4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 07:56:55 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB7D40E5
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 04:56:53 -0700 (PDT)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 17 May 2023
 19:56:43 +0800
From:   zelong dong <zelong.dong@amlogic.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
        <kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v2 3/3] media: rc: meson-ir: support MMIO regmaps to access registers
Date:   Wed, 17 May 2023 19:56:35 +0800
Message-ID: <20230517115635.31565-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230517115635.31565-1-zelong.dong@amlogic.com>
References: <20230517115635.31565-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.11.69]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zelong Dong <zelong.dong@amlogic.com>

Supports MMIO regmaps to access controller registers in Meson IR driver.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/meson-ir.c | 72 +++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 7ab6304f7184..ac4ebaa3904c 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/bitfield.h>
+#include <linux/regmap.h>
 
 #include <media/rc-core.h>
 
@@ -55,21 +56,16 @@
 #define MESON_HW_TRATE		20	/* us */
 
 struct meson_ir {
-	void __iomem	*reg;
+	struct regmap	*reg;
 	struct rc_dev	*rc;
 	spinlock_t	lock;
 };
 
-static void meson_ir_set_mask(struct meson_ir *ir, unsigned int reg,
-			      u32 mask, u32 value)
-{
-	u32 data;
-
-	data = readl(ir->reg + reg);
-	data &= ~mask;
-	data |= (value & mask);
-	writel(data, ir->reg + reg);
-}
+static struct regmap_config meson_ir_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
 
 static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
 {
@@ -79,11 +75,11 @@ static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
 
 	spin_lock(&ir->lock);
 
-	duration = readl_relaxed(ir->reg + IR_DEC_REG1);
+	regmap_read(ir->reg, IR_DEC_REG1, &duration);
 	duration = FIELD_GET(IR_DEC_REG1_TIME_IV, duration);
 	rawir.duration = duration * MESON_RAW_TRATE;
 
-	status = readl_relaxed(ir->reg + IR_DEC_STATUS);
+	regmap_read(ir->reg, IR_DEC_STATUS, &status);
 	rawir.pulse = !!(status & IR_DEC_STATUS_PULSE);
 
 	ir_raw_event_store_with_timeout(ir->rc, &rawir);
@@ -97,6 +93,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	void __iomem *res_start;
 	const char *map_name;
 	struct meson_ir *ir;
 	int irq, ret;
@@ -105,7 +102,12 @@ static int meson_ir_probe(struct platform_device *pdev)
 	if (!ir)
 		return -ENOMEM;
 
-	ir->reg = devm_platform_ioremap_resource(pdev, 0);
+	res_start = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(res_start))
+		return PTR_ERR(res_start);
+
+	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
+					&meson_ir_regmap_config);
 	if (IS_ERR(ir->reg))
 		return PTR_ERR(ir->reg);
 
@@ -148,27 +150,28 @@ static int meson_ir_probe(struct platform_device *pdev)
 	}
 
 	/* Reset the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_RESET,
-			  IR_DEC_REG1_RESET);
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
+			   IR_DEC_REG1_RESET);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
 
 	/* Set general operation mode (= raw/software decoding) */
 	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_MODE,
-				  FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
+		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, IR_DEC_REG2_MODE,
-				  FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
+		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
 
 	/* Set rate */
-	meson_ir_set_mask(ir, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
-			  MESON_RAW_TRATE - 1);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			   FIELD_PREP(IR_DEC_REG0_BASE_TIME,
+				      MESON_RAW_TRATE - 1));
 	/* IRQ on rising and falling edges */
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
-			  FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
+			   FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
 	/* Enable the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
-			  IR_DEC_REG1_ENABLE);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
+			   IR_DEC_REG1_ENABLE);
 
 	dev_info(dev, "receiver initialized\n");
 
@@ -182,7 +185,7 @@ static int meson_ir_remove(struct platform_device *pdev)
 
 	/* Disable the decoder */
 	spin_lock_irqsave(&ir->lock, flags);
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
 	spin_unlock_irqrestore(&ir->lock, flags);
 
 	return 0;
@@ -202,15 +205,16 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	 * bootloader a chance to power the system back on
 	 */
 	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_MODE,
-				  FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_NEC));
+		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_NEC));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, IR_DEC_REG2_MODE,
-				  FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_NEC));
+		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_NEC));
 
 	/* Set rate to default value */
-	meson_ir_set_mask(ir, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
-			  MESON_HW_TRATE - 1);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			   FIELD_PREP(IR_DEC_REG0_BASE_TIME,
+				      MESON_HW_TRATE - 1));
 
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
-- 
2.35.1

