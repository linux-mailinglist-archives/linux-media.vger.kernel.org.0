Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7C038E4ED
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhEXLLF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbhEXLK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:10:57 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C701829E7;
        Mon, 24 May 2021 13:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854564;
        bh=/bO4BOYTblT6C+IXnVgDavnxDORJuqVwTddskR8seHw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vlPkiqq64s6SfFsUJkYuehg+Y2zijcF8mtPDW9rkQ6yoqqkrUfkbK2jizi1HGyKxB
         i4Dzj0y4rvuRhjRI8NK9begYwPideO2SSzkhwI62yEz2TPc1tJrhfRgDKHyW6vmj/N
         64BauCVTXFrddOCbLIkW7eApxNRFqEShqAJQEA/Q=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 14/38] media: ti-vpe: cal: catch VC errors
Date:   Mon, 24 May 2021 14:08:45 +0300
Message-Id: <20210524110909.672432-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
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

