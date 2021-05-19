Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E793890DC
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 16:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347828AbhESOcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 10:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347746AbhESOcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 10:32:08 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DB9C06175F
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:30:48 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id m124so9564140pgm.13
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xlweU0DjsaYwDF/RrSg9zBbeB8bv1vD7nHpqdym1XJo=;
        b=YMAfBrMobR3wsbwGo3w+R7YMLWOVtsY+qWDCKEF4wj+1ZDpTNlOODPmAA/qd6eZL6J
         g3KldyTh2Nxq5gm1QMzjVRuGIC/jzu5AZHk6ryko697ip4wRblOUipWx0ZpXGSGp5Jy3
         bCgC5N/LKN7UycE0c4n28S3bdZFSsv3kiFalo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xlweU0DjsaYwDF/RrSg9zBbeB8bv1vD7nHpqdym1XJo=;
        b=tnytomZTFzImZOvwroK+K0vnhmzN/AfJtabRcpCkHYtFLVLkcfZAPa6546QKbGkNCk
         tOc1dusglwCgXeBRn53215wfKKp+Bah0zOelRJH7hAU2KLxh0yBqAv5mkm9QYkFsidQC
         COUOrA36G4AJVXSlbisROnIbWC+sxuxAxVSwCyn5YY24vcKMJFEp3xCTXK72MeU7zdkG
         0ZYon/zQ1iy9i8djjboLVSWqmuhqMDQ21QExuZUxZ+s/JQgmzK9gfJgT4Pc8AbfJbF0J
         8gbkVSwRI0GeUGWZCURKSPfEe1sg8sO3wN4kYadjEzsUTbn8pigvBKArWLGi9GPbPbSf
         DVKw==
X-Gm-Message-State: AOAM530zkMzXFw9Ihsf7N+3IKgRnJKxHw9f6/JVdVKTHGRRl0i15JCoE
        UdUlKOC28fDLltb3yCAkBT/vHg==
X-Google-Smtp-Source: ABdhPJwVf5vQW1Nj677UfUqxdMzrMWzwSqM24k+OPc/e/N9Xkf0w+2QpmJrXTs+5sFFGE3X4rVJ9Tg==
X-Received: by 2002:a63:2dc4:: with SMTP id t187mr11262448pgt.80.1621434648456;
        Wed, 19 May 2021 07:30:48 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:87ab:ff82:1544:697])
        by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:30:48 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 04/14] media: mtk-vcodec: make flush buffer reusable by encoder
Date:   Wed, 19 May 2021 23:30:01 +0900
Message-Id: <20210519143011.1175546-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The flush buffer is a special buffer that tells the decoder driver to
send an empty CAPTURE frame to the client with V4L2_BUF_FLAG_LAST set.

We need similar functionality for the encoder ; however currently the
flush buffer depends on decoder-specific structures and thus cannot be
reused with the encoder.

Fix this by testing for this buffer by its VB2 address, and not through
a dedicated flag stored in a higher-level decoder structure. This also
allows us to remove said flag and simplify the code a bit.

Since the flush buffer should never be used in the stateless decoder,
also add safeguards to check against it.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 24 +++++++++----------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  2 --
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +---------
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  6 +++--
 4 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 58e521096b94..a06fd2522e35 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -368,8 +368,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 		return;
 	}
 
-	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf,
-				    m2m_buf.vb);
 	dst_buf_info = container_of(dst_buf, struct mtk_video_dec_buf,
 				    m2m_buf.vb);
 
@@ -390,7 +388,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 			pfb->base_y.va, &pfb->base_y.dma_addr,
 			&pfb->base_c.dma_addr, pfb->base_y.size);
 
-	if (src_buf_info->lastframe) {
+	if (src_buf == &ctx->empty_flush_buf.vb) {
 		mtk_v4l2_debug(1, "Got empty flush input buffer.");
 		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
 
@@ -411,6 +409,10 @@ static void mtk_vdec_worker(struct work_struct *work)
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
+
+	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf,
+				    m2m_buf.vb);
+
 	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
@@ -514,8 +516,7 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 			mtk_v4l2_debug(1, "Capture stream is off. No need to flush.");
 			return 0;
 		}
-		v4l2_m2m_buf_queue(ctx->m2m_ctx,
-				   &ctx->empty_flush_buf->m2m_buf.vb);
+		v4l2_m2m_buf_queue(ctx->m2m_ctx, &ctx->empty_flush_buf.vb);
 		v4l2_m2m_try_schedule(ctx->m2m_ctx);
 		break;
 
@@ -1124,7 +1125,6 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 	unsigned int dpbsize = 1, i = 0;
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
-	struct mtk_video_dec_buf *buf = NULL;
 	struct mtk_q_data *dst_q_data;
 
 	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
@@ -1134,6 +1134,8 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 	 * check if this buffer is ready to be used after decode
 	 */
 	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		struct mtk_video_dec_buf *buf;
+
 		vb2_v4l2 = to_vb2_v4l2_buffer(vb);
 		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
@@ -1163,8 +1165,8 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
 		mtk_v4l2_err("No src buffer");
 		return;
 	}
-	buf = container_of(src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
-	if (buf->lastframe) {
+
+	if (src_buf == &ctx->empty_flush_buf.vb) {
 		/* This shouldn't happen. Just in case. */
 		mtk_v4l2_err("Invalid flush buffer.");
 		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
@@ -1269,8 +1271,6 @@ static int vb2ops_vdec_buf_init(struct vb2_buffer *vb)
 	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		buf->used = false;
 		buf->queued_in_v4l2 = false;
-	} else {
-		buf->lastframe = false;
 	}
 
 	return 0;
@@ -1296,9 +1296,7 @@ static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			struct mtk_video_dec_buf *buf_info = container_of(
-				 src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
-			if (!buf_info->lastframe)
+			if (src_buf != &ctx->empty_flush_buf.vb)
 				v4l2_m2m_buf_done(src_buf,
 						VB2_BUF_STATE_ERROR);
 		}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index cf26b6c1486a..1f8b7300dce6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -40,7 +40,6 @@ struct vdec_fb {
  * @queued_in_vb2:	Capture buffer is queue in vb2
  * @queued_in_v4l2:	Capture buffer is in v4l2 driver, but not in vb2
  *			queue yet
- * @lastframe:		Intput buffer is last buffer - EOS
  * @error:		An unrecoverable error occurs on this buffer.
  * @frame_buffer:	Decode status, and buffer information of Capture buffer
  *
@@ -52,7 +51,6 @@ struct mtk_video_dec_buf {
 	bool	used;
 	bool	queued_in_vb2;
 	bool	queued_in_v4l2;
-	bool	lastframe;
 	bool	error;
 	struct vdec_fb	frame_buffer;
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index f87dc47d9e63..5ce7f1b83e4e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -81,21 +81,14 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	struct mtk_video_dec_buf *mtk_buf = NULL;
 	int ret = 0;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
-	mtk_buf = kzalloc(sizeof(*mtk_buf), GFP_KERNEL);
-	if (!mtk_buf) {
-		kfree(ctx);
-		return -ENOMEM;
-	}
 
 	mutex_lock(&dev->dev_mutex);
-	ctx->empty_flush_buf = mtk_buf;
 	ctx->id = dev->id_counter++;
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
 	file->private_data = &ctx->fh;
@@ -121,8 +114,7 @@ static int fops_vcodec_open(struct file *file)
 	}
 	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	ctx->empty_flush_buf->m2m_buf.vb.vb2_buf.vb2_queue = src_vq;
-	ctx->empty_flush_buf->lastframe = true;
+	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
@@ -162,7 +154,6 @@ static int fops_vcodec_open(struct file *file)
 err_ctrls_setup:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
-	kfree(ctx->empty_flush_buf);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
@@ -193,7 +184,6 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
 	list_del_init(&ctx->list);
-	kfree(ctx->empty_flush_buf);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index d03cca95e99b..c6fe61253f43 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -13,6 +13,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include "mtk_vcodec_util.h"
 
@@ -249,7 +250,8 @@ struct vdec_pic_info {
  * @decode_work: worker for the decoding
  * @encode_work: worker for the encoding
  * @last_decoded_picinfo: pic information get from latest decode
- * @empty_flush_buf: a fake size-0 capture buffer that indicates flush
+ * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
+ *		     to be used with encoder and stateful decoder.
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
@@ -287,7 +289,7 @@ struct mtk_vcodec_ctx {
 	struct work_struct decode_work;
 	struct work_struct encode_work;
 	struct vdec_pic_info last_decoded_picinfo;
-	struct mtk_video_dec_buf *empty_flush_buf;
+	struct v4l2_m2m_buffer empty_flush_buf;
 
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
-- 
2.31.1.751.gd2f1c929bd-goog

