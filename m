Return-Path: <linux-media+bounces-65110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CRaNLUWNMmrl1wUAu9opvQ
	(envelope-from <linux-media+bounces-65110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:04:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2122769976D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:04:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=XBRodase;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65110-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65110-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21BB331964ED
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7A13F5BD7;
	Wed, 17 Jun 2026 11:56:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD13F5BCF;
	Wed, 17 Jun 2026 11:56:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697372; cv=none; b=FTKKlIjCNXgsGspXhbe4tXpjsHpcr1rgmlbkmAAAHYRxP4k4ro3eTct/ErfGYgXC1DhB0okbvRNXC+cFhcMKtd840j3RTku9byqNIYQNivrihTaR3YU6ZlzNcz2X/g0DSEHnlXrFG09e3R1gD0hCpj2aqCLl7BaerzzlKlxH0Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697372; c=relaxed/simple;
	bh=6sHE00vbDvzvrybHQclSR6qWqqhtviFdFTBgc5dIgYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KE9l7JqCUHPKB26NWHYDSLlbT7ECAW/LNSqVyFvADMhKW7dsXwfCmO6t0qyzJqposn8T2WSKRZ1VrK/68NCFPNEkia6tYgBeeL0gEbOdPYeV3w++h5PAaDe0j/yMGT4k+CmhfnvbWUkOpVBuURCxsLRA17F8TRtLAUlfqQRErlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XBRodase; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6587518E9;
	Wed, 17 Jun 2026 13:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697321;
	bh=6sHE00vbDvzvrybHQclSR6qWqqhtviFdFTBgc5dIgYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XBRodase4zRAh1axK1oCitwH9puPynRJ8wCQbB33Kweftix4ac7UEU0muondnFp6m
	 W7z9uapz5tJl4wxnewWm+1tdAfdCtU99ign9SBtneJbN/51SmJFUYTandPhKjqFHJs
	 wYCct0fbVIbG0T0abKfkfAzOKYGueXr8SpaZRnBI=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:54:58 +0300
Subject: [PATCH v6 05/11] media: rcar-csi2: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-5-1260eb72dff7@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5188;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=6sHE00vbDvzvrybHQclSR6qWqqhtviFdFTBgc5dIgYE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotE+5XiH48zvOMT+Ws2VpWXRzXys0wFe2cWe
 7Mny+iC1ieJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLRAAKCRD6PaqMvJYe
 9flQD/0RGHQ7OXugT3lskQHoLsZJu7Tp+zg2e0MpqoMaw4+uBvKiMy3yXRan7MG4XDRK9ZkD/Qu
 BO7TUIt8yooXRoO4PIIb6lIdErL0vJIy9oG4iWClnyTPxvJs8ce+yyNhU7SvTqUHTprTznTFwEF
 Y4KYP3QfSAzcDy36shEMbvYEMSTjy6ovHBc5elZQiwY1PQCLvi1V7hi/+Or+L2O/SkBetsg4qjX
 A5H88j3cqkbcLzdkG07hWmjjTbO1SS3gPDyu0B8GJW4QQSYkAPFJri2WjPvtaZSXPCrxj20wJBX
 hBXzfOvghOLPtl/S5vr+T+4veIQAzjVzRExqw2XrmkaC6Ogd7ta2nOS1u3EBrV3hqPbPzXDynR8
 2xZeAAMiDm2vq/9jLFdksipNzI8tflQt5kCYWdIljPrGtHEGTUZRq9Fqy6lKWWC6bhWaIWZzi/S
 ISwgmyzHGNtValGvTLZg7fmarXekLVpbIrRKMHoG51cXdqJQP6raHSqs/uZVXHZT8MmpEvlqc/Z
 CEcf6hz2zZYpQ18niH+7uU96E9i56RLwMZI3sTCng2mCwPecv8jGNPn30DAXSs8nO/pitlges1e
 /ZBnxqtjbfZCrs3y9ZGmh8y7rg+kw8z99Auz/IvbAR/RUpRg+xMf1h2fxgTZv8w13i9DHqTZQl5
 0FqPhzYdK5G5F4Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65110-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2122769976D

Switch to Streams API with a single hardcoded route.

For single-stream use case there should be no change in behavior.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 64 +++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index f5d8b06dff51..91f713e1f8c2 100644
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
@@ -2629,7 +2664,8 @@ static int rcsi2_probe(struct platform_device *pdev)
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


