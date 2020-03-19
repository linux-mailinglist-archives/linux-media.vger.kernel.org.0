Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 139B818AD88
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgCSHuy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:54 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37020 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCSHuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:54 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7onNE085592;
        Thu, 19 Mar 2020 02:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604249;
        bh=vZpbOU2dWm3Rvn6RhCOAQJcdEMOrD6Hl2qkg3kgwkxo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=H3lC2Aa1UkEBk8qeG+FB4CAOo69fSh5yg37fN1ZLjLyI+Q8WVC7XI9WDxlGSV/ZB3
         6QSlk9BS3IOzSunLxq8hT7LMTNWDAVmrkMTtX30tc2SQJSgB+gyHMqZH36ILF8Qm8v
         XxfUwtnOBMQ1NlXlqg4l+nXh7W2OiZZc9Km3B+po=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7onwl026552;
        Thu, 19 Mar 2020 02:50:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:49 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXql047151;
        Thu, 19 Mar 2020 02:50:48 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 08/19] media: ti-vpe: cal: simplify irq handling
Date:   Thu, 19 Mar 2020 09:50:12 +0200
Message-ID: <20200319075023.22151-9-tomi.valkeinen@ti.com>
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

Instead of having identical code block to handle irqs for the two CAL
ports, we can have a for loop and a single code block.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 68 +++++++++++------------------
 1 file changed, 25 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b070c56f8d80..ba82f0887875 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1228,64 +1228,46 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	/* Check which DMA just finished */
 	irqst2 = reg_read(dev, CAL_HL_IRQSTATUS(2));
 	if (irqst2) {
+		int i;
+
 		/* Clear Interrupt status */
 		reg_write(dev, CAL_HL_IRQSTATUS(2), irqst2);
 
-		/* Need to check both port */
-		if (isportirqset(irqst2, 1)) {
-			ctx = dev->ctx[0];
-
-			spin_lock(&ctx->slock);
-			ctx->dma_act = false;
-
-			if (ctx->cur_frm != ctx->next_frm)
-				cal_process_buffer_complete(ctx);
-
-			spin_unlock(&ctx->slock);
-		}
-
-		if (isportirqset(irqst2, 2)) {
-			ctx = dev->ctx[1];
+		for (i = 1; i <= 2; ++i) {
+			if (isportirqset(irqst2, i)) {
+				ctx = dev->ctx[i - 1];
 
-			spin_lock(&ctx->slock);
-			ctx->dma_act = false;
+				spin_lock(&ctx->slock);
+				ctx->dma_act = false;
 
-			if (ctx->cur_frm != ctx->next_frm)
-				cal_process_buffer_complete(ctx);
+				if (ctx->cur_frm != ctx->next_frm)
+					cal_process_buffer_complete(ctx);
 
-			spin_unlock(&ctx->slock);
+				spin_unlock(&ctx->slock);
+			}
 		}
 	}
 
 	/* Check which DMA just started */
 	irqst3 = reg_read(dev, CAL_HL_IRQSTATUS(3));
 	if (irqst3) {
+		int i;
+
 		/* Clear Interrupt status */
 		reg_write(dev, CAL_HL_IRQSTATUS(3), irqst3);
 
-		/* Need to check both port */
-		if (isportirqset(irqst3, 1)) {
-			ctx = dev->ctx[0];
-			dma_q = &ctx->vidq;
-
-			spin_lock(&ctx->slock);
-			ctx->dma_act = true;
-			if (!list_empty(&dma_q->active) &&
-			    ctx->cur_frm == ctx->next_frm)
-				cal_schedule_next_buffer(ctx);
-			spin_unlock(&ctx->slock);
-		}
-
-		if (isportirqset(irqst3, 2)) {
-			ctx = dev->ctx[1];
-			dma_q = &ctx->vidq;
-
-			spin_lock(&ctx->slock);
-			ctx->dma_act = true;
-			if (!list_empty(&dma_q->active) &&
-			    ctx->cur_frm == ctx->next_frm)
-				cal_schedule_next_buffer(ctx);
-			spin_unlock(&ctx->slock);
+		for (i = 1; i <= 2; ++i) {
+			if (isportirqset(irqst3, i)) {
+				ctx = dev->ctx[i - 1];
+				dma_q = &ctx->vidq;
+
+				spin_lock(&ctx->slock);
+				ctx->dma_act = true;
+				if (!list_empty(&dma_q->active) &&
+				    ctx->cur_frm == ctx->next_frm)
+					cal_schedule_next_buffer(ctx);
+				spin_unlock(&ctx->slock);
+			}
 		}
 	}
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

