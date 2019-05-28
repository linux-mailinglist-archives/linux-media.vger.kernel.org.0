Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD6E2CCF2
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfE1RDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:03:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45926 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbfE1RDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:03:39 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 25051280195
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v6 06/16] rockchip/vpu: Support the Request API
Date:   Tue, 28 May 2019 14:02:22 -0300
Message-Id: <20190528170232.2091-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528170232.2091-1-ezequiel@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce support for the Request API. Although the JPEG encoder
does not mandate using the Request API, it's perfectly possible to
use it, if the application wants to.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
--
Changes from v3:
* None

Changes from v2:
* Drop unrelated mdev.bus_info changes.
* Remove the get_ref and get_ctrl helpers as they are not used yet.

 .../rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c     |  6 ++++++
 .../media/rockchip/vpu/rockchip_vpu_drv.c     |  7 +++++++
 .../media/rockchip/vpu/rockchip_vpu_enc.c     | 19 +++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
index 6f9f5158d193..74823d25cd8d 100644
--- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
+++ b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
@@ -113,11 +113,15 @@ void rk3399_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx)
 	struct rockchip_vpu_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct rockchip_vpu_jpeg_ctx jpeg_ctx;
+	struct media_request *src_req;
 	u32 reg;
 
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
+	src_req = src_buf->vb2_buf.req_obj.req;
+	v4l2_ctrl_request_setup(src_req, &ctx->ctrl_handler);
+
 	memset(&jpeg_ctx, 0, sizeof(jpeg_ctx));
 	jpeg_ctx.buffer = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
 	jpeg_ctx.width = ctx->dst_fmt.width;
@@ -153,6 +157,8 @@ void rk3399_vpu_jpeg_enc_run(struct rockchip_vpu_ctx *ctx)
 		| VEPU_REG_ENCODE_FORMAT_JPEG
 		| VEPU_REG_ENCODE_ENABLE;
 
+	v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
+
 	/* Kick the watchdog and start encoding */
 	schedule_delayed_work(&vpu->watchdog_work, msecs_to_jiffies(2000));
 	vepu_write(vpu, reg, VEPU_REG_ENCODE_START);
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
index fa02354a0f8a..f47fbd0f9545 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
@@ -162,6 +162,7 @@ enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->dev->vpu_mutex;
 	src_vq->dev = ctx->dev->v4l2_dev.dev;
+	src_vq->supports_requests = true;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -525,6 +526,11 @@ static void rockchip_vpu_remove_enc_func(struct rockchip_vpu_dev *vpu)
 	video_unregister_device(&func->vdev);
 }
 
+static const struct media_device_ops rockchip_m2m_media_ops = {
+	.req_validate = vb2_request_validate,
+	.req_queue = v4l2_m2m_request_queue,
+};
+
 static int rockchip_vpu_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
@@ -617,6 +623,7 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 	strscpy(vpu->mdev.bus_info, "platform: " DRIVER_NAME,
 		sizeof(vpu->mdev.model));
 	media_device_init(&vpu->mdev);
+	vpu->mdev.ops = &rockchip_m2m_media_ops;
 	vpu->v4l2_dev.mdev = &vpu->mdev;
 
 	ret = rockchip_vpu_add_enc_func(vpu);
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
index aa00df9a7ecb..4512e94c3f32 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
@@ -540,14 +540,33 @@ static void rockchip_vpu_stop_streaming(struct vb2_queue *q)
 			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 		if (!vbuf)
 			break;
+		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
+					   &ctx->ctrl_handler);
 		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 	}
 }
 
+static void rockchip_vpu_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct rockchip_vpu_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_handler);
+}
+
+static int rockchip_vpu_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+
 const struct vb2_ops rockchip_vpu_enc_queue_ops = {
 	.queue_setup = rockchip_vpu_queue_setup,
 	.buf_prepare = rockchip_vpu_buf_prepare,
 	.buf_queue = rockchip_vpu_buf_queue,
+	.buf_out_validate = rockchip_vpu_buf_out_validate,
+	.buf_request_complete = rockchip_vpu_buf_request_complete,
 	.start_streaming = rockchip_vpu_start_streaming,
 	.stop_streaming = rockchip_vpu_stop_streaming,
 	.wait_prepare = vb2_ops_wait_prepare,
-- 
2.20.1

