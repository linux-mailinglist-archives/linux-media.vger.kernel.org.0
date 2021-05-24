Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D4438E4F1
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbhEXLLH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232705AbhEXLLD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:11:03 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 313CD1575;
        Mon, 24 May 2021 13:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854566;
        bh=8vEjMRbTVoZMFNafGW4iohz7s3We09O1Pnh+Or34MMA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bWT9hhQqKJyE0BUeRVHgpAILGjFIki4ZGmclDYvi7o8yvIVoKEyCShjCeF9e+17ia
         zcyu7d0/1bYZGup0lZ+bhyBkme3pmH7mGJ0J+9DN57hpKU12B9EDhmZ+SfOLlUKfWe
         YH3izTgZrQluRZ9AcgXoMBQmRk7lsjxIGB0yGI3A=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 18/38] media: ti-vpe: cal: add 'use_pix_proc' field
Date:   Mon, 24 May 2021 14:08:49 +0300
Message-Id: <20210524110909.672432-19-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
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
index 5ab87c9d3707..c1a6e23ff713 100644
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

