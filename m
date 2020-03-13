Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE93B184615
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgCMLlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:41:47 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48696 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgCMLlr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:41:47 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfip6123421;
        Fri, 13 Mar 2020 06:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099704;
        bh=P4NyObOAVPL93bitxiqbqeCwtYbd9Bc7vBux4LRkixc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Wcvz5RXSupRvRTWjNGRgRvvPlrpW5fkW4xUdFO69yqdHuukbZDDCEoJgq6xeRbN2U
         cz8jRJjI1iHC7C8zuz9GsRrQY8CGag/+4PSBQ0yJXKSKLvZlRb5e8Kmqy6K0kzgQYR
         gpigamVzWZudZ4kEMeXULbHFlhKH9+u75KZV8m6c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfi1v039996;
        Fri, 13 Mar 2020 06:41:44 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:43 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcol044014;
        Fri, 13 Mar 2020 06:41:42 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 03/16] media: ti-vpe: cal: catch error irqs and print errors
Date:   Fri, 13 Mar 2020 13:41:08 +0200
Message-ID: <20200313114121.32182-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313114121.32182-1-tomi.valkeinen@ti.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL reports various errors via IRQs, which are not handled at all by the
current driver. Add code to enable and catch those IRQs and print
errors. This will make it much easier to notice and debug issues with
sensors.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 46 +++++++++++++++++++++++-
 drivers/media/platform/ti-vpe/cal_regs.h |  3 ++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b4a9f4d16ce4..f6ce0558752a 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -692,6 +692,21 @@ static void cal_quickdump_regs(struct cal_dev *dev)
  */
 static void enable_irqs(struct cal_ctx *ctx)
 {
+	const u32 cio_err_mask =
+		((1 << 20) - 1) |	/* lane errors */
+		BIT(27) |		/* FIFO_OVR */
+		BIT(28) |		/* SHORT_PACKET */
+		BIT(30);		/* ECC_NO_CORRECTION */
+
+	/* Enable CIO error irqs */
+	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1),
+		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
+	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
+		  cio_err_mask);
+
+	/* Always enable OCP error */
+	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1), BIT(6));
+
 	/* Enable IRQ_WDMA_END 0/1 */
 	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), 1 << (ctx->csi2_port - 1));
 	/* Enable IRQ_WDMA_START 0/1 */
@@ -702,6 +717,12 @@ static void enable_irqs(struct cal_ctx *ctx)
 
 static void disable_irqs(struct cal_ctx *ctx)
 {
+	/* Disable CIO error irqs */
+	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(1),
+		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
+	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
+		  0);
+
 	/* Disable IRQ_WDMA_END 0/1 */
 	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(2), 1 << (ctx->csi2_port - 1));
 	/* Disable IRQ_WDMA_START 0/1 */
@@ -1169,7 +1190,30 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	struct cal_dev *dev = (struct cal_dev *)data;
 	struct cal_ctx *ctx;
 	struct cal_dmaqueue *dma_q;
-	u32 irqst2, irqst3;
+	u32 irqst1, irqst2, irqst3;
+
+	irqst1 = reg_read(dev, CAL_HL_IRQSTATUS(1));
+	if (irqst1) {
+		int i;
+
+		reg_write(dev, CAL_HL_IRQSTATUS(1), irqst1);
+
+		if (irqst1 & BIT(6))
+			dev_err_ratelimited(&dev->pdev->dev, "OCP ERROR\n");
+
+		for (i = 1; i <= 2; ++i) {
+			if (irqst1 & CAL_HL_IRQ_CIO_MASK(i)) {
+				u32 cio_stat = reg_read(dev,
+							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
+
+				dev_err_ratelimited(&dev->pdev->dev,
+						    "CIO%d error: %#08x\n", i, cio_stat);
+
+				reg_write(dev, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
+					  cio_stat);
+			}
+		}
+	}
 
 	/* Check which DMA just finished */
 	irqst2 = reg_read(dev, CAL_HL_IRQSTATUS(2));
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index 0b76d1186074..a29198cc3efe 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -158,6 +158,9 @@
 #define CAL_HL_IRQ_ENABLED				0x1
 #define CAL_HL_IRQ_PENDING				0x1
 
+#define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + (i-1) * 8)
+#define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + (i-1) * 8)
+
 #define CAL_PIX_PROC_EN_MASK			BIT(0)
 #define CAL_PIX_PROC_EXTRACT_MASK		GENMASK(4, 1)
 #define CAL_PIX_PROC_EXTRACT_B6				0x0
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

