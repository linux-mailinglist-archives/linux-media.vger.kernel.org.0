Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C931927F9
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbgCYMQJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:09 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39314 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCYMQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:09 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCG60O078524;
        Wed, 25 Mar 2020 07:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138566;
        bh=0NvQwr4geNSED7nzsef812hmZpUS3Q5SDOTKBytWIY8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pu8Ti5yNzy0B6fygHSna7y07QaInY/Q5EgzWlFLSIn2ftay7DcCdeI6wwEfhnEUY5
         KFHclzawwUUIvn67yl0nBiK8PFWYIDeYmVup6LrLozk+naOhAK0S6VPkK3mnD9/bM6
         NBQXZ7ZCidy2fIh4GFcHziOqno14jsUElOw2zr08=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCG6Bh003495;
        Wed, 25 Mar 2020 07:16:06 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:05 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm57085323;
        Wed, 25 Mar 2020 07:16:04 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 08/19] media: ti-vpe: cal: simplify irq handling
Date:   Wed, 25 Mar 2020 14:14:59 +0200
Message-ID: <20200325121510.25923-9-tomi.valkeinen@ti.com>
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

Instead of having identical code block to handle irqs for the two CAL
ports, we can have a for loop and a single code block.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 68 +++++++++++------------------
 1 file changed, 25 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9bfe83fdd76e..df06ecfdfc6a 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1221,64 +1221,46 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
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

