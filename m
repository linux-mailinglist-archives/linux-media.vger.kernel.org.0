Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BB238E50B
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbhEXLL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhEXLLQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:11:16 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E270355C;
        Mon, 24 May 2021 13:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854574;
        bh=JMqTxdqAEL5s0SuX1mVd1lO4f5hjG2E5UIlIIW4lpA0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RAUtDo/slDteW11pZa2Na/bj4Kyv4qBfnwLHQFdPSV9kPrHDKZHOA/sWExHA9PGa1
         8LN8pDPH+PddJEZKkZkSbFrJ/alI4uVLOqEYhaZU99238NrBB3m2nSnp/xkYJNBli6
         kzBUvIEVbgCppENcPuNRH94wsLY8MTfmZ/npaiws=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 32/38] media: ti-vpe: cal: use CSI-2 frame number
Date:   Mon, 24 May 2021 14:09:03 +0300
Message-Id: <20210524110909.672432-33-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver fills buf->vb.sequence with an increasing number which is
incremented by the driver. This feels a bit pointless, as the userspace
could as well track that kind of number itself. Instead, lets use the
frame number provided in the CSI-2 data from the sensor.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 7 +++++--
 drivers/media/platform/ti-vpe/cal.h | 1 -
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 888706187fd1..62c45add4efe 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -493,7 +493,6 @@ void cal_ctx_unprepare(struct cal_ctx *ctx)
 
 void cal_ctx_start(struct cal_ctx *ctx)
 {
-	ctx->sequence = 0;
 	ctx->dma.state = CAL_DMA_RUNNING;
 
 	/* Configure the CSI-2, pixel processing and write DMA contexts. */
@@ -586,6 +585,10 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 {
 	struct cal_buffer *buf = NULL;
+	u32 frame_num;
+
+	frame_num = cal_read(ctx->cal, CAL_CSI2_STATUS(ctx->phy->instance,
+						       ctx->csi2_ctx)) & 0xffff;
 
 	spin_lock(&ctx->dma.lock);
 
@@ -607,7 +610,7 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 	if (buf) {
 		buf->vb.vb2_buf.timestamp = ktime_get_ns();
 		buf->vb.field = ctx->v_fmt.fmt.pix.field;
-		buf->vb.sequence = ctx->sequence++;
+		buf->vb.sequence = frame_num;
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	}
 }
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 400f95485d7c..ad08c189ad3b 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -217,7 +217,6 @@ struct cal_ctx {
 	const struct cal_format_info	**active_fmt;
 	unsigned int		num_active_fmt;
 
-	unsigned int		sequence;
 	struct vb2_queue	vb_vidq;
 	u8			dma_ctx;
 	u8			cport;
-- 
2.25.1

