Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8E3C18A280
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 19:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgCRSgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 14:36:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56747 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgCRSgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 14:36:54 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jEdYj-0001UQ-HY; Wed, 18 Mar 2020 19:36:53 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Subject: [PATCH] media: coda: add RC enable controls
Date:   Wed, 18 Mar 2020 19:36:49 +0100
Message-Id: <20200318183649.16831-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the encoder enables the rate control algorithms if the bitrate
control is non-zero. Implement the V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE
and V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE controls to allow userspace to
choose frame-level or macroblock-level rate control updates, or to
explicitly disable rate control. Both controls are initially enabled to
keep the current behavior.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c    |  9 +++++++--
 drivers/media/platform/coda/coda-common.c | 10 ++++++++++
 drivers/media/platform/coda/coda.h        |  2 ++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 3443396ba5f3..b021604eceaa 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -1215,7 +1215,8 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 		coda_write(dev, value, CODA_CMD_ENC_SEQ_GOP_SIZE);
 	}
 
-	if (ctx->params.bitrate) {
+	if (ctx->params.bitrate && (ctx->params.frame_rc_enable ||
+				    ctx->params.mb_rc_enable)) {
 		ctx->params.bitrate_changed = false;
 		ctx->params.h264_intra_qp_changed = false;
 
@@ -1276,7 +1277,11 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 	}
 	coda_write(dev, value, CODA_CMD_ENC_SEQ_OPTION);
 
-	coda_write(dev, 0, CODA_CMD_ENC_SEQ_RC_INTERVAL_MODE);
+	if (ctx->params.frame_rc_enable && !ctx->params.mb_rc_enable)
+		value = 1;
+	else
+		value = 0;
+	coda_write(dev, value, CODA_CMD_ENC_SEQ_RC_INTERVAL_MODE);
 
 	coda_setup_iram(ctx);
 
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 175504141a2c..c8bbe0983b71 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2222,6 +2222,12 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
 		ctx->params.h264_constrained_intra_pred_flag = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		ctx->params.frame_rc_enable = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
+		ctx->params.mb_rc_enable = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:
 		ctx->params.h264_chroma_qp_index_offset = ctrl->val;
 		break;
@@ -2320,6 +2326,10 @@ static void coda_encode_ctrls(struct coda_ctx *ctx)
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION, 0, 1, 1,
 		0);
+	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+		V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
+	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+		V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE, 0, 1, 1, 1);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET, -12, 12, 1, 0);
 	v4l2_ctrl_new_std_menu(&ctx->ctrls, &coda_ctrl_ops,
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index af0f8252b0c6..b81f3aca9209 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -148,6 +148,8 @@ struct coda_params {
 	bool			h264_intra_qp_changed;
 	bool			intra_refresh_changed;
 	bool			slice_mode_changed;
+	bool			frame_rc_enable;
+	bool			mb_rc_enable;
 };
 
 struct coda_buffer_meta {
-- 
2.20.1

