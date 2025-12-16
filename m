Return-Path: <linux-media+bounces-48908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FEFCC3ED6
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 795023029C19
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C6C359F96;
	Tue, 16 Dec 2025 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N9W/Lnqn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710313563EE;
	Tue, 16 Dec 2025 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898376; cv=none; b=jFzrlV1cv6LLafYqIUjnqTkSGqPxh55OHRWL8tqh6EX2E9Udvfy7YkZQvyauA/0sXH7DX+Ccuz3uAG8m5obzGm7MtFMfTzABjW40fcngnDjYlISl8G0a2vxA3FDw8P+RNipt0e0r4bOr9ygGbqRsGN9g6QesrkmbLR5WaHN50xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898376; c=relaxed/simple;
	bh=G7vewekPSB7oSmo9S8uf6r8JWQlmethAcjjPRfWZ67E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ng4Sc6vz/ZG8YnYIYva+3r6Zbl9K2XECblO5jLeRv+N2gL79Ne5DEnUGfWZ6pnzOwatkry8dR7Ba9xOWfvaYVzD4KtqmlsnJQmUrkS0Ip+oodmw2rio43WRF6J2bXPmCy1ze9TpifcNfb8+vo+iBCqcl7qwyp7IIMDP6tn2PDQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N9W/Lnqn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B767E18C6;
	Tue, 16 Dec 2025 16:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898350;
	bh=G7vewekPSB7oSmo9S8uf6r8JWQlmethAcjjPRfWZ67E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N9W/LnqnpUIFCqwUwJbZE6bT7VKkawCmPJoCClGmQTyS+aZPYGC5GpNbSrbbxLyCC
	 gormYPgbcKIhF0A0tAaCQQKUus1wyLEBqjMc/oD7V9GHzWF2WNSxmDIasSo8c/gR52
	 UIDhfq78uJQc+Q/l0tCightCoNQbYhkJQS1FJAk4=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:31 +0200
Subject: [PATCH v4 14/15] media: rcar-csi2: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-14-f28b4831cc67@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4411;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=G7vewekPSB7oSmo9S8uf6r8JWQlmethAcjjPRfWZ67E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhoQmkZAyhMgX0eyfIczoeEOvulPyragiWUJ
 f84fB5jfMKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4aAAKCRD6PaqMvJYe
 9b2VD/4oadDgDwoKICdOT9MrIoUTF/DOepId1aX2UB6tT5c4bOGK2WrXXCIw/QTl/ablvADNJK+
 R5XgE0Ay3dBJk3rBBUDZSYuUnjpYgXk57h1rQJhb3mBpiotiwbnPmcOmzjNf7cUdNn75UZHhTKD
 uM50+I4oxRILnM6ZASgxPrzr3/t/BqAuHhqDICuvhWTwPZiI91yvIB+Huet1nw57XI7vjbIFLQo
 +x6rLz30P1hIBu/5T3r7ZV5pYa+uDGZi1RDkkTY/TTPLAiNdRGy8vGyJcJeb6PEPElz33tZN7Pa
 5ASIM6a6vAh4kIx7npFykVSxp+AziO671w4rZxoQg/6zDU3NnxTNpENHUtLXrJE6kCXSCkGyvKP
 ksWWrWzJDf3JZx14QtN+dkJLORNbkRe1C9zc496YC9fRNkC7Vca7R4+2qv9G2ydSKuOHGAAkFqB
 0099pBRcGHgHS9QWfJU59zjwAWkWGnfG5DwylhHtDLW7WF8/7WXNzSrQ6ez6TZuGkA3gDN2WXZ9
 Nqwr6qDvdMcLsqT+tf00VDYSV7kcGoCgk5Tt9A1CPApttlpxnbHsfgfo8gtkKo8YB7q6U7RphY1
 XKLeMOmEAUYGUVSFZyUQoPg32mk/8Kj2sZ9XGihq6uxkPt2C2P7Hnv5bI15QKhrVvp7B+WgOdrf
 05sz3VtmFtazY1g==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 75 ++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 93f25fb3b82e..51d381cc647f 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -702,6 +702,17 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
 	},
 };
 
+static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
+	.width		= 1920,
+	.height		= 1080,
+	.code		= MEDIA_BUS_FMT_RGB888_1X24,
+	.colorspace	= V4L2_COLORSPACE_SRGB,
+	.field		= V4L2_FIELD_NONE,
+	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
+	.quantization	= V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
+};
+
 static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
@@ -1887,10 +1898,8 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	int ret = 0;
-
-	if (source_streams_mask != 1)
-		return -EINVAL;
+	u64 sink_streams;
+	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
@@ -1901,8 +1910,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       RCAR_CSI2_SOURCE_VC0,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
 		if (priv->stream_count == 0)
 			rcsi2_stop(priv);
@@ -1919,19 +1933,22 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 				 u32 source_pad, u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	u64 sink_streams;
 	int ret;
 
-	if (source_streams_mask != 1)
-		return -EINVAL;
-
 	if (!priv->remote)
 		return -ENODEV;
 
 	if (priv->stream_count == 1)
 		rcsi2_stop(priv);
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       RCAR_CSI2_SOURCE_VC0,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
-					  BIT_ULL(0));
+					  sink_streams);
 	if (ret)
 		return ret;
 
@@ -1970,6 +1987,34 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	int ret;
+
+	if (priv->info->use_isp) {
+		ret = v4l2_subdev_routing_validate(sd, routing,
+						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	} else {
+		ret = v4l2_subdev_routing_validate(sd, routing,
+						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+						   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	}
+
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &rcar_csi2_default_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
 					 unsigned int pad,
 					 struct v4l2_mbus_frame_desc *fd)
@@ -2045,6 +2090,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 
+	.set_routing = rcsi2_set_routing,
 	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
@@ -2065,17 +2111,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
-		.width		= 1920,
-		.height		= 1080,
-		.code		= MEDIA_BUS_FMT_RGB888_1X24,
-		.colorspace	= V4L2_COLORSPACE_SRGB,
-		.field		= V4L2_FIELD_NONE,
-		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
-		.quantization	= V4L2_QUANTIZATION_DEFAULT,
-		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
-	};
-
 	static const struct v4l2_subdev_krouting routing = {
 		.num_routes = ARRAY_SIZE(routes),
 		.routes = routes,

-- 
2.43.0


