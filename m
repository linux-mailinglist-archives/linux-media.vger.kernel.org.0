Return-Path: <linux-media+bounces-54497-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNbSB0pWqGlutQAAu9opvQ
	(envelope-from <linux-media+bounces-54497-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 16:56:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBB203718
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 16:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F039305C91E
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 15:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87C335C182;
	Wed,  4 Mar 2026 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r2dT4Zv0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15A035B63A;
	Wed,  4 Mar 2026 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639440; cv=none; b=D+rIEKZrhz6eW4XhOGXLsRyg9SX3O2mOG4NLqPGBXfBcHLG/flvjrc1p4AhMUNKa/lRmw9JX4MUmQSun9e+UXUlTCpbhQZo0rXR+i0f+UC9q4+bYnbSjeNNuoljNkfK2wOmG3M6WioHzw/j0tCA39s+gNgXwLUnjdwrKM7ZzNuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639440; c=relaxed/simple;
	bh=8jOMhp1Rdfr4f4VsHXn5BTMwdklTWcTSp3nBz/NtR7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWGwHWz34c4+gxjxdF/jN35E7QZGYiZralGQsrT8yvgsBtDPWAJW0fHimitBVesMdxcT+cXqq/5rD+f3fbA2yd4ivUOZ4CeDklw1/cRlW+w6iI1h2F+btZP/4b8WVHfNTxqd7l/+x7W0/x5cnDOXFclOWvgbp3iaBL7FWyIs9Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r2dT4Zv0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:404d:d4e8:ffdc:3995])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DF822DA4;
	Wed,  4 Mar 2026 16:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772639370;
	bh=8jOMhp1Rdfr4f4VsHXn5BTMwdklTWcTSp3nBz/NtR7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r2dT4Zv0mtsLOliUTzUdFIpe6TDUjXcveOk5Bz9FV/gaxN4Jk8r92pL/oxzrQu7d1
	 dqp9RMzSgUYy4LwKq2YjPJK8L1+6OU2e1EIJlNcAmm5YlE8G1H8BiuK3GzMXCIhU1n
	 AIb/pm/Xv2UVcgbttcvVauaCFX0rl2iSYoDAdutE=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Wed, 04 Mar 2026 16:50:23 +0100
Subject: [PATCH v5 2/4] media: dw100: Implement dynamic vertex map update
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-sklug-v6-16-topic-dw100-v3-1-dev-v5-2-1a7e1f721b50@ideasonboard.com>
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
X-Rspamd-Queue-Id: 42DBB203718
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54497-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Implement dynamic vertex map updates by handling the
V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. This
allows to implement features like dynamic zoom, pan, rotate and dewarp.

To stay compatible with the old version, updates of
V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streaming
when requests are not used. Print a corresponding warning once.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---

Changes in v4:
- Added missing newline at end of warning message
- Fixed position of closing parenthesis
- Collected tag

Changes in v2:
- Replaced the manual warn once by dev_warn_once(). This changes the
  frequency from once per context to once per boot which was agreed to
  be enough.
- Renamed user_map_needs_update to user_map_is_dirty as it is more
  expressive and fits to user_map_is_set
- Fixed indentation issue found by Media CI
---
 drivers/media/platform/nxp/dw100/dw100.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 17c8aa87a162e5b199b8e9a2c00d6cb346c5bf89..69d469944536f62af22d6fc532afdcf669afe4be 100644
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
@@ -1476,6 +1481,12 @@ static void dw100_device_run(void *priv)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->hdl);
 
+	if (src_buf->vb2_buf.req_obj.req)
+		dw100_update_mapping(ctx);
+	else if (ctx->user_map_is_dirty)
+		dev_warn_once(&ctx->dw_dev->pdev->dev,
+			      "V4L2 requests are required to update the vertex map dynamically\n");
+
 	/*
 	 * As the hardware does not update any volatile controls, we can
 	 * complete control handling before starting the dewarper.

-- 
2.51.0


