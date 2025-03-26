Return-Path: <linux-media+bounces-28781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C74A71581
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B985189AA8C
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4171F4629;
	Wed, 26 Mar 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gsLN+Ddf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC51F4194;
	Wed, 26 Mar 2025 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987446; cv=none; b=IyhymHghEgsfVq+5W+Rzu55VGEMlw6jfY3wwqZ4Gdf4ZYATSSLn8XWtoQWp6z3UHsP+THcP1BCHoS2CPohj3MK9m4n1I9LeyF0yE9at9zxJq0WkI4yhpmKTG4+Rwe0TFe/CkaxQcDB2A1sEq2QBBdAuv7UYDSAyW16sbt5W3F9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987446; c=relaxed/simple;
	bh=AouKTtyjiq8170T9Uqjk+tvVIEns+KuUJ+h/sOoyHuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Di1GnmD+QbGp/M/y52egLeL1DnlyDW2QhrSXTiiLCCxlz0s2BfJqCrPZfXsWzfOnJe/p8GoL/dgwkHWIZ37oOCewAdfiEkLjb8MmlBSfKuE8Jwv4pPJ97mIA/ynPBFKoBtC9psb3VNoCRV8gIbujGwJ5onjOUs9IIsD3guRcU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gsLN+Ddf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4E4D1F1C;
	Wed, 26 Mar 2025 12:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987316;
	bh=AouKTtyjiq8170T9Uqjk+tvVIEns+KuUJ+h/sOoyHuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gsLN+Ddf37+AnUwMzQWylJNMGXWqgPx3juZE9T/26dufXtCn2j7hJVn55BlSK7wMn
	 SLu9ivuWK+xx5WP1Wm9iQB1RquIpY0kLKxYWXTkwh8ucFhhFYcxnz2x3UQ41IctZHT
	 +gRT+lQvwe5HfcScda3s8ysI6e9+LOrnxRPF54u8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:36 +0200
Subject: [PATCH v2 14/15] media: rcar-csi2: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-14-d0d7002c641f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=AouKTtyjiq8170T9Uqjk+tvVIEns+KuUJ+h/sOoyHuA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CUXlUDGfuY4SDfPIFYuT1FKrHh+qWCZjoa5
 g1lkpk658SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PglAAKCRD6PaqMvJYe
 9Xb4D/0Xj9Ik/1jpkJJVZqlh5Nkl1Es/SCcglgrhyyDsAaPdoN+JT6Xf47QBYES/rmrLGtGtZdn
 rH0OtZnobKx9Aq/hwevw576IASCQHKVywqoyJ2HHbQnwHpugGdcqWeIVT7cKNYZyIa1jFP3jgMl
 0YrabVnIFAfwCinecihAzHS6VzCW7eMl04R24efwnaCLH5xvLkcyF5A2ik3+UL7sAcMtvO2ca1W
 4PZq5iaYrQXFwycAwSSrSxZsBVf5odS6CppUdGWZV/VVUPLYY5LPJxCATwg3GvCBNIk2V6pqvcS
 q961R8coPZwUJE3lkG+cBenfPjG0YV32PK+H1QEx3fhizHpyK1MUXAE+Jmr8/Rw3DEi3pv0dfEe
 udyCWWTXH8K4ibzI6IxLA22WStk33k02+/GRJ25eVU0ZUwlhPgSaOJHMoekYmVpBjhDp0ueaJpE
 rIMwQ0lRyPZxpPSj92onA8g98BHippvv3A7mtXLTZbxVgAb8LuyMm9WLVUhhX0jmna+LaV5zZ2h
 19W4B7vdqqNa5ducTei9LipADPPSI668saLBQTpJjIloQ6yKe9BK6maoTOhg8aolzTCoxDU5DFm
 3iLJDon5aJXpEbvEuQGli3DsoDPR6F22nFCJ8VjNnr005w5M+z7T+UZpGNW8XqmfjmEBNunhUfS
 89zhVr7wUbHwawg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 85 ++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 8f708196ef49..4a73d223229c 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -694,6 +694,17 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
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
@@ -1641,10 +1652,8 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
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
@@ -1655,8 +1664,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
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
 		rcsi2_stop(priv);
 		return ret;
@@ -1672,10 +1686,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 				 u32 source_pad, u64 source_streams_mask)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	int ret = 0;
-
-	if (source_streams_mask != 1)
-		return -EINVAL;
+	u64 sink_streams;
 
 	if (!priv->remote)
 		return -ENODEV;
@@ -1683,11 +1694,17 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
 	if (priv->stream_count == 1)
 		rcsi2_stop(priv);
 
-	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       RCAR_CSI2_SOURCE_VC0,
+						       RCAR_CSI2_SINK,
+						       &source_streams_mask);
+
+	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
+				    sink_streams);
 
 	priv->stream_count -= 1;
 
-	return ret;
+	return 0;
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
@@ -1720,6 +1737,40 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
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
+	if (!priv->info->use_isp)
+		return -ENOTTY;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
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
@@ -1781,6 +1832,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 
+	.set_routing = rcsi2_set_routing,
 	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
@@ -1801,17 +1853,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
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


