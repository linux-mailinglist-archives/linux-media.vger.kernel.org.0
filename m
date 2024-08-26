Return-Path: <linux-media+bounces-16805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9295F1B5
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6688281F8A
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D45A18D648;
	Mon, 26 Aug 2024 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PolcWDec"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA2B18D63F;
	Mon, 26 Aug 2024 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676085; cv=none; b=ViHf/DAq2Q9aU6LpCBSQDVbwVVrh6lZ8FPC+QaPvnkaD3bKcN5xl0C+mHTADLL5QyQSq2OwjMxDqhLdmdO7AB7VBxw3QQ9VYqe2y1NJLKX+a6fOOX9zG81JA6ttyenZwK3pVoaG3wnXv0E01SHhnu/MRDDuv4/nv2LA5x/C4Qc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676085; c=relaxed/simple;
	bh=pC31TMBm1LuxpurY7zo/QNQuPEpRlxOKUDSCCF/EcTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckkMYr9YzrDrf0WdRUFb3jtTGbhcgJ/kAhonCCt56EF7tg67G1REzUWpcmE6/3pj6x0ZtKHCGeiP5RRaAVs9rUIk122rsGSM+I6u4G7hCLKXVXZQTxkUKqkz8qKsTvAJ7s7IcIdHIg7jVsKuveBBn6aTSH8IFGaT3TLr8XC7/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PolcWDec; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2312B741;
	Mon, 26 Aug 2024 14:40:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724676015;
	bh=pC31TMBm1LuxpurY7zo/QNQuPEpRlxOKUDSCCF/EcTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PolcWDecwpJ7RLmXdYEUtUYefnM2ZnokhL76Z5KatwZQy9HVXnqqVGY7fjW3stgJo
	 RZ65ob3+0gXPv0H7lhVdbT+XZxaAR1cGh7Y/utqGx8Hk+8Ou7qjDd0BLM5aJlmlWwd
	 PsBCLl0qhJ4ysnirDigO415IzHErXbuJzVvMlhfQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 7/7] [DNI] media: renesas: vsp1: Validate all links through .link_validate()
Date: Mon, 26 Aug 2024 15:41:06 +0300
Message-ID: <20240826124106.3823-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move validation of the links between video devices and subdevs,
performed manually in vsp1_video_streamon(), to the video device
.link_validate() handler.

This is how drivers should be implemented, but sadly, doing so for the
vsp1 driver could break userspace, introducing a regression. This patch
serves as an example to showcase usage of the .link_validate()
operation, but should not be merged.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_video.c  | 98 +++++++------------
 1 file changed, 37 insertions(+), 61 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index e728f9f5160e..14575698bbe7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -45,51 +45,6 @@
  * Helper functions
  */
 
-static struct v4l2_subdev *
-vsp1_video_remote_subdev(struct media_pad *local, u32 *pad)
-{
-	struct media_pad *remote;
-
-	remote = media_pad_remote_pad_first(local);
-	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
-		return NULL;
-
-	if (pad)
-		*pad = remote->index;
-
-	return media_entity_to_v4l2_subdev(remote->entity);
-}
-
-static int vsp1_video_verify_format(struct vsp1_video *video)
-{
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct v4l2_subdev *subdev;
-	int ret;
-
-	subdev = vsp1_video_remote_subdev(&video->pad, &fmt.pad);
-	if (subdev == NULL)
-		return -EINVAL;
-
-	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
-	if (ret < 0)
-		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
-
-	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
-	    video->rwpf->format.height != fmt.format.height ||
-	    video->rwpf->format.width != fmt.format.width) {
-		dev_dbg(video->vsp1->dev,
-			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
-			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
-			video->rwpf->format.height, fmt.format.code,
-			fmt.format.width, fmt.format.height);
-		return -EPIPE;
-	}
-
-	return 0;
-}
-
 static int __vsp1_video_try_format(struct vsp1_video *video,
 				   struct v4l2_pix_format_mplane *pix,
 				   const struct vsp1_format_info **fmtinfo)
@@ -991,14 +946,6 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 
 	mutex_unlock(&mdev->graph_mutex);
 
-	/*
-	 * Verify that the configured format matches the output of the connected
-	 * subdev.
-	 */
-	ret = vsp1_video_verify_format(video);
-	if (ret < 0)
-		goto err_stop;
-
 	/* Start the queue. */
 	ret = vb2_streamon(&video->queue, type);
 	if (ret < 0)
@@ -1087,14 +1034,43 @@ static const struct v4l2_file_operations vsp1_video_fops = {
 
 static int vsp1_video_link_validate(struct media_link *link)
 {
-	/*
-	 * Ideally, link validation should be implemented here instead of
-	 * calling vsp1_video_verify_format() in vsp1_video_streamon()
-	 * manually. That would however break userspace that start one video
-	 * device before configures formats on other video devices in the
-	 * pipeline. This operation is just a no-op to silence the warnings
-	 * from v4l2_subdev_link_validate().
-	 */
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev *subdev;
+	struct media_entity *entity;
+	struct media_pad *remote;
+	struct vsp1_video *video;
+	int ret;
+
+	if (is_media_entity_v4l2_video_device(link->source->entity)) {
+		entity = link->source->entity;
+		remote = link->sink;
+	} else {
+		entity = link->sink->entity;
+		remote = link->source;
+	}
+
+	fmt.pad = remote->index;
+
+	subdev = media_entity_to_v4l2_subdev(remote->entity);
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
+
+	video = to_vsp1_video(media_entity_to_video_device(entity));
+
+	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
+	    video->rwpf->format.height != fmt.format.height ||
+	    video->rwpf->format.width != fmt.format.width) {
+		dev_dbg(video->vsp1->dev,
+			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
+			video->rwpf->format.height, fmt.format.code,
+			fmt.format.width, fmt.format.height);
+		return -EPIPE;
+	}
+
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart


