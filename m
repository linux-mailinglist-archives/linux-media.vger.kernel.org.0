Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BD850A29E
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389418AbiDUOiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389505AbiDUOh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:37:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB1D2197
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:35:08 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F175492;
        Thu, 21 Apr 2022 16:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650551704;
        bh=iWfMFpq2rZDj4cb4x7bR8yKDVCM80TcX5tkvI6XufXo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nyagb0NQrGdIgyZ0PaLoGZJa1oKkONQ7uqjP2fEf5uMbIF8Ja/hGl3xR8/ddiOOp4
         8h1EmuxJLv44E7un5q+FurdfEdi03ldua0Z+zZYLu8K/GtZHRGdr6OJhkvauuHLzpF
         Fe7JLEWAPpWw9esJxOV5K5V68Efjy3SZv1loi6Hc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 6/6] media: ti: cal: fix wdma irq for metadata
Date:   Thu, 21 Apr 2022 17:34:49 +0300
Message-Id: <20220421143449.552312-7-tomi.valkeinen@ideasonboard.com>
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

CAL HW interrupts are inherently racy. If we get both start and end
interrupts, we don't know what has happened: did the DMA for a single
frame start and end, or did one frame end and a new frame start?

Usually for normal pixel frames we get the interrupts separately. If
we do get both, we have to guess. The assumption in the code is that the
active vertical area is larger than the blanking vertical area, and thus
it is more likely that we get the end of the old frame and the start of
a new frame.

However, for embedded data, which is only a few lines high, we always
get both interrupts. Here the assumption is that we get both for the
same frame.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal.c | 33 ++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index e4355f266c58..12de9171e353 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -670,11 +670,34 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 
 static void cal_irq_handle_wdma(struct cal_ctx *ctx, bool start, bool end)
 {
-	if (end)
-		cal_irq_wdma_end(ctx);
-
-	if (start)
-		cal_irq_wdma_start(ctx);
+	/*
+	 * CAL HW interrupts are inherently racy. If we get both start and end
+	 * interrupts, we don't know what has happened: did the DMA for a single
+	 * frame start and end, or did one frame end and a new frame start?
+	 *
+	 * Usually for normal pixel frames we get the interrupts separately. If
+	 * we do get both, we have to guess. The assumption in the code below is
+	 * that the active vertical area is larger than the blanking vertical
+	 * area, and thus it is more likely that we get the end of the old frame
+	 * and the start of a new frame.
+	 *
+	 * However, for embedded data, which is only a few lines high, we always
+	 * get both interrupts. Here the assumption is that we get both for the
+	 * same frame.
+	 */
+	if (ctx->v_fmt.fmt.pix.height < 10) {
+		if (start)
+			cal_irq_wdma_start(ctx);
+
+		if (end)
+			cal_irq_wdma_end(ctx);
+	} else {
+		if (end)
+			cal_irq_wdma_end(ctx);
+
+		if (start)
+			cal_irq_wdma_start(ctx);
+	}
 }
 
 static irqreturn_t cal_irq(int irq_cal, void *data)
-- 
2.25.1

