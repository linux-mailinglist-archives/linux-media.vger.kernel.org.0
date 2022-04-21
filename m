Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9FB50A29A
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389394AbiDUOh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389500AbiDUOh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:37:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6F25FA1
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:35:07 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 999DD8E6;
        Thu, 21 Apr 2022 16:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650551703;
        bh=F7clPYedaCxFMb1jG7GPMYn+ylDt167SU3/HPUzUzvI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R3AABhwqwjWa93BPjbKZPLqiU+/zxfCG6deqejwPhycWLLCJmSdxuq4nvB/vFY5OE
         Abm4LCwTz+YCnbjQb9JfTIGldSzfsDmVL+pJGo8o2PusEDJH/i0lByrxLpnU8OxK9H
         oCPI01KnV1xJS73VihBieta4UMRyPdsryDXw8hYE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 5/6] media: ti: cal: combine wdma irq handling
Date:   Thu, 21 Apr 2022 17:34:48 +0300
Message-Id: <20220421143449.552312-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
References: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of handling the WDMA START and END interrupts separately, we
need to handle both at the same time to better manage the inherent race
conditions related to CAL interrupts.

Change the code so that we have a single function,
cal_irq_handle_wdma(), which gets two booleans, start and end, as
parameters, which allows us to manage the race conditions in the
following patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal.c | 59 ++++++++++++-----------------
 1 file changed, 25 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 783ce5a8cd79..e4355f266c58 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -668,22 +668,33 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 	}
 }
 
+static void cal_irq_handle_wdma(struct cal_ctx *ctx, bool start, bool end)
+{
+	if (end)
+		cal_irq_wdma_end(ctx);
+
+	if (start)
+		cal_irq_wdma_start(ctx);
+}
+
 static irqreturn_t cal_irq(int irq_cal, void *data)
 {
 	struct cal_dev *cal = data;
-	u32 status;
-
-	status = cal_read(cal, CAL_HL_IRQSTATUS(0));
-	if (status) {
-		unsigned int i;
+	u32 status[3];
+	unsigned int i;
 
-		cal_write(cal, CAL_HL_IRQSTATUS(0), status);
+	for (i = 0; i < 3; ++i) {
+		status[i] = cal_read(cal, CAL_HL_IRQSTATUS(i));
+		if (status[i])
+			cal_write(cal, CAL_HL_IRQSTATUS(i), status[i]);
+	}
 
-		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
+	if (status[0]) {
+		if (status[0] & CAL_HL_IRQ_OCPO_ERR_MASK)
 			dev_err_ratelimited(cal->dev, "OCPO ERROR\n");
 
 		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
-			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
+			if (status[0] & CAL_HL_IRQ_CIO_MASK(i)) {
 				u32 cio_stat = cal_read(cal,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
 
@@ -694,7 +705,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 					  cio_stat);
 			}
 
-			if (status & CAL_HL_IRQ_VC_MASK(i)) {
+			if (status[0] & CAL_HL_IRQ_VC_MASK(i)) {
 				u32 vc_stat = cal_read(cal, CAL_CSI2_VC_IRQSTATUS(i));
 
 				dev_err_ratelimited(cal->dev,
@@ -706,32 +717,12 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		}
 	}
 
-	/* Check which DMA just finished */
-	status = cal_read(cal, CAL_HL_IRQSTATUS(1));
-	if (status) {
-		unsigned int i;
-
-		/* Clear Interrupt status */
-		cal_write(cal, CAL_HL_IRQSTATUS(1), status);
-
-		for (i = 0; i < cal->num_contexts; ++i) {
-			if (status & CAL_HL_IRQ_WDMA_END_MASK(i))
-				cal_irq_wdma_end(cal->ctx[i]);
-		}
-	}
-
-	/* Check which DMA just started */
-	status = cal_read(cal, CAL_HL_IRQSTATUS(2));
-	if (status) {
-		unsigned int i;
-
-		/* Clear Interrupt status */
-		cal_write(cal, CAL_HL_IRQSTATUS(2), status);
+	for (i = 0; i < cal->num_contexts; ++i) {
+		bool end = !!(status[1] & CAL_HL_IRQ_WDMA_END_MASK(i));
+		bool start = !!(status[2] & CAL_HL_IRQ_WDMA_START_MASK(i));
 
-		for (i = 0; i < cal->num_contexts; ++i) {
-			if (status & CAL_HL_IRQ_WDMA_START_MASK(i))
-				cal_irq_wdma_start(cal->ctx[i]);
-		}
+		if (start || end)
+			cal_irq_handle_wdma(cal->ctx[i], start, end);
 	}
 
 	return IRQ_HANDLED;
-- 
2.25.1

