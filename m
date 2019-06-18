Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33B084A756
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbfFRQps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:48 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52475 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730032AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEu-0003WX-6Z; Tue, 18 Jun 2019 18:45:44 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 28/28] media: coda: encoder parameter change support
Date:   Tue, 18 Jun 2019 18:45:35 +0200
Message-Id: <20190618164535.20162-29-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
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

Add support for dynamically changing the GOP size, bitrate, frame rate,
constant intra quantization parameter, number of intra refresh macro
blocks and slice mode parameters.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c    | 83 +++++++++++++++++++++++
 drivers/media/platform/coda/coda-common.c |  7 ++
 drivers/media/platform/coda/coda.h        |  7 ++
 drivers/media/platform/coda/coda_regs.h   | 18 +++++
 4 files changed, 115 insertions(+)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index b59cb16f75a1..00c7bed3dd57 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -698,6 +698,79 @@ static u32 coda_slice_mode(struct coda_ctx *ctx)
 	       ((1 & CODA_SLICING_MODE_MASK) << CODA_SLICING_MODE_OFFSET);
 }
 
+static int coda_enc_param_change(struct coda_ctx *ctx)
+{
+	struct coda_dev *dev = ctx->dev;
+	u32 change_enable = 0;
+	u32 success;
+	int ret;
+
+	if (ctx->params.gop_size_changed) {
+		change_enable |= CODA_PARAM_CHANGE_RC_GOP;
+		coda_write(dev, ctx->params.gop_size,
+			   CODA_CMD_ENC_PARAM_RC_GOP);
+		ctx->gopcounter = ctx->params.gop_size - 1;
+		ctx->params.gop_size_changed = false;
+	}
+	if (ctx->params.h264_intra_qp_changed) {
+		coda_dbg(1, ctx, "parameter change: intra Qp %u\n",
+			 ctx->params.h264_intra_qp);
+
+		if (ctx->params.bitrate) {
+			change_enable |= CODA_PARAM_CHANGE_RC_INTRA_QP;
+			coda_write(dev, ctx->params.h264_intra_qp,
+				   CODA_CMD_ENC_PARAM_RC_INTRA_QP);
+		}
+		ctx->params.h264_intra_qp_changed = false;
+	}
+	if (ctx->params.bitrate_changed) {
+		coda_dbg(1, ctx, "parameter change: bitrate %u kbit/s\n",
+			 ctx->params.bitrate);
+		change_enable |= CODA_PARAM_CHANGE_RC_BITRATE;
+		coda_write(dev, ctx->params.bitrate,
+			   CODA_CMD_ENC_PARAM_RC_BITRATE);
+		ctx->params.bitrate_changed = false;
+	}
+	if (ctx->params.framerate_changed) {
+		coda_dbg(1, ctx, "parameter change: frame rate %u/%u Hz\n",
+			 ctx->params.framerate & 0xffff,
+			 (ctx->params.framerate >> 16) + 1);
+		change_enable |= CODA_PARAM_CHANGE_RC_FRAME_RATE;
+		coda_write(dev, ctx->params.framerate,
+			   CODA_CMD_ENC_PARAM_RC_FRAME_RATE);
+		ctx->params.framerate_changed = false;
+	}
+	if (ctx->params.intra_refresh_changed) {
+		coda_dbg(1, ctx, "parameter change: intra refresh MBs %u\n",
+			 ctx->params.intra_refresh);
+		change_enable |= CODA_PARAM_CHANGE_INTRA_MB_NUM;
+		coda_write(dev, ctx->params.intra_refresh,
+			   CODA_CMD_ENC_PARAM_INTRA_MB_NUM);
+		ctx->params.intra_refresh_changed = false;
+	}
+	if (ctx->params.slice_mode_changed) {
+		change_enable |= CODA_PARAM_CHANGE_SLICE_MODE;
+		coda_write(dev, coda_slice_mode(ctx),
+			   CODA_CMD_ENC_PARAM_SLICE_MODE);
+		ctx->params.slice_mode_changed = false;
+	}
+
+	if (!change_enable)
+		return 0;
+
+	coda_write(dev, change_enable, CODA_CMD_ENC_PARAM_CHANGE_ENABLE);
+
+	ret = coda_command_sync(ctx, CODA_COMMAND_RC_CHANGE_PARAMETER);
+	if (ret < 0)
+		return ret;
+
+	success = coda_read(dev, CODA_RET_ENC_PARAM_CHANGE_SUCCESS);
+	if (success != 1)
+		coda_dbg(1, ctx, "parameter change failed: %u\n", success);
+
+	return 0;
+}
+
 static phys_addr_t coda_iram_alloc(struct coda_iram_info *iram, size_t size)
 {
 	phys_addr_t ret;
@@ -1143,6 +1216,9 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 	}
 
 	if (ctx->params.bitrate) {
+		ctx->params.bitrate_changed = false;
+		ctx->params.h264_intra_qp_changed = false;
+
 		/* Rate control enabled */
 		value = (ctx->params.bitrate & CODA_RATECONTROL_BITRATE_MASK)
 			<< CODA_RATECONTROL_BITRATE_OFFSET;
@@ -1397,6 +1473,13 @@ static int coda_prepare_encode(struct coda_ctx *ctx)
 	u32 rot_mode = 0;
 	u32 dst_fourcc;
 	u32 reg;
+	int ret;
+
+	ret = coda_enc_param_change(ctx);
+	if (ret < 0) {
+		v4l2_warn(&ctx->dev->v4l2_dev, "parameter change failed: %d\n",
+			  ret);
+	}
 
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 8060a3425325..e6bbe1f6cd51 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1317,6 +1317,7 @@ static int coda_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	tpf = &a->parm.output.timeperframe;
 	coda_approximate_timeperframe(tpf);
 	ctx->params.framerate = coda_timeperframe_to_frate(tpf);
+	ctx->params.framerate_changed = true;
 
 	return 0;
 }
@@ -2033,12 +2034,14 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE:
 		ctx->params.bitrate = ctrl->val / 1000;
+		ctx->params.bitrate_changed = true;
 		break;
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
 		ctx->params.gop_size = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
 		ctx->params.h264_intra_qp = ctrl->val;
+		ctx->params.h264_intra_qp_changed = true;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
 		ctx->params.h264_inter_qp = ctrl->val;
@@ -2086,17 +2089,21 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
 		ctx->params.slice_mode = ctrl->val;
+		ctx->params.slice_mode_changed = true;
 		break;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
 		ctx->params.slice_max_mb = ctrl->val;
+		ctx->params.slice_mode_changed = true;
 		break;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
 		ctx->params.slice_max_bits = ctrl->val * 8;
+		ctx->params.slice_mode_changed = true;
 		break;
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
 		break;
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
 		ctx->params.intra_refresh = ctrl->val;
+		ctx->params.intra_refresh_changed = true;
 		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 		ctx->params.force_ipicture = true;
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index 502a6272629a..848bf1da401e 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -137,6 +137,12 @@ struct coda_params {
 	u32			slice_max_bits;
 	u32			slice_max_mb;
 	bool			force_ipicture;
+	bool			gop_size_changed;
+	bool			bitrate_changed;
+	bool			framerate_changed;
+	bool			h264_intra_qp_changed;
+	bool			intra_refresh_changed;
+	bool			slice_mode_changed;
 };
 
 struct coda_buffer_meta {
@@ -254,6 +260,7 @@ struct coda_ctx {
 	u32				bit_stream_param;
 	u32				frm_dis_flg;
 	u32				frame_mem_ctrl;
+	u32				para_change;
 	int				display_idx;
 	struct dentry			*debugfs_entry;
 	bool				use_bit;
diff --git a/drivers/media/platform/coda/coda_regs.h b/drivers/media/platform/coda/coda_regs.h
index 4d503f472397..b17464b56d3d 100644
--- a/drivers/media/platform/coda/coda_regs.h
+++ b/drivers/media/platform/coda/coda_regs.h
@@ -342,6 +342,24 @@
 #define CODA_CMD_ENC_SEQ_JPG_THUMB_SIZE				0x1a4
 #define CODA_CMD_ENC_SEQ_JPG_THUMB_OFFSET			0x1a8
 
+/* Encoder Parameter Change */
+#define CODA_CMD_ENC_PARAM_CHANGE_ENABLE	0x180
+#define		CODA_PARAM_CHANGE_RC_GOP			BIT(0)
+#define		CODA_PARAM_CHANGE_RC_INTRA_QP			BIT(1)
+#define		CODA_PARAM_CHANGE_RC_BITRATE			BIT(2)
+#define		CODA_PARAM_CHANGE_RC_FRAME_RATE			BIT(3)
+#define		CODA_PARAM_CHANGE_INTRA_MB_NUM			BIT(4)
+#define		CODA_PARAM_CHANGE_SLICE_MODE			BIT(5)
+#define		CODA_PARAM_CHANGE_HEC_MODE			BIT(6)
+#define CODA_CMD_ENC_PARAM_RC_GOP		0x184
+#define CODA_CMD_ENC_PARAM_RC_INTRA_QP		0x188
+#define CODA_CMD_ENC_PARAM_RC_BITRATE		0x18c
+#define CODA_CMD_ENC_PARAM_RC_FRAME_RATE	0x190
+#define CODA_CMD_ENC_PARAM_INTRA_MB_NUM		0x194
+#define CODA_CMD_ENC_PARAM_SLICE_MODE		0x198
+#define CODA_CMD_ENC_PARAM_HEC_MODE		0x19c
+#define CODA_RET_ENC_PARAM_CHANGE_SUCCESS	0x1c0
+
 /* Encoder Picture Run */
 #define CODA9_CMD_ENC_PIC_SRC_INDEX		0x180
 #define CODA9_CMD_ENC_PIC_SRC_STRIDE		0x184
-- 
2.20.1

