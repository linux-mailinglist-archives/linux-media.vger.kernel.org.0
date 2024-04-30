Return-Path: <linux-media+bounces-10434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A688B6FDB
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C55F1C21B3A
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DD612C48B;
	Tue, 30 Apr 2024 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RdITaf7y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AB212C471;
	Tue, 30 Apr 2024 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473630; cv=none; b=KxoyYpO7O7Lh//8WHoJjBcjPEqnVQMhYHkht303jISH0vL73IAchgoJf57EAO7ouGgOWxhCzaLiHNjX1eJhUzr9oLcPwQlM57MA6naFugi58KNDYBuUKFt703DfJ8kLPDMxFbyT1UoONij45tBsZzAKDnI+skXdLs4MRnBESHwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473630; c=relaxed/simple;
	bh=bI6ghWuy11ydO24UCg81CpfIRJjmawRzOjVsaLhrL1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiTSy7Be+tELpjxJRKbSgiLgeNvMfHLXeqOQj76C3GaWGf+Jz5Ih9t26RNkLB+8Xqv9CNk7Be+OX/PWUa/x2Wh0zUxfJTJq8pKi/EV7zWjLRPtF2eUPKcUAct85ptr472cJQK8pSkVDg+YjFViG1I2npCVPBCV4UYlqzaxelc/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RdITaf7y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47A654AB;
	Tue, 30 Apr 2024 12:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473561;
	bh=bI6ghWuy11ydO24UCg81CpfIRJjmawRzOjVsaLhrL1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RdITaf7ysd7BdM9KBZkgJs3acyfZw1b7e7p+Dtg7WX8Wh8yVTS3tOjMrD722UscXt
	 Szt1p1OglGA2queBBlESBkp5FV3cxLOqQM7TSBG2pQWjg1vcp8KR8Y2+yD4nunlXax
	 rR2CCLg4LUB+QPiiQdX50EXbgLXPxAfVs5oqDQ28=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/19] media: max9286: Use frame interval from subdev state
Date: Tue, 30 Apr 2024 12:39:46 +0200
Message-ID: <20240430103956.60190-11-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the frame interval stored in the subdev state instead of storing
a copy in the driver private structure.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 52 ++++++++-----------------------------
 1 file changed, 11 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 575d8ac8efa1..ae1b73fde832 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -197,8 +197,6 @@ struct max9286_priv {
 	struct v4l2_ctrl *pixelrate_ctrl;
 	unsigned int pixelrate;
 
-	struct v4l2_fract interval;
-
 	unsigned int nsources;
 	unsigned int source_mask;
 	unsigned int route_mask;
@@ -571,11 +569,14 @@ static void max9286_set_video_format(struct max9286_priv *priv,
 		      MAX9286_INVVS | MAX9286_HVSRC_D14);
 }
 
-static void max9286_set_fsync_period(struct max9286_priv *priv)
+static void max9286_set_fsync_period(struct max9286_priv *priv,
+				     struct v4l2_subdev_state *state)
 {
+	struct v4l2_fract *interval;
 	u32 fsync;
 
-	if (!priv->interval.numerator || !priv->interval.denominator) {
+	interval = v4l2_subdev_state_get_interval(state, MAX9286_SRC_PAD);
+	if (!interval->numerator || !interval->denominator) {
 		/*
 		 * Special case, a null interval enables automatic FRAMESYNC
 		 * mode. FRAMESYNC is taken from the slowest link.
@@ -591,8 +592,8 @@ static void max9286_set_fsync_period(struct max9286_priv *priv)
 	 * The FRAMESYNC generator is configured with a period expressed as a
 	 * number of PCLK periods.
 	 */
-	fsync = div_u64((u64)priv->pixelrate * priv->interval.numerator,
-			priv->interval.denominator);
+	fsync = div_u64((u64)priv->pixelrate * interval->numerator,
+			interval->denominator);
 
 	dev_dbg(&priv->client->dev, "fsync period %u (pclk %u)\n", fsync,
 		priv->pixelrate);
@@ -802,7 +803,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 		format = v4l2_subdev_state_get_format(state, source_idx);
 
 		max9286_set_video_format(priv, format);
-		max9286_set_fsync_period(priv);
+		max9286_set_fsync_period(priv, state);
 
 		/*
 		 * The frame sync between cameras is transmitted across the
@@ -871,44 +872,14 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int max9286_get_frame_interval(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_state *sd_state,
-				      struct v4l2_subdev_frame_interval *interval)
-{
-	struct max9286_priv *priv = sd_to_max9286(sd);
-
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
-
-	if (interval->pad != MAX9286_SRC_PAD)
-		return -EINVAL;
-
-	interval->interval = priv->interval;
-
-	return 0;
-}
-
 static int max9286_set_frame_interval(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_state *state,
 				      struct v4l2_subdev_frame_interval *interval)
 {
-	struct max9286_priv *priv = sd_to_max9286(sd);
-
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
-
 	if (interval->pad != MAX9286_SRC_PAD)
 		return -EINVAL;
 
-	priv->interval = interval->interval;
+	*v4l2_subdev_state_get_interval(state, interval->pad) = interval->interval;
 
 	return 0;
 }
@@ -966,7 +937,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
 	.enum_mbus_code = max9286_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= max9286_set_fmt,
-	.get_frame_interval = max9286_get_frame_interval,
+	.get_frame_interval = v4l2_subdev_get_frame_interval,
 	.set_frame_interval = max9286_set_frame_interval,
 };
 
@@ -1148,7 +1119,6 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
 
 	max9286_set_video_format(priv, &max9286_default_format);
-	max9286_set_fsync_period(priv);
 
 	cfg = max9286_read(priv, 0x1c);
 	if (cfg < 0)
-- 
2.44.0


