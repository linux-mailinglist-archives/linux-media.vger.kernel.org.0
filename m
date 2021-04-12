Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E580D35C554
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240571AbhDLLfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240557AbhDLLfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66C8C06174A
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:35:33 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A48713F0;
        Mon, 12 Apr 2021 13:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227332;
        bh=hX/FyYqfirRnzVh7tvLXXryQv+OFIOURhcjFQ+gd9Wk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gIpVHH9ym16/DjmGzyZKGV8iJx8tRy6CMpUkbkIWC+i9RXXx4QG4ZwZeh3ethJdMX
         wQjdIrNfNhud4ewoLkryg8aTz4Wt6OAjUHe1RD2AkWr5hXiIGBhcTpTf3bEzKrr5Vg
         z/EoVPhYKi/OE5JHuHcxzSgb1Nqjfp6Etv35VTLc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 19/28] media: ti-vpe: cal: add cal_ctx_wr_dma_enable and fix a race
Date:   Mon, 12 Apr 2021 14:34:48 +0300
Message-Id: <20210412113457.328012-20-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have not noticed any errors due to this, but the DMA configuration
looks racy. Setting the DMA mode bitfield in CAL_WR_DMA_CTRL supposedly
enables the DMA. However, the driver currently a) continues configuring
the DMA after setting the mode, and b) enables the DMA interrupts only
after setting the mode.

This probably doesn't cause any issues as there should be no data coming
in to the DMA yet, but it's still better to fix this.

Add a new function, cal_ctx_wr_dma_enable(), to set the DMA mode field,
and call that function only after the DMA config and the irq enabling
has been done.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index a1d173bd4613..0fef892854ef 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -409,8 +409,6 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 		      CAL_WR_DMA_CTRL_YSIZE_MASK);
 	cal_set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
 		      CAL_WR_DMA_CTRL_DTAG_MASK);
-	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
-		      CAL_WR_DMA_CTRL_MODE_MASK);
 	cal_set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
 		      CAL_WR_DMA_CTRL_PATTERN_MASK);
 	cal_set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
@@ -442,6 +440,15 @@ void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
 	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->dma_ctx), addr);
 }
 
+static void cal_ctx_wr_dma_enable(struct cal_ctx *ctx)
+{
+	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx));
+
+	cal_set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
+		      CAL_WR_DMA_CTRL_MODE_MASK);
+	cal_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx), val);
+}
+
 static void cal_ctx_wr_dma_disable(struct cal_ctx *ctx)
 {
 	u32 val = cal_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->dma_ctx));
@@ -500,6 +507,8 @@ void cal_ctx_start(struct cal_ctx *ctx)
 		  CAL_HL_IRQ_WDMA_END_MASK(ctx->dma_ctx));
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
 		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
+
+	cal_ctx_wr_dma_enable(ctx);
 }
 
 void cal_ctx_stop(struct cal_ctx *ctx)
-- 
2.25.1

