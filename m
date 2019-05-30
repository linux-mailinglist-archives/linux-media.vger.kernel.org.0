Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E12B3040A
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfE3VP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:15:58 -0400
Received: from mailoutvs48.siol.net ([185.57.226.239]:55402 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726794AbfE3VPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:15:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 1B9BF52286B;
        Thu, 30 May 2019 23:15:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id uezCuMHm-0Ve; Thu, 30 May 2019 23:15:44 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id C27FC5227EC;
        Thu, 30 May 2019 23:15:44 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 7E01D5228C1;
        Thu, 30 May 2019 23:15:42 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] media: cedrus: Add infra for extra buffers connected to capture buffers
Date:   Thu, 30 May 2019 23:15:15 +0200
Message-Id: <20190530211516.1891-7-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530211516.1891-1-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

H264 and HEVC engines need additional buffers for each capture buffer.
H264 engine has this currently solved by allocating fixed size pool,
which is not ideal. Most of the time pool size is much bigger than it
needs to be.

Ideally, extra buffer should be allocated at buffer initialization, but
that's not efficient. It's size in H264 depends on flags set in SPS, but
that information is not available in buffer init callback.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 ++++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index d8e6777e5e27..16c1bdfd243a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -81,6 +81,10 @@ struct cedrus_run {
 struct cedrus_buffer {
 	struct v4l2_m2m_buffer          m2m_buf;
=20
+	void		*extra_buf;
+	dma_addr_t	extra_buf_dma;
+	ssize_t		extra_buf_size;
+
 	union {
 		struct {
 			unsigned int			position;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
index 681dfe3367a6..d756e0e69634 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -411,6 +411,24 @@ static void cedrus_queue_cleanup(struct vb2_queue *v=
q, u32 state)
 	}
 }
=20
+static void cedrus_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq =3D vb->vb2_queue;
+
+	if (!V4L2_TYPE_IS_OUTPUT(vq->type)) {
+		struct cedrus_ctx *ctx =3D vb2_get_drv_priv(vq);
+		struct cedrus_buffer *cedrus_buf;
+
+		cedrus_buf =3D vb2_to_cedrus_buffer(vq->bufs[vb->index]);
+
+		if (cedrus_buf->extra_buf_size)
+			dma_free_coherent(ctx->dev->dev,
+					  cedrus_buf->extra_buf_size,
+					  cedrus_buf->extra_buf,
+					  cedrus_buf->extra_buf_dma);
+	}
+}
+
 static int cedrus_buf_out_validate(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
@@ -497,6 +515,7 @@ static void cedrus_buf_request_complete(struct vb2_bu=
ffer *vb)
 static struct vb2_ops cedrus_qops =3D {
 	.queue_setup		=3D cedrus_queue_setup,
 	.buf_prepare		=3D cedrus_buf_prepare,
+	.buf_cleanup		=3D cedrus_buf_cleanup,
 	.buf_queue		=3D cedrus_buf_queue,
 	.buf_out_validate	=3D cedrus_buf_out_validate,
 	.buf_request_complete	=3D cedrus_buf_request_complete,
--=20
2.21.0

