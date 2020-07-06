Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C596E215EC9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbgGFSjB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbgGFSjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:00 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 708CA2582;
        Mon,  6 Jul 2020 20:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060701;
        bh=yW91JyxB1nR5JkMNu+i/LwCEFJKzB2PbC8dy+VPPhow=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XCqGZABrzjIXM7jP2IRTsotfOJHvVrTGACBToJ4qnxw4WeQufedgIU09r+vP5ZXtH
         zfcFxhFI2CBaqAYMuPcHPgztWfRNVxjpzHA2iP0Kp41oCLzZLqVQQmJsqMnTv5Ymaz
         vG3PtgRHKKRlQkUd6w73wO4xHVuJcNg9WlbuoT0k=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 086/108] media: ti-vpe: cal: Drop cal_ctx m_fmt field
Date:   Mon,  6 Jul 2020 21:36:47 +0300
Message-Id: <20200706183709.12238-87-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct cal_ctx m_fmt field stores the media bus format for the
context input. Only the format 'field' field is used, store it in the
video format instead, and drop m_fmt.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 10 +++++-----
 drivers/media/platform/ti-vpe/cal.c       |  2 +-
 drivers/media/platform/ti-vpe/cal.h       |  4 +---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 0a1a11692208..f57767e79ca5 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -387,10 +387,10 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
 
 	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
 	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	ctx->v_fmt.fmt.pix.pixelformat  = fmt->fourcc;
+	ctx->v_fmt.fmt.pix.pixelformat = fmt->fourcc;
+	ctx->v_fmt.fmt.pix.field = mbus_fmt.field;
 	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
 	ctx->fmt = fmt;
-	ctx->m_fmt = mbus_fmt;
 	*f = ctx->v_fmt;
 
 	return 0;
@@ -775,13 +775,13 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 		return -EINVAL;
 	}
 
-	/* Save current subdev format */
+	/* Save current format */
 	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
 	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	ctx->v_fmt.fmt.pix.pixelformat  = fmt->fourcc;
+	ctx->v_fmt.fmt.pix.pixelformat = fmt->fourcc;
+	ctx->v_fmt.fmt.pix.field = mbus_fmt.field;
 	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
 	ctx->fmt = fmt;
-	ctx->m_fmt = mbus_fmt;
 
 	return 0;
 }
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index f6e42b2c022a..34a344b7f08a 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -314,7 +314,7 @@ static inline void cal_schedule_next_buffer(struct cal_ctx *ctx)
 static inline void cal_process_buffer_complete(struct cal_ctx *ctx)
 {
 	ctx->cur_frm->vb.vb2_buf.timestamp = ktime_get_ns();
-	ctx->cur_frm->vb.field = ctx->m_fmt.field;
+	ctx->cur_frm->vb.field = ctx->v_fmt.fmt.pix.field;
 	ctx->cur_frm->vb.sequence = ctx->sequence++;
 
 	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_DONE);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 446aa4cc5217..5c63e7883dbc 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -164,9 +164,7 @@ struct cal_ctx {
 	/* video capture */
 	const struct cal_fmt	*fmt;
 	/* Used to store current pixel format */
-	struct v4l2_format		v_fmt;
-	/* Used to store current mbus frame format */
-	struct v4l2_mbus_framefmt	m_fmt;
+	struct v4l2_format	v_fmt;
 
 	/* Current subdev enumerated format */
 	const struct cal_fmt	**active_fmt;
-- 
Regards,

Laurent Pinchart

