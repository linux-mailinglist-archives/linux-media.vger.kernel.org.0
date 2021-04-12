Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7755235C548
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240522AbhDLLfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52608 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237993AbhDLLfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:36 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A3915A9;
        Mon, 12 Apr 2021 13:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227317;
        bh=hlDBsQq8z5EeehTuCf0Uyo+3DuEt2iVFZge/5B0v12s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PoeMldCn5tnIpkYQ5cjQBZZ3fvNil1y+91tMan/4mhyTdFjDYUiGjGcIU7Or0D7Zc
         EB4SpUaoPhZ3pTPVUWy0SUJ3zJkifnd9umxsGfnRQg8fMHb98xyjB+vnroghj1aGdd
         npr62ORrJCojkQjLsGHZoFDs1InInzKtpDeJ/5sI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 07/28] media: ti-vpe: cal: add cal_ctx_prepare/unprepare
Date:   Mon, 12 Apr 2021 14:34:36 +0300
Message-Id: <20210412113457.328012-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the following patches we need to do context configuration which might
fail. Add new functions, cal_ctx_prepare and cal_ctx_unprepare, to
handle such configuration.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c |  9 +++++++++
 drivers/media/platform/ti-vpe/cal.c       | 10 ++++++++++
 drivers/media/platform/ti-vpe/cal.h       |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index cf603cc9114c..8e9bbe6beb23 100644
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
@@ -733,6 +739,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 error_stop:
 	cal_ctx_stop(ctx);
 	pm_runtime_put_sync(ctx->cal->dev);
+	cal_ctx_unprepare(ctx);
 
 error_pipeline:
 	media_pipeline_stop(&ctx->vdev.entity);
@@ -752,6 +759,8 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 
 	pm_runtime_put_sync(ctx->cal->dev);
 
+	cal_ctx_unprepare(ctx);
+
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
 	media_pipeline_stop(&ctx->vdev.entity);
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b539a9afb3f5..3d57aedbee0a 100644
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

