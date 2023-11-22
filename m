Return-Path: <linux-media+bounces-697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F787F3CCE
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5BB31C203BF
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7D111725;
	Wed, 22 Nov 2023 04:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LsKwtjbL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFD4112;
	Tue, 21 Nov 2023 20:30:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D394C85;
	Wed, 22 Nov 2023 05:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627377;
	bh=DIfyZxfJFY9QgExA0KUFudIfrdWFSlkGVPpwcc7YUHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LsKwtjbLFeqhzvKW7AxX4KCx/I3KVZ8qYWVEra7KhpwwJDUudtNzVA4E4b4bhX3yU
	 atFnYMIkfVEftGBLA+mh3Pz+68Mj/ZZmkyNbZPmMJ2WCCJOC1JtRkuTAUNyMAgJ9Af
	 Rs0MDY3RJQBdp89AGhzCBzQIrSS7sIb5TiEgy/O8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v1 03/19] media: renesas: vsp1: Drop vsp1_rwpf_get_crop() wrapper
Date: Wed, 22 Nov 2023 06:29:53 +0200
Message-ID: <20231122043009.2741-4-laurent.pinchart+renesas@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The vsp1_rwpf_get_crop() function is just a wrapper around
v4l2_subdev_state_get_crop() without any added value. Drop it and call
v4l2_subdev_state_get_crop() directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  |  2 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 12 +++---------
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  3 ---
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 4efcec5253d6..3e62638fdce6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -298,7 +298,7 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
 	 * offsets are needed, as planes 2 and 3 always have identical
 	 * strides.
 	 */
-	crop = *vsp1_rwpf_get_crop(rpf, rpf->entity.state);
+	crop = *v4l2_subdev_state_get_crop(rpf->entity.state, RWPF_PAD_SINK);
 
 	/*
 	 * Partition Algorithm Control
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 574623a48a3d..9d38203e73d0 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -16,12 +16,6 @@
 #define RWPF_MIN_WIDTH				1
 #define RWPF_MIN_HEIGHT				1
 
-struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
-				     struct v4l2_subdev_state *sd_state)
-{
-	return v4l2_subdev_state_get_crop(sd_state, RWPF_PAD_SINK);
-}
-
 /* -----------------------------------------------------------------------------
  * V4L2 Subdevice Operations
  */
@@ -105,7 +99,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 		struct v4l2_rect *crop;
 
 		/* Update the sink crop rectangle. */
-		crop = vsp1_rwpf_get_crop(rwpf, state);
+		crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
 		crop->left = 0;
 		crop->top = 0;
 		crop->width = fmt->format.width;
@@ -152,7 +146,7 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *vsp1_rwpf_get_crop(rwpf, state);
+		sel->r = *v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
 		break;
 
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -222,7 +216,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	sel->r.height = min_t(unsigned int, sel->r.height,
 			      format->height - sel->r.top);
 
-	crop = vsp1_rwpf_get_crop(rwpf, state);
+	crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
 	*crop = sel->r;
 
 	/* Propagate the format to the source pad. */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
index e0d212c70b2f..5ac9f0a6fafc 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
@@ -85,7 +85,4 @@ int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols);
 
 extern const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops;
 
-struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
-				     struct v4l2_subdev_state *sd_state);
-
 #endif /* __VSP1_RWPF_H__ */
-- 
Regards,

Laurent Pinchart


