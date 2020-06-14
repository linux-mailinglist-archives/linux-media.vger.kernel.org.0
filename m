Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCCD1F8B6C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgFOAAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgFOAAU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:20 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D48B8120A;
        Mon, 15 Jun 2020 02:00:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179213;
        bh=1ybk2BLUIWRw+BZEGvAQt3iTX0/YjeYGbhNkDjRkaBU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oiAkh4aTXBX/uNMZXOPswXJUTtzZ0krTclZXWM5xsMyJIviLiS1n4X/nT1TDSYsGI
         KtooKi3Pu04YK4f6TzjIGUlydPIdxwa9UZ9Gro5bKmxmMzyinyAfDbSyy4Z5agG7XO
         Q4OhnOAh08ypehi+JmPr7svPAvRq4zz0D4nX2La0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 006/107] media: ti-vpe: cal: Merge all status variables in IRQ handler
Date:   Mon, 15 Jun 2020 02:58:03 +0300
Message-Id: <20200614235944.17716-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_irq() function reads three IRQ status registers and stores their
values in three different variables. As each value is processed right
after reading the corresponding register, a single variable is enough.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 35 +++++++++++++----------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b04d8cb86977..0a5fb81223da 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1206,19 +1206,18 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	struct cal_dev *dev = (struct cal_dev *)data;
 	struct cal_ctx *ctx;
 	struct cal_dmaqueue *dma_q;
-	u32 irqst0, irqst1, irqst2;
+	unsigned int i;
+	u32 status;
 
-	irqst0 = reg_read(dev, CAL_HL_IRQSTATUS(0));
-	if (irqst0) {
-		int i;
+	status = reg_read(dev, CAL_HL_IRQSTATUS(0));
+	if (status) {
+		reg_write(dev, CAL_HL_IRQSTATUS(0), status);
 
-		reg_write(dev, CAL_HL_IRQSTATUS(0), irqst0);
-
-		if (irqst1 & CAL_HL_IRQ_OCPO_ERR_MASK)
+		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
 			dev_err_ratelimited(&dev->pdev->dev, "OCPO ERROR\n");
 
 		for (i = 0; i < 2; ++i) {
-			if (irqst1 & CAL_HL_IRQ_CIO_MASK(i)) {
+			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
 				u32 cio_stat = reg_read(dev,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
 
@@ -1232,15 +1231,13 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	}
 
 	/* Check which DMA just finished */
-	irqst1 = reg_read(dev, CAL_HL_IRQSTATUS(1));
-	if (irqst1) {
-		int i;
-
+	status = reg_read(dev, CAL_HL_IRQSTATUS(1));
+	if (status) {
 		/* Clear Interrupt status */
-		reg_write(dev, CAL_HL_IRQSTATUS(1), irqst1);
+		reg_write(dev, CAL_HL_IRQSTATUS(1), status);
 
 		for (i = 0; i < 2; ++i) {
-			if (isportirqset(irqst1,  i)) {
+			if (isportirqset(status, i)) {
 				ctx = dev->ctx[i];
 
 				spin_lock(&ctx->slock);
@@ -1255,15 +1252,13 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	}
 
 	/* Check which DMA just started */
-	irqst2 = reg_read(dev, CAL_HL_IRQSTATUS(2));
-	if (irqst2) {
-		int i;
-
+	status = reg_read(dev, CAL_HL_IRQSTATUS(2));
+	if (status) {
 		/* Clear Interrupt status */
-		reg_write(dev, CAL_HL_IRQSTATUS(2), irqst2);
+		reg_write(dev, CAL_HL_IRQSTATUS(2), status);
 
 		for (i = 0; i < 2; ++i) {
-			if (isportirqset(irqst2, i)) {
+			if (isportirqset(status, i)) {
 				ctx = dev->ctx[i];
 				dma_q = &ctx->vidq;
 
-- 
Regards,

Laurent Pinchart

