Return-Path: <linux-media+bounces-10911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF1C8BD326
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9008C1F252FC
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EBA157490;
	Mon,  6 May 2024 16:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oVQAHzlT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E72156C5F;
	Mon,  6 May 2024 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014216; cv=none; b=tIvtXGQlKh/1d+uo0jNTBcHStK7txwd1YpvQuOrlOzZA2qE7iAF0294jv44u51RDpNzv+Uy5ujkmksX+CJIKPSnPNKDLqVSod9Wwlb3jFSd28qQRr3BwP+1Cb1zwHTn5cNagZ+eTSJFI5Dd/a+k0bgnOpCX5X5D4/A2QuxS/XiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014216; c=relaxed/simple;
	bh=VuFXNZgdAKJuryKD7E/q9YCVYH4lU+It/urqthlBLt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1xnAn7XekqQSU5yUKtD+1i5fEx61H6lrrIhFXOxubRUATW71Kz52REthKqrKAoEqw1V5ECheIUgVQd8V7nU8tU2j8SArokUf1/O7DeBdk7XXSsmVCHn6dVa2vWWpdlKgcKHdw+qAq/tq1+c4ZnKBbRUfHV6XqsQ/6tp0eOj6u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oVQAHzlT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B780114D;
	Mon,  6 May 2024 18:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715014200;
	bh=VuFXNZgdAKJuryKD7E/q9YCVYH4lU+It/urqthlBLt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oVQAHzlTwe+3wvAA9SPd9d4WwINw8rHNElGP1FEbNMdye9LvsULylqBAGeY8J0ZG8
	 eHhALVwVYzBk7pl7LJUAL0HF1w2GxN5wP3zZTs7cRXeea68LQ+q77NTECVpM9IV1zi
	 o8agMlWkF/vU05oBep8cg6XXPCZhT4Fqlt7HuDb4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 11/11] media: max9286: Use frame interval from subdev state
Date: Mon,  6 May 2024 18:49:39 +0200
Message-ID: <20240506164941.110389-12-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the frame interval stored in the subdev state instead of storing
a copy in the driver private structure.

Initialize the frame interval to the special case 0/0 that in the
max9286 driver represents automatic handling of frame sync.

During the startup phase, configure register 0x01 to use automatic
frame sync, to match the subdev state initialiation, instead of calling
max9286_set_fsync_period() which now requires a 'state' argument.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 59 +++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7fad190cd9b3..6930a98c8965 100644
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
+	const struct v4l2_fract *interval;
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
@@ -801,7 +802,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 		format = v4l2_subdev_state_get_format(state, MAX9286_SRC_PAD);
 
 		max9286_set_video_format(priv, format);
-		max9286_set_fsync_period(priv);
+		max9286_set_fsync_period(priv, state);
 
 		/*
 		 * The frame sync between cameras is transmitted across the
@@ -874,19 +875,11 @@ static int max9286_get_frame_interval(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_state *sd_state,
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
 
-	interval->interval = priv->interval;
+	interval->interval = *v4l2_subdev_state_get_interval(sd_state,
+							     interval->pad);
 
 	return 0;
 }
@@ -895,19 +888,11 @@ static int max9286_set_frame_interval(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_state *sd_state,
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
+	*v4l2_subdev_state_get_interval(sd_state,
+					interval->pad) = interval->interval;
 
 	return 0;
 }
@@ -993,9 +978,21 @@ static const struct v4l2_mbus_framefmt max9286_default_format = {
 static int max9286_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct v4l2_fract *interval;
+
 	for (unsigned int i = 0; i < MAX9286_N_PADS; i++)
 		*v4l2_subdev_state_get_format(state, i) = max9286_default_format;
 
+	/*
+	 * Special case: a null interval enables automatic FRAMESYNC mode.
+	 *
+	 * FRAMESYNC is taken from the slowest link. See register 0x01
+	 * configuration.
+	 */
+	interval = v4l2_subdev_state_get_interval(state, MAX9286_SRC_PAD);
+	interval->numerator = 0;
+	interval->denominator = 0;
+
 	return 0;
 }
 
@@ -1142,7 +1139,13 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
 
 	max9286_set_video_format(priv, &max9286_default_format);
-	max9286_set_fsync_period(priv);
+
+	/*
+	 * Use automatic FRAMESYNC mode. FRAMESYNC is taken from the slowest
+	 * link.
+	 */
+	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
+				  MAX9286_FSYNCMETH_AUTO);
 
 	cfg = max9286_read(priv, 0x1c);
 	if (cfg < 0)
-- 
2.44.0


