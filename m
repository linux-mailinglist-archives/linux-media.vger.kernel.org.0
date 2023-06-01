Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4C0719B45
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 13:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbjFALyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 07:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjFALyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 07:54:44 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFBB129
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 04:54:42 -0700 (PDT)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 1 Jun 2023
 19:54:00 +0800
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
Subject: [PATCH v3 2/3] media: rc: meson-ir: rename Meson IR Controller register macros
Date:   Thu, 1 Jun 2023 19:54:32 +0800
Message-ID: <20230601115433.21809-3-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601115433.21809-1-zelong.dong@amlogic.com>
References: <20230601115433.21809-1-zelong.dong@amlogic.com>
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

There are more registers to come in the next Meson IR Controller.
For defining clearly, rename register macros.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/meson-ir.c | 77 +++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 6d77a8c33dc1..a0ccde02bc08 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -24,31 +24,30 @@
 #define IR_DEC_LDR_REPEAT	0x08
 #define IR_DEC_BIT_0		0x0c
 #define IR_DEC_REG0		0x10
-#define REG0_RATE_MASK		GENMASK(11, 0)
+#define IR_DEC_REG0_BASE_TIME	GENMASK(11, 0)
 #define IR_DEC_FRAME		0x14
 #define IR_DEC_STATUS		0x18
-#define STATUS_IR_DEC_IN	BIT(8)
+#define IR_DEC_STATUS_PULSE	BIT(8)
 #define IR_DEC_REG1		0x1c
-#define REG1_TIME_IV_MASK	GENMASK(28, 16)
-#define REG1_ENABLE		BIT(15)
-#define REG1_MODE_MASK		GENMASK(8, 7)
-#define REG1_MODE_SHIFT		7
-#define REG1_IRQSEL_MASK	GENMASK(3, 2)
-#define REG1_RESET		BIT(0)
+#define IR_DEC_REG1_TIME_IV	GENMASK(28, 16)
+#define IR_DEC_REG1_ENABLE	BIT(15)
+#define IR_DEC_REG1_MODE	GENMASK(8, 7)
+#define IR_DEC_REG1_IRQSEL	GENMASK(3, 2)
+#define IR_DEC_REG1_RESET	BIT(0)
 /* The following regs are only available on Meson 8b and newer */
 #define IR_DEC_REG2		0x20
-#define REG2_MODE_MASK		GENMASK(3, 0)
-#define REG2_MODE_SHIFT		0
+#define IR_DEC_REG2_MODE	GENMASK(3, 0)
 
-#define DECODE_MODE_NEC		0x0
-#define DECODE_MODE_RAW		0x2
+#define DEC_MODE_NEC		0x0
+#define DEC_MODE_RAW		0x2
 
-#define REG1_IRQSEL_NEC_MODE	0
-#define REG1_IRQSEL_RISE_FALL	1
-#define REG1_IRQSEL_FALL	2
-#define REG1_IRQSEL_RISE	3
+#define IRQSEL_NEC_MODE		0
+#define IRQSEL_RISE_FALL	1
+#define IRQSEL_FALL		2
+#define IRQSEL_RISE		3
 
-#define MESON_TRATE		10	/* us */
+#define MESON_RAW_TRATE		10	/* us */
+#define MESON_HW_TRATE		20	/* us */
 
 struct meson_ir {
 	void __iomem	*reg;
@@ -76,11 +75,11 @@ static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
 	spin_lock(&ir->lock);
 
 	duration = readl_relaxed(ir->reg + IR_DEC_REG1);
-	duration = FIELD_GET(REG1_TIME_IV_MASK, duration);
-	rawir.duration = duration * MESON_TRATE;
+	duration = FIELD_GET(IR_DEC_REG1_TIME_IV, duration);
+	rawir.duration = duration * MESON_RAW_TRATE;
 
 	status = readl_relaxed(ir->reg + IR_DEC_STATUS);
-	rawir.pulse = !!(status & STATUS_IR_DEC_IN);
+	rawir.pulse = !!(status & IR_DEC_STATUS_PULSE);
 
 	ir_raw_event_store_with_timeout(ir->rc, &rawir);
 
@@ -122,7 +121,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 	map_name = of_get_property(node, "linux,rc-map-name", NULL);
 	ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	ir->rc->rx_resolution = MESON_TRATE;
+	ir->rc->rx_resolution = MESON_RAW_TRATE;
 	ir->rc->min_timeout = 1;
 	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
 	ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
@@ -144,24 +143,27 @@ static int meson_ir_probe(struct platform_device *pdev)
 	}
 
 	/* Reset the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, REG1_RESET);
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, 0);
+	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_RESET,
+			  IR_DEC_REG1_RESET);
+	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
 
 	/* Set general operation mode (= raw/software decoding) */
 	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
-				  FIELD_PREP(REG1_MODE_MASK, DECODE_MODE_RAW));
+		meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				  FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
-				  FIELD_PREP(REG2_MODE_MASK, DECODE_MODE_RAW));
+		meson_ir_set_mask(ir, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				  FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
 
 	/* Set rate */
-	meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, MESON_TRATE - 1);
+	meson_ir_set_mask(ir, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			  MESON_RAW_TRATE - 1);
 	/* IRQ on rising and falling edges */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_IRQSEL_MASK,
-			  FIELD_PREP(REG1_IRQSEL_MASK, REG1_IRQSEL_RISE_FALL));
+	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
+			  FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
 	/* Enable the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, REG1_ENABLE);
+	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
+			  IR_DEC_REG1_ENABLE);
 
 	dev_info(dev, "receiver initialized\n");
 
@@ -175,7 +177,7 @@ static void meson_ir_remove(struct platform_device *pdev)
 
 	/* Disable the decoder */
 	spin_lock_irqsave(&ir->lock, flags);
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, 0);
+	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
@@ -193,14 +195,15 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	 * bootloader a chance to power the system back on
 	 */
 	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
-				  DECODE_MODE_NEC << REG1_MODE_SHIFT);
+		meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				  FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_NEC));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
-				  DECODE_MODE_NEC << REG2_MODE_SHIFT);
+		meson_ir_set_mask(ir, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				  FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_NEC));
 
 	/* Set rate to default value */
-	meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, 0x13);
+	meson_ir_set_mask(ir, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			  MESON_HW_TRATE - 1);
 
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
-- 
2.35.1

