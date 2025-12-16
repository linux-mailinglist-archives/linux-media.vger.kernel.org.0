Return-Path: <linux-media+bounces-48898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42985CC408F
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8FF530178AB
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CFE34E24E;
	Tue, 16 Dec 2025 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MS0UJZFk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300B342177;
	Tue, 16 Dec 2025 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898358; cv=none; b=nC0cdmhMB2CofcZJnbZa5Gqkr4tysv290gYXy6/6aLCRkRD95uR3LzW2cAsb31PD8rqzTNr0eJ2hU5cFcj7W6L6pF2baoxiru88xbtl/+mvxPs4q2s9qA6k/p4OHkyuJ3n3GgUuY8QgzlqD+rmUYk0WsrSI7a78005fB6JNGzH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898358; c=relaxed/simple;
	bh=eTBBPNaGXVujuMVaMDyD5WAUtGtB3Iz2GSBQlnIJYdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQv6FcalUHiOzN3hOw5SpqN7yuIu5l9QQHTHRVfJLH61s2Ksgckd6MXnmZ5bYm0fAAQk2rOO9iGI5xOaURu3u/nA6uVpUXtAyRh8PJ3nrxQ+4onN2iLA1Xm2Gyxq+ojP3XpckZfdz9DFAOMK9pNQiMJ8XICesVtNvR/8fQqFr1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MS0UJZFk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C5B213D7;
	Tue, 16 Dec 2025 16:19:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898343;
	bh=eTBBPNaGXVujuMVaMDyD5WAUtGtB3Iz2GSBQlnIJYdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MS0UJZFkhlk3j7YTmQv5TImlKS0mrcPiQ061E7GwT06QT+PNVo5XUcufn8U42npBt
	 vFgrS2gGRPS2bRi0Ncxb/1PDvlhAg2xvasgdpWmnwpiA6wq8wg9Ct8PKIirPdRAARC
	 +7tlxJTNuTAzCybI5W6mO3DMLEJrordR4uFh74gQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:21 +0200
Subject: [PATCH v4 04/15] media: rcar-csi2: Simplify rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251216-rcar-streams-v4-4-f28b4831cc67@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
In-Reply-To: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3857;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eTBBPNaGXVujuMVaMDyD5WAUtGtB3Iz2GSBQlnIJYdY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhkgD6rLA7SSCmy2aKo44xPgGosGbJfSWVCB
 LUr5X0qMAiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZAAKCRD6PaqMvJYe
 9cMAD/9IZFMHVRxJwWvgnsz+Wo6Xb/i2LullqTYqi9C6xUDqaykDXlPKNbva0R9nZRfEphYAALd
 GGTidC+1W9c693/zENHEZru7MKRsasd5JpzdzcCqlvEYwwiVAQ7yqPaFLdaOxMxW71lWYogPe2E
 08C/ZFkBSrKHeKiSiCW5IV4u375bsIpzX0kGLR9H6vsMS1TWHfQMhoHA9EClomZ2VsLf/RHwcqx
 OHWjm+U/iQuEALPeRZ3zt6WnuhXWn63d5UeiPDW2cIqut/GI4scpU3c1nOHMzuLDjvJF6bKvWTP
 /qVArA7h4eaZALJ1Ng3knUs4FJWnHT1mL0KnYrSDJDqo59Tvx8J9lKLuI+5+U4VAfztuog9MAhR
 P+iM24Xg9MeL8g/8Vas/pVdpQuGeSEoT6s3cQftc6Srsljcd8SB46LVdGyC8gS/qd8vnxMfEdLl
 WBlkJ8Bvy0w5m482oRBx8Sm2zmfh6ZIv/cmewyDhobcBr0tEjMYqGVoXqEvoLY1suonGBnUYnnZ
 Lt7tQIwSb5bYrTnM4kL2ybhSz/yHvTX/s4vcVvTOGupkKreDF6H8g7mankOeywb5QHhO4o7TiBi
 zV7XZ61B1y6rsKa9XNOUMov0qFFJm9dp4JkG5eWZZRjuHAgSParPrtrWjgCvAe0tYePN3GQdOTt
 VUopRJubrc7mj3w==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of taking the bpp and the number of lanes as parameters to
rcsi2_calc_mbps(), change the function to get those parameters inside
the function. This centralizes the code a bit and makes it easier to add
streams support.

Also, in the future when the legacy (non-link-freq) code is removed,
there will be no need to change rcsi2_calc_mbps() parameters.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 45 ++++++++++++++++--------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 8032fa4f7a8a..a2a87c5bfd7c 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1003,13 +1003,18 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
-			   unsigned int lanes)
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
+			   struct v4l2_subdev_state *state)
 {
+	const struct rcar_csi2_format *format;
+	struct v4l2_mbus_framefmt *fmt;
 	struct media_pad *remote_pad;
 	struct v4l2_subdev *source;
+	unsigned int lanes;
+	unsigned int bpp;
 	s64 freq;
 	u64 mbps;
+	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
@@ -1017,6 +1022,20 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 	source = priv->remote;
 	remote_pad = &source->entity.pads[priv->remote_pad];
 
+	ret = rcsi2_get_active_lanes(priv, &lanes);
+	if (ret)
+		return ret;
+
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+	if (!fmt)
+		return -EINVAL;
+
+	format = rcsi2_code_to_fmt(fmt->code);
+	if (!format)
+		return -EINVAL;
+
+	bpp = format->bpp;
+
 	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
 	if (freq < 0) {
 		int ret = (int)freq;
@@ -1093,7 +1112,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	phycnt = PHYCNT_ENABLECLK;
 	phycnt |= (1 << lanes) - 1;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, state);
 	if (mbps < 0)
 		return mbps;
 
@@ -1475,23 +1494,15 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 				    struct v4l2_subdev_state *state)
 {
 	const struct rcsi2_cphy_setting *cphy = NULL;
-	const struct rcar_csi2_format *format;
-	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int mbps;
 	int ret;
 
-	/* Use the format on the sink pad to compute the receiver config. */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
-
 	ret = rcsi2_get_active_lanes(priv, &lanes);
 	if (ret)
 		return ret;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, state);
 	if (mbps < 0)
 		return mbps;
 
@@ -1732,23 +1743,15 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
 static int rcsi2_start_receiver_v4m(struct rcar_csi2 *priv,
 				    struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
-	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int mbps;
 	int ret;
 
-	/* Calculate parameters */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
-
 	ret = rcsi2_get_active_lanes(priv, &lanes);
 	if (ret)
 		return ret;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, state);
 	if (mbps < 0)
 		return mbps;
 

-- 
2.43.0


