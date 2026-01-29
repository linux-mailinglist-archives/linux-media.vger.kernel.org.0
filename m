Return-Path: <linux-media+bounces-51780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N1JKuhHe2kdDQIAu9opvQ
	(envelope-from <linux-media+bounces-51780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 12:43:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A4AFC08
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 12:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21A69300D76C
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 11:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137D83876C1;
	Thu, 29 Jan 2026 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OZjoCjCV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB5E3876A4;
	Thu, 29 Jan 2026 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769687007; cv=none; b=XSOKcxpPkiOXK3wJziBgNeT/y3b+qa1E5ZiYQk950/ghGiZXSeJzG5zjb/+yYXUwguOA1kjpqoeOVrQvCvDP/KpvlCTJYkdMmoKyx31tHnCLwXJkIRfj4HiWRetJv3TL9UtRXYHGvXpSHZklWAwjlv25sW/X+s3Y+0SjhZ5lXyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769687007; c=relaxed/simple;
	bh=+Vp+WqODTAaIKelMntc3l329Z299faZuEWgOPeC848I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtRTfQCA6FjHV+T8Or03ZA0TKXgpgcWuc+xRciAtypLxIFgjKdg1HnySpCMix5j/fscfyishctwfXn0xOY6oWOSNYxpyqW6qr5uJcCgB0K3Ck0XWBBDiu5uWhFghtvnGgP4/j0etXzevuW0iHjl8Zprd8nnK2QiIElrW9Ck/0Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OZjoCjCV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:f52e:2bba:80e9:14d8])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 28C1E281C;
	Thu, 29 Jan 2026 12:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769686967;
	bh=+Vp+WqODTAaIKelMntc3l329Z299faZuEWgOPeC848I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OZjoCjCVnaZUBGKrrFlZvtp2TcFPMjZvvIOTQx3pCpeapD4I6rNRM23WTR2rE3gnY
	 pRnamynHmOq0xDT8VZ8khVHzSytDQG7wzfNZ3ofpSIYV6p9uFg4BoWwO2/N3oLEar+
	 BuzIXJQ3IBgcRCVhH0+iU9sSQ1JRB+Jxm4Zqjw8A=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Thu, 29 Jan 2026 12:43:13 +0100
Subject: [PATCH v3 4/4] media: dw100: Merge dw100_device_run and
 dw100_start
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-4-2eb5685eaf09@ideasonboard.com>
References: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-0-2eb5685eaf09@ideasonboard.com>
In-Reply-To: <20260129-sklug-v6-16-topic-dw100-v3-1-dev-v3-0-2eb5685eaf09@ideasonboard.com>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-51780-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: 381A4AFC08
X-Rspamd-Action: no action

The dw100_start() function is only called from dw100_device_run(). As
both functions are not too big, move the code directly into
dw100_device_run() and drop dw100_start() to improve readability.

This patch contains no functional changes.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

---

Changes in v3:
- Added this patch as proposed in the review of v1
---
 drivers/media/platform/nxp/dw100/dw100.c | 61 ++++++++++++++------------------
 1 file changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 46e3a7b74fb777aa479110a52229f36b8632db44..c7c4249f5769467fb2b1f3c87f5685c4463a0a9d 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1442,25 +1442,42 @@ static irqreturn_t dw100_irq_thread_fn(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
-			struct vb2_v4l2_buffer *out_vb)
+static void dw100_device_run(void *priv)
 {
+	struct dw100_ctx *ctx = priv;
 	struct dw100_device *dw_dev = ctx->dw_dev;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 
-	out_vb->sequence =
-		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)->sequence++;
-	in_vb->sequence =
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
+				&ctx->hdl);
+
+	if (src_buf->vb2_buf.req_obj.req)
+		dw100_update_mapping(ctx);
+	else if (ctx->user_map_is_dirty)
+		dev_warn_once(&dw_dev->pdev->dev,
+			      "V4L2 requests are required to update the vertex map dynamically"
+		);
+
+	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+				   &ctx->hdl);
+
+	src_buf->sequence =
 		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)->sequence++;
+	dst_buf->sequence =
+		dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)->sequence++;
 
-	dev_dbg(&ctx->dw_dev->pdev->dev,
+	dev_dbg(&dw_dev->pdev->dev,
 		"Starting queues %p->%p, sequence %u->%u\n",
 		v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE),
 		v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
-		in_vb->sequence, out_vb->sequence);
+		src_buf->sequence, dst_buf->sequence);
 
-	v4l2_m2m_buf_copy_metadata(in_vb, out_vb);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
 
 	/* Now, let's deal with hardware ... */
 	dw100_hw_master_bus_disable(dw_dev);
@@ -1469,10 +1486,10 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	dw100_hw_set_src_crop(dw_dev, &ctx->q_data[DW100_QUEUE_SRC],
 			      &ctx->q_data[DW100_QUEUE_DST]);
 	dw100_hw_set_source(dw_dev, &ctx->q_data[DW100_QUEUE_SRC],
-			    &in_vb->vb2_buf);
+			    &src_buf->vb2_buf);
 	dw100_hw_set_destination(dw_dev, &ctx->q_data[DW100_QUEUE_DST],
 				 ctx->q_data[DW100_QUEUE_SRC].fmt,
-				 &out_vb->vb2_buf);
+				 &dst_buf->vb2_buf);
 	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
 			     ctx->map_width, ctx->map_height);
 	dw100_hw_enable_irq(dw_dev);
@@ -1482,30 +1499,6 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	dw100_hw_master_bus_enable(dw_dev);
 }
 
-static void dw100_device_run(void *priv)
-{
-	struct dw100_ctx *ctx = priv;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-
-	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
-
-	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
-				&ctx->hdl);
-
-	if (src_buf->vb2_buf.req_obj.req)
-		dw100_update_mapping(ctx);
-	else if (ctx->user_map_is_dirty)
-		dev_warn_once(&ctx->dw_dev->pdev->dev,
-			      "V4L2 requests are required to update the vertex map dynamically"
-		);
-
-	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
-				   &ctx->hdl);
-
-	dw100_start(ctx, src_buf, dst_buf);
-}
-
 static const struct v4l2_m2m_ops dw100_m2m_ops = {
 	.device_run	= dw100_device_run,
 };

-- 
2.51.0


