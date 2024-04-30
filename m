Return-Path: <linux-media+bounces-10430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F6E8B6FD3
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 158D2285123
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913AD12C47A;
	Tue, 30 Apr 2024 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kxf1oF9F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9412C462;
	Tue, 30 Apr 2024 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473625; cv=none; b=sz96NtERBVPa9Icq/Z7wFO8K03bAgX3UEDbQBq5oAvx2l4dywTS+wEXK1pDwBawT+8x0YpMSZkBVXRNlePlEx2OVkSVJk75eGz+HlCq2YaXhXZtFi7nKTKHy/jN2JQiYLvjyWz1anwAofaVOumWeHmWJXckkwF5bJSALNxDDAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473625; c=relaxed/simple;
	bh=KjmX316UzTb7myq2bNcVZ6PMSFLQsY+pMynqv1Fd8d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V54fvymfM+YXjbVXT/kciTussnJzdEghAn6vUM/ViLdk4ir3NaZ8KnthGehU24j32xOZ2lw7+x3DZVE9h5N8gzUDrjxCeUemSujiGdH5yKTnCQG5jEn1Vl2YRmyG7wxrlyRP0PeRXGZCkzRW+xaNG6FWvma6FoflSDdW8MXvv3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kxf1oF9F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C452A14B1;
	Tue, 30 Apr 2024 12:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473559;
	bh=KjmX316UzTb7myq2bNcVZ6PMSFLQsY+pMynqv1Fd8d4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kxf1oF9FoOHvnFMrmzGtWw8ADXmMCM3sCaz8yutXPYzXt1TregPXgj55qEJmc5exK
	 G5yBqI4DyFIqoGL3T/OxNPhnSXcVy1Hwmt0s1owH/6OttYlVEXvR40F7WX2gomTSbr
	 HDor2b/wRcq9EEuEfVimJiptBqHeOk2i+N//ZhVI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/19] media: adv748x: Use routes to configure VC
Date: Tue, 30 Apr 2024 12:39:42 +0200
Message-ID: <20240430103956.60190-7-jacopo.mondi@ideasonboard.com>
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

Use the newly introduced routing table to configure on which MIPI
CSI-2 Virtual Channel to send the image stream on.

Perform Virtual Channel selection at s_stream() time instead of
forcing it to 0 during the chip reset.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c |  8 ++------
 drivers/media/i2c/adv748x/adv748x-csi2.c | 22 ++++++++++++++++++++--
 drivers/media/i2c/adv748x/adv748x.h      |  1 -
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 3abc73ea8ccb..c9d917135709 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -530,14 +530,10 @@ static int adv748x_reset(struct adv748x_state *state)
 	io_write(state, ADV748X_IO_PD, ADV748X_IO_PD_RX_EN);
 
 	/* Conditionally enable TXa and TXb. */
-	if (is_tx_enabled(&state->txa)) {
+	if (is_tx_enabled(&state->txa))
 		regval |= ADV748X_IO_10_CSI4_EN;
-		adv748x_csi2_set_virtual_channel(&state->txa, 0);
-	}
-	if (is_tx_enabled(&state->txb)) {
+	if (is_tx_enabled(&state->txb))
 		regval |= ADV748X_IO_10_CSI1_EN;
-		adv748x_csi2_set_virtual_channel(&state->txb, 0);
-	}
 	io_write(state, ADV748X_IO_10, regval);
 
 	/* Use vid_std and v_freq as freerun resolution for CP */
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 7fa72340e66e..a7bfed393ff0 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -14,7 +14,8 @@
 
 #include "adv748x.h"
 
-int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
+static int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx,
+					    unsigned int vc)
 {
 	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
 }
@@ -175,13 +176,30 @@ static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
 static int adv748x_csi2_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+	struct v4l2_subdev_state *state;
 	struct v4l2_subdev *src;
+	int ret;
 
 	src = adv748x_get_remote_sd(&tx->pads[ADV748X_CSI2_SINK]);
 	if (!src)
 		return -EPIPE;
 
-	return v4l2_subdev_call(src, video, s_stream, enable);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (enable) {
+		/* A single route is available. */
+		struct v4l2_subdev_route *route = &state->routing.routes[0];
+
+		ret = adv748x_csi2_set_virtual_channel(tx, route->source_stream);
+		if (ret)
+			goto unlock;
+	}
+
+	ret = v4l2_subdev_call(src, video, s_stream, enable);
+unlock:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index be24bc57767c..95d04468af9d 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -434,7 +434,6 @@ int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input);
 
 int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx);
 void adv748x_csi2_cleanup(struct adv748x_csi2 *tx);
-int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc);
 int adv748x_csi2_set_pixelrate(struct v4l2_subdev *sd, s64 rate);
 
 int adv748x_hdmi_init(struct adv748x_hdmi *hdmi);
-- 
2.44.0


