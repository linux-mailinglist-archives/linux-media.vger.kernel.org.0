Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16D64546E3
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 14:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237447AbhKQNKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 08:10:02 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49556 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237416AbhKQNJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 08:09:59 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8B4BB1F45D05
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637154420; bh=SOIfKJTF3ojVjdj5pNKtgKYrGmMpjOI/etlet6g4CfI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oXHaIMrHZL2Kf6Z6hLYftuq3Srst9bAzqCibEfCUy8HilO3ozsLTBneFywPwSp3RU
         bvTsliBjcRzI1Fx39XAx3mhwVNy2IED95Mx+bBqiHFR8EVXd4k0geTdjhA0uZYBYSS
         YlZmJytVyITNyhNBY2QKcgg/i/ysEeaYQTrHiO1/a5UKECVVa3XYfA+lvwD02oxY9y
         xcT/g2OzLx8TiLHb09YGNwLGZr2GtbR97/siReL6t+S9AzkWepXdqOuBsPJQ47yXze
         R5fELdZnNipwoYgRMwuAL0GZwXEzNmYqOFvFW1528G2KIty2zIY6JhxNePUngj7x+4
         TIKgjbar7REiw==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
Subject: [PATCH v2 6/7] media: mtk-vcodec: don't check return val of mtk_venc_get_q_data
Date:   Wed, 17 Nov 2021 15:06:34 +0200
Message-Id: <20211117130635.11633-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function mtk_venc_get_q_data always returns a reference
so there is no need to check if the return value is null.
In addition move the q_data initialization to the declaration

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 39 ++++---------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index be28f2401839..5caaeb4773ca 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -399,7 +399,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct vb2_queue *vq;
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int i, ret;
 	const struct mtk_video_fmt *fmt;
 
@@ -414,12 +414,6 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	q_data = mtk_venc_get_q_data(ctx, f->type);
-	if (!q_data) {
-		mtk_v4l2_err("fail to get q data");
-		return -EINVAL;
-	}
-
 	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->capture_formats[0];
@@ -460,7 +454,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct vb2_queue *vq;
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int ret, i;
 	const struct mtk_video_fmt *fmt;
 
@@ -475,12 +469,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	q_data = mtk_venc_get_q_data(ctx, f->type);
-	if (!q_data) {
-		mtk_v4l2_err("fail to get q data");
-		return -EINVAL;
-	}
-
 	fmt = mtk_venc_find_format(f->fmt.pix.pixelformat, pdata);
 	if (!fmt) {
 		fmt = &ctx->dev->venc_pdata->output_formats[0];
@@ -520,14 +508,13 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 	struct vb2_queue *vq;
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int i;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
 	if (!vq)
 		return -EINVAL;
 
-	q_data = mtk_venc_get_q_data(ctx, f->type);
 
 	pix->width = q_data->coded_width;
 	pix->height = q_data->coded_height;
@@ -596,15 +583,11 @@ static int vidioc_venc_g_selection(struct file *file, void *priv,
 				     struct v4l2_selection *s)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
-	q_data = mtk_venc_get_q_data(ctx, s->type);
-	if (!q_data)
-		return -EINVAL;
-
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -630,15 +613,11 @@ static int vidioc_venc_s_selection(struct file *file, void *priv,
 				     struct v4l2_selection *s)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, s->type);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
-	q_data = mtk_venc_get_q_data(ctx, s->type);
-	if (!q_data)
-		return -EINVAL;
-
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP:
 		/* Only support crop from (0,0) */
@@ -805,11 +784,9 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
 				   struct device *alloc_devs[])
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vq);
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, vq->type);
 	unsigned int i;
 
-	q_data = mtk_venc_get_q_data(ctx, vq->type);
-
 	if (q_data == NULL)
 		return -EINVAL;
 
@@ -829,11 +806,9 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
 static int vb2ops_venc_buf_prepare(struct vb2_buffer *vb)
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
-	struct mtk_q_data *q_data;
+	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, vb->vb2_queue->type);
 	int i;
 
-	q_data = mtk_venc_get_q_data(ctx, vb->vb2_queue->type);
-
 	for (i = 0; i < q_data->fmt->num_planes; i++) {
 		if (vb2_plane_size(vb, i) < q_data->sizeimage[i]) {
 			mtk_v4l2_err("data will not fit into plane %d (%lu < %d)",
-- 
2.17.1

