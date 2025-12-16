Return-Path: <linux-media+bounces-48904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1ACC3EF1
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0718B303751B
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F3A354AF6;
	Tue, 16 Dec 2025 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tJIu2sc6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B91350D52;
	Tue, 16 Dec 2025 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898368; cv=none; b=bQLw8v7qRuqvg9s/DU7V85FzLKZtT4KVbEWse71BXmPa0ixgtQFXQJeXRMX7zjEOIGMqe/qNGqSgmFEjN7zP2Gp9UzMoMVfoz3pCxDtTtp/uQy63ASM93CyCUjPk3tz+q3jxdCV/0aNyNy/kqe0fQmDKVAfywuYZHyf95cZWTww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898368; c=relaxed/simple;
	bh=mZWCoESvX+k2ae2+IKwq0Qo52nPIskYlapwxCMGA4K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZzQRVUPBalA+vVpgKl3d++WFB5yHjkoeSzLtIQ2FPC5eR8okpidgtqPGxXiqnf6bWkYKpC8NJn5R8Zfhgqv8BpGpCGccjik+IXUg7qaRuQUVkm5WZOfUw7ur8VhPkomNYWFZyx8mfpYaww5iHTj+ncL7JGdTez6DU3kIvp1QW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tJIu2sc6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC9E91693;
	Tue, 16 Dec 2025 16:19:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898347;
	bh=mZWCoESvX+k2ae2+IKwq0Qo52nPIskYlapwxCMGA4K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tJIu2sc6e925ip15/dp4eMmRALPOMD1cSpcKpDeaBi4TTuPKSEjJsRxvugSvyvagZ
	 rWcpFrPF843Nf06z0mbtzjwgFmLjdlE5IGite7mQPDwVpRdHfUvMyhC8Noqf0KIyq3
	 qF8Oym3RvYF11+Ljd1FwhjUsCCZ6FlTLiqh1j81E=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:27 +0200
Subject: [PATCH v4 10/15] media: rcar-isp: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-10-f28b4831cc67@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4413;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=mZWCoESvX+k2ae2+IKwq0Qo52nPIskYlapwxCMGA4K8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhm/a0/PYdUHllsTHM7Abd6iT/AQMGZZZlQt
 /98Lty2XVKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZgAKCRD6PaqMvJYe
 9Sm1EACe8bxatwkmtAfyjRKpJCLZW51Pc12/wKyMs5xr6Br5UInbCzukYCzhYGzukPDtlgLfTEf
 J2puGdsdFm4onYJjC1nf1m5m3N1hc3LHIhxdgXc1pg04yn/LBTGdkjHW6R0kknoWYg1M19JyAf5
 nkWiNw3DEPpbOJq6ALfymFTvKqgajzowia04k3UC0WaHXulxzongwgZHq5qXS3HMPJQXVFb46N2
 Gxi+9CnpDDjkEdttIM9r69pZ4BAj7YqwIMcB+ZnWtf/Qf0u021tJcAhT8v1KutDDiiLkCWJ3652
 +Qdg4gSrnQKIhGjaprGRhZK14wcRLu6ByhA4IH4f3H9VJfYfI75gmWW/kS+8436svj9t7itX1Rr
 oXHwVTgNsfg8Uk96kiffdp+b8hNwVyAXk72GKieyGt+IjgiElkXNnjp8Sk/wS0CFTvKkTMzhE+f
 mpDFExCO7PsMkEXSe02Fs7B/W1KHdVu87ZbbfXyogYARWQp2kI09XEhx6nhZZQ2S62A455Yalu9
 htrDBH8mYK4II8Xgi5oRVM85nm+jFq8oJz6mLb1w5NRDXMXEaKjwrhSPVAjfXPzOIwdjx90NEGR
 hdQ5xNfi054XMzsGDW9FNkENVCbRGoJLp8E25DsqcikRJBlk03fzahnWtghHWXxmUDEMfkehO2M
 yAYg7tOLovjl5pw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Switch to Streams API with a single hardcoded route.

For single-stream use case there should be no change in behavior.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 69 ++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 58a9a3bd9f75..8ac45516aa39 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -124,6 +124,17 @@ static const struct rcar_isp_format rcar_isp_formats[] = {
 	},
 };
 
+static const struct v4l2_mbus_framefmt risp_default_fmt = {
+	.width = 1920,
+	.height = 1080,
+	.code = MEDIA_BUS_FMT_RGB888_1X24,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.field = V4L2_FIELD_NONE,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+};
+
 static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
@@ -216,13 +227,20 @@ static void risp_power_off(struct rcar_isp *isp)
 
 static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 {
+	const struct v4l2_subdev_route *route;
 	const struct v4l2_mbus_framefmt *fmt;
 	const struct rcar_isp_format *format;
 	unsigned int vc;
 	u32 sel_csi = 0;
 	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
+	if (state->routing.num_routes != 1)
+		return -EINVAL;
+
+	route = &state->routing.routes[0];
+
+	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+					   route->sink_stream);
 	if (!fmt)
 		return -EINVAL;
 
@@ -341,7 +359,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_ISP_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -349,10 +367,20 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	if (!risp_code_to_fmt(format->format.code))
 		format->format.code = rcar_isp_formats[0].code;
 
-	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
-		framefmt = v4l2_subdev_state_get_format(state, i);
-		*framefmt = format->format;
-	}
+	/* Set sink format. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
 
 	return 0;
 }
@@ -369,6 +397,32 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
 	.pad	= &risp_pad_ops,
 };
 
+static int risp_init_state(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	static struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_ISP_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_ISP_PORT0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	static const struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+						&risp_default_fmt);
+}
+
+static const struct v4l2_subdev_internal_ops risp_internal_ops = {
+	.init_state = risp_init_state,
+};
+
 /* -----------------------------------------------------------------------------
  * Async handling and registration of subdevices and links
  */
@@ -526,11 +580,12 @@ static int risp_probe(struct platform_device *pdev)
 
 	isp->subdev.owner = THIS_MODULE;
 	isp->subdev.dev = &pdev->dev;
+	isp->subdev.internal_ops = &risp_internal_ops;
 	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
 	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
 	snprintf(isp->subdev.name, sizeof(isp->subdev.name), "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 
 	isp->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
 	isp->subdev.entity.ops = &risp_entity_ops;

-- 
2.43.0


