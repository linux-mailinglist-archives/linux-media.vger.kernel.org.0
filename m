Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4AC5C194F
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 22:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbfI2UBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Sep 2019 16:01:13 -0400
Received: from mailoutvs21.siol.net ([185.57.226.212]:54173 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729233AbfI2UBL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Sep 2019 16:01:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 751D75223B9;
        Sun, 29 Sep 2019 22:01:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id RRnT9vDB_VQ1; Sun, 29 Sep 2019 22:01:07 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 0D1E552233F;
        Sun, 29 Sep 2019 22:01:07 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 96C2E5223B9;
        Sun, 29 Sep 2019 22:01:04 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org
Cc:     gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se, jernej.skrabec@siol.net
Subject: [PATCH v2 6/6] media: cedrus: Add support for holding capture buffer
Date:   Sun, 29 Sep 2019 22:00:23 +0200
Message-Id: <20190929200023.215831-7-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929200023.215831-1-jernej.skrabec@siol.net>
References: <20190929200023.215831-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When frame contains multiple slices and driver works in slice mode, it's
more efficient to hold capture buffer in queue until all slices of a
same frame are decoded.

Add support for that to Cedrus driver by exposing and implementing
V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c   |  9 +++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c    |  8 +++++---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 14 ++++++++++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_dec.c
index e49c3396ca4d..67f7d4326fc1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -31,6 +31,14 @@ void cedrus_device_run(void *priv)
=20
 	run.src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	run.dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	if (v4l2_m2m_release_capture_buf(run.src, run.dst)) {
+		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		v4l2_m2m_buf_done(run.dst, VB2_BUF_STATE_DONE);
+		run.dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	}
+	run.dst->is_held =3D run.src->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BU=
F;
+
 	run.first_slice =3D !run.dst->vb2_buf.copied_timestamp ||
 		run.src->vb2_buf.timestamp !=3D run.dst->vb2_buf.timestamp;
=20
@@ -46,6 +54,7 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
 		run.mpeg2.quantization =3D cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+		run.dst->is_held =3D false;
 		break;
=20
 	case V4L2_PIX_FMT_H264_SLICE:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
index fc8579b90dab..b466041c25db 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -122,7 +122,7 @@ static irqreturn_t cedrus_irq(int irq, void *data)
 	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
=20
 	src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
=20
 	if (!src_buf || !dst_buf) {
 		v4l2_err(&dev->v4l2_dev,
@@ -136,8 +136,10 @@ static irqreturn_t cedrus_irq(int irq, void *data)
 		state =3D VB2_BUF_STATE_DONE;
=20
 	v4l2_m2m_buf_done(src_buf, state);
-	v4l2_m2m_buf_done(dst_buf, state);
-
+	if (!dst_buf->is_held) {
+		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		v4l2_m2m_buf_done(dst_buf, state);
+	}
 	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
=20
 	return IRQ_HANDLED;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
index 3ec3a2db790c..82198b2bb081 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -303,6 +303,17 @@ static int cedrus_s_fmt_vid_out(struct file *file, v=
oid *priv,
=20
 	ctx->src_fmt =3D f->fmt.pix;
=20
+	switch (ctx->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		vq->subsystem_flags |=3D
+			VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+		break;
+	default:
+		vq->subsystem_flags &=3D
+			(u32)~VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+		break;
+	}
+
 	/* Propagate colorspace information to capture. */
 	ctx->dst_fmt.colorspace =3D f->fmt.pix.colorspace;
 	ctx->dst_fmt.xfer_func =3D f->fmt.pix.xfer_func;
@@ -336,6 +347,9 @@ const struct v4l2_ioctl_ops cedrus_ioctl_ops =3D {
 	.vidioc_streamon		=3D v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff		=3D v4l2_m2m_ioctl_streamoff,
=20
+	.vidioc_try_decoder_cmd		=3D v4l2_m2m_ioctl_stateless_try_decoder_cmd,
+	.vidioc_decoder_cmd		=3D v4l2_m2m_ioctl_stateless_decoder_cmd,
+
 	.vidioc_subscribe_event		=3D v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event	=3D v4l2_event_unsubscribe,
 };
--=20
2.23.0

