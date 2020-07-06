Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5AC215EB3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729974AbgGFSie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbgGFSie (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:34 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF60B1942;
        Mon,  6 Jul 2020 20:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060692;
        bh=IQBDQmQyJexxSB9ubdca0hRlXE1QqCMczdbzZ/K2/eg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OkpzJjecJe65kUaeR8lkkR7V7Vs5YB1WlaG8gXOpwmOdc2dV/S3YPRjlEPxh1Djfr
         fGzb4x66Lth6NSAuUoMlzcyeeQi7yGzCHyYA6z02l5J8hSR+ceeqlnTw8hJ0ZAKFmw
         CcR4VBkNRmbE8SxrnjMHHtKqLdQBEencC0RFxsVg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 067/108] media: ti-vpe: cal: Remove isvcirqset() and isportirqset() macros
Date:   Mon,  6 Jul 2020 21:36:28 +0300
Message-Id: <20200706183709.12238-68-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The isvcirqset() isn't used. The isportirqset() doesn't increase
readability. Inline the latter and simply drop the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 67b87d33639d..e57ee6010555 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1265,11 +1265,6 @@ static inline void cal_process_buffer_complete(struct cal_ctx *ctx)
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
@@ -1309,7 +1304,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		reg_write(cal, CAL_HL_IRQSTATUS(1), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-			if (isportirqset(status, i)) {
+			if (status & CAL_HL_IRQ_MASK(i)) {
 				ctx = cal->ctx[i];
 
 				spin_lock(&ctx->slock);
@@ -1332,7 +1327,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		reg_write(cal, CAL_HL_IRQSTATUS(2), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-			if (isportirqset(status, i)) {
+			if (status & CAL_HL_IRQ_MASK(i)) {
 				ctx = cal->ctx[i];
 				dma_q = &ctx->vidq;
 
-- 
Regards,

Laurent Pinchart

