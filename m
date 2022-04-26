Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2EEF50F1CD
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343682AbiDZHLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343799AbiDZHJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:09:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A463B37A39
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:06:32 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 966A0487;
        Tue, 26 Apr 2022 09:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650956790;
        bh=zgfWLgihXUMj2VHk9it2LcXV/RVPnbAzGqGuJ2Ipdas=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tnue73lt5+OBNggHSzNP8HztGDuf/KfmeKSjEdGtnQJAIkyf6fJc+Yc40IrgA2q8F
         MKKrZ2IpSYycByeUQCT6nAQruyKVlqoKPC8fnK7RzsQfwggKMf7HY1fmWEe0rEDMt2
         lbbUfYQO9NymDBjeML8N7xJ4jYEBHJ5YO8JRGTdY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 5/5] media: ti: cal: fix wdma irq for metadata
Date:   Tue, 26 Apr 2022 10:06:18 +0300
Message-Id: <20220426070618.68536-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426070618.68536-1-tomi.valkeinen@ideasonboard.com>
References: <20220426070618.68536-1-tomi.valkeinen@ideasonboard.com>
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
2.34.1

