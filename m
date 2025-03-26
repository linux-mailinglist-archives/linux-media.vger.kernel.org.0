Return-Path: <linux-media+bounces-28776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63181A71571
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4619D1783CF
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D769C1F131C;
	Wed, 26 Mar 2025 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WcpWcHez"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64C31EEA34;
	Wed, 26 Mar 2025 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987437; cv=none; b=G37DX3L5dBNfTCogC97GHch4J7Kt2E39e9hyzlsP2SBpKVV21DPk5r3MUF5NGJHNwnQFiMMnGyu+2MaJkmDK26Woy81q6L9qRDbqVWPOS9srTceam5tgBeU+cYu0ca9cMYjkzJaZf9IvI1GYTWzZj/aSkdbDtNOtoCg3UXaVjjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987437; c=relaxed/simple;
	bh=m4eAQoWiz6TenXAjyN+I8pDhDV1KbKicqLmlxA8ZIe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC/17LvTnD2JorcBABHpGDc/GSzrLukc8awaUPrhn6Upx4dnTCv7gYv8eb1cKp1KaVq4W7uWsbeo+MctgKU0vz5GSMOiG735z9AuRCOfNE+1T+kLi/cbZBlZPn7R4g1wmyLnEV+G3b+yhhxlF5n7PhqUQVr9YZPfG19cXDiU6ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WcpWcHez; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32BB91963;
	Wed, 26 Mar 2025 12:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987312;
	bh=m4eAQoWiz6TenXAjyN+I8pDhDV1KbKicqLmlxA8ZIe8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WcpWcHezoQilZY2T747pv7L92dtiRj/GB0HOEFeuP4HM/6XpHHOQYo1h6MqyRd0lq
	 A+kbSv9UKObztHxnQOQMvk2FOBCr9ID5wT08/Fy5fJR6WLWinvD+BdKbfUAwGJTGN6
	 EjLTdP0mj4GsoUqwoIp75AxU0QrRTtuAOSH/p2HQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:31 +0200
Subject: [PATCH v2 09/15] media: rcar-isp: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-9-d0d7002c641f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4119;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=m4eAQoWiz6TenXAjyN+I8pDhDV1KbKicqLmlxA8ZIe8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CS6urPgqIDtdgMzQttkgqxqbmUWXRAWZphv
 mXvP3+tcC2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkgAKCRD6PaqMvJYe
 9SvLEACXQeVyyaFk9inXdLQ8EoitRS5wRwM8otc3zz9tcoXNLZknLVvbUcuYcl9u0YVGpjEzo39
 aHGQ1CH1KmadmPnmz5sQ2fVu/P5ltErOmEa+0K5o33L7A92UXx3y9ud6OsWMMu+dPWmej/hmn5r
 oNh6dvfUuIkWEfxAAXXYUN1xNHGJSNhfdmTsL12XZ2VlNTQ/JUKMKeRvU6l60A7wD2+7OPJCoeg
 t7/khxOgF3P50/W4dhRqUdQzWECCN+MlMWaZCrUkkfYK9bCfPm48G00Swg280G7af8FlbGFJ1If
 5OeK1R2hAq/CbqtByTWTtKwyiKNn8avrJl4KlfuG6jWSHTbwsnxbNCIRGQTrrCcRnSYXTVkXEER
 zvNcfWn0muYGYD7L1kedMS9B/ptxZqlCvYefNMKU29wIdUy/Nj1wvumyYzBzmE6xMBPBf74jHf5
 WxiGJCPFgTf0n2STmsQxKF/w60NxxafGMf13cLqfqRKEbWgrfnqzfoXvdvUhWYsw4AzQkBtZzoy
 3h82jr3P2L6aAVWXsGcwBOOPe2WPmy89bGLCAUvJZqsW9fmCUfzrwb/Jrbgbjqlt2P2ihU0o2bp
 SGU5le9odgQ9rlJNtik/FspZM3lEsuugenS9wRS7BOKac9kkmFj89MKDwauwLrYt3c8IzkQTMGQ
 CMZO0Yn77ob6K0Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Switch to Streams API with a single hardcoded route. This breaks any
existing userspace which depended on the custom rcar streams
implementation, but a single camera use case should continue to work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 62 +++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 8e222c9ec604..5f3fcdb7e37e 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
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
@@ -222,7 +233,7 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	u32 sel_csi = 0;
 	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK);
+	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK, 0);
 	if (!fmt)
 		return -EINVAL;
 
@@ -336,7 +347,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_ISP_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -344,10 +355,20 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	if (!risp_code_to_fmt(format->format.code))
 		format->format.code = rcar_isp_formats[0].code;
 
-	for (unsigned int i = 0; i < RCAR_ISP_NUM_PADS; i++) {
-		framefmt = v4l2_subdev_state_get_format(state, i);
-		*framefmt = format->format;
-	}
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
+
+	*fmt = format->format;
 
 	return 0;
 }
@@ -364,6 +385,32 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
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
@@ -510,11 +557,12 @@ static int risp_probe(struct platform_device *pdev)
 
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


