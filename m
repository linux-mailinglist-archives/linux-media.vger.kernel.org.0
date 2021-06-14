Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286FA3A65BD
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235206AbhFNLmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236870AbhFNLkD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:40:03 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0586A5EA5;
        Mon, 14 Jun 2021 13:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669850;
        bh=Vgcomd7B6SnFfTVAx5SDMl7tzzUliPmdaQ24YtDRoOs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GsyOPXRSgo9WXavPnxmnbT9Z95tLLuZUI4e4ri818C5Yu/r28nDH7ugJsgAO2N9ZL
         HGE0qCd/4zbb/iQjcbSO19QJ7LpJmvpBbd4JN8Fj5MoxX0DQXOmE+EXwNM+/vNoAP4
         j+vZYJ9K2FBId3XgCo9xeHmimFhHCwDmzUQ2dIoE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 19/35] media: ti-vpe: cal: add cal_ctx_wr_dma_enable and fix a race
Date:   Mon, 14 Jun 2021 14:23:29 +0300
Message-Id: <20210614112345.2032435-20-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index fdfa5ada64eb..cd8ec0413463 100644
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

