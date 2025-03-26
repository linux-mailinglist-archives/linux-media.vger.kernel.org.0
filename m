Return-Path: <linux-media+bounces-28773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E03DDA71567
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE661896FC1
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCE31EA7E2;
	Wed, 26 Mar 2025 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nQxR0gmD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22B1E51EC;
	Wed, 26 Mar 2025 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987432; cv=none; b=hYjcUE2sKrADLvQhdMEJ/H8D+E7Yy3WGTH1PSOrrJvV6Le4s7PGS8ybSbLayoZf42gdI1ZQi9PFziZh4dJoE6vywszdp9brgq+BXVxrE4lULXi+Slz9khrFfm4e07wl5o8emfXXHTwxH5xvyXWxhpxlzU+myi0LVQkU5m36tDMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987432; c=relaxed/simple;
	bh=f9Zu08iRKcpOonJQPT1z5w861yw0MT1qatoa5Fhmp1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUoR6hPNIqJJtdBQHBuU004+cixSI1bfYEM+JPawU8qTOnB1X3Iq7STM8ddYjDHwcAZYypBzdau4aCd4Iv4QNtUZMCLkKSxDjyhcR5dJpnAFaBAmMJ/MuwHrf2PgKEl/17Dmo91HtyZfGkYwdRGQVWbdPsXVMUY9E7iVf1M+3pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nQxR0gmD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20438158E;
	Wed, 26 Mar 2025 12:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987310;
	bh=f9Zu08iRKcpOonJQPT1z5w861yw0MT1qatoa5Fhmp1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nQxR0gmDTiRf7OoVn1ouyfjXIEecbj+IiAzmfaaFl/xC5RqoQNfVgfx6rSzksPTKe
	 kt8ba3EoeQJqdEGfT3hqE2VQxWBPWeydD9rCB80LkFyw0aQLqWrw9ydcFVPy+Aij6+
	 MVrBaKaWkZGcTojDZAolpQoQEaF+DPfjZgcHrEWI=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:28 +0200
Subject: [PATCH v2 06/15] media: rcar-csi2: Simplify rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-6-d0d7002c641f@ideasonboard.com>
References: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
In-Reply-To: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3595;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=f9Zu08iRKcpOonJQPT1z5w861yw0MT1qatoa5Fhmp1w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CROAri9pt2Krcib0/T5aMMUbnAcrpihBWpn
 IpPQAyfWteJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkQAKCRD6PaqMvJYe
 9bo0D/94/1Hu2maDf6Q4JYLbe2knH52LQwsusChltlw1doHfkBFntoQ3skIjXE7HCZi+uq6wHEE
 DCzUTs0t5GdeUj1wt2MkwNkYMZ65b/s6ZxVWW0gmCJYf4MDR5nyk7bk7jkACg4ViPjlD9uzrvHg
 pN/YH/DJ1/d3v8DzpVBK4aaSeQSJZM20dRuKGwGgKRX2zJuqo6fSK21HiqhXaY4j6n2isJOHe1g
 1Wp/ugBd3Oxw//PGnw4s/YwsXw/oTKcVtK4CljT0cQbb4YqpXfLaFAJ4+VxlySvDM/i6X2DYG9y
 8wZlMM5spsAhuqAxB+nICUGQZNJkdJX2cZCXserqT8s6G3daIefkPqjtXG+GS2xnCwAuGvBtSj9
 7UUmNzp4q/+oxb9ydGJlvfYonbhWNHHLa133dUZtGMXu2Gck4wDfEa6/B9mhhZqo+Ck/MgJWHbj
 2lX+6YPNZo8faSr/5AYzQmFEx8EWnwK//AQhOAJJde1siClbAOV7K03+GhqLJlmmZLjHpsc8/76
 rvOMJ6+Rq42Z84TPeh8OsryvLqrmHFt18jwoIhOCgYWYOLY+DizvB4e5ITjN/4W873ACKjDwB0y
 B0CqfzlBWRUXAQBrLOyqSnLZoWFOvtf9iYhq6ZADpRi5lvAzGNtWtGgWlkTfL8ECiRVqI3uUSeX
 HbDA/htNxAHtgEA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of taking the bpp and the number of lanes as parameters to
rcsi2_calc_mbps(), change the function to get those parameters inside
the function. This centralizes the code a bit and makes it easier to add
streams support.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 45 ++++++++++++++++--------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 8aca35096408..90973f3cba38 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -998,13 +998,18 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
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
@@ -1012,6 +1017,20 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
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
@@ -1092,7 +1111,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	phycnt = PHYCNT_ENABLECLK;
 	phycnt |= (1 << lanes) - 1;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, state);
 	if (mbps < 0)
 		return mbps;
 
@@ -1300,23 +1319,15 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
 static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 				    struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
-	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int msps;
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
 
-	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	msps = rcsi2_calc_mbps(priv, state);
 	if (msps < 0)
 		return msps;
 
@@ -1494,23 +1505,15 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
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


