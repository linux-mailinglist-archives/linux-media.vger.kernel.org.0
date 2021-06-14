Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073A33A6502
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbhFNLcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:32:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58158 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236268AbhFNLaG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:30:06 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 701503274;
        Mon, 14 Jun 2021 13:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669844;
        bh=QFZQ/2tVfcMfW7MP9kb1Ny+o6KpV3J2OSW9IsRvWVA0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NJ1i0KYG4kfj+f12bH6ngSVJyWFm3QoSH9o0I3ytopuRxzhum2oNKS2supBJ4jitb
         SSawaVhUaMpVmDMIYSSkX+nUezttu59X5/n5dyjJVhqFdALcCnNIoRxbE+is4Yaq6/
         QeXGXzxhsj58spwpjYCh/NE2M0l7vgM25TN9/xS8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 07/35] media: ti-vpe: cal: add cal_ctx_prepare/unprepare
Date:   Mon, 14 Jun 2021 14:23:17 +0300
Message-Id: <20210614112345.2032435-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the following patches we need to do context configuration which might
fail. Add new functions, cal_ctx_prepare and cal_ctx_unprepare, to
handle such configuration.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c |  9 +++++++++
 drivers/media/platform/ti-vpe/cal.c       | 10 ++++++++++
 drivers/media/platform/ti-vpe/cal.h       |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 9d0b515f013e..f17524579102 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -708,6 +708,12 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto error_pipeline;
 	}
 
+	ret = cal_ctx_prepare(ctx);
+	if (ret) {
+		ctx_err(ctx, "Failed to prepare context: %d\n", ret);
+		goto error_pipeline;
+	}
+
 	spin_lock_irq(&ctx->dma.lock);
 	buf = list_first_entry(&ctx->dma.queue, struct cal_buffer, list);
 	ctx->dma.pending = buf;
@@ -735,6 +741,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 error_stop:
 	cal_ctx_stop(ctx);
 	pm_runtime_put_sync(ctx->cal->dev);
+	cal_ctx_unprepare(ctx);
 
 error_pipeline:
 	media_pipeline_stop(&ctx->vdev.entity);
@@ -754,6 +761,8 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 
 	pm_runtime_put_sync(ctx->cal->dev);
 
+	cal_ctx_unprepare(ctx);
+
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
 	media_pipeline_stop(&ctx->vdev.entity);
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 2f70725a567b..ded663f8fbfe 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -430,6 +430,16 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
 	return stopped;
 }
 
+int cal_ctx_prepare(struct cal_ctx *ctx)
+{
+	return 0;
+}
+
+void cal_ctx_unprepare(struct cal_ctx *ctx)
+{
+
+}
+
 void cal_ctx_start(struct cal_ctx *ctx)
 {
 	ctx->sequence = 0;
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index af46084580bd..09ad20faa9e1 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -296,6 +296,8 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 					 unsigned int instance);
 void cal_camerarx_destroy(struct cal_camerarx *phy);
 
+int cal_ctx_prepare(struct cal_ctx *ctx);
+void cal_ctx_unprepare(struct cal_ctx *ctx);
 void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr);
 void cal_ctx_start(struct cal_ctx *ctx);
 void cal_ctx_stop(struct cal_ctx *ctx);
-- 
2.25.1

