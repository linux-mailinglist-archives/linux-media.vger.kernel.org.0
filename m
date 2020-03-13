Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2946184618
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgCMLlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:41:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33218 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgCMLlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:41:51 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfmLG122255;
        Fri, 13 Mar 2020 06:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099708;
        bh=q746mfL3jSiaqBZzUugmJ0nwOgAl1e82fkx1JdBiP+0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sHtGgVbNLF540CYZV+wVkPm3+h0D1zmaSHnweIOE0SEarll/cxzN2tHEcaIYPLE4J
         bNWLict2R2ahzqet0sFpwfH9JRbOHwNLDdIi5BI/tMA0loETWqVrp2xnDEDTGYSx8y
         fckQvwzKuUd51XyBsHPojMMLy4MAcr+YloJJtq9U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBfme1010661
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:41:48 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:47 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcon044014;
        Fri, 13 Mar 2020 06:41:45 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 05/16] media: ti-vpe: cal: simplify irq handling
Date:   Fri, 13 Mar 2020 13:41:10 +0200
Message-ID: <20200313114121.32182-5-tomi.valkeinen@ti.com>
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

Instead of having identical code block to handle irqs for the two CAL
ports, we can have a for loop and a single code block.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 68 +++++++++++------------------
 1 file changed, 25 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 1499d443f414..0888d6aac3f4 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1226,64 +1226,46 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
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

