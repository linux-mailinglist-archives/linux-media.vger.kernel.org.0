Return-Path: <linux-media+bounces-51357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABtWJQpEcmnpfAAAu9opvQ
	(envelope-from <linux-media+bounces-51357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:36:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 617BD69001
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ACA10788C75
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 14:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C31434AAF2;
	Thu, 22 Jan 2026 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g4/8OIb+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B7E35B138;
	Thu, 22 Jan 2026 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093108; cv=none; b=A/xVpL3s1LqXSu4JYIHs4FP6vEs1uvJlRRbIf6gbVn1h4JmWO/5It2c1lmirL/nD8XnBGQ6ea3/OBS7xGB1+bsNUAYX/PAwSWa3QPAqyN3Qltl2nIxJkCYzCqwJVk1Xj1Z8SHLYuie70Q8KiOPawu6Hgj43UQFT5d6ofSSnAfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093108; c=relaxed/simple;
	bh=RhUZ81l7yNwwNw6VQzmc+HcVsUJ4nb05ME1YwQaDjNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/xwKWBGQTmmupi354PYBLBPoalOScFn5UZoFjXQDeq4eIYVB3pUF358XqQPJe/NGGgu5mqf1rlRkYoNwOzW3saZHwRlmWZkTVY3oW13NQFy98mcMD3t7bB2Vz2fEvlAldAiCNQzr3XFiTjStFHneIFIYhKOY5nrWady5GtD80M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g4/8OIb+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:bc8e:214:d514:699a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5BB7DA06;
	Thu, 22 Jan 2026 15:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769093072;
	bh=RhUZ81l7yNwwNw6VQzmc+HcVsUJ4nb05ME1YwQaDjNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g4/8OIb+JnhNHC48BsbAeU/zM5QpU2uDbP3wESJSmYEWSVVRBVAt1qZZgFa7y3cJx
	 oe3Rc9mLiHLasEfZauiVUqe0UEhrEhBvfmNnbYKwOU4eW+aRRpfl8qMDKbsgAJ1Gid
	 TvCSKL3kbjQUtdZ05tweOj8Emvw9G1SnHj2Uhsio=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Thu, 22 Jan 2026 15:44:57 +0100
Subject: [PATCH v2 2/3] media: dw100: Implement dynamic vertex map update
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-2-ea1e29f18cf1@ideasonboard.com>
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
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_FROM(0.00)[bounces-51357-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[213.196.21.55:from];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.25.139.140:received,2a00:6020:448c:6c00:bc8e:214:d514:699a:received,213.167.242.64:received];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 617BD69001
X-Rspamd-Action: no action

Implement dynamic vertex map updates by handling the
V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. This
allows to implement features like dynamic zoom, pan, rotate and dewarp.

To stay compatible with the old version, updates of
V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streaming
when requests are not used. Print a corresponding warning once.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

---

Changes in v2:
- Replaced the manual warn once by dev_warn_once(). This changes the
  frequency from once per context to once per boot which was agreed to
  be enough.
- Renamed user_map_needs_update to user_map_is_dirty as it is more
  expressive and fits to user_map_is_set
- Fixed indentation issue found by Media CI
---
 drivers/media/platform/nxp/dw100/dw100.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 1cb895da9912371a2b23ca62412c572d9cb75c00..d2b1c62b52db47ea1d2242caaf334fff30c6f366 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -98,6 +98,7 @@ struct dw100_ctx {
 	unsigned int			map_width;
 	unsigned int			map_height;
 	bool				user_map_is_set;
+	bool				user_map_is_dirty;
 
 	/* Source and destination queue data */
 	struct dw100_q_data		q_data[2];
@@ -293,11 +294,15 @@ static u32 dw100_map_format_coordinates(u16 xq, u16 yq)
 	return (u32)((yq << 16) | xq);
 }
 
-static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
+static void dw100_update_mapping(struct dw100_ctx *ctx)
 {
 	struct v4l2_ctrl *ctrl = ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
 
-	return ctrl->p_cur.p_u32;
+	if (!ctx->user_map_is_dirty)
+		return;
+
+	memcpy(ctx->map, ctrl->p_cur.p_u32, ctx->map_size);
+	ctx->user_map_is_dirty = false;
 }
 
 /*
@@ -306,8 +311,6 @@ static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
  */
 static int dw100_create_mapping(struct dw100_ctx *ctx)
 {
-	u32 *user_map;
-
 	if (ctx->map)
 		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
 				  ctx->map, ctx->map_dma);
@@ -318,8 +321,8 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
 	if (!ctx->map)
 		return -ENOMEM;
 
-	user_map = dw100_get_user_map(ctx);
-	memcpy(ctx->map, user_map, ctx->map_size);
+	ctx->user_map_is_dirty = true;
+	dw100_update_mapping(ctx);
 
 	dev_dbg(&ctx->dw_dev->pdev->dev,
 		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
@@ -351,6 +354,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
 		ctx->user_map_is_set = true;
+		ctx->user_map_is_dirty = true;
 		break;
 	}
 
@@ -405,6 +409,7 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
 	}
 
 	ctx->user_map_is_set = false;
+	ctx->user_map_is_dirty = true;
 }
 
 static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops = {
@@ -1478,6 +1483,13 @@ static void dw100_device_run(void *priv)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->hdl);
 
+	if (src_buf->vb2_buf.req_obj.req)
+		dw100_update_mapping(ctx);
+	else if (ctx->user_map_is_dirty)
+		dev_warn_once(&ctx->dw_dev->pdev->dev,
+			      "V4L2 requests are required to update the vertex map dynamically"
+		);
+
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
 				   &ctx->hdl);
 

-- 
2.51.0


