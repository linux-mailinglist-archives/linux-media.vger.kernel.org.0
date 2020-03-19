Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0CF18AD86
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCSHuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36988 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgCSHut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:49 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7okex085582;
        Thu, 19 Mar 2020 02:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604246;
        bh=pEl9SEiN/b6XOCIaBduypkV3NHjXcRp9ifJe4yE344w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vgbtRks8RwM8PlJwEylpVBq372en1cCIpJSazx+0qlpx9INER1M9VW0MXqCW26+M+
         4YSQKtEE4ywSStdF92GpGH+g5Vaeh9Pb69ePbfAfiu/kZpvx2RVK29JTFaUTqEpdOh
         21Lp2Gt8xydNcptYJVhCQj6YOMckWhCQCkCGAM2I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7oknk118916
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:50:46 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:45 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqj047151;
        Thu, 19 Mar 2020 02:50:44 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 06/19] media: ti-vpe: cal: catch error irqs and print errors
Date:   Thu, 19 Mar 2020 09:50:10 +0200
Message-ID: <20200319075023.22151-7-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319075023.22151-1-tomi.valkeinen@ti.com>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
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
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 46 +++++++++++++++++++++++-
 drivers/media/platform/ti-vpe/cal_regs.h |  6 ++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 4f9dee3474ba..838215a3f230 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -684,6 +684,21 @@ static void enable_irqs(struct cal_ctx *ctx)
 {
 	u32 val;
 
+	const u32 cio_err_mask =
+		CAL_CSI2_COMPLEXIO_IRQ_LANE_ERRORS_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
+
+	/* Enable CIO error irqs */
+	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1),
+		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
+	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
+		  cio_err_mask);
+
+	/* Always enable OCPO error */
+	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1), CAL_HL_IRQ_OCPO_ERR_MASK);
+
 	/* Enable IRQ_WDMA_END 0/1 */
 	val = 0;
 	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
@@ -700,6 +715,12 @@ static void disable_irqs(struct cal_ctx *ctx)
 {
 	u32 val;
 
+	/* Disable CIO error irqs */
+	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(1),
+		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
+	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
+		  0);
+
 	/* Disable IRQ_WDMA_END 0/1 */
 	val = 0;
 	set_field(&val, CAL_HL_IRQ_CLEAR, CAL_HL_IRQ_MASK(ctx->csi2_port));
@@ -1171,7 +1192,30 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
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
+		if (irqst1 & CAL_HL_IRQ_OCPO_ERR_MASK)
+			dev_err_ratelimited(&dev->pdev->dev, "OCPO ERROR\n");
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
index 0b76d1186074..2d71f1e86e2a 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -158,6 +158,11 @@
 #define CAL_HL_IRQ_ENABLED				0x1
 #define CAL_HL_IRQ_PENDING				0x1
 
+#define CAL_HL_IRQ_OCPO_ERR_MASK		BIT(6)
+
+#define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + ((i)-1) * 8)
+#define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + ((i)-1) * 8)
+
 #define CAL_PIX_PROC_EN_MASK			BIT(0)
 #define CAL_PIX_PROC_EXTRACT_MASK		GENMASK(4, 1)
 #define CAL_PIX_PROC_EXTRACT_B6				0x0
@@ -414,6 +419,7 @@
 #define CAL_CSI2_COMPLEXIO_IRQ_ERRCONTROL3_MASK		BIT(17)
 #define CAL_CSI2_COMPLEXIO_IRQ_ERRCONTROL4_MASK		BIT(18)
 #define CAL_CSI2_COMPLEXIO_IRQ_ERRCONTROL5_MASK		BIT(19)
+#define CAL_CSI2_COMPLEXIO_IRQ_LANE_ERRORS_MASK		GENMASK(19, 0)
 #define CAL_CSI2_COMPLEXIO_IRQ_STATEULPM1_MASK		BIT(20)
 #define CAL_CSI2_COMPLEXIO_IRQ_STATEULPM2_MASK		BIT(21)
 #define CAL_CSI2_COMPLEXIO_IRQ_STATEULPM3_MASK		BIT(22)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

