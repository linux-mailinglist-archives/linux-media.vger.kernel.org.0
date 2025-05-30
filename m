Return-Path: <linux-media+bounces-33676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE47AC90AA
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAF78504487
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3F823184E;
	Fri, 30 May 2025 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nPK2bYbO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793B230BE6;
	Fri, 30 May 2025 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613107; cv=none; b=qShz7ohhRIM7iaA1heZ5W9G4LWMe/NsVgGQX46Upk74lJdU+Gs0KrGI9Cxg2S62Zm2fiqgUKcsL82nYR3PGq0TyTHAQ7ikkIf8yTQdabmDdLp72FB8Lx7yT2TC6+kJbtrFlbCjN/anjc0z/NwdH11EN/TVZ/VyJVUzrxFkyF5Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613107; c=relaxed/simple;
	bh=GDkHInsCsrgA6dV3ADS50B1/4imFLWM9R7kKfBD6saQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbfclQDFlO3QBad8xmwUi8Vd/Sf/Bqa8ejU8y+I2RIBKFe/pgnIGDEIvI2yXC6Q4Yy0wwLX4TyXO927bWzWco6jKmJr4EcWMFQ9PdBvwogdjcrzrhx7FdPt+P4HvzqwHSt4hprLh3WzWsTaMB/cFk73t+9fRjy3lbjNudFEx7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nPK2bYbO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9725DA44;
	Fri, 30 May 2025 15:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613068;
	bh=GDkHInsCsrgA6dV3ADS50B1/4imFLWM9R7kKfBD6saQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nPK2bYbOFZjZTbWy2USbJN8NMdfAJTcsA5sIg09dUZAcXpcd+UBNt2cHaF0kMXIap
	 zc4xWHQzisC/YQFbEHHlNnCehWI7+YmP6Tt9+GqE33hg85m5qA/JloSz/uxXsYFV1/
	 r8KcEjvSPqGOO0tAYVNhcbIrW1gSyfVZyqGjZKeg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:38 +0300
Subject: [PATCH v3 09/15] media: rcar-isp: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-9-026655df7138@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4143;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=GDkHInsCsrgA6dV3ADS50B1/4imFLWM9R7kKfBD6saQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfdhx6N1ETTN9fWGek5cRSuEzkBsYcHqHG7p
 JeE1SKM1WuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33QAKCRD6PaqMvJYe
 9SoREACsx7kAjQmaEesZuwXr+wb4nvgDXlPk7m6P/5Ol1fYH1NxaoWpHmAcyTERXvswHSsI/T4X
 MClTMjQq5cEy6O3s5ULVLl+pxU7kNF/e6H2Nd7IEIi18gVaSQekU1H3jFEsWuhXBRV0r1CLs24J
 QDU2fShJWGXBhtt3lNCd36I5geeqqm1N2QSRd0sBeQ05J63yOl7l8JK4L+bkl7+RlFSX6ONkULu
 MAvvyV9HlFQd2S0QbQ/qtDPREF2W1kXCXQSmmzmuL3rNjj/roxUzdlaE0kbyttsy+R1Ue2PwwYm
 cvGRAuRcbu75prBRiN/7o6OM5bYESysdD5wFbg8uD2PxEbzqbAbjHCs2bIOt33h96BxxBTmgZ+X
 AcrZA3Dk900ryC136tFTEhpYjDhJ1E2e5SH1KPpbrjzLTN14SbrhNpsqqvBNJzahnzXwyOc+d2v
 BZHQuJcGkTEMrzuIAv6iVPlIwKSJX4ac7nVlA9V0f88FOt4bscqRS6YYbvL+ZA/RA6nFtuik9B4
 rPan/2X5YXqV4BG1rUWAnigTDAfrelB6VpiP9EPj77QOAJkydt03U5b23Y7BsZCfjBSRGQwe5Fw
 a/RzV1onzW43xXQXdgk6dB56VwJNcqJ4B1cQL+XWGyoCW4+rTvFvXBFfRt0DY9YJGrgMxcylZcF
 VSo4hEbyGcfrqyA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Switch to Streams API with a single hardcoded route. This breaks any
existing userspace which depended on the custom rcar streams
implementation, but a single camera use case should continue to work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 62 ++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 2337c5d44c40..a04cbf96b809 100644
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
@@ -521,11 +568,12 @@ static int risp_probe(struct platform_device *pdev)
 
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


