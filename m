Return-Path: <linux-media+bounces-51356-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBgGNe9BcmnpfAAAu9opvQ
	(envelope-from <linux-media+bounces-51356-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:27:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683468C62
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AC87D7A65C2
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 14:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABFF35CB77;
	Thu, 22 Jan 2026 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eWjoHduc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D715352FA3;
	Thu, 22 Jan 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093106; cv=none; b=J6glM1fBWJeCtrgjmas6LxHEdgySiUHnEyRnPce6pqfIhzXYgZyd8krWHoSwkqttpfKbMhfQ3c2SWjtiz4hFpeHc1l2OI3s7VAjm3b81pH1SAAV5GADe+suiql+ZWTyTbIm87J00pU2c2zM5njXirVc5YjiWcraGZBjYyg2mlns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093106; c=relaxed/simple;
	bh=5oJ7muIlKrTCE7hk0LsBSqCNpuuKQGVs3p7fy03ndGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oHtToa4qpYSVqgzi3g/NznTeWigRkCEwHh+FanaptGN1KVLnKrC5eKjqdiyV3NyZ+r2dLWtZ1VETlxHjryP0loSEB2/VakSyNLwnZfUu2nQIvL8gNfW7V+lnGvvINLx1IsrQ4Hv32+zKVQ13nX+3kDevqPAuG3mta84pWrCpaqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eWjoHduc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:bc8e:214:d514:699a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F0A7463B;
	Thu, 22 Jan 2026 15:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769093069;
	bh=5oJ7muIlKrTCE7hk0LsBSqCNpuuKQGVs3p7fy03ndGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eWjoHducJ2w2NbYgQw6+sssoC7fkK5beMcxI7NqQIVktPg9dgxNwZ+LCLmsbhq2Qt
	 FX9IJ+Lc76nl6mMLM5bEhDXv0Ds+ls6PnpZQJ+s+KKyxVLPV6f/cS4VJwxxoTRF4Zj
	 y/sMNCuwQqtjqExrlRSnz5QaYuEujw65vywyNu2o=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Thu, 22 Jan 2026 15:44:56 +0100
Subject: [PATCH v2 1/3] media: dw100: Implement V4L2 requests support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-1-ea1e29f18cf1@ideasonboard.com>
References: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-0-ea1e29f18cf1@ideasonboard.com>
In-Reply-To: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-0-ea1e29f18cf1@ideasonboard.com>
To: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_FROM(0.00)[bounces-51356-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 7683468C62
X-Rspamd-Action: no action

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

Changes in v2:
- Use v4l2_m2m_buf_done_and_job_finish() to mark the buffers as done in
  the correct order.

Changes in v1:
- Moved v4l2_ctrl_request_complete into dw100_device_run
---
 drivers/media/platform/nxp/dw100/dw100.c | 49 +++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..1cb895da9912371a2b23ca62412c572d9cb75c00 100644
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
@@ -1058,7 +1077,6 @@ static const struct v4l2_ioctl_ops dw100_ioctl_ops = {
 static void dw100_job_finish(struct dw100_device *dw_dev, bool with_error)
 {
 	struct dw100_ctx *curr_ctx;
-	struct vb2_v4l2_buffer *src_vb, *dst_vb;
 	enum vb2_buffer_state buf_state;
 
 	curr_ctx = v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
@@ -1069,16 +1087,13 @@ static void dw100_job_finish(struct dw100_device *dw_dev, bool with_error)
 		return;
 	}
 
-	src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
-	dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
-
 	if (likely(!with_error))
 		buf_state = VB2_BUF_STATE_DONE;
 	else
 		buf_state = VB2_BUF_STATE_ERROR;
 
-	v4l2_m2m_buf_done(src_vb, buf_state);
-	v4l2_m2m_buf_done(dst_vb, buf_state);
+	v4l2_m2m_buf_done_and_job_finish(dw_dev->m2m_dev, curr_ctx->fh.m2m_ctx,
+					 buf_state);
 
 	dev_dbg(&dw_dev->pdev->dev, "Finishing transaction with%s error(s)\n",
 		with_error ? "" : "out");
@@ -1460,6 +1475,12 @@ static void dw100_device_run(void *priv)
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
 
@@ -1467,6 +1488,11 @@ static const struct v4l2_m2m_ops dw100_m2m_ops = {
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
@@ -1578,6 +1604,7 @@ static int dw100_probe(struct platform_device *pdev)
 	dw_dev->mdev.dev = &pdev->dev;
 	strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
 	media_device_init(&dw_dev->mdev);
+	dw_dev->mdev.ops = &dw100_m2m_media_ops;
 	dw_dev->v4l2_dev.mdev = &dw_dev->mdev;
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);

-- 
2.51.0


