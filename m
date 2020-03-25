Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 111FC1927F2
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbgCYMP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:15:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60916 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMP4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:15:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFqPN012911;
        Wed, 25 Mar 2020 07:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138552;
        bh=IiA6Y6uIhckpd4wm4aVOMaEaPV5ksJ9Hyu9eYzzkdlw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=KIPrtUt1VuSw25rZA3bngFLGavuuMIcIrMszRzLLNiA0B8YqrGYFPL9/s3dBhEl7v
         JhHyiQbVpxrUR7mm1XRETJBdlwq5wmIOu6NVSaLM1142hOrSbAIiZgBZ61ZDJbDb75
         lQMCHc+WIGdYvtizHY/Ed1AXSo94PeQIxJTdFDd4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCFqRC013042
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:15:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:15:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:15:52 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm50085323;
        Wed, 25 Mar 2020 07:15:50 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 01/19] media: ti-vpe: cal: fix DMA memory corruption
Date:   Wed, 25 Mar 2020 14:14:52 +0200
Message-ID: <20200325121510.25923-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325121510.25923-1-tomi.valkeinen@ti.com>
References: <20200325121510.25923-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the CAL driver stops streaming, it will shut everything down
without waiting for the current frame to finish. This leaves the CAL DMA
in a slightly undefined state, and when CAL DMA is enabled when the
stream is started the next time, the old DMA transfer will continue.

It is not clear if the old DMA transfer continues with the exact
settings of the original transfer, or is it a mix of old and new
settings, but in any case the end result is memory corruption as the
destination memory address is no longer valid.

I could not find any way to ensure that any old DMA transfer would be
discarded, except perhaps full CAL reset. But we cannot do a full reset
when one port is getting enabled, as that would reset both ports.

This patch tries to make sure that the DMA transfer is finished properly
when the stream is being stopped. I say "tries", as, as mentioned above,
I don't see a way to force the DMA transfer to finish. I believe this
fixes the corruptions for normal cases, but if for some reason the DMA
of the final frame would stall a lot, resulting in timeout in the code
waiting for the DMA to finish, we'll again end up with unfinished DMA
transfer. However, I don't know what could cause such a timeout.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 6c8f3702eac0..9dd6de14189b 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -412,6 +412,8 @@ struct cal_ctx {
 	struct cal_buffer	*cur_frm;
 	/* Pointer pointing to next v4l2_buffer */
 	struct cal_buffer	*next_frm;
+
+	bool dma_act;
 };
 
 static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
@@ -942,6 +944,7 @@ static void csi2_lane_config(struct cal_ctx *ctx)
 
 static void csi2_ppi_enable(struct cal_ctx *ctx)
 {
+	reg_write(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port), BIT(3));
 	reg_write_field(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
 			CAL_GEN_ENABLE, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
@@ -1204,15 +1207,25 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		if (isportirqset(irqst2, 1)) {
 			ctx = dev->ctx[0];
 
+			spin_lock(&ctx->slock);
+			ctx->dma_act = false;
+
 			if (ctx->cur_frm != ctx->next_frm)
 				cal_process_buffer_complete(ctx);
+
+			spin_unlock(&ctx->slock);
 		}
 
 		if (isportirqset(irqst2, 2)) {
 			ctx = dev->ctx[1];
 
+			spin_lock(&ctx->slock);
+			ctx->dma_act = false;
+
 			if (ctx->cur_frm != ctx->next_frm)
 				cal_process_buffer_complete(ctx);
+
+			spin_unlock(&ctx->slock);
 		}
 	}
 
@@ -1228,6 +1241,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 			dma_q = &ctx->vidq;
 
 			spin_lock(&ctx->slock);
+			ctx->dma_act = true;
 			if (!list_empty(&dma_q->active) &&
 			    ctx->cur_frm == ctx->next_frm)
 				cal_schedule_next_buffer(ctx);
@@ -1239,6 +1253,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 			dma_q = &ctx->vidq;
 
 			spin_lock(&ctx->slock);
+			ctx->dma_act = true;
 			if (!list_empty(&dma_q->active) &&
 			    ctx->cur_frm == ctx->next_frm)
 				cal_schedule_next_buffer(ctx);
@@ -1711,10 +1726,27 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
 	struct cal_buffer *buf, *tmp;
+	unsigned long timeout;
 	unsigned long flags;
 	int ret;
+	bool dma_act;
 
 	csi2_ppi_disable(ctx);
+
+	/* wait for stream and dma to finish */
+	dma_act = true;
+	timeout = jiffies + msecs_to_jiffies(500);
+	while (dma_act && time_before(jiffies, timeout)) {
+		msleep(50);
+
+		spin_lock_irqsave(&ctx->slock, flags);
+		dma_act = ctx->dma_act;
+		spin_unlock_irqrestore(&ctx->slock, flags);
+	}
+
+	if (dma_act)
+		ctx_err(ctx, "failed to disable dma cleanly\n");
+
 	disable_irqs(ctx);
 	csi2_phy_deinit(ctx);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

