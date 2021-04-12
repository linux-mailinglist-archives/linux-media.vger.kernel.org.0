Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA2035C54D
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240546AbhDLLfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52636 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240536AbhDLLfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:43 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91FA85A9;
        Mon, 12 Apr 2021 13:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227324;
        bh=VJFvWC/UhAVA9bPwkI3vGyNi+CAn05FqRKZ0XvWi+7E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OLiwo9xRPgadvo3ccW7Tv5Vbqt3jui3isJCTDzsfdclpyretl3PgfRH3Gnk7LYKT3
         2pdXss7dPU0Iwzk+XM2+LNYdhUVBvNpXWMFeC5TZysN+GZprst9QAfei2YM2/8pn/K
         pnijL9IIIFFvOJBANGP8YR5cob4EeMPFURvr6Gbw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 12/28] media: ti-vpe: cal: rename CAL_HL_IRQ_MASK
Date:   Mon, 12 Apr 2021 14:34:41 +0300
Message-Id: <20210412113457.328012-13-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL_HL_IRQ_MASK macro is used for both WDMA start and end status bits.
For clarity, rename CAL_HL_IRQ_MASK macro to CAL_HL_IRQ_WDMA_END_MASK
and CAL_HL_IRQ_WDMA_START_MASK.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 12 ++++++------
 drivers/media/platform/ti-vpe/cal_regs.h |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index daa0c1ab94e7..0abcc83841c6 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -453,9 +453,9 @@ void cal_ctx_start(struct cal_ctx *ctx)
 
 	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(1),
-		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
+		  CAL_HL_IRQ_WDMA_END_MASK(ctx->dma_ctx));
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
-		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
+		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
 }
 
 void cal_ctx_stop(struct cal_ctx *ctx)
@@ -479,9 +479,9 @@ void cal_ctx_stop(struct cal_ctx *ctx)
 
 	/* Disable IRQ_WDMA_END and IRQ_WDMA_START. */
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(1),
-		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
+		  CAL_HL_IRQ_WDMA_END_MASK(ctx->dma_ctx));
 	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(2),
-		  CAL_HL_IRQ_MASK(ctx->dma_ctx));
+		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
 
 	ctx->dma.state = CAL_DMA_STOPPED;
 }
@@ -589,7 +589,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		cal_write(cal, CAL_HL_IRQSTATUS(1), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-			if (status & CAL_HL_IRQ_MASK(i))
+			if (status & CAL_HL_IRQ_WDMA_END_MASK(i))
 				cal_irq_wdma_end(cal->ctx[i]);
 		}
 	}
@@ -603,7 +603,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		cal_write(cal, CAL_HL_IRQSTATUS(2), status);
 
 		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-			if (status & CAL_HL_IRQ_MASK(i))
+			if (status & CAL_HL_IRQ_WDMA_START_MASK(i))
 				cal_irq_wdma_start(cal->ctx[i]);
 		}
 	}
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index 5c4f9e642185..93d9bf1f3c00 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -125,7 +125,8 @@
 #define CAL_HL_IRQ_EOI_LINE_NUMBER_READ0		0
 #define CAL_HL_IRQ_EOI_LINE_NUMBER_EOI0			0
 
-#define CAL_HL_IRQ_MASK(m)			BIT(m)
+#define CAL_HL_IRQ_WDMA_END_MASK(m)		BIT(m)
+#define CAL_HL_IRQ_WDMA_START_MASK(m)		BIT(m)
 
 #define CAL_HL_IRQ_OCPO_ERR_MASK		BIT(6)
 
-- 
2.25.1

