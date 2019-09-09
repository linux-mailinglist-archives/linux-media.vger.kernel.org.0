Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F92ADD34
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389738AbfIIQ0G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:26:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55406 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389678AbfIIQ0F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:26:05 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GQ3rA045139;
        Mon, 9 Sep 2019 11:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046363;
        bh=Dq/beKIWyXrJcll4mDZuPJ0BwS94XIORfr56X5vC+zI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=w61iHOkNG4i/qyEAYWvaPYsyGbGAplS9aOD1sTVrZaL++ZNT3HSqgtRxKUajt6ed+
         3pUJ1XW3mni7s966iV5oS9lC2SPyy5HIbQoAiG2qgFtX5Vt7+hBLYphC7QN/ybji/0
         Zz42pUEAysZnnMC0N5HsWoFf0UaulhNt7WpwExyM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x89GQ3qV026991
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 11:26:03 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:26:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:26:03 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoS056522;
        Mon, 9 Sep 2019 11:26:03 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 04/13] media: am437x-vpfe: Wait for end of frame before tear-down
Date:   Mon, 9 Sep 2019 11:27:34 -0500
Message-ID: <20190909162743.30114-5-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We were originally attempting to stop all processing as soon
as possible, but the in-progress DMA operation cannot be canceled.
This led to the module being in a busy state and prevented proper
power management functionality.

The existing implementation would attempt to clean things up by waiting
up to 50ms. However when receiving video frame at 15fps or lower,
it meant an inter frame arrival rate of 66.6 ms or higher.
In such cases upon tear down the following message could be seen:
omap_hwmod: vpfe0: _wait_target_disable failed

This patch fixes this issue by adding a stopping state where
we would wait for the next Vsync before disabling the hardware.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 52 ++++++++++-----------
 drivers/media/platform/am437x/am437x-vpfe.h |  3 ++
 2 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 7c5b734f7143..3a8ad9bdf283 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -441,40 +441,25 @@ static void vpfe_ccdc_restore_defaults(struct vpfe_ccdc *ccdc)
 
 static int vpfe_ccdc_close(struct vpfe_ccdc *ccdc, struct device *dev)
 {
-	int dma_cntl, i, pcr;
+	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
+	u32 dma_cntl, pcr;
 
-	/* If the CCDC module is still busy wait for it to be done */
-	for (i = 0; i < 10; i++) {
-		usleep_range(5000, 6000);
-		pcr = vpfe_reg_read(ccdc, VPFE_PCR);
-		if (!pcr)
-			break;
+	pcr = vpfe_reg_read(ccdc, VPFE_PCR);
+	if (pcr)
+		vpfe_dbg(1, vpfe, "VPFE_PCR is still set (%x)", pcr);
 
-		/* make sure it it is disabled */
-		vpfe_pcr_enable(ccdc, 0);
-	}
+	dma_cntl = vpfe_reg_read(ccdc, VPFE_DMA_CNTL);
+	if ((dma_cntl & VPFE_DMA_CNTL_OVERFLOW))
+		vpfe_dbg(1, vpfe, "VPFE_DMA_CNTL_OVERFLOW is still set (%x)",
+			 dma_cntl);
 
 	/* Disable CCDC by resetting all register to default POR values */
 	vpfe_ccdc_restore_defaults(ccdc);
 
-	/* if DMA_CNTL overflow bit is set. Clear it
-	 *  It appears to take a while for this to become quiescent ~20ms
-	 */
-	for (i = 0; i < 10; i++) {
-		dma_cntl = vpfe_reg_read(ccdc, VPFE_DMA_CNTL);
-		if (!(dma_cntl & VPFE_DMA_CNTL_OVERFLOW))
-			break;
-
-		/* Clear the overflow bit */
-		vpfe_reg_write(ccdc, dma_cntl, VPFE_DMA_CNTL);
-		usleep_range(5000, 6000);
-	}
-
 	/* Disabled the module at the CONFIG level */
 	vpfe_config_enable(ccdc, 0);
 
 	pm_runtime_put_sync(dev);
-
 	return 0;
 }
 
@@ -1303,6 +1288,9 @@ static void vpfe_handle_interlaced_irq(struct vpfe_device *vpfe,
 			if (vpfe->cur_frm != vpfe->next_frm)
 				vpfe_process_buffer_complete(vpfe);
 
+			if (vpfe->stopping)
+				return;
+
 			/*
 			 * based on whether the two fields are stored
 			 * interleave or separately in memory,
@@ -1341,7 +1329,7 @@ static irqreturn_t vpfe_isr(int irq, void *dev)
 {
 	struct vpfe_device *vpfe = (struct vpfe_device *)dev;
 	enum v4l2_field field = vpfe->fmt.fmt.pix.field;
-	int intr_status;
+	int intr_status, stopping = vpfe->stopping;
 
 	intr_status = vpfe_reg_read(&vpfe->ccdc, VPFE_IRQ_STS);
 
@@ -1352,9 +1340,13 @@ static irqreturn_t vpfe_isr(int irq, void *dev)
 		} else {
 			vpfe_handle_interlaced_irq(vpfe, field);
 		}
+		if (stopping) {
+			vpfe->stopping = false;
+			complete(&vpfe->capture_stop);
+		}
 	}
 
-	if (intr_status & VPFE_VDINT1) {
+	if (intr_status & VPFE_VDINT1 && !stopping) {
 		if (field == V4L2_FIELD_NONE &&
 		    vpfe->cur_frm == vpfe->next_frm)
 			vpfe_schedule_next_buffer(vpfe);
@@ -1980,6 +1972,9 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	vpfe_attach_irq(vpfe);
 
+	vpfe->stopping = false;
+	init_completion(&vpfe->capture_stop);
+
 	if (vpfe->ccdc.ccdc_cfg.if_type == VPFE_RAW_BAYER)
 		vpfe_ccdc_config_raw(&vpfe->ccdc);
 	else
@@ -2032,6 +2027,11 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
 
 	vpfe_pcr_enable(&vpfe->ccdc, 0);
 
+	/* Wait for the last frame to be captured */
+	vpfe->stopping = true;
+	wait_for_completion_timeout(&vpfe->capture_stop,
+				    msecs_to_jiffies(250));
+
 	vpfe_detach_irq(vpfe);
 
 	sdinfo = vpfe->current_subdev;
diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
index 4678285f34c6..2dde09780215 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.h
+++ b/drivers/media/platform/am437x/am437x-vpfe.h
@@ -23,6 +23,7 @@
 
 #include <linux/am437x-vpfe.h>
 #include <linux/clk.h>
+#include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
@@ -270,6 +271,8 @@ struct vpfe_device {
 	 */
 	u32 field_off;
 	struct vpfe_ccdc ccdc;
+	int stopping;
+	struct completion capture_stop;
 };
 
 #endif	/* AM437X_VPFE_H */
-- 
2.17.1

