Return-Path: <linux-media+bounces-26384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F3A3C0CA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0E03AE65E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484AD1FC0F5;
	Wed, 19 Feb 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dmM1/pYd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0AD1F8BAF;
	Wed, 19 Feb 2025 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973007; cv=none; b=qo1FJAGhmCyyLsQ6D7k9c3ku2CYsikfqEPHykAgirxlmKJkdi3zDrBsfdZXjyoEeTJpTH5P3zW7vFPndvstD9AMn5oFHJsAOorlHR4r/mstWPlSB3JTUBYG5kpDJ7+dbs7TujKrfm/2uSpq5YeZ3IzsQO7pUDgKCbyvbdADMrJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973007; c=relaxed/simple;
	bh=m4eAQoWiz6TenXAjyN+I8pDhDV1KbKicqLmlxA8ZIe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXxnPcJ5dwF3NAvZBiXVTV5Zyj6hEzXmV79TGUhJEglhoc9bJfmAO9DVqVKSzcTAzFUyLe9KeQeJKsE0aV9d92nP4xkigttS3O7jB37bsElHG8Hw1lvITmQcgGnPcNmswC0Lc0vVTEx3v5QjjyeIR7ZQLTUWC8MzCR5E4MSq+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dmM1/pYd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 298E7193E;
	Wed, 19 Feb 2025 14:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972909;
	bh=m4eAQoWiz6TenXAjyN+I8pDhDV1KbKicqLmlxA8ZIe8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dmM1/pYd9LzPD2hBu4BNHrjVXWsK4oVD89UVBDM2nfIppNcfN//LpAPVmABLcQSq/
	 fFCShv647peKn+/YTstHwRmTMjo7BIbGzZw6jh+CIhQGbtoYTgjgiN6QIKXcZ6eyWC
	 BZWjPZzryoUh9G6RrioCRxxobX57WNVjMKTE5K+Q=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:06 +0200
Subject: [PATCH 12/18] media: rcar-isp: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-12-f1b93e370aab@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4119;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=m4eAQoWiz6TenXAjyN+I8pDhDV1KbKicqLmlxA8ZIe8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteF0BPuDAkU+raNhMcx+jc51L44Ey/A+MNFVu
 zfWyg/JlsaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhdAAKCRD6PaqMvJYe
 9RRlEACWTyfywoNncmwtz7mPvXiDfXr4XAStp39UJ8yFdhZeqgSvjx9XbsfQozgR9WjlS+HhKE4
 BDKLKcvYCuMGV74k0hvmcclxBDeHZ4XJNpYKacsz3UQfBvpUUlT4P050Evpy6nIHQUM83IVLVfa
 GOQzUDNtGowv5/C5QWa32nTxqzZbRQakmdcy6mS7KfSzZ5qgr/fVG4VGxaMxWdPlb8vBooSgPzp
 4pNgwfGxKB2Kyekotqpihpo3cEE4f+j0A8apNC9CeVF66OO61GieUiESULDfwxTBiR34X/nNbO1
 MQ1TXanB2bmteMiHxjb9dDZNmVxIH2YY8baKA4cNgxZg2PcbreULIhW3uu+FAIo2LcOZ8c74OUi
 bJW1yKsnlEgGmzSVY3KwK6UctzQtPmsokzvU9vgvN0GNiwLIFHxKh4NQHknxAt4mY9nWASg9cNh
 d5w3kICuD8LiqSAAwyXp/v5oGKQ0rHc2OyS+zg8oBCE4q01adgtbB8+6wqODm6JmeHsrmgZPzCO
 noLV9+4XZoz0yq0SwDKliI0NAVyjZIJe7crrjSi9warUBofTe/SgaX5yqb8A22uJaoPNsE91Gcr
 CaqUwMOWXQOzUSqWoZckQiPHbTcKDlLMqBVG1EeOnrYjm5WolkOBpVYN0k9WQpAEVOol6l+qADw
 J9HNq6AGFyxwP8Q==
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


