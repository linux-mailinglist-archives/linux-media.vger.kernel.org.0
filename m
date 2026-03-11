Return-Path: <linux-media+bounces-55402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMrTGHt0sWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:56:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E45264E6F
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC8F43029614
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E71364035;
	Wed, 11 Mar 2026 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mUsQH996"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B00362149;
	Wed, 11 Mar 2026 13:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237253; cv=none; b=ttaBXd0OO6kYrFM0e+OHarllvxyhH/DC3x8jZ6DUpdsb2qi8DUkITfPKbDeokBw65f192O4oSUhbFRwOzpwGQ9LfNS2rl9QIACfeLdecWtQbQtWUK4+9u32AzdAb1V2MaFyyRXMgwBd+S67akhkBZc1MYmVZ6biiJDk4GHosb5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237253; c=relaxed/simple;
	bh=nxSpWhGGdK1V6xX1GVzD1gr52EzJI9+8vNCGE5j99T4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RsInV322jvQusTJKil1TOZ+8iba2Frmy4tRZHrqTrVxKYMnFTdDiMR0gjLTWRgDgKt7MHHrrZiELtIC9dBavv3wvf9YJj1TlAPTt6c2UU0RioH3KqabQ2+pIZ5f3fCGv+ZRVF8vMU4uDu/XsquYXw31prCzSq8ThhONL/mtm+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mUsQH996; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E61DC59;
	Wed, 11 Mar 2026 14:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237165;
	bh=nxSpWhGGdK1V6xX1GVzD1gr52EzJI9+8vNCGE5j99T4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mUsQH996O9IIIB9dxZ/AQOzOWT8WmclKGPjVHgUy0bkCSluwpVxZ+6JfA0Suadu7P
	 P8HL3Vt5Xc0igf7ph4oIBvYW15J+wT+Y+3e90YYGub+HlmqGO8DETl6fwuc+0tNygX
	 rQGukjPfXSn7uooEhtztUWVWS8BelUJ/eq7K68wg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:17 +0200
Subject: [PATCH v5 04/10] media: rcar-csi2: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-4-3e6c957d7567@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
In-Reply-To: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5121;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=nxSpWhGGdK1V6xX1GVzD1gr52EzJI9+8vNCGE5j99T4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPqBn/u/pYrIoavOmX7TEopTDr8Vtc1O1Jfd
 FgVg6PuRLiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz6gAKCRD6PaqMvJYe
 9ZZCD/0aHITAIqBi4G5zmYqfpp4ZPHa/UlE4BY7EhsBXqVcTW9qFLvyDiuSdNcCoHF9rSIY7aFS
 q1hrP7agNYuU6luEBMAeqP6X/XoBfvQBbyAFCBJckJ3xo9aJ+rU48FsQyp2O7CfGkhlNbdk62/V
 mHc/v4pJngQBRO83PkogeU8KI6hBNXdfw4XwuhPMMOXPEgtex0PV/C4O8MsEui8tph8y6iqfORl
 14zFE/9PX+qJh9K4uxeXB01JTSflxd+lHzQShS0EalMxKxCOXmwNvFIVRyRBaGZQvJO3rE5/LxG
 mCTne9bRlrvFuCE7vNtaImQAY535mc/PdZa1Xg2kT25pmpH4ZsoFF0kN79RaEDFJOHo4MjKsjwQ
 EpkElzpMakD6rIwiaTAD6P7YnRN+aQOh42KPbzBZ+5u0Ju5DWXwTJafaxx2a7QppV0tO12ke6+U
 n2avpv4Lt7HyEyGjdOY9NvSkPeeAOS2IXvMHwfNuHwCMoY5G/uAPxSG1Ea1EVizyvrEq6cCb2kv
 Bn2iOg86ZkSRBXJqUiUZHGaSrVlQnaaXUEJqLaXOV7sk60slcwl8w82ixI1ObusN2o63uKcNuNy
 INc0nbu8aE426rIEtnezFOvQJQZirRHI+tXvmL/M7+AQ1gaqm9nQKB/PNto5JraV1Dems+K/4xg
 3Y73IE7YKcxnXxg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: D1E45264E6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55402-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Switch to Streams API with a single hardcoded route.

For single-stream use case there should be no change in behavior.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 64 +++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 158fa447e668..ad62c95c8f9a 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1023,17 +1023,24 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 	 */
 	freq = v4l2_get_link_freq(remote_pad, 0, 0);
 	if (freq < 0) {
+		const struct v4l2_subdev_route *route;
 		const struct rcar_csi2_format *format;
 		const struct v4l2_mbus_framefmt *fmt;
 		unsigned int lanes;
 		unsigned int bpp;
 		int ret;
 
+		if (state->routing.num_routes != 1)
+			return -EINVAL;
+
 		ret = rcsi2_get_active_lanes(priv, &lanes);
 		if (ret)
 			return ret;
 
-		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+		route = &state->routing.routes[0];
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
 		if (!fmt)
 			return -EINVAL;
 
@@ -1062,6 +1069,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {
+	const struct v4l2_subdev_route *route;
 	const struct rcar_csi2_format *format;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
 	const struct v4l2_mbus_framefmt *fmt;
@@ -1070,7 +1078,16 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	int mbps, ret;
 
 	/* Use the format on the sink pad to compute the receiver config. */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+
+	if (state->routing.num_routes != 1)
+		return -EINVAL;
+
+	route = &state->routing.routes[0];
+
+	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+					   route->sink_stream);
+	if (!fmt)
+		return -EINVAL;
 
 	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
 		fmt->width, fmt->height,
@@ -1892,8 +1909,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	unsigned int num_pads = rcsi2_num_pads(priv);
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_CSI2_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -1901,11 +1917,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
-	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
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
 
-	/* Propagate the format to the source pads. */
-	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
-		*v4l2_subdev_state_get_format(state, i) = format->format;
+	*fmt = format->format;
 
 	return 0;
 }
@@ -1925,8 +1950,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
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
@@ -1939,10 +1971,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
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
@@ -2599,7 +2634,8 @@ static int rcsi2_probe(struct platform_device *pdev)
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


