Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8723E48EC29
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 16:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbiANPD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 10:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235747AbiANPD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 10:03:56 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55594C06161C
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 07:03:56 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7BC37101C2F; Fri, 14 Jan 2022 15:03:53 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] media: mtk-cir: reduce message end to fix nec repeats
Date:   Fri, 14 Jan 2022 15:03:52 +0000
Message-Id: <20220114150353.195192-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ir receiver generates an interrupt with the IR data, once a space of
at least ok_count is has been seen. Currently this is about 110ms; when
holding down a button on a nec remote, no such space is generated until
a button is released. This means nothing happens until you release the
button.

The sample rate is fixed at 46us, so the maximum space that can be
encoded is about 12ms. So, the set ok_count above that at 23ms.

Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 840e7aec5c21..746d43fdc17a 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -24,7 +24,8 @@
  * Register to setting ok count whose unit based on hardware sampling period
  * indicating IR receiving completion and then making IRQ fires
  */
-#define MTK_OK_COUNT(x)		  (((x) & GENMASK(23, 16)) << 16)
+#define MTK_OK_COUNT_MASK	  (GENMASK(22, 16))
+#define MTK_OK_COUNT(x)		  ((x) << 16)
 
 /* Bit to enable IR hardware function */
 #define MTK_IR_EN		  BIT(0)
@@ -268,7 +269,7 @@ static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
 static const struct mtk_ir_data mt7623_data = {
 	.regs = mt7623_regs,
 	.fields = mt7623_fields,
-	.ok_count = 0xf,
+	.ok_count = 3,
 	.hw_period = 0xff,
 	.div	= 4,
 };
@@ -276,7 +277,7 @@ static const struct mtk_ir_data mt7623_data = {
 static const struct mtk_ir_data mt7622_data = {
 	.regs = mt7622_regs,
 	.fields = mt7622_fields,
-	.ok_count = 0xf,
+	.ok_count = 3,
 	.hw_period = 0xffff,
 	.div	= 32,
 };
@@ -400,7 +401,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	mtk_w32_mask(ir, MTK_DG_CNT(1), MTK_DG_CNT_MASK, MTK_IRTHD);
 
 	/* Enable IR and PWM */
-	val = mtk_r32(ir, MTK_CONFIG_HIGH_REG);
+	val = mtk_r32(ir, MTK_CONFIG_HIGH_REG) & ~MTK_OK_COUNT_MASK;
 	val |= MTK_OK_COUNT(ir->data->ok_count) |  MTK_PWM_EN | MTK_IR_EN;
 	mtk_w32(ir, val, MTK_CONFIG_HIGH_REG);
 
-- 
2.34.1

