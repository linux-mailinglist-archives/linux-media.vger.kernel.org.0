Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57274365863
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhDTMFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:05:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhDTMFs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:48 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0B63470;
        Tue, 20 Apr 2021 14:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920316;
        bh=pgmBzkD89Yj5syNZDJMf4wgTsp3ulNvR2SyioDFzWSU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zrcq3aZPZlQwKvheZJ1yN7OltvmL9XgxKOVAbeXtrpuA7gitU5ckQbaatrBfBOJZF
         +rdjvE28aNEmsVGQocdZ27IL+q2exUnhYthnyrpND1kV0mof+Gsuwwi/USQnRDwfw7
         kmKv+amJ6TfmqUfDOe77f7ex2XOxMayPsRnbmeWI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 07/35] media: ti-vpe: cal: add cal_ctx_prepare/unprepare
Date:   Tue, 20 Apr 2021 15:04:05 +0300
Message-Id: <20210420120433.902394-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
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
index d24f1918f264..6d6dce8001b2 100644
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

