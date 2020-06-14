Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617B21F8BA8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgFOAB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbgFOAB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:26 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B48FA98D;
        Mon, 15 Jun 2020 02:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179241;
        bh=Fy3x65anEgWUt6nXGoBRnyIJuryy2vTn3lijeLiDQ8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vzlsv1OXAnca1Wh0u7m9ZQcW8K9CJZbUN03FNjC75F3Dk3pn6DOIXFKPni7siLIZl
         mxpzISSkuTzWzT/Bo6cqDzHGxNzQFUfmgfTN2FdHn8chpFO5tau7yCqfqw2x8avJpW
         7A4r6rhNXFo8yQPv2acC5Lrn/z9ZnFoL3J7MjY3Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 066/107] media: ti-vpe: cal: Remove isvcirqset() and isportirqset() macros
Date:   Mon, 15 Jun 2020 02:59:03 +0300
Message-Id: <20200614235944.17716-67-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The isvcirqset() isn't used. The isportirqset() doesn't increase
readability. Inline the latter and simply drop the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 518f8af616b6..26b9f4638084 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1259,11 +1259,6 @@ static inline void cal_process_buffer_complete(struct cal_ctx *ctx)
 	ctx->cur_frm = ctx->next_frm;
 }
 
-#define isvcirqset(irq, vc, ff) (irq & \
-	(CAL_CSI2_VC_IRQENABLE_ ##ff ##_IRQ_##vc ##_MASK))
-
-#define isportirqset(irq, port) (irq & CAL_HL_IRQ_MASK(port))
-
 static irqreturn_t cal_irq(int irq_cal, void *data)
 {
 	struct cal_dev *cal = data;
@@ -1300,7 +1295,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		reg_write(cal, CAL_HL_IRQSTATUS(1), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-			if (isportirqset(status, i)) {
+			if (status & CAL_HL_IRQ_MASK(i)) {
 				ctx = cal->ctx[i];
 
 				spin_lock(&ctx->slock);
@@ -1321,7 +1316,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		reg_write(cal, CAL_HL_IRQSTATUS(2), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-			if (isportirqset(status, i)) {
+			if (status & CAL_HL_IRQ_MASK(i)) {
 				ctx = cal->ctx[i];
 				dma_q = &ctx->vidq;
 
-- 
Regards,

Laurent Pinchart

