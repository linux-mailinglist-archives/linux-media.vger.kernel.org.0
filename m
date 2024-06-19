Return-Path: <linux-media+bounces-13625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 248DE90E090
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C766828386E
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665904A1C;
	Wed, 19 Jun 2024 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DjZQHCJv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D4B1878;
	Wed, 19 Jun 2024 00:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756273; cv=none; b=ukovkwbIwUAa369dXQNRx6aZfp1l9AczHfxNPSq842d4K5r4YpN2vWocoj7UO6wtYP1WH3iikYt0g6ojSWf3BqhHxT47ZTICbFZikO6wXT9yzK20xle/Na7RWSaNS9Rikyn5SAHcCjoL+tp33rk1nPMB3kNIo0c4Hn3EjKjUEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756273; c=relaxed/simple;
	bh=M++m7Y9zNAxbt17Tj3p6HWn2ixgwYVxmVP9z4IuY+Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoPwkkL89QnCUnQFLvxg2D1irQKmOBqtXQNQ0fgVdAQbH0T9UMKBFttC7IC3ifrc9OGLpGuByUhY2+OQZtK4sOzc50sCzL/rX7fB0343F/DvMWUFN5IJLR21psy67iKwPiPHR8siYZGi6sA2KNYGbpEB4z9fIMm1KoyhQA2s9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DjZQHCJv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C10FE11CF;
	Wed, 19 Jun 2024 02:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756251;
	bh=M++m7Y9zNAxbt17Tj3p6HWn2ixgwYVxmVP9z4IuY+Nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DjZQHCJvd48lmCSc5bW/78b/9lx1hKrSAkoILfgksCdnU3+mVdB1iRCJ/gr7F49C0
	 HxfIeVgJwPBi2XnyZiDkbo/JmEOdnY9b0o+G96rb/hbbEKrYmbwEcwo7N6xN1VaYtX
	 agd0m0VbHmPJf2h90RUiNso8zrp58CNS2MEOnE/s=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 03/19] media: renesas: vsp1: Drop vsp1_rwpf_get_crop() wrapper
Date: Wed, 19 Jun 2024 03:17:06 +0300
Message-ID: <20240619001722.9749-4-laurent.pinchart+renesas@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The vsp1_rwpf_get_crop() function is just a wrapper around
v4l2_subdev_state_get_crop() without any added value. Drop it and call
v4l2_subdev_state_get_crop() directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
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


