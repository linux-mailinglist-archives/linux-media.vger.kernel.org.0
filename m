Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 681B7373D9
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfFFMLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:11:40 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:40097 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727332AbfFFMLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:11:37 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YrExhzc7c3qlsYrF1hma8l; Thu, 06 Jun 2019 14:11:35 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/9] vicodec: pass on enc output format to capture side
Date:   Thu,  6 Jun 2019 14:11:26 +0200
Message-Id: <20190606121131.37110-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
References: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKtIBrnrPXSVio9cPUc5JB9Ftpx+rBkd7RzCHgtzXD4RR8L2gM0yjVm1hADwzWZIq1xQhT+YMm5f1T+FF5Q7+37T74jyOFE7XpMFoBufC39KsTR1Bhg5
 IK+7IuX4Zh+ohQFt3ocmRlKmO9rEpP/AgBcp4Dhylp/Gew64btiUQx6DpGUD4yr43DP3QMqE7VtOJEgZevDYMGMdFB0a9Rl/7jR5O6KHJWcSzDAfx6ViLdNC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Setting the encoder output format to e.g. 1920x1080 will set the
crop rectangle to 1920x1088, the coded resolution to 1920x1088 and
the capture coded resolution and sizeimage to 1920x1088 as well.

Note that this might change, since the encoder spec is still in
flux with respect to how this should behave.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 53 +++++++++++++++----
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 7a7082808a23..7a78d044072d 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -1032,16 +1032,10 @@ static int vidioc_s_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
 	default:
 		return -EINVAL;
 	}
-	if (q_data->visible_width > q_data->coded_width)
-		q_data->visible_width = q_data->coded_width;
-	if (q_data->visible_height > q_data->coded_height)
-		q_data->visible_height = q_data->coded_height;
-
 
 	dprintk(ctx->dev,
-		"Setting format for type %d, coded wxh: %dx%d, visible wxh: %dx%d, fourcc: %08x\n",
+		"Setting format for type %d, coded wxh: %dx%d, fourcc: 0x%08x\n",
 		f->type, q_data->coded_width, q_data->coded_height,
-		q_data->visible_width, q_data->visible_height,
 		q_data->info->id);
 
 	return 0;
@@ -1063,18 +1057,58 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
-	struct v4l2_pix_format_mplane *pix_mp;
+	struct vicodec_q_data *q_data;
+	struct vicodec_q_data *q_data_cap;
 	struct v4l2_pix_format *pix;
+	struct v4l2_pix_format_mplane *pix_mp;
+	u32 coded_w = 0, coded_h = 0;
+	unsigned int size = 0;
 	int ret;
 
+	q_data = get_q_data(ctx, f->type);
+	q_data_cap = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+
 	ret = vidioc_try_fmt_vid_out(file, priv, f);
 	if (ret)
 		return ret;
 
+	if (ctx->is_enc) {
+		struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+		struct vb2_queue *vq_cap = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+							   V4L2_BUF_TYPE_VIDEO_CAPTURE);
+		const struct v4l2_fwht_pixfmt_info *info = ctx->is_stateless ?
+			&pixfmt_stateless_fwht : &pixfmt_fwht;
+
+		if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+			coded_w = f->fmt.pix.width;
+			coded_h = f->fmt.pix.height;
+		} else {
+			coded_w = f->fmt.pix_mp.width;
+			coded_h = f->fmt.pix_mp.height;
+		}
+		if (vb2_is_busy(vq) && (coded_w != q_data->coded_width ||
+					coded_h != q_data->coded_height))
+			return -EBUSY;
+		size = coded_w * coded_h *
+			info->sizeimage_mult / info->sizeimage_div;
+		if (!ctx->is_stateless)
+			size += sizeof(struct fwht_cframe_hdr);
+
+		if (vb2_is_busy(vq_cap) && size > q_data_cap->sizeimage)
+			return -EBUSY;
+	}
+
 	ret = vidioc_s_fmt(file2ctx(file), f);
 	if (!ret) {
+		if (ctx->is_enc) {
+			q_data->visible_width = coded_w;
+			q_data->visible_height = coded_h;
+			q_data_cap->coded_width = coded_w;
+			q_data_cap->coded_height = coded_h;
+			q_data_cap->sizeimage = size;
+		}
+
 		switch (f->type) {
-		case V4L2_BUF_TYPE_VIDEO_CAPTURE:
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 			pix = &f->fmt.pix;
 			ctx->state.colorspace = pix->colorspace;
@@ -1082,7 +1116,6 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 			ctx->state.ycbcr_enc = pix->ycbcr_enc;
 			ctx->state.quantization = pix->quantization;
 			break;
-		case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 			pix_mp = &f->fmt.pix_mp;
 			ctx->state.colorspace = pix_mp->colorspace;
-- 
2.20.1

