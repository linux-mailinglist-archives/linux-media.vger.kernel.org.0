Return-Path: <linux-media+bounces-54496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNhEIXleqGmZtgAAu9opvQ
	(envelope-from <linux-media+bounces-54496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 17:31:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAFA2044CE
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 17:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 446F832685AB
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 15:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A8335B64E;
	Wed,  4 Mar 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="icf6QAYA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F66F34EEF2;
	Wed,  4 Mar 2026 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639438; cv=none; b=L/xrprO+lZe5GVvKJq6saGmanZIwI9Hvu8JAeGcDxyQVQPDntqDC/Q0Y65RBT/KjUWj7PrUBHKazx2QWUFSfFYC+GA6KAi3FrZdT5o6Z7sbM3kDkROaOQthPiPnwQof6jg0H3nrazIj2wQOvU3SXo1gYvBx1CaQjRnUm0p6ZBbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639438; c=relaxed/simple;
	bh=CzRhEfOyUudbHke9KgdFAtAYtmG9TMIu7xK+0uvey80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iAr0/ZpALrFG4YeNHR3tO2gPwOhqIAopO8zJTXeibEIF5MwXuhUTVNDHdQpRTa8ZMK9EYI5GyXbFKaP4am7dXUKewlcuJAdYbcj56squu3aG7O6RKJV/FqZmYrY+I5U02V/40XmQ/B4/HYysuKXIxgkANTqRWTe0PV3Qe7ArjzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=icf6QAYA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:404d:d4e8:ffdc:3995])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 487EDC78;
	Wed,  4 Mar 2026 16:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772639367;
	bh=CzRhEfOyUudbHke9KgdFAtAYtmG9TMIu7xK+0uvey80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=icf6QAYA0shcrbD3JcIB77WYABr0jwOcwd1YtZaMS2CElYyaC+TB0SnTvA96rxVmk
	 BnZSLs2RyjqoIzvK2i8LAS1T+OUHuCJUXbBfciQn+F66yOPuvfvss/IAB8NvIrWSGs
	 C7QrYcJAXAGrucQvusjg7aWQXAuOSDFygXtdfNKk=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Wed, 04 Mar 2026 16:50:22 +0100
Subject: [PATCH v5 1/4] media: dw100: Implement V4L2 requests support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-sklug-v6-16-topic-dw100-v3-1-dev-v5-1-1a7e1f721b50@ideasonboard.com>
References: <20260304-sklug-v6-16-topic-dw100-v3-1-dev-v5-0-1a7e1f721b50@ideasonboard.com>
In-Reply-To: <20260304-sklug-v6-16-topic-dw100-v3-1-dev-v5-0-1a7e1f721b50@ideasonboard.com>
To: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: EBAFA2044CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54496-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

The dw100 dewarper hardware present on the NXP i.MX8MP allows very
flexible dewarping using a freely configurable vertex map. Aside from
lens dewarping the vertex map can be used to implement things like
arbitrary zoom, pan and rotation. The current driver supports setting
that vertex map before calling VIDIOC_STREAMON.

To control above mentioned features during streaming it is necessary to
update the vertex map dynamically. To do that in a race free manner V4L2
requests support is required. Add V4L2 requests support to prepare for
dynamic vertex map updates.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---

Changes in v5:
- Dropped the call to v4l2_m2m_job_finish() that was missed in v2 and
  lead to a race condition where jobs would be finished immediately
after being queued.

Changes in v4:
- Improved commit message
- Added comment above v4l2_ctrl_request_complete()
- Collected tag

Changes in v2:
- Use v4l2_m2m_buf_done_and_job_finish() to mark the buffers as done in
  the correct order.

Changes in v1:
- Moved v4l2_ctrl_request_complete into dw100_device_run
---
 drivers/media/platform/nxp/dw100/dw100.c | 55 ++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..17c8aa87a162e5b199b8e9a2c00d6cb346c5bf89 100644
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
@@ -1069,21 +1087,16 @@ static void dw100_job_finish(struct dw100_device *dw_dev, bool with_error)
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
-
 	dev_dbg(&dw_dev->pdev->dev, "Finishing transaction with%s error(s)\n",
 		with_error ? "" : "out");
 
-	v4l2_m2m_job_finish(dw_dev->m2m_dev, curr_ctx->fh.m2m_ctx);
+	v4l2_m2m_buf_done_and_job_finish(dw_dev->m2m_dev, curr_ctx->fh.m2m_ctx,
+					 buf_state);
 }
 
 static void dw100_hw_reset(struct dw100_device *dw_dev)
@@ -1460,6 +1473,16 @@ static void dw100_device_run(void *priv)
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
+	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
+				&ctx->hdl);
+
+	/*
+	 * As the hardware does not update any volatile controls, we can
+	 * complete control handling before starting the dewarper.
+	 */
+	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+				   &ctx->hdl);
+
 	dw100_start(ctx, src_buf, dst_buf);
 }
 
@@ -1467,6 +1490,11 @@ static const struct v4l2_m2m_ops dw100_m2m_ops = {
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
@@ -1578,6 +1606,7 @@ static int dw100_probe(struct platform_device *pdev)
 	dw_dev->mdev.dev = &pdev->dev;
 	strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
 	media_device_init(&dw_dev->mdev);
+	dw_dev->mdev.ops = &dw100_m2m_media_ops;
 	dw_dev->v4l2_dev.mdev = &dw_dev->mdev;
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);

-- 
2.51.0


