Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9509A061
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392294AbfHVTp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:45:29 -0400
Received: from mailoutvs32.siol.net ([185.57.226.223]:56133 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2392280AbfHVTp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:45:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id E0B52524922;
        Thu, 22 Aug 2019 21:45:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GUgxcelfQGCl; Thu, 22 Aug 2019 21:45:26 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 84BC452481F;
        Thu, 22 Aug 2019 21:45:26 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 20948524922;
        Thu, 22 Aug 2019 21:45:24 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        jernej.skrabec@siol.net, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
        jonas@kwiboo.se
Subject: [PATCH 7/8] media: cedrus: Add support for holding capture buffer
Date:   Thu, 22 Aug 2019 21:44:59 +0200
Message-Id: <20190822194500.2071-8-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190822194500.2071-1-jernej.skrabec@siol.net>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
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
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c   | 9 +++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c    | 8 +++++---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 1 +
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_dec.c
index d7b54accfe83..68462b99750e 100644
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
 	run.first_slice =3D
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
index a942cd9bed57..99fedec80224 100644
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
index eeee3efd247b..5153b2bba21e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -515,6 +515,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
 	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
 	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv =3D ctx;
+	src_vq->subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 	src_vq->buf_struct_size =3D sizeof(struct cedrus_buffer);
 	src_vq->min_buffers_needed =3D 1;
 	src_vq->ops =3D &cedrus_qops;
--=20
2.22.1

