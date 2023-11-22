Return-Path: <linux-media+bounces-696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E24D7F3CCC
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E170DB21B0C
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661FFC134;
	Wed, 22 Nov 2023 04:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="re4d2+jd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6827D18D;
	Tue, 21 Nov 2023 20:30:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75C4DDB7;
	Wed, 22 Nov 2023 05:29:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627378;
	bh=ATpew07XsnMkuQSi1R1gYHH/mtFeXCD+2efEUZYi5FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=re4d2+jdqxfQ57Iz0FpHHw3JS4xxUvtPY+LxvTeeONFzs2gmait8f1KZE6EMLcij5
	 2fnyUuWs4jFm5DWNh+21miBEcAGnAunOu8hGYah6J89ITLsrCHqAo5pxhzTdkAb/oL
	 r2Ys78Q7zzpkM30N7L3rpsPpntj8EVJlQGrKzEAU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v1 04/19] media: renesas: vsp1: Drop brx_get_compose() wrapper
Date: Wed, 22 Nov 2023 06:29:54 +0200
Message-ID: <20231122043009.2741-5-laurent.pinchart+renesas@ideasonboard.com>
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

The brx_get_compose() function is just a wrapper around
v4l2_subdev_state_get_compose() without any added value. Drop it and
call v4l2_subdev_state_get_compose() directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_brx.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 0eb4d8fe4285..05940d0427bf 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -96,13 +96,6 @@ static int brx_enum_frame_size(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static struct v4l2_rect *brx_get_compose(struct vsp1_brx *brx,
-					 struct v4l2_subdev_state *sd_state,
-					 unsigned int pad)
-{
-	return v4l2_subdev_state_get_compose(sd_state, pad);
-}
-
 static void brx_try_format(struct vsp1_brx *brx,
 			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
@@ -157,7 +150,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 	if (fmt->pad != brx->entity.source_pad) {
 		struct v4l2_rect *compose;
 
-		compose = brx_get_compose(brx, state, fmt->pad);
+		compose = v4l2_subdev_state_get_compose(state, fmt->pad);
 		compose->left = 0;
 		compose->top = 0;
 		compose->width = format->width;
@@ -204,7 +197,7 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
 			return -EINVAL;
 
 		mutex_lock(&brx->entity.lock);
-		sel->r = *brx_get_compose(brx, state, sel->pad);
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
 		mutex_unlock(&brx->entity.lock);
 		return 0;
 
@@ -253,7 +246,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
 	sel->r.width = format->width;
 	sel->r.height = format->height;
 
-	compose = brx_get_compose(brx, state, sel->pad);
+	compose = v4l2_subdev_state_get_compose(state, sel->pad);
 	*compose = sel->r;
 
 done:
-- 
Regards,

Laurent Pinchart


