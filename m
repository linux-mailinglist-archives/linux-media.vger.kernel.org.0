Return-Path: <linux-media+bounces-50765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC6D23D61
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A7CA30209BE
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29EB35EDA5;
	Thu, 15 Jan 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f4r6Cjw1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D0361DBC;
	Thu, 15 Jan 2026 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471735; cv=none; b=h23Zb++9ZpXqOnaGJ1sbOBoKbz9Bpf+jlWQY9zIOCGfYEOd0BbuTJu7PU/gZoIGwCM4+ut+7ou/7ZRm08kqys6AC4rIGHenyptMnEtnyv/QXZMspJlPW0Yj2QmWNhBA5YMjL6FELM+MGcskjsKFthsE1WAKaH71NYTp8BR0DlIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471735; c=relaxed/simple;
	bh=eTBBPNaGXVujuMVaMDyD5WAUtGtB3Iz2GSBQlnIJYdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9ZeP1eCmNWLJDMeKkW8bBfiaI2jhwr/nJpeymGFugxsFpNwFQoYyspdf6RfJhXebwxO5XTZxjQnSv43de5UwTy1hoFCGltDmAeCSktZk/kEoqYaJ0KdABKv5O+KZZTcI/D1xWi3cWSYQfoYxGM/rOvsCNKdvt0mNWvLdXgaXx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f4r6Cjw1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C98728F7;
	Thu, 15 Jan 2026 11:08:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768471700;
	bh=eTBBPNaGXVujuMVaMDyD5WAUtGtB3Iz2GSBQlnIJYdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f4r6Cjw1mJufvqEo3emOY4hg55zKEE/QGk6kJZ+F9GMVuX1aU+WXnBW6LJZz4TIZR
	 WKNR/aMrM0oDH+YyycEOdqZ+sC3hq+O/vUyWNINPmiJqbdTtPgboIvvIG93aw2bYn9
	 YR3sfK6/LU7pbJm3e70cpIblVJc1B/+Mi5sQXQX0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 15 Jan 2026 12:07:00 +0200
Subject: [PATCH 4/5] media: rcar-csi2: Simplify rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260115-rcar-streams-prep-1-v1-4-f87700926c11@ideasonboard.com>
References: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
In-Reply-To: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3857;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eTBBPNaGXVujuMVaMDyD5WAUtGtB3Iz2GSBQlnIJYdY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpaLyqF7167wHo+drMRZPBcTHaGefdYQXdoFo/u
 lNorOn+lKeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaWi8qgAKCRD6PaqMvJYe
 9et+D/44X5rSjOx6UXwEdFP2FxCApdN39BIbhF3BHrJ8D6SqmmoK82l5s5N7ZIISW5JIHh/HGIu
 AX5Wga2FHvINlxdxs+sgvvIbwmdPwsUCTtLFRCwdwKOcjnalJr6MI25COuxGEdBK46ww23gnhwm
 htW79VL597DNMgy0yM9YVuHyZukLP9kYVmABrUIRiGMCSu0uMh/VcsiABKReOleLM1c4gfApgUq
 IbxbpCyN5EmBEbUWYXDDD9w971geFMJTM6/Iqaeqj6cGEZWFma/QuzApQFHSOPMlGymbt0PhpJK
 cOk1wYNt/Rm1/NOKBZ9S8nUnSDJAnMvXLtknO91asb3ZppdCtvoTnRETR9axVBlM3uq9Er0A1/I
 EbHLzxd75FMvmx6MHV3aMHfDdDRbGJucl4a7fo5BxyCgGoXbdwjcDNU7/fcoyUy4TYyupI6oFwj
 T6pnHiNvI4lQmGa3JuTUPPxSkNZg3flDkCrXJYCT5s0eg3jicYCUritTOpo2vkOT1bNz6dD8HyD
 LTGhhHprry8FOsLWLWQybF8lJL4MTCs0s670+HdOQHOpOKWolMDH3Fnd29hEeokMIXZ6Pf0nGRD
 xkCh2YBUWvCkpO1UNmoms+28cNIhazQ1FWQ6FtukAJ5FICye+vvnK57K4YHD1kQICFXQ6GJ+ZId
 ep2l7aI1AaHgmvw==
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


