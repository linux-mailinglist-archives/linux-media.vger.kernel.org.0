Return-Path: <linux-media+bounces-49900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE7CF349C
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 12:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FE7C300874C
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 11:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2549F319612;
	Mon,  5 Jan 2026 11:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JuJgzNkC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E502530E0F3;
	Mon,  5 Jan 2026 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612991; cv=none; b=WAWHCT3LYUGiddk4HAA7Ug9/80Nf2N5htUlREbdAyddqiW37ilrSRfDnn7ti6Y90aVkD4sb2VVWcBHJGkiH5lwKAAEQoHkfaesHy4QgI0GOb/B/l1zWRKrJ88V0VDN7U2JJx2mc8z2v3GgjEnYW0PNKyoCnDtfTjlbQjccYUL18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612991; c=relaxed/simple;
	bh=r/iZ8DqEosyRFLaSBiQIpk9AVgGQPCLN1wDRiBBcnVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sP4uWLADJYOylwQJSL6x0FsghUTt850ccn2C7Eyirvsz+EMwhQvo0mVVMG85d6s0LEWQ9IzRuUuEfkhBKeKHWIoCcNg1pf5a+0UqBcpuyeCfTRPEyHdm6XFcOtKCfIzDUgUARoCSCgDNWPu47sXQ1PhmkT0OrhsluF6CibUEWVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JuJgzNkC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c12b:c5c7:ad08:9cf2])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F12E2A8F;
	Mon,  5 Jan 2026 12:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767612968;
	bh=r/iZ8DqEosyRFLaSBiQIpk9AVgGQPCLN1wDRiBBcnVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JuJgzNkC6Ltm24m+6JpLrqFCKmLl5H1DezWAEtz7HVItaS0929RW4ZlVErxAxJ9gy
	 0yyARu+HFSyIzkrVYZBS1deXNdRSmNh+RL6/r8vVCDNvZVydB+XlNN5UmR+1yzMe1O
	 HaIbUGp2UmrQ52nIkVmk/uieDo8PBN68soWJ7o/o=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Mon, 05 Jan 2026 12:35:53 +0100
Subject: [PATCH 1/4] media: dw100: Implement V4L2 requests support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
In-Reply-To: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
To: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.14.2

The dw100 dewarper hardware present on the NXP i.MX8MP allows very
flexible dewarping using a freely configurable vertex map. Aside from
lens dewarping the vertex map can be used to implement things like
arbitrary zoom, pan and rotation. The current driver supports setting
that vertex map before calling VIDIOC_STREAMON.

To control above mentioned features during streaming it is necessary to
update the vertex map dynamically. To do that in a race free manner V4L2
requests support is required. This patch adds V4L2 requests support to
prepare for dynamic vertex map updates.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

---

Changes in v1:
- Moved v4l2_ctrl_request_complete into dw100_device_run
---
 drivers/media/platform/nxp/dw100/dw100.c | 41 ++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..7f14b82c15a071605c124dbb868f8003856c4fc0 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -459,6 +459,15 @@ static int dw100_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
+static int dw100_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
 static int dw100_buf_prepare(struct vb2_buffer *vb)
 {
 	unsigned int i;
@@ -500,6 +509,13 @@ static void dw100_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 }
 
+static void dw100_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct dw100_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
+}
+
 static void dw100_return_all_buffers(struct vb2_queue *q,
 				     enum vb2_buffer_state state)
 {
@@ -553,11 +569,13 @@ static void dw100_stop_streaming(struct vb2_queue *q)
 }
 
 static const struct vb2_ops dw100_qops = {
-	.queue_setup	 = dw100_queue_setup,
-	.buf_prepare	 = dw100_buf_prepare,
-	.buf_queue	 = dw100_buf_queue,
-	.start_streaming = dw100_start_streaming,
-	.stop_streaming  = dw100_stop_streaming,
+	.queue_setup	      = dw100_queue_setup,
+	.buf_out_validate     = dw100_buf_out_validate,
+	.buf_prepare	      = dw100_buf_prepare,
+	.buf_queue	      = dw100_buf_queue,
+	.start_streaming      = dw100_start_streaming,
+	.stop_streaming       = dw100_stop_streaming,
+	.buf_request_complete = dw100_buf_request_complete,
 };
 
 static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
@@ -575,6 +593,7 @@ static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->vq_mutex;
 	src_vq->dev = ctx->dw_dev->v4l2_dev.dev;
+	src_vq->supports_requests = true;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -1460,6 +1479,12 @@ static void dw100_device_run(void *priv)
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
+	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
+				&ctx->hdl);
+
+	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+				   &ctx->hdl);
+
 	dw100_start(ctx, src_buf, dst_buf);
 }
 
@@ -1467,6 +1492,11 @@ static const struct v4l2_m2m_ops dw100_m2m_ops = {
 	.device_run	= dw100_device_run,
 };
 
+static const struct media_device_ops dw100_m2m_media_ops = {
+	.req_validate = vb2_request_validate,
+	.req_queue = v4l2_m2m_request_queue,
+};
+
 static struct video_device *dw100_init_video_device(struct dw100_device *dw_dev)
 {
 	struct video_device *vfd = &dw_dev->vfd;
@@ -1578,6 +1608,7 @@ static int dw100_probe(struct platform_device *pdev)
 	dw_dev->mdev.dev = &pdev->dev;
 	strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
 	media_device_init(&dw_dev->mdev);
+	dw_dev->mdev.ops = &dw100_m2m_media_ops;
 	dw_dev->v4l2_dev.mdev = &dw_dev->mdev;
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);

-- 
2.51.0


