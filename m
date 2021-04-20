Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67EB036586F
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhDTMF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:05:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbhDTMF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:57 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E0511172;
        Tue, 20 Apr 2021 14:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920323;
        bh=8vEjMRbTVoZMFNafGW4iohz7s3We09O1Pnh+Or34MMA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m2ByTn+hPbPGaJyfMqlD+UnsUcw42uaJQZiwE9dnYwt/Xal+9u+witB3892o5exlJ
         WuR7y7TRj4HvzWncNOHO5zxykJJrGvYiqC38QNylYAQXA2/nSmBXGQ+gqkPXkpq78L
         +zaMW8pvmKcq7tN2dU74dvB5Gx4DU7LEjvpUsHTE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 18/35] media: ti-vpe: cal: add 'use_pix_proc' field
Date:   Tue, 20 Apr 2021 15:04:16 +0300
Message-Id: <20210420120433.902394-19-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
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

