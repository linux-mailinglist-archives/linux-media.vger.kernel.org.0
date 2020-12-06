Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87932D0841
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728429AbgLFXzX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:55:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgLFXzX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:55:23 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20C0C335;
        Mon,  7 Dec 2020 00:54:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298840;
        bh=gv3E7zqEGBKsQAxxGg8zD2HtYrnPI6Gp/VT0tW7b7oQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ktBoL3/0vLfK9m1uSynhsfcqa9eZLWp0Qas6JyW4zZctvzCgE8san0lK8Hmyx++ia
         /UyJytto2WONX8n4LFSwoy9RgHuieyEyRFYY7tanyU3Ao9+UpBsy3gLYEqp5ov2QWd
         oFCsK/LPnezRCsrFB0gQzh8zMOY4x7xxoIgx+Xrs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 02/24] media: ti-vpe: cal: Drop cal_ctx m_fmt field
Date:   Mon,  7 Dec 2020 01:53:31 +0200
Message-Id: <20201206235353.26968-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 9bb6cc1bdbcc..955dacd878e7 100644
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

