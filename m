Return-Path: <linux-media+bounces-49901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF6CF3502
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 12:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC7123087908
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 11:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B2F3191DF;
	Mon,  5 Jan 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X+GLWobW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA35330B13;
	Mon,  5 Jan 2026 11:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612994; cv=none; b=XbQhTVaLRAG4QPq7rMfj2nJ3enwFDLnERkMgbgmBNQdmUB9jOTh9TAqrKZX0ZOh2X0OgrI+KwPJc7UJrnTNxG0mEDh416E6d6yuPp+33kCOZpTg+R4cdYlVpRHAMAXX8x7f/P2qt8EGNJWbupmdTekWugZJHZUMSL4DTaYaMLWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612994; c=relaxed/simple;
	bh=jvlIXbtNSexvmkwwE43H+b1KKz+iJP/Yh8FvkvEyob8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DnEb7GNXZ1xxOeBarhtcmAEO4YyfwSNd9nhnIjSVylOm1j51MBSOmpfQ9TCZX5SmAO1tNX3d5Tiw/GySBriQftM6QwaqkAF3cu0fYyqnH+TK/zi+ZIGOXDpXO04vGXGGxU3TBGvV/144/PjGJQMsNNNodgqe0KSzbmxYMA1gp2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X+GLWobW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c12b:c5c7:ad08:9cf2])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9DC81FDB;
	Mon,  5 Jan 2026 12:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767612970;
	bh=jvlIXbtNSexvmkwwE43H+b1KKz+iJP/Yh8FvkvEyob8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X+GLWobWa93GjXVh88tvAGi7XjZapig38gOcmD5sC9cC8Er9kKGhD0wntYZvRCHcr
	 aEN4sPPdNhP0mG+JRbEbPbaOTpqS3QEbaC/jn5EzvqgT7+HnPd63FiPV2xkkfFJjcx
	 dMGrvCw8x1LMSQ7PP1furd0FhIlFLmU/43CjFmN4=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Mon, 05 Jan 2026 12:35:54 +0100
Subject: [PATCH 2/4] media: dw100: Implement dynamic vertex map update
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com>
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

Implement dynamic vertex map updates by handling the
V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming. This
allows to implement features like dynamic zoom, pan, rotate and dewarp.

To stay compatible with the old version, updates of
V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during streaming
when requests are not used. Print a corresponding warning once.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/nxp/dw100/dw100.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 7f14b82c15a071605c124dbb868f8003856c4fc0..8a421059a1c9b55f514a29d3c2c5a6ffb76e0a64 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -98,6 +98,8 @@ struct dw100_ctx {
 	unsigned int			map_width;
 	unsigned int			map_height;
 	bool				user_map_is_set;
+	bool				user_map_needs_update;
+	bool				warned_dynamic_update;
 
 	/* Source and destination queue data */
 	struct dw100_q_data		q_data[2];
@@ -293,11 +295,15 @@ static u32 dw100_map_format_coordinates(u16 xq, u16 yq)
 	return (u32)((yq << 16) | xq);
 }
 
-static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
+static void dw100_update_mapping(struct dw100_ctx *ctx)
 {
 	struct v4l2_ctrl *ctrl = ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
 
-	return ctrl->p_cur.p_u32;
+	if (!ctx->user_map_needs_update)
+		return;
+
+	memcpy(ctx->map, ctrl->p_cur.p_u32, ctx->map_size);
+	ctx->user_map_needs_update = false;
 }
 
 /*
@@ -306,8 +312,6 @@ static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
  */
 static int dw100_create_mapping(struct dw100_ctx *ctx)
 {
-	u32 *user_map;
-
 	if (ctx->map)
 		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
 				  ctx->map, ctx->map_dma);
@@ -318,8 +322,8 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
 	if (!ctx->map)
 		return -ENOMEM;
 
-	user_map = dw100_get_user_map(ctx);
-	memcpy(ctx->map, user_map, ctx->map_size);
+	ctx->user_map_needs_update = true;
+	dw100_update_mapping(ctx);
 
 	dev_dbg(&ctx->dw_dev->pdev->dev,
 		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
@@ -351,6 +355,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
 		ctx->user_map_is_set = true;
+		ctx->user_map_needs_update = true;
 		break;
 	}
 
@@ -405,6 +410,7 @@ static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
 	}
 
 	ctx->user_map_is_set = false;
+	ctx->user_map_needs_update = true;
 }
 
 static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops = {
@@ -1482,6 +1488,15 @@ static void dw100_device_run(void *priv)
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->hdl);
 
+	if (src_buf->vb2_buf.req_obj.req) {
+		dw100_update_mapping(ctx);
+	} else if (ctx->user_map_needs_update && !ctx->warned_dynamic_update) {
+		ctx->warned_dynamic_update = true;
+		dev_warn(&ctx->dw_dev->pdev->dev,
+			"V4L2 requests are required to update the vertex map dynamically"
+		);
+	}
+
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
 				   &ctx->hdl);
 

-- 
2.51.0


