Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34AA36586B
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhDTMF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:05:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbhDTMFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:54 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8ED2D1235;
        Tue, 20 Apr 2021 14:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920321;
        bh=O2PDnD5Nq3B16OPnLY/br3cUjv6h4spforr2yL++pr0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IfgoNDGpipJ9unSqs4QHe7ClWppj/0rALXONwGr+eZBTHybqhU/DQhB6+t+G8bb/W
         GFgMaxOVOSa1Bo6KOjzhaiTiBht5/DMapCPjy1oFbVXFcXAw4Yr2UOOE71VbkMm9V6
         /k2eKwQ8euFEYEdDGlnj2bmdKusQG+Tu9OrriDyU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 14/35] media: ti-vpe: cal: catch VC errors
Date:   Tue, 20 Apr 2021 15:04:12 +0300
Message-Id: <20210420120433.902394-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
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
index 9591a0c8a215..043e462c1d36 100644
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
index 01363294b882..0568677674b4 100644
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

