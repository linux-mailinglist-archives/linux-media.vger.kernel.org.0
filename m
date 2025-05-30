Return-Path: <linux-media+bounces-33681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2CAC90C4
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27811C035CD
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD7423507C;
	Fri, 30 May 2025 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mOpFgMw6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88A4235051;
	Fri, 30 May 2025 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613116; cv=none; b=IMTw7467ygC2DVwzHvwCFa134Ggbwe+FFhrNJNvW/y+24G8jF/40m/wFhUis5smKbZO3K3r/jOaytn0oAOfD6EWe+aq3uoNfy1h643DxNejkworQmIFVuz+uyXAmTJpjhNam0+OViKTRy2eUraRL+TfsiFmydB8dfIjMcYXngZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613116; c=relaxed/simple;
	bh=AouKTtyjiq8170T9Uqjk+tvVIEns+KuUJ+h/sOoyHuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=smlp+opEi3k98fFTPKWUXXrbvIuQ6NCfaagzKPFCwzRrwOIHCX4PYdmvRiLj9UNikM+6Bh/VPxzdqCS42PSX+nbYk7TsnNK4HSHh1gTvU2UzS3Ge/oGcarqY14R6IZvcw4M2mMns+cgCIPtX3MUrt94j4To4RsECPGYZFMLzAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mOpFgMw6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4940D10C4;
	Fri, 30 May 2025 15:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613071;
	bh=AouKTtyjiq8170T9Uqjk+tvVIEns+KuUJ+h/sOoyHuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mOpFgMw6zyTFbffi1/zNt0eQDi8KeesZywEhUMkYrrFSRT0G1LWA7JOJHGfad5d4/
	 YLcko8/P2RArDAaNRumMsrHVXNMIOhgvfamuPuRuAWT9JbpIF+v31JyWwfkaU4Gd4l
	 QjsNv23YUgUqvhg+g+uhWMYQYLPzPz6EvtWQYBRU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:43 +0300
Subject: [PATCH v3 14/15] media: rcar-csi2: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-14-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObffkGGh49nv+2Ez1anfl08hAfLaOuq7abXTo
 OkjTZokI5OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33wAKCRD6PaqMvJYe
 9ZLyEACq/j86koNFkrPzR9TJfbgSuT0b2E+nOvwldERnbnTTuwzwUE/xcpSEIl0EUDrehnHIHsd
 6/AgjvNx5JzxeOxrGskJ+GsEnVQARpfTZ1/yfe2mBhVOqIHXYFQsgIP4Buy/0P66EkzRK2HAsYe
 6TDG0N6FJ2DczOx8+WmMjp4nDtKiD7pYs8P6YXiZVzbFSVTtZ8D+ylZvsh4xCgMu3A4Ixk6jWDG
 D3RtVYgHZBMJVSllk+V7xOY0Zwc+sQgt8F7yKWKM1Vux06raPO5JU6rpul9UwViULBv2dCkxz7y
 1WdgP2BAyJWysrm0m5l8WPQIY/KiwEPUOkUFnzHOlWiVlku+Lb3KdJBk5Qz+TD6aSJn834Z7oSu
 zUkC/QJjV+dTsQTSY10pgM+bXESsvwgmKZnCIlyj18pLzB/kDaQna3siYEKNIvS+GTU8l6IsqUV
 xH2D4yiOn4cWz8YF7HE9mvJkztJ/UEu9adHqCcjuqZHpHi9ctM3udhl4zYWORQGunK5k/wmevhJ
 IU2vx/KgCEIZHWeuaX/RixsvODPVQ2Cxy28ZbGBg6R3iVUgSrm9Eg5lBGJLHEQFlPGP7q6QKIyl
 afwa/V+WZxsXDAqWY1ZqddcprSVn7+u5yevEWMyul3/snOccu9cW4+u3rDL1KogSWar3VbSF6Z0
 WIkjWI7nlZw5i+Q==
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


