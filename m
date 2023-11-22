Return-Path: <linux-media+bounces-707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D51837F3CE2
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A2F2818D2
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F8F15AD4;
	Wed, 22 Nov 2023 04:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AwWZuUFs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBEDD50;
	Tue, 21 Nov 2023 20:30:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D738818A1;
	Wed, 22 Nov 2023 05:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627392;
	bh=Wipr7e5z/Db423Vn+uvte9e7cOfXqTShBL4QMVgQdsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AwWZuUFsooMqsn055RkD+2QgwudnCIeXccbVnHNs6GGI5yH4kpxtI+8BTE51QkLN9
	 zNfP/oWfG3Q6s06+vrBYDpq3/6aTPWRoUB9+ci1fmr0DjNYQoGqtGB4PZtpnO4tbhk
	 ekOD5YGQAwfo5PqVj78m6U3vFsAdN4fBMVp2wN3Q=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 14/19] media: renesas: vsp1: Get configuration from partition instead of state
Date: Wed, 22 Nov 2023 06:30:04 +0200
Message-ID: <20231122043009.2741-15-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Entities access various piece of information from the entity state when
configuring a partition. The same data is available through the
partition structure passed to the .configure_partition() operation. Use
it to avoid accessing the state, which will simplify moving to the V4L2
subdev active state API.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_rpf.c    | 35 +++++++++----------
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  6 +---
 .../media/platform/renesas/vsp1/vsp1_wpf.c    | 18 +++-------
 3 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 862751616646..b4558670b46f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -289,7 +289,7 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
 	struct vsp1_device *vsp1 = rpf->entity.vsp1;
 	const struct vsp1_format_info *fmtinfo = rpf->fmtinfo;
 	const struct v4l2_pix_format_mplane *format = &rpf->format;
-	struct v4l2_rect crop;
+	struct v4l2_rect crop = partition->rpf[rpf->entity.index];
 
 	/*
 	 * Source size and crop offsets.
@@ -299,22 +299,6 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
 	 * offsets are needed, as planes 2 and 3 always have identical
 	 * strides.
 	 */
-	crop = *v4l2_subdev_state_get_crop(rpf->entity.state, RWPF_PAD_SINK);
-
-	/*
-	 * Partition Algorithm Control
-	 *
-	 * The partition algorithm can split this frame into multiple
-	 * slices. We must scale our partition window based on the pipe
-	 * configuration to match the destination partition window.
-	 * To achieve this, we adjust our crop to provide a 'sub-crop'
-	 * matching the expected partition window. Only 'left' and
-	 * 'width' need to be adjusted.
-	 */
-	if (pipe->partitions > 1) {
-		crop.width = partition->rpf[rpf->entity.index].width;
-		crop.left += partition->rpf[rpf->entity.index].left;
-	}
 
 	if (pipe->interlaced) {
 		crop.height = round_down(crop.height / 2, fmtinfo->vsub);
@@ -369,8 +353,23 @@ static void rpf_partition(struct vsp1_entity *entity,
 			  struct v4l2_rect *window)
 {
 	struct vsp1_rwpf *rpf = to_rwpf(&entity->subdev);
+	struct v4l2_rect *rpf_rect = &partition->rpf[rpf->entity.index];
 
-	partition->rpf[rpf->entity.index] = *window;
+	/*
+	 * Partition Algorithm Control
+	 *
+	 * The partition algorithm can split this frame into multiple slices. We
+	 * must adjust our partition window based on the pipe configuration to
+	 * match the destination partition window. To achieve this, we adjust
+	 * our crop to provide a 'sub-crop' matching the expected partition
+	 * window.
+	 */
+	*rpf_rect = *v4l2_subdev_state_get_crop(entity->state, RWPF_PAD_SINK);
+
+	if (pipe->partitions > 1) {
+		rpf_rect->width = window->width;
+		rpf_rect->left += window->left;
+	}
 }
 
 static const struct vsp1_entity_operations rpf_entity_ops = {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index 4a14fd3baac1..e5953d86c17c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -305,10 +305,6 @@ static void uds_configure_partition(struct vsp1_entity *entity,
 				    struct vsp1_dl_body *dlb)
 {
 	struct vsp1_uds *uds = to_uds(&entity->subdev);
-	const struct v4l2_mbus_framefmt *output;
-
-	output = v4l2_subdev_state_get_format(uds->entity.state,
-					      UDS_PAD_SOURCE);
 
 	/* Input size clipping. */
 	vsp1_uds_write(uds, dlb, VI6_UDS_HSZCLIP, VI6_UDS_HSZCLIP_HCEN |
@@ -320,7 +316,7 @@ static void uds_configure_partition(struct vsp1_entity *entity,
 	vsp1_uds_write(uds, dlb, VI6_UDS_CLIP_SIZE,
 		       (partition->uds_source.width
 				<< VI6_UDS_CLIP_SIZE_HSIZE_SHIFT) |
-		       (output->height
+		       (partition->uds_source.height
 				<< VI6_UDS_CLIP_SIZE_VSIZE_SHIFT));
 }
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index f8d1e2f47691..5c363ff1d36c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -370,7 +370,6 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
 	struct vsp1_rwpf *wpf = to_rwpf(&entity->subdev);
 	struct vsp1_device *vsp1 = wpf->entity.vsp1;
 	struct vsp1_rwpf_memory mem = wpf->mem;
-	const struct v4l2_mbus_framefmt *sink_format;
 	const struct v4l2_pix_format_mplane *format = &wpf->format;
 	const struct vsp1_format_info *fmtinfo = wpf->fmtinfo;
 	unsigned int width;
@@ -380,20 +379,13 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
 	unsigned int flip;
 	unsigned int i;
 
-	sink_format = v4l2_subdev_state_get_format(wpf->entity.state,
-						   RWPF_PAD_SINK);
-	width = sink_format->width;
-	height = sink_format->height;
-	left = 0;
-
 	/*
-	 * Cropping. The partition algorithm can split the image into
-	 * multiple slices.
+	 * Cropping. The partition algorithm can split the image into multiple
+	 * slices.
 	 */
-	if (pipe->partitions > 1) {
-		width = partition->wpf.width;
-		left = partition->wpf.left;
-	}
+	width = partition->wpf.width;
+	left = partition->wpf.left;
+	height = partition->wpf.height;
 
 	vsp1_wpf_write(wpf, dlb, VI6_WPF_HSZCLIP, VI6_WPF_SZCLIP_EN |
 		       (0 << VI6_WPF_SZCLIP_OFST_SHIFT) |
-- 
Regards,

Laurent Pinchart


