Return-Path: <linux-media+bounces-26382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74997A3C0A0
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E738518951AA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE2A1F76C2;
	Wed, 19 Feb 2025 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CALPf+Ej"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620451F5849;
	Wed, 19 Feb 2025 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973004; cv=none; b=G27niOCJ3EZvDBiS5TAKgcbC6h6+7oYN2kwi2Fue4d7ktyTf72nDvx7bpY9E/dhMr/T9WBgJFMBZjzDJoKU84h1He9/2SJVTvoA/5S1Cox5gAmh71WTvrqdgGeVnM2LVaLTKruN8sR2z9JktbgdxOyBUrAMinrglwkgHWXfKFR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973004; c=relaxed/simple;
	bh=JZv36af1jW5uhq9uaijH/ZEQNL7NFCncVCynBQYUP3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/K8dqhza/vUFNw4iVIhyjP+WiaNQ+1MhqkEUMJHpBNj5bPPwh9QOmCjlH+HiM0asna0pBBen3sBJnTXY3SwoVqL2dWSgngwdcVHbpcqmoD2rkTNl65+ZoaQH3nxHQWpxlslu/M4gQA6JsbApvGPbXnCD3xkVE1V9F23/Fkip74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CALPf+Ej; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 698251349;
	Wed, 19 Feb 2025 14:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972909;
	bh=JZv36af1jW5uhq9uaijH/ZEQNL7NFCncVCynBQYUP3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CALPf+Ej9dH0L76hkGAORd7E5YHtnBM7LtsAfdFoECgQ34Sj/jLa5vYLfkSOiBmSV
	 nM4FnH9CyzHMr5wcqmRwYrRzdCDLfGaFZCTDnVgZCL4UXGPzraUIi2LO8RQoxAw9n2
	 UKdVRfNtCoA2syqKFUBH7J1eLotfRQzXJBjhumdE=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:05 +0200
Subject: [PATCH 11/18] media: rcar-csi2: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-11-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=4215;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=JZv36af1jW5uhq9uaijH/ZEQNL7NFCncVCynBQYUP3o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFzSJMH1cGiXVYSjb23UJvk/F0Xz2gKI10je
 qih0J1i0y+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcwAKCRD6PaqMvJYe
 9dzrD/9CbbAqGM8SmE4ZCZR6ejOE5N3lBvUTZoOHhnEH4xI8EbBIn9x8FkNva6vjm7GPbhHrN37
 JUmUctUenKNLgAbMZ5uByW+wAPm+h0syCNqfshT4t9ZuL7GVc5eJ8sRcne2WpC9rp3OLYq9r+VK
 6i/yo0QXzHnPGbD6KQkZWSH1vxaKg2H01n9Jltr/oESKwDz4EHxepdaCNGMKqBCVA0haRlg3fjY
 9WeDBabKxf4OeySSq/iKUCImtxzf10oPEXWPWHobfS9ZP0xzxRrLl6ssp6n7yEFXHMvgl7xLhXh
 ZnfZiglbhjjlX30yqLw41NTmtl9V7LVm+UgZl7yxmCRaSWAWxMufwoc4FQdBfPxDAYuZvZPbQNs
 i5t3vnPSraH+ggb3FUkYhsMTXEpo/2V+0ZJsWq8o4lpQkFpkaNBNuvzjYo3SFhORtFRgDkRSGJ1
 Jwt+ZF8dhkMt1wE1uwM8XOSWXprjf9TCpae1LoxmLLdEKXlvkmk8iA8smkhXoL4tv6jlAEoaX+d
 2YoTA7jQ3mD0U5XEbJgt6ol3j4Mj5AXVevafat1N0J1Drm6uvjEFR5651gtVHdO2pi6UNsOGjbd
 WsxxfFZITwfoE6BwtLiDOoGPycsgwIq1NuTdjT7vho9ll0YDXvbfPo5yByPuttdiQzoV480vuLz
 6buFPxVs4csO+JQ==
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
index d6d5c18b0b4c..71836a9e063b 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1024,7 +1024,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 		if (ret)
 			return ret;
 
-		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
 		if (!fmt)
 			return -EINVAL;
 
@@ -1065,7 +1065,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	int mbps, ret;
 
 	/* Use the format on the sink pad to compute the receiver config. */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
 
 	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
 		fmt->width, fmt->height,
@@ -1646,8 +1646,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	unsigned int num_pads = rcsi2_num_pads(priv);
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_CSI2_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -1655,11 +1654,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
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
@@ -1679,8 +1687,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
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
@@ -1693,10 +1708,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
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
@@ -2352,7 +2370,8 @@ static int rcsi2_probe(struct platform_device *pdev)
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


