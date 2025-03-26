Return-Path: <linux-media+bounces-28775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0591A7156F
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB9FE189AC8B
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85991F1303;
	Wed, 26 Mar 2025 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JoEFcUPO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A646B1EEA30;
	Wed, 26 Mar 2025 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987437; cv=none; b=MZB8s3Fdqgjyp+rX5fhzOSWIR+MVKL9J9STBShkgPApEnMHdwseEXokO3oXaYl2E5pBu7kDSX/33BK40wLRDTFR5cBQd3Ho0iNAP2L5+hwTzPrBPbX7yKVTiAeuC70uCmUJgTSf8Xmmkjl3YzQ+8UggM+P1U43G26sPCmCoCkwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987437; c=relaxed/simple;
	bh=eGxXrbQ8I7Tnu7ZgQwBPljss30FabnTKNMEZW47YvvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0XiYR35PqKQ6D4mz6BdT1u3Rugo6HEKrTi3kVO6aqlyTIJY1Cng+YceVikZbCOet6msgalYvbiUXlcApRKeKSAnX5PLY+GtuTrCctBskQgx6cQZNBbdzl6v0z5AihIP/jDEc5NNNaryLuWRVW4OLzHr0B4f2yWLhhZrLDBnrG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JoEFcUPO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D5BF1955;
	Wed, 26 Mar 2025 12:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987312;
	bh=eGxXrbQ8I7Tnu7ZgQwBPljss30FabnTKNMEZW47YvvU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JoEFcUPOLufZP5jw0pDVpdxxTXaRK0CuI5x2uXXjG/bMyzSbTM1n5Nu2JF7nQC4TT
	 XLe8Ebnl5TH5zAVHPXZH6vhxmUKLUyRqFQKaAfMg/ilAJyEQAm9zpJe4lSwhUyD+sh
	 3CaSK7IfJANLsJJ/Bw7sFzOpriweR+shVg35AYkk=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:30 +0200
Subject: [PATCH v2 08/15] media: rcar-csi2: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-8-d0d7002c641f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4215;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eGxXrbQ8I7Tnu7ZgQwBPljss30FabnTKNMEZW47YvvU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CSZGpM9Zl3UeMcQfSWRXm0KxJu9Uhz7WICA
 +w/Ha/PB3qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkgAKCRD6PaqMvJYe
 9WaVD/0XV6jzJ0T/qnOtJzKZgVvNt22xTAID6NaE9Gk7eRn0VUUykM5/PRTwqSciEow5mRGlQ3e
 IQLkp1E6+bzQAz45l0OLgqGy1efGirQzC+WqeXnN0QHzoCD8AHWWyyyVeRi2i4vKO7pPGL1Ferd
 70cW+fTUhkCPCcexhqxlpOg9/deXL+ZUQkZYwWTllJXr4s/ScunpBPuVTdSdwtmj24zxLUanE68
 Q24XAfD6dWy39++PbNMiDG2IKhZEj7+E35wNMiea/bCs6nfABTaq+GnsP8trCUgYCWPustGbIa3
 0Ndu3gguqWJe5n+/obRNn52EpMKA/4h2EBdj/lUMLF93wiFThFQOJORYGdPkGXTEeIiJE9plIph
 1PNzjmnZ2XlaELuzqF3Kn6P9TdmJ0KCNzPt7eJNXDYqCtNWico2lSTIMKHTSqi0+koysrBoKDUD
 wE5dsxCPqMNa9HN694DfHplr9MdVqa0ha21vP65dImd1EVXO9RxMV8SZeTxhHsDi/+G4y+jzKz0
 DcYbjgdWnZp2ffqyrWb7rG08vfzia7HTXwkLuyzfZM5nIETlSJzTaLgDUnhcGi8Q6k9fC9spEC5
 ltFSd5UP2hMXRTMGacLAo6KO9vm38nNx/CojEz7cdvSaEszz7TFeiUkPhZ7FI1EHrkLIOBVkbY4
 iadAfdlc5qYsQ0g==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Switch to Streams API with a single hardcoded route. This breaks any
existing userspace which depended on the custom rcar streams
implementation, but a single camera use case should continue to work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 47 +++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index e0a0fd96459b..20bd44274bd2 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1028,7 +1028,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 		if (ret)
 			return ret;
 
-		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
 		if (!fmt)
 			return -EINVAL;
 
@@ -1069,7 +1069,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	int mbps, ret;
 
 	/* Use the format on the sink pad to compute the receiver config. */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
 
 	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
 		fmt->width, fmt->height,
@@ -1650,8 +1650,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	unsigned int num_pads = rcsi2_num_pads(priv);
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_CSI2_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -1659,11 +1658,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
-	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
+	/* Set sink format */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	/* Propagate to source format */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
 
-	/* Propagate the format to the source pads. */
-	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
-		*v4l2_subdev_state_get_format(state, i) = format->format;
+	*fmt = format->format;
 
 	return 0;
 }
@@ -1683,8 +1691,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
 static int rcsi2_init_state(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	unsigned int num_pads = rcsi2_num_pads(priv);
+	static struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_CSI2_SOURCE_VC0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
 
 	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
 		.width		= 1920,
@@ -1697,10 +1712,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
 		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
 	};
 
-	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
-		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
+	static const struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
 
-	return 0;
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+						&rcar_csi2_default_fmt);
 }
 
 static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
@@ -2356,7 +2374,8 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
 	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_STREAMS;
 
 	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	priv->subdev.entity.ops = &rcar_csi2_entity_ops;

-- 
2.43.0


