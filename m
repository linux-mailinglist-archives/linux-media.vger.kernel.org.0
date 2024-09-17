Return-Path: <linux-media+bounces-18336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF44B97B11B
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 168781C21095
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2F4185B55;
	Tue, 17 Sep 2024 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TLkcCTri"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553BD17BEDB;
	Tue, 17 Sep 2024 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582213; cv=none; b=KovPu7CmWGOgTO4f28sArGQTuU8pS7O8DbGFYGJpcKlEhHgZGdymjFwucrnbCx8kc2Vf4KdVEbeqgpNcgdosvwztcXPWWsXuJ9BvlQlPraBSFQqVNq88z9LFhnx57qIYQalCOU6dqFeaVflVyG9if4FjkzJvLzlb+XZrtNFnFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582213; c=relaxed/simple;
	bh=yuqsL2W74eA6/mxkQ/xEXQAbG/42LNjT3uMhh5obiIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfGCrQBSnaP/JQ/vGMueUGh034r5tKzJynJlk81Azws24CK/OrYpOcDj7dYfOyZ2kssbjazUOPIsbJL+pmF1Y8QqauTbACQpgwV/1xYycKBHXN5fA4VZl0zkWjYkiyHBA2cJpkoS9VU6SI67Zz1+GoZGtKFY6IWqPJut7EEjXlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TLkcCTri; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16E758BE;
	Tue, 17 Sep 2024 16:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726582125;
	bh=yuqsL2W74eA6/mxkQ/xEXQAbG/42LNjT3uMhh5obiIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TLkcCTriu7A+FeQO7Zd2W+fvIvW8ouNV56VcCHZBbXBgQrrx/As6WE1qe7lNueAP7
	 yrD3PPmcrtVs+uaes4fVWkKjIBT9bCq1+fWYGHIiJTvU4C6BmLTWAM9jgkUIpUXLpC
	 56BsmEJj04ViPrehMON0YzTFexoXgjSm9UtdXTUw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Sep 2024 17:09:31 +0300
Subject: [PATCH 3/4] media: renesas: Use state cleanup macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-scoped-state-v1-3-b8ba3fbe5952@ideasonboard.com>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
In-Reply-To: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4070;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NCiPAqhXCcuK34hin2VFlGsCD4jIoCLs1SmrFqCLKyo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm6Y27GmYXeGPZjUyQjwAN/NDMSO7Lhoi6AK4sN
 cu6ZPSBXfeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZumNuwAKCRD6PaqMvJYe
 9cCwD/4ox6YtzI9LJMGx6A8RpQRD5zRJBFu24xaKUVmv2t/TMXT8QTtstzYHTp2dMBAkxXqCDLG
 WuXTtZYEmbtXJvkz9UyBAtquj+8BOXuF/p6pxkLZ5EgZLttbB5ZH9pcD6W/GxVj2JFpJQW/QI9Q
 uTu/li5fyUsa+wWnLlLWWLQmGQIQp+/HX3gbjn+3Wj8feaZQg7cfm6/zYs9/aytAUDIFd/9JcfI
 BT9N/MFJpIS3oKLukpaOnRLXRGENio57TkTsrTRXZMTE5BxUjEeZ8NG4tIagTuRhCwPW3oxqprL
 dkMwwhCElk/0aIpq+j3xs3cFXOsmfnENslikDGMdrD5UArn0D6Xj8cAZqveDxtX56AUPNfNGcYY
 /HhRAvMmyW5b1WHZD9kpMQ1Xz0SOqxkJzeMYEm7CcJ0j8US/taCA+z9hXouQfZxoc//kZ7qkQmG
 Xo0xjfOcnj1Ngw6x7Mk9VDIcW5tPMa0WvmgV5Y+OqqEp8ncmEhp0BBEGHdUOr10p5uz8iT+yBgr
 Or5X3vdx3VAusmFNlBULcZTTLJo5NHgt95BVG+xKYvlodymI8RsCKdFTdjpo+0GjWieiYgkuVho
 AlF79V3ARu76qy94u8ns9hetvwzyeXVvIkX1PHVkoDbRHSPmXdPrM45IUVVBysectUAVL0y2dSh
 dXrOCYL8DoXcnJw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Use the new subdev state cleanup macros.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c            | 14 ++++----------
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c |  9 ++++-----
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c   |  9 ++-------
 3 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index c419ddb4c5a2..03ef6566271f 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1163,27 +1163,24 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
 static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	struct v4l2_subdev_state *state;
 	int ret = 0;
 
 	if (!priv->remote)
 		return -ENODEV;
 
-	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
+	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&priv->subdev);
 
 	if (enable && priv->stream_count == 0) {
 		ret = rcsi2_start(priv, state);
 		if (ret)
-			goto out;
+			return ret;
 	} else if (!enable && priv->stream_count == 1) {
 		rcsi2_stop(priv);
 	}
 
 	priv->stream_count += enable ? 1 : -1;
-out:
-	v4l2_subdev_unlock_state(state);
 
-	return ret;
+	return 0;
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
@@ -1274,18 +1271,15 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
 
 static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 {
-	struct v4l2_subdev_state *state;
 	struct rcar_csi2 *priv = data;
 
-	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
+	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&priv->subdev);
 
 	rcsi2_stop(priv);
 	usleep_range(1000, 2000);
 	if (rcsi2_start(priv, state))
 		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
 
-	v4l2_subdev_unlock_state(state);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e68fcdaea207..63b846f3e468 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -238,7 +238,6 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 	struct v4l2_subdev *source = csi2->remote_source;
 	const struct rzg2l_csi2_format *format;
 	const struct v4l2_mbus_framefmt *fmt;
-	struct v4l2_subdev_state *state;
 	struct v4l2_ctrl *ctrl;
 	u64 mbps;
 
@@ -250,10 +249,10 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 		return -EINVAL;
 	}
 
-	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
-	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
-	format = rzg2l_csi2_code_to_fmt(fmt->code);
-	v4l2_subdev_unlock_state(state);
+	scoped_v4l2_subdev_lock_and_get_active_state(&csi2->subdev) {
+		fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
+		format = rzg2l_csi2_code_to_fmt(fmt->code);
+	}
 
 	/*
 	 * Calculate hsfreq in Mbps
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index ac8ebae4ed07..0b9e8a7cf22a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -36,14 +36,9 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int c
 
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
 {
-	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *fmt;
+	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&cru->ip.subdev);
 
-	state = v4l2_subdev_lock_and_get_active_state(&cru->ip.subdev);
-	fmt = v4l2_subdev_state_get_format(state, 1);
-	v4l2_subdev_unlock_state(state);
-
-	return fmt;
+	return v4l2_subdev_state_get_format(state, 1);
 }
 
 static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)

-- 
2.43.0


