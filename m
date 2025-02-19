Return-Path: <linux-media+bounces-26388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A711A3C0D7
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5864B3BCA37
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58561FDA8C;
	Wed, 19 Feb 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="neEZaQUk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBC91FDE38;
	Wed, 19 Feb 2025 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973014; cv=none; b=XHTWrpsXVd3/cTFHEI38LXXMdWhiP90AhIdrc12YKflFDYwAthwP7AVhEYxzoRm3QeOftQABIoaFctBrbqPFlCp1oB54ap1wZ6TtJ0zsoon9/K9z1rR53ERN+z3HfgCR37V4pfBpQEPXQCsCXhO5ZkkoVeh+eI3ppmBSh1DRkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973014; c=relaxed/simple;
	bh=MyVXZINKxIvzpHnwFdS/BFqyvn30vZ3xOm/nU5P+/00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kef7+4W1iUohCgpeUJ/fA/nmrfN4N8KZ/QWtqxtcgJ64hpGEqlvBvdc1NiffxW+sRWRmE4Bd40c1ytvh1Xx4sF27Q2bMs3y87kxU6fLMNtSBNoxO6DrlGOEtyrY7b6LADupXyJPAjkb43tf3xIg0kcoEgb7/mPXi5EZSkRFZtRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=neEZaQUk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD6EBBEB;
	Wed, 19 Feb 2025 14:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972913;
	bh=MyVXZINKxIvzpHnwFdS/BFqyvn30vZ3xOm/nU5P+/00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=neEZaQUklMI7QdeoSbtQsMDw3EQjfkBzIQqkKzyvA7tSST2bSP5Vzpo8hEcosGHTX
	 quXDeeK0NNjuay8wMpzJw9EnyQK7dZyaLys+7ygr03E78tK2HmcdEB6TtjE9mFRWbp
	 8N7qUeaPnXFYGCdjbZSRO2/vAdprQk4Cn6MUIQ7E=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:11 +0200
Subject: [PATCH 17/18] media: rcar-csi2: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-17-f1b93e370aab@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=MyVXZINKxIvzpHnwFdS/BFqyvn30vZ3xOm/nU5P+/00=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteF1LVFL86/nvBCb21LXia4UcDTIt3q+PeWQy
 vBlof+2bI+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhdQAKCRD6PaqMvJYe
 9TCmD/wP/sIBxz3R5oyDTgEOqI8w+LXKMWVJxKzauy2x2smvUgsCgI3LhH+NQEa30TpSbmHfkX/
 8SvBT+YZw1GjnYjPUoo3WqhSDgqusdh5xJnfrnnbOdSZlZvz3lUjlnhp+DxbdW8Fkonddxt8ns3
 CUQoR77WPR6/YxjLqN0YfSb4RlQOswpr82a5AxvhGqE8rzS+kP1HZWHWLAd8jGj/i3FRpNgs4l/
 9oHfBytliOkOHDP/xQmaax0OhIiYv4Fj2wH9ivpmkNjcPv6vL3vivtjpDNEuUzx8bQHp0sN4LAZ
 h1tpKobaO4/3yzs5GA1R1TtAxWHRGpi5+aAO3zYGxCZLcBDQ4dd2X8T1HcoBBGqnGjv3bYDvHi/
 yqPfWIuNEmnhTIcbBNjOk8IQvgJVTIoJVbsAACsY3EM3XC2OXOo9Uw+eRXas+JJx3x6cS7luYvZ
 E9Lc8ggjoA4yp3LwhfCP+mcFcP/LHvlJeXf+esY7TbQGuizkwPUf1Xm2fRHXI8rMNTuKft31j2p
 neVHjS8Ih2/OiOt5U3nP7l4leK1aWigecTFx+0h9fGguQdVgkTJ6AlYM0o97j23rYSzw1KD9jxT
 03mlVIaLuyylM0TSXQcFFAlv64G0r3YSDuSZUR28l4aeMFnxJVsXfvMNMObrkcIIWcRkNuwz/Bz
 WYlgBDAld3RQxlA==
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
index 627b116a96c4..357840753601 100644
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
@@ -1637,10 +1648,8 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
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
@@ -1651,8 +1660,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
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
@@ -1668,10 +1682,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
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
@@ -1679,11 +1690,17 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
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
@@ -1716,6 +1733,40 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
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
@@ -1777,6 +1828,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 
+	.set_routing = rcsi2_set_routing,
 	.get_frame_desc = rcsi2_get_frame_desc,
 };
 
@@ -1797,17 +1849,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
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


