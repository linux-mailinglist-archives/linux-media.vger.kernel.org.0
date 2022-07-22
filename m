Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BC257DA59
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 08:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbiGVGe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 02:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbiGVGe7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 02:34:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286666714A
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 23:34:58 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14A4AE71;
        Fri, 22 Jul 2022 08:34:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658471692;
        bh=ILm1CxPu7JakTaZRHMLbf/ql1zlVuAYs0BB1OQ9pCc0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Er/APvRAJ7Ky7AH7+4BtscWJOGLlh3Fipj0YJWI6m/leicZpqv7PTAnfEwOV8B6mE
         uci4hDtfYKVAW4KX6CSukQBpE6yA4GsDCIOCSB98G9EjNt/Dd3guw4MFGyYCUuG6ZI
         FDKy6hKWuxGn8O/Fr3mTe9s4Urx9A7FeO7RT5e5Q=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 5/5] media: ti: cal: fix wdma irq for metadata
Date:   Fri, 22 Jul 2022 09:34:24 +0300
Message-Id: <20220722063424.174288-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220722063424.174288-1-tomi.valkeinen@ideasonboard.com>
References: <20220722063424.174288-1-tomi.valkeinen@ideasonboard.com>
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
 drivers/media/platform/ti/cal/cal.c | 31 +++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 910ff179e597..56b61c0583cf 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -717,11 +717,34 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 
 static void cal_irq_handle_wdma(struct cal_ctx *ctx, bool start, bool end)
 {
-	if (end)
-		cal_irq_wdma_end(ctx);
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
 
-	if (start)
-		cal_irq_wdma_start(ctx);
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

