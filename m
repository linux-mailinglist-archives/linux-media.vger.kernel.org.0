Return-Path: <linux-media+bounces-20015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D709A99D0
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 467611F22877
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 06:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D59013D508;
	Tue, 22 Oct 2024 06:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VT/L9C4L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24BF126C02
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578726; cv=none; b=PP8AVd6CdV2nOx/Viq4/6a2I53Wsy9j9XNmyVtdRiUBEiKn0cB0njaznytu55YVrtu3EXIByDDgTy+fvvr1QtQQTIjQgZfH2UNsmf49adBvxslaXsXNcenp1yQxv0PUkdyWzsWxs23n3m4fXsFVh1xiyAmeYglH7lY5/95HJT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578726; c=relaxed/simple;
	bh=Tg7kAzwh2SDUVAh3RzhTJpOm0i29EwxDVAzPVozzSyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vB9DUtq527bvaoiKG1XHsQhEoNC/en+bjZwE0uqSdHFzAn6QmxKFmNqdG+cOSn4c5Xln1xFMgXV9jEpo2anpCStXwN0964YFDCReZpHry+XaiZU/dirq1GMyJXhdU7HRopbnSBG3wZCvA1nEbKKW5PVyLbjzcaJWtw1Pz5BWddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VT/L9C4L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02C8A49E;
	Tue, 22 Oct 2024 08:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729578616;
	bh=Tg7kAzwh2SDUVAh3RzhTJpOm0i29EwxDVAzPVozzSyk=;
	h=From:To:Cc:Subject:Date:From;
	b=VT/L9C4LLqHLekCob9hE4y7CixljaDM+UbmMGtfCPGiB0dabGxryd0yYDqA9Yv+DG
	 GWA8+hjLQR9F9EPDoavOH18iRinzAt7+5elrKMkqs26YJLBJiUdalXeMA99jwz1Dio
	 9U//q9qr09XwCQNXauqqfT8jd+F1P8LrSVwLNSPA=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: dw100: Enable dynamic vertex map
Date: Tue, 22 Oct 2024 12:01:55 +0530
Message-ID: <20241022063155.506191-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, vertex maps cannot be updated dynamically while dw100
is streaming. This patch enables the support to update the vertex
map dynamically at runtime.

To support this functionality, we need to allocate and track two
sets of DMA-allocated vertex maps, one for the currently applied map
and another for the updated (pending) map. Before the start of next
frame, if a new user-supplied vertex map is available, the hardware
mapping is changed to use new vertex map, thus enabling the user to
update the vertex map at runtime.

We should ensure no race occurs when the vertex map is updated multiple
times when a frame is processing. Hence, vertex map is never updated to
the applied vertex map index in .s_ctrl(). It is always updated on the
pending vertex map slot, with `maps_mutex` lock held. `maps_mutex` lock
is also held when the pending vertex map is applied to the hardware in
dw100_start().

Ability to update the vertex map at runtime, enables abritrary rotation
and digital zoom features for the input frames, through the dw100
hardware.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/platform/nxp/dw100/dw100.c | 73 ++++++++++++++++++------
 1 file changed, 56 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 54ebf59df682..42712ccff754 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -83,6 +83,11 @@ struct dw100_q_data {
 	struct v4l2_rect		crop;
 };
 
+struct dw100_map {
+	unsigned int *map;
+	dma_addr_t map_dma;
+};
+
 struct dw100_ctx {
 	struct v4l2_fh			fh;
 	struct dw100_device		*dw_dev;
@@ -92,12 +97,14 @@ struct dw100_ctx {
 	struct mutex			vq_mutex;
 
 	/* Look Up Table for pixel remapping */
-	unsigned int			*map;
-	dma_addr_t			map_dma;
+	struct dw100_map		maps[2];
+	unsigned int			applied_map_id;
 	size_t				map_size;
 	unsigned int			map_width;
 	unsigned int			map_height;
 	bool				user_map_is_set;
+	bool				user_map_is_updated;
+	struct mutex			maps_mutex;
 
 	/* Source and destination queue data */
 	struct dw100_q_data		q_data[2];
@@ -308,24 +315,31 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
 {
 	u32 *user_map;
 
-	if (ctx->map)
-		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
-				  ctx->map, ctx->map_dma);
+	for (unsigned int i = 0; i < 2; i++) {
+		if (ctx->maps[i].map)
+			dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
+					  ctx->maps[i].map, ctx->maps[i].map_dma);
 
-	ctx->map = dma_alloc_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
-				      &ctx->map_dma, GFP_KERNEL);
+		ctx->maps[i].map = dma_alloc_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
+						      &ctx->maps[i].map_dma, GFP_KERNEL);
 
-	if (!ctx->map)
-		return -ENOMEM;
+		if (!ctx->maps[i].map)
+			return -ENOMEM;
+	}
 
 	user_map = dw100_get_user_map(ctx);
-	memcpy(ctx->map, user_map, ctx->map_size);
+
+	mutex_lock(&ctx->maps_mutex);
+	ctx->applied_map_id = 0;
+	memcpy(ctx->maps[ctx->applied_map_id].map, user_map, ctx->map_size);
+	mutex_unlock(&ctx->maps_mutex);
 
 	dev_dbg(&ctx->dw_dev->pdev->dev,
 		"%ux%u %s mapping created (d:%pad-c:%p) for stream %ux%u->%ux%u\n",
 		ctx->map_width, ctx->map_height,
 		ctx->user_map_is_set ? "user" : "identity",
-		&ctx->map_dma, ctx->map,
+		&ctx->maps[ctx->applied_map_id].map_dma,
+		ctx->maps[ctx->applied_map_id].map,
 		ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width,
 		ctx->q_data[DW100_QUEUE_DST].pix_fmt.height,
 		ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width,
@@ -336,10 +350,12 @@ static int dw100_create_mapping(struct dw100_ctx *ctx)
 
 static void dw100_destroy_mapping(struct dw100_ctx *ctx)
 {
-	if (ctx->map) {
-		dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
-				  ctx->map, ctx->map_dma);
-		ctx->map = NULL;
+	for (unsigned int i = 0; i < 2; i++) {
+		if (ctx->maps[i].map)
+			dma_free_coherent(&ctx->dw_dev->pdev->dev, ctx->map_size,
+					  ctx->maps[i].map, ctx->maps[i].map_dma);
+
+		ctx->maps[i].map = NULL;
 	}
 }
 
@@ -350,6 +366,15 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
+		u32 *user_map = ctrl->p_new.p_u32;
+		unsigned int id;
+
+		mutex_lock(&ctx->maps_mutex);
+		id = ctx->applied_map_id ? 0 : 1;
+		memcpy(ctx->maps[id].map, user_map, ctx->map_size);
+		ctx->user_map_is_updated = true;
+		mutex_unlock(&ctx->maps_mutex);
+
 		ctx->user_map_is_set = true;
 		break;
 	}
@@ -655,6 +680,8 @@ static int dw100_open(struct file *file)
 
 	v4l2_fh_add(&ctx->fh);
 
+	mutex_init(&ctx->maps_mutex);
+
 	return 0;
 
 err:
@@ -675,6 +702,7 @@ static int dw100_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mutex_destroy(&ctx->vq_mutex);
+	mutex_destroy(&ctx->maps_mutex);
 	kfree(ctx);
 
 	return 0;
@@ -1453,8 +1481,19 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
 	dw100_hw_set_destination(dw_dev, &ctx->q_data[DW100_QUEUE_DST],
 				 ctx->q_data[DW100_QUEUE_SRC].fmt,
 				 &out_vb->vb2_buf);
-	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
-			     ctx->map_width, ctx->map_height);
+
+
+	mutex_lock(&ctx->maps_mutex);
+	if (ctx->user_map_is_updated) {
+		unsigned int id = ctx->applied_map_id ? 0 : 1;
+
+		dw100_hw_set_mapping(dw_dev, ctx->maps[id].map_dma,
+				     ctx->map_width, ctx->map_height);
+		ctx->applied_map_id = id;
+		ctx->user_map_is_updated = false;
+	}
+	mutex_unlock(&ctx->maps_mutex);
+
 	dw100_hw_enable_irq(dw_dev);
 	dw100_hw_dewarp_start(dw_dev);
 
-- 
2.45.2


