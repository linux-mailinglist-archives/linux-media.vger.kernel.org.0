Return-Path: <linux-media+bounces-13649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E543190E149
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 03:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81C2728408E
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 01:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F75125B2;
	Wed, 19 Jun 2024 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="chLkp+bp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF286FB8;
	Wed, 19 Jun 2024 01:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760272; cv=none; b=n+TS/ezjwvHTw75BUmnd2TvIbv3rq8R5ts9iqHi7FG8goN8YNyhaEDdhGigylVBu+6sL9mm4fFILQIfKgY9mRsmgBDDQ/NR+Tx1JWqTgFYeRj6Kxzb54bvoj+rKKQVIfALoXDOIyTFeqlnSg2imwFloLOie5lmyjfzgGQrU2vhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760272; c=relaxed/simple;
	bh=urL8luN8cOSRyuyB24bVfFlprB0iZWyVX1WCfEWmGUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jf3sUZYaIwppYdU/GlWL7wiZ0WkwXwFeyZFml5tbsBdoVwp2BhO99XnwVZt6nXYs8D6dXVJzWQ53xzn5t+wFVDiTfyy1PgXccxmMWZjMDZmo1j3GCw/vJ9vDuikjZdvf+hruvqQPYdLf3F+D+dthrr7Lt1NquLKMGB27kqCwukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=chLkp+bp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6276F1254;
	Wed, 19 Jun 2024 03:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760250;
	bh=urL8luN8cOSRyuyB24bVfFlprB0iZWyVX1WCfEWmGUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=chLkp+bp8AegfzWymPhfy7cUXfuHGAx31Vkk/WM2RfYQ3Nfiig5j0ylDn9xbrveMq
	 wnSJXHEfAIPfJSA32hf6oncKVkROa9Xkk9ksZPUTOEhfkRu+QJHL447xGLGJn/+pHj
	 JZoNhCkASf6XlkEyCadVj6sFEUOr4oNkh4D6uQ+U=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 7/8] media: renesas: vsp1: Implement .link_validate() for video devices
Date: Wed, 19 Jun 2024 04:23:55 +0300
Message-ID: <20240619012356.22685-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_link_validate() helper prints a warning if the
.link_validate() operation is not implemented for video devices
connected to the subdevs. Implement the operation to silence the
warning.

Ideally validation of the link between the video device and the subdev
should be implemented in that operation. That would however break
userspace that does not configure formats on all video devices before
starting streaming. While this mode of operation may not be considered
valid by the V4L2 API specification (interpretation differ), it is
nonetheless supported by the vsp1 driver at the moment and used by at
least the vsp1 unit test suite, and possibly other userspace
applciations. Removing it would be a regression.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_video.c  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index d6f2739456bf..88806eddc839 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1151,6 +1151,27 @@ static const struct v4l2_file_operations vsp1_video_fops = {
 	.mmap = vb2_fop_mmap,
 };
 
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static int vsp1_video_link_validate(struct media_link *link)
+{
+	/*
+	 * Ideally, link validation should be implemented here instead of
+	 * calling vsp1_video_verify_format() in vsp1_video_streamon()
+	 * manually. That would however break userspace that start one video
+	 * device before configures formats on other video devices in the
+	 * pipeline. This operation is just a no-op to silence the warnings
+	 * from v4l2_subdev_link_validate().
+	 */
+	return 0;
+}
+
+static const struct media_entity_operations vsp1_video_media_ops = {
+	.link_validate = vsp1_video_link_validate,
+};
+
 /* -----------------------------------------------------------------------------
  * Suspend and Resume
  */
@@ -1285,6 +1306,7 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 
 	/* ... and the video node... */
 	video->video.v4l2_dev = &video->vsp1->v4l2_dev;
+	video->video.entity.ops = &vsp1_video_media_ops;
 	video->video.fops = &vsp1_video_fops;
 	snprintf(video->video.name, sizeof(video->video.name), "%s %s",
 		 rwpf->entity.subdev.name, direction);
-- 
Regards,

Laurent Pinchart


