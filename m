Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FEB3A6572
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhFNLiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:38:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58264 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235206AbhFNLgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:36:13 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A94CA5E9B;
        Mon, 14 Jun 2021 13:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669848;
        bh=JuLgHAGBlW21rYNAspfavRvEqNaJ6ERpEzqSVYt0Ndw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bzX6nMUPiWpDVKbnXlhDCPBedwALXkECSZYohM/X/1mOI0WWClpsv2KLXoHy/0s0g
         K+iaKngQqzA9yCTD6KbfMlCOdxVHsxXV+nvUT72n8C77zvmHap9gxSNaR+8A4wGBqN
         cHU4bVN+GRs6Z3v7Akj7O/9NdZyC3HKb2Bo2A48c=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 14/35] media: ti-vpe: cal: catch VC errors
Date:   Mon, 14 Jun 2021 14:23:24 +0300
Message-Id: <20210614112345.2032435-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL driver currently ignores VC related errors. To help catch error
conditions, enable all the VC error interrupts and handle them in the
interrupt handler by printing an error.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 25 ++++++++++++++++----
 drivers/media/platform/ti-vpe/cal.c          | 10 ++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 3bc63a5e9317..b36e55b63718 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -226,24 +226,41 @@ static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
 		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
 		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
 		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
-
-	/* Enable CIO error IRQs. */
+	const u32 vc_err_mask =
+		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(0) |
+		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(1) |
+		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(2) |
+		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(3) |
+		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(0) |
+		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(1) |
+		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(2) |
+		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(3);
+
+	/* Enable CIO & VC error IRQs. */
 	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
-		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+		  CAL_HL_IRQ_CIO_MASK(phy->instance) |
+		  CAL_HL_IRQ_VC_MASK(phy->instance));
 	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
 		  cio_err_mask);
+	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(phy->instance),
+		  vc_err_mask);
 }
 
 static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
 {
 	/* Disable CIO error irqs */
 	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
-		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+		  CAL_HL_IRQ_CIO_MASK(phy->instance) |
+		  CAL_HL_IRQ_VC_MASK(phy->instance));
 	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance), 0);
+	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(phy->instance), 0);
 }
 
 static void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
 {
+	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
+			1, CAL_CSI2_PPI_CTRL_ECC_EN_MASK);
+
 	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
 			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 964dc602f5af..759dc414a5bb 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -577,6 +577,16 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 				cal_write(cal, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
 					  cio_stat);
 			}
+
+			if (status & CAL_HL_IRQ_VC_MASK(i)) {
+				u32 vc_stat = cal_read(cal, CAL_CSI2_VC_IRQSTATUS(i));
+
+				dev_err_ratelimited(cal->dev,
+						    "CIO%u VC error: %#08x\n",
+						    i, vc_stat);
+
+				cal_write(cal, CAL_CSI2_VC_IRQSTATUS(i), vc_stat);
+			}
 		}
 	}
 
-- 
2.25.1

