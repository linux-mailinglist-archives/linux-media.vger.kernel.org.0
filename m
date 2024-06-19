Return-Path: <linux-media+bounces-13636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C543590E0A6
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7F51C21499
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A153B645;
	Wed, 19 Jun 2024 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vjrMHTqP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C15EDB;
	Wed, 19 Jun 2024 00:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756291; cv=none; b=ShYgHAkN9FcpT6y7y4OicgYotNVZycAcpNoo0hpieuBrTI+zkP9IEpTS1buioZUFgAIcTor3XLeVknX1RKWPZMlKpfXT4vE/SWDhI72f9Mv1H52gsIIl0cBs4ucz9nFCT2I3WrTzigc3W/63w5b3H9PwHGLLnThotKEQuDET/hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756291; c=relaxed/simple;
	bh=FOC7HJ7K2/VzbgFzKbB6unqDhu8Yz8zpJVkDTpcXW48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmD5CZ2ItZ5BTfcVuncG6JHjOYiKGJw0N64NqO6yi4uNRJBFRC2/iDmr3PAf5vsCUbY0vL6cEwQ7ch1J5Tw0gZVLVqVAjqB7UG8StpYDyhZuKbqm7vgLHsPlvF2DeXYbeVFZJEUR/xBWagNyES3zJfPY7fWXFSSBTjddAUlE6Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vjrMHTqP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA7571011;
	Wed, 19 Jun 2024 02:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756266;
	bh=FOC7HJ7K2/VzbgFzKbB6unqDhu8Yz8zpJVkDTpcXW48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vjrMHTqPeIjhB6ZbJXsLZq4A+GnkV2PkIZq3L694l25hyM6uhprZ/RHMhRWj6hTvG
	 YdVq2LgZbeEq9xhVFa4GXV3LjOWGF0Z2uu2/HkWdbZU2OKNwFu2hfHbohEFGvJlpTO
	 UzEy9/E3kfwB/JHaPiTpi8yWPoy7F1pNR6SRPMAU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 14/19] media: renesas: vsp1: Get configuration from partition instead of state
Date: Wed, 19 Jun 2024 03:17:17 +0300
Message-ID: <20240619001722.9749-15-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Entities access various piece of information from the subdev state when
configuring a partition. The same data is available through the
partition structure passed to the .configure_partition() operation. Use
it to avoid accessing the state, which will simplify moving to the V4L2
subdev active state API.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
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


