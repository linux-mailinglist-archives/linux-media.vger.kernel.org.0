Return-Path: <linux-media+bounces-13469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A2090B5EC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8754B1F241D7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8797134C6;
	Mon, 17 Jun 2024 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BO14HBWw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75319FC0E;
	Mon, 17 Jun 2024 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640746; cv=none; b=EK89ITX/x2pM7kl4tSXwZT14RVq4HPR7UyIU68U1/VbiNt75A4Lh9a0BgaFTa3/CEe41Pz8dXXkwwOmMXKrPdp5m3qeEYyxFhwGL9cb17+naV4jCCCrzxnNRHLROHQW3UWwqyawn7sfmSGtzjmt2Z4X8Pxlv4rVjsqg5jARea+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640746; c=relaxed/simple;
	bh=30Qexf4g0J1i2/Rxlw45AweA37VZfcnzq0n9YmvxtTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqDVKgLbrQR0x2Nn8BevrSNj90caesGO+dLqXWXXmBAk2Su480ZkukYY71ZLQuYM8NGiC5bpwP099FBzxWpxTtbdUi87cpnNRMplkwk7FZGiEu8xb3m0KJ9eaCYl7QtsNBjdYfNtOh/DYgjPN8HDgaXMdQc7zwMgoe0CbAzOQLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BO14HBWw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A85CC29A;
	Mon, 17 Jun 2024 18:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718640708;
	bh=30Qexf4g0J1i2/Rxlw45AweA37VZfcnzq0n9YmvxtTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BO14HBWwxdms2wxkkWh5+kPDO9V4cZgMg3fd2MvIV06g1ing2FXJLDtRNw6XREiiM
	 kFfOENygPubfcPurmK9FVLbDUrejmqj+jtgG2/iLWPCIwuLt3O1zGnjB+0NN7Jy1jo
	 8VJJDeUEojU2dlxBdVcLF2DTT7lJQmTC9rwfQ7hE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 11/11] media: max9286: Use frame interval from subdev state
Date: Mon, 17 Jun 2024 18:11:34 +0200
Message-ID: <20240617161135.130719-12-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
References: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
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

As the frame sync mode is set at s_stream() time, we can remove it
from max9286_setup().

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 52 +++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index e247512dfec4..9fc4e130a273 100644
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
@@ -994,9 +979,21 @@ static const struct v4l2_mbus_framefmt max9286_default_format = {
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
 
@@ -1143,7 +1140,6 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
 
 	max9286_set_video_format(priv, &max9286_default_format);
-	max9286_set_fsync_period(priv);
 
 	cfg = max9286_read(priv, 0x1c);
 	if (cfg < 0)
-- 
2.45.2


