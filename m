Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4857DD3C5F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbfJKJcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:32:50 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:43157 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727649AbfJKJct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:32:49 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IrHxixmWhjZ8vIrHziRKkO; Fri, 11 Oct 2019 11:32:48 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 6/6] media: cedrus: h264: Support multiple slices per frame
Date:   Fri, 11 Oct 2019 11:32:45 +0200
Message-Id: <20191011093245.33366-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
References: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBzmwk2wZ2r7Pj+6rXYHDLmxi/ZQLcXEtL9ge0rZoZsrUq1qjsnbssu/lhUUm5/EeUAhs9fKzJkr1MtFfE2YjG/dw+69ohPp89pjpDNh7EC58zf2PEz4
 oijuRk881nVL0wS0Ij98MedtpypoHtDwi+j6D/Dj7df9LN51dUbSBWksP9NbBLl4y70idbxEeATlyLBMhV4pTUnaz60qrZPWJNzPe0XUBSQCOGvFguejwg6Z
 dVk34iA/gPTYKrKp2nA+DpT1b5/D5nkAKF1LHOXmj21sBFAFeo7kVGTUdBjZBYIyssvqI95tsG7ief50KkBV76Y7lZzgfRq8K9KqymcG9SgGIPYASDv2Cnm9
 7MrPaIZoGluQLmqZeQL+rr8hSV797xIOAOmRh3wTdpbY3tGn5gKl+C+wnxqXMbycH8M6FWCCg71A19cBbtFH+qJk+txgDXS6eBUWgSIXrtWpdhAIESGdDQuh
 caoHGjPr6dTGRMxh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

With recent changes, support for decoding multi-slice frames can be
easily added now.

Signal VPU if current slice is first in frame or not and add information
about first macroblock coordinates.

When frame contains multiple slices and driver works in slice mode, it's
more efficient to hold capture buffer in queue until all slices of a
same frame are decoded.

Add support for that to Cedrus driver by exposing and implementing
V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
[hverkuil-cisco@xs4all.nl: rewritten to use v4l2_m2m_buf_done_and_job_finish]
[hverkuil-cisco@xs4all.nl: removed unnecessary (u32) cast]
[hverkuil-cisco@xs4all.nl: use new_frame v4l2_m2m_ctx bool]
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   | 16 ++--------------
 .../staging/media/sunxi/cedrus/cedrus_video.c    | 14 ++++++++++++++
 3 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index d6a782703c9b..cd85668f9c80 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -301,6 +301,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	dma_addr_t src_buf_addr;
 	u32 offset = slice->header_bit_size;
 	u32 len = (slice->size * 8) - offset;
+	unsigned int pic_width_in_mbs;
+	bool mbaff_pic;
 	u32 reg;
 
 	cedrus_write(dev, VE_H264_VLD_LEN, len);
@@ -370,12 +372,20 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 		reg |= VE_H264_SPS_DIRECT_8X8_INFERENCE;
 	cedrus_write(dev, VE_H264_SPS, reg);
 
+	mbaff_pic = !(slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) &&
+		    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
+	pic_width_in_mbs = sps->pic_width_in_mbs_minus1 + 1;
+
 	// slice parameters
 	reg = 0;
+	reg |= ((slice->first_mb_in_slice % pic_width_in_mbs) & 0xff) << 24;
+	reg |= (((slice->first_mb_in_slice / pic_width_in_mbs) *
+		 (mbaff_pic + 1)) & 0xff) << 16;
 	reg |= decode->nal_ref_idc ? BIT(12) : 0;
 	reg |= (slice->slice_type & 0xf) << 8;
 	reg |= slice->cabac_init_idc & 0x3;
-	reg |= VE_H264_SHS_FIRST_SLICE_IN_PIC;
+	if (ctx->fh.m2m_ctx->new_frame)
+		reg |= VE_H264_SHS_FIRST_SLICE_IN_PIC;
 	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
 		reg |= VE_H264_SHS_FIELD_PIC;
 	if (slice->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index a942cd9bed57..e7e18424bab1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -103,7 +103,6 @@ static irqreturn_t cedrus_irq(int irq, void *data)
 {
 	struct cedrus_dev *dev = data;
 	struct cedrus_ctx *ctx;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	enum vb2_buffer_state state;
 	enum cedrus_irq_status status;
 
@@ -121,24 +120,13 @@ static irqreturn_t cedrus_irq(int irq, void *data)
 	dev->dec_ops[ctx->current_codec]->irq_disable(ctx);
 	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
 
-	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
-	if (!src_buf || !dst_buf) {
-		v4l2_err(&dev->v4l2_dev,
-			 "Missing source and/or destination buffers\n");
-		return IRQ_HANDLED;
-	}
-
 	if (status == CEDRUS_IRQ_ERROR)
 		state = VB2_BUF_STATE_ERROR;
 	else
 		state = VB2_BUF_STATE_DONE;
 
-	v4l2_m2m_buf_done(src_buf, state);
-	v4l2_m2m_buf_done(dst_buf, state);
-
-	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
+	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
+					 state);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 3ec3a2db790c..f745f66c4440 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -303,6 +303,17 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
 
 	ctx->src_fmt = f->fmt.pix;
 
+	switch (ctx->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		vq->subsystem_flags |=
+			VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+		break;
+	default:
+		vq->subsystem_flags &=
+			~VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+		break;
+	}
+
 	/* Propagate colorspace information to capture. */
 	ctx->dst_fmt.colorspace = f->fmt.pix.colorspace;
 	ctx->dst_fmt.xfer_func = f->fmt.pix.xfer_func;
@@ -336,6 +347,9 @@ const struct v4l2_ioctl_ops cedrus_ioctl_ops = {
 	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
 
+	.vidioc_try_decoder_cmd		= v4l2_m2m_ioctl_stateless_try_decoder_cmd,
+	.vidioc_decoder_cmd		= v4l2_m2m_ioctl_stateless_decoder_cmd,
+
 	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
-- 
2.23.0

