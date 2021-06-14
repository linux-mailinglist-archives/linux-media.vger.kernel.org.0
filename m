Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE473A65D5
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236278AbhFNLmZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235730AbhFNLlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:41:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35FDC061144
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 04:37:59 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8939F5EA3;
        Mon, 14 Jun 2021 13:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669849;
        bh=LJLNjqbBdiR4zthmiKbYaubMMzr2q5QdfRnKDUvaCHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u0yl2eTjSglE5fPbCcg/kASSwvSoECLMHLd0BSnf8yIKXoj/k/7sAb8rLWehMcMzB
         oVzaMQ4914GBYK1H69u0QlmGl9ye+jIwnq218hFDIpdRpHR+EfxZRyTm6pBF5FNTqO
         wor3h6Jz8lsIyryLuLiy5z/sCyXP7NmK20HB0+wU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 18/35] media: ti-vpe: cal: add 'use_pix_proc' field
Date:   Mon, 14 Jun 2021 14:23:28 +0300
Message-Id: <20210614112345.2032435-19-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We already have functions to reserve and release a pix proc unit, but we
always reserve such and the code expects the pix proc unit to be used.

Add a new field, 'use_pix_proc', to indicate if the pix prox unit has
been reserved and should be used. Use the flag to skip programming pix
proc unit when not needed.

Note that we still always set the use_pix_proc flag to true.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 10 +++++++---
 drivers/media/platform/ti-vpe/cal.h |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 92240dfa7b78..fdfa5ada64eb 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -473,13 +473,15 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
 	}
 
 	ctx->pix_proc = ret;
+	ctx->use_pix_proc = true;
 
 	return 0;
 }
 
 void cal_ctx_unprepare(struct cal_ctx *ctx)
 {
-	cal_release_pix_proc(ctx->cal, ctx->pix_proc);
+	if (ctx->use_pix_proc)
+		cal_release_pix_proc(ctx->cal, ctx->pix_proc);
 }
 
 void cal_ctx_start(struct cal_ctx *ctx)
@@ -489,7 +491,8 @@ void cal_ctx_start(struct cal_ctx *ctx)
 
 	/* Configure the CSI-2, pixel processing and write DMA contexts. */
 	cal_ctx_csi2_config(ctx);
-	cal_ctx_pix_proc_config(ctx);
+	if (ctx->use_pix_proc)
+		cal_ctx_pix_proc_config(ctx);
 	cal_ctx_wr_dma_config(ctx);
 
 	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
@@ -530,7 +533,8 @@ void cal_ctx_stop(struct cal_ctx *ctx)
 	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->csi2_ctx), 0);
 
 	/* Disable pix proc */
-	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
+	if (ctx->use_pix_proc)
+		cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
 }
 
 /* ------------------------------------------------------------------
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 5d8b3193be7d..d7cc399f47da 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -223,6 +223,8 @@ struct cal_ctx {
 	u8			cport;
 	u8			csi2_ctx;
 	u8			pix_proc;
+
+	bool			use_pix_proc;
 };
 
 extern unsigned int cal_debug;
-- 
2.25.1

