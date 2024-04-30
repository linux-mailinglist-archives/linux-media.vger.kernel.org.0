Return-Path: <linux-media+bounces-10425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B49128B6FC8
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6F21F23AA0
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC2B12C475;
	Tue, 30 Apr 2024 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M/DYoJ+F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A56F12C461;
	Tue, 30 Apr 2024 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473616; cv=none; b=esrdzRcb3nTJGJYG7+MTcUcLBWktXb2WXuAM+5tp3Iud7FNkAcecRoONLqtXRr9KpNm7eh3GeQVIbLSbkAxvKfpWEmu5QZa1a0w7ue0nxIp+vsfc8h3P/SjK9xSx4ZjAX9QD+oNu5gy6kHH6NwD7/M7EPAm1rThauKjroeb1aNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473616; c=relaxed/simple;
	bh=n6BzMcu1VucNIw2NaCp7E+5G2JkQNedJMkSE/VKrhZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZ1PXgzGzSNEPK0BJT319sedRQzdIny9BB2IGJNraXtkG4LfXQ0BQwBto6VpsLGDDDHXXHoj5YIqS0HHzZNC6axW4y73N3WUiqPP0lQSm+f8LKtzMP23S1OwA+utqDV01cCPlKefNE8PFwgNO3A8ps2gRMGPNaeY48ABfiXlrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M/DYoJ+F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB8E64D4;
	Tue, 30 Apr 2024 12:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473556;
	bh=n6BzMcu1VucNIw2NaCp7E+5G2JkQNedJMkSE/VKrhZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M/DYoJ+F4xZ6Wca0Lj1iil4/eKBNqG3MwikpnDZjpOqTETVup5JUBKD4bKxXIJXyk
	 RRCxLQx+064i1hvUOifhtphxwSXIVsbJ/mnheiAULwTABETrmnEpGPpup1uvGP3Cb4
	 VbJGNckkhvQUI9bPzijZS4IycMkcNyzf732g3dqs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 01/19] media: adv748x: Add support for active state
Date: Tue, 30 Apr 2024 12:39:37 +0200
Message-ID: <20240430103956.60190-2-jacopo.mondi@ideasonboard.com>
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

Initialize and use the subdev active state to store the subdevice
format.

This simplifies the implementation of the get_fmt and set_fmt pad
operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 69 ++++--------------------
 drivers/media/i2c/adv748x/adv748x.h      |  1 -
 2 files changed, 11 insertions(+), 59 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 5b265b722394..435b0909bbef 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -139,78 +139,26 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
  * But we must support setting the pad formats for format propagation.
  */
 
-static struct v4l2_mbus_framefmt *
-adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state,
-			    unsigned int pad, u32 which)
-{
-	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(sd_state, pad);
-
-	return &tx->format;
-}
-
-static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_subdev_format *sdformat)
-{
-	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-	struct adv748x_state *state = tx->state;
-	struct v4l2_mbus_framefmt *mbusformat;
-
-	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
-						 sdformat->which);
-	if (!mbusformat)
-		return -EINVAL;
-
-	mutex_lock(&state->mutex);
-
-	sdformat->format = *mbusformat;
-
-	mutex_unlock(&state->mutex);
-
-	return 0;
-}
-
 static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *sdformat)
 {
-	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-	struct adv748x_state *state = tx->state;
 	struct v4l2_mbus_framefmt *mbusformat;
-	int ret = 0;
-
-	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
-						 sdformat->which);
-	if (!mbusformat)
-		return -EINVAL;
 
-	mutex_lock(&state->mutex);
+	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 
+	/* Format on the source pad is always copied from the sink one. */
 	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
 		const struct v4l2_mbus_framefmt *sink_fmt;
 
-		sink_fmt = adv748x_csi2_get_pad_format(sd, sd_state,
-						       ADV748X_CSI2_SINK,
-						       sdformat->which);
-
-		if (!sink_fmt) {
-			ret = -EINVAL;
-			goto unlock;
-		}
-
+		sink_fmt = v4l2_subdev_state_get_format(sd_state,
+							ADV748X_CSI2_SINK);
 		sdformat->format = *sink_fmt;
 	}
 
 	*mbusformat = sdformat->format;
 
-unlock:
-	mutex_unlock(&state->mutex);
-
-	return ret;
+	return 0;
 }
 
 static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
@@ -228,7 +176,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 }
 
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
-	.get_fmt = adv748x_csi2_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
 };
@@ -320,6 +268,11 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	if (ret)
 		goto err_cleanup_subdev;
 
+	tx->sd.state_lock = tx->ctrl_hdl.lock;
+	ret = v4l2_subdev_init_finalize(&tx->sd);
+	if (ret)
+		goto err_free_ctrl;
+
 	ret = v4l2_async_register_subdev(&tx->sd);
 	if (ret)
 		goto err_free_ctrl;
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index d2b5e722e997..9bc0121d0eff 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -75,7 +75,6 @@ enum adv748x_csi2_pads {
 
 struct adv748x_csi2 {
 	struct adv748x_state *state;
-	struct v4l2_mbus_framefmt format;
 	unsigned int page;
 	unsigned int port;
 	unsigned int num_lanes;
-- 
2.44.0


