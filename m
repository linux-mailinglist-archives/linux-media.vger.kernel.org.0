Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A42335C553
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240570AbhDLLfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240537AbhDLLfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:50 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC5F8DBC;
        Mon, 12 Apr 2021 13:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227331;
        bh=BZ/To7fR4PL/TdSUwhvY3JrWefrPQnW/qQ4qLKCiPHw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LizgRmDcne2QvLmCN/NVRSC19fqrhX/oAbRjxFLxJR4VXX/PKEooQwa/BuMdcd1Q5
         yuSM+GnECbBSbRddx/Jzk3vzttAWnfesNZkCe8V1gmT4FA+8SipX+E53DfbPwG7NMm
         YLAkb5h/T99ALhazf2rlnH0NI4FohnXG4eZ2cu0o=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 18/28] media: ti-vpe: cal: add 'use_pix_proc' field
Date:   Mon, 12 Apr 2021 14:34:47 +0300
Message-Id: <20210412113457.328012-19-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 10 +++++++---
 drivers/media/platform/ti-vpe/cal.h |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e397f59d3bbc..a1d173bd4613 100644
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
 	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx), 0);
 
 	/* Disable pix proc */
-	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
+	if (ctx->use_pix_proc)
+		cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
 }
 
 /* ------------------------------------------------------------------
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 01e05e46e48d..409b7276a1fa 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -223,6 +223,8 @@ struct cal_ctx {
 	u8			cport;
 	u8			ppi_ctx;
 	u8			pix_proc;
+
+	bool use_pix_proc;
 };
 
 extern unsigned int cal_debug;
-- 
2.25.1

