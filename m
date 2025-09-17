Return-Path: <linux-media+bounces-42682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E5B80AAE
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 17:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A215E4E340E
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FED5314D37;
	Wed, 17 Sep 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRG4Ovqy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A535FC0F;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758123533; cv=none; b=m1nzIfXhFniytOWNCIDUd9vLm1/+D+lxOysNgz4U6iy/Q3o+A7n72sDhXF8kn60nGTYxxWlIpyCIu5h7SjAoKvgyTEHcaBVuBpVqf/z59V4HLHF5yPKWTcixx2tG4zIS1WlvBPcuOfLhOdInHjMCEbUSjmekuoq52kIIezanXWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758123533; c=relaxed/simple;
	bh=XYoMKLKx8Svk2zKKNL7kXv0DJnZYHwNKdP/KHhB98Lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HG7nk7B63HgpTtwbk0reY7cn4VlfODqlCc5Q8hL8gtJtKolROjYIDCALg7bKDYe4H3CM98Uqp8H4ZKn6fX2NB2yN9S0/81AQIWxGifmYUlncGzueTJnTC02sPAeVltFdG9ObthtuAQjhojHXpDxtNDu9eGpZTMrOqPAXvVyv+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRG4Ovqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D39DC4CEF0;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123533;
	bh=XYoMKLKx8Svk2zKKNL7kXv0DJnZYHwNKdP/KHhB98Lg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lRG4OvqyqhmUBUA8PWwAcDlhmKLnp2qlY1iZEJ4G6Q9DG5e273qYD0i2BnWWIscBm
	 heFNy96j49cACbEtKP+jL3cj+aRxXoWo+0d71OB+SptxMOM2cnfXD4Ss4TaZWRIDMM
	 ImIQoad8uK8QgyMuKP1GtLvBs4Mxf3Y7S5McmThv3KyZ0GckHthdOdyhgKzYqbG0q5
	 6/MzxXF6zYWf0huecUtjkdWzqaIXeIIeByxNtC2edRH9Qp2Q4iGF2S0/AYRpIye5+i
	 tWyKEturhfyIbh1OjbyJUYiNzs40xLjSgMnaoWHK18KpGsJQwts7dypPHj4ziAP58V
	 ERRl/EoHG3UQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E58CAC59D;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 17 Sep 2025 17:38:48 +0200
Subject: [PATCH v11 08/17] media: rockchip: rkcif: add abstraction for
 interface and crop blocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v11-8-af0eada54e5d@collabora.com>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758123529; l=16913;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=JKt/C4TMwILweFaTlz4RL5F6pESC9jF+DdZS+qd1aVo=;
 b=pIBWOyMAI0HTb6bJgcINWKVLxJuVQgsKH33kijvR2mHvz1Rgx1RlIauswQGNMUMRDnU7CXJ6T
 aQyRFLnUZmOA241swtWkAbdM9lhh1eyYxrWuGwMW/8oUf8Krnb2IFA9
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add an abstraction for the INTERFACE and CROP parts of the different
Rockchip Camera Interface (CIF) variants. These parts are represented
as V4L2 subdevice with one sink pad and one source pad. The sink pad
is connected to a subdevice: either the subdevice provided by the
driver of the companion chip connected to the DVP, or the subdevice
provided by the MIPI CSI-2 receiver. The source pad is connected to
V4l2 device(s) provided by one or many instance(s) of the DMA
abstraction.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  71 ++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  13 +
 .../platform/rockchip/rkcif/rkcif-interface.c      | 388 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  30 ++
 5 files changed, 503 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
index c6837ed2f65c..9d535fc27e51 100644
--- a/drivers/media/platform/rockchip/rkcif/Makefile
+++ b/drivers/media/platform/rockchip/rkcif/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
 
 rockchip-cif-objs += rkcif-dev.o
+rockchip-cif-objs += rkcif-interface.o
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 43a9390526d8..a3e052ad885a 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -26,9 +26,78 @@
 #define RKCIF_DRIVER_NAME "rockchip-cif"
 #define RKCIF_CLK_MAX	  4
 
+enum rkcif_format_type {
+	RKCIF_FMT_TYPE_INVALID,
+	RKCIF_FMT_TYPE_YUV,
+	RKCIF_FMT_TYPE_RAW,
+};
+
+enum rkcif_interface_index {
+	RKCIF_DVP,
+	RKCIF_MIPI_BASE,
+	RKCIF_MIPI1 = RKCIF_MIPI_BASE,
+	RKCIF_MIPI2,
+	RKCIF_MIPI3,
+	RKCIF_MIPI4,
+	RKCIF_MIPI5,
+	RKCIF_MIPI6,
+	RKCIF_MIPI_MAX,
+	RKCIF_IF_MAX = RKCIF_MIPI_MAX
+};
+
+enum rkcif_interface_pad_index {
+	RKCIF_IF_PAD_SINK,
+	RKCIF_IF_PAD_SRC,
+	RKCIF_IF_PAD_MAX
+};
+
+enum rkcif_interface_status {
+	RKCIF_IF_INACTIVE,
+	RKCIF_IF_ACTIVE,
+};
+
+enum rkcif_interface_type {
+	RKCIF_IF_INVALID,
+	RKCIF_IF_DVP,
+	RKCIF_IF_MIPI,
+};
+
+struct rkcif_input_fmt {
+	u32 mbus_code;
+
+	enum rkcif_format_type fmt_type;
+	enum v4l2_field field;
+};
+
+struct rkcif_interface;
+
 struct rkcif_remote {
 	struct v4l2_async_connection async_conn;
 	struct v4l2_subdev *sd;
+
+	struct rkcif_interface *interface;
+};
+
+struct rkcif_dvp {
+	u32 dvp_clk_delay;
+};
+
+struct rkcif_interface {
+	enum rkcif_interface_type type;
+	enum rkcif_interface_status status;
+	enum rkcif_interface_index index;
+	struct rkcif_device *rkcif;
+	struct rkcif_remote *remote;
+	const struct rkcif_input_fmt *in_fmts;
+	unsigned int in_fmts_num;
+
+	struct media_pad pads[RKCIF_IF_PAD_MAX];
+	struct v4l2_fwnode_endpoint vep;
+	struct v4l2_subdev sd;
+
+	union {
+		struct rkcif_dvp dvp;
+	};
 };
 
 struct rkcif_match_data {
@@ -46,6 +115,8 @@ struct rkcif_device {
 	struct reset_control *reset;
 	void __iomem *base_addr;
 
+	struct rkcif_interface interfaces[RKCIF_IF_MAX];
+
 	struct media_device media_dev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_async_notifier notifier;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index a8514e7d3249..331634e5e74b 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -73,8 +73,21 @@ static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
 				struct v4l2_subdev *sd,
 				struct v4l2_async_connection *asd)
 {
+	struct rkcif_device *rkcif =
+		container_of(notifier, struct rkcif_device, notifier);
 	struct rkcif_remote *remote =
 		container_of(asd, struct rkcif_remote, async_conn);
+	struct media_pad *sink_pad =
+		&remote->interface->pads[RKCIF_IF_PAD_SINK];
+	int ret;
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad,
+					      MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(rkcif->dev, "failed to link source pad of %s\n",
+			sd->name);
+		return ret;
+	}
 
 	remote->sd = sd;
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
new file mode 100644
index 000000000000..06386144b70c
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ */
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#include "rkcif-common.h"
+#include "rkcif-interface.h"
+
+static inline struct rkcif_interface *to_rkcif_interface(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rkcif_interface, sd);
+}
+
+static const struct media_entity_operations rkcif_interface_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
+};
+
+static int rkcif_interface_set_fmt(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_format *format)
+{
+	struct rkcif_interface *interface = to_rkcif_interface(sd);
+	const struct rkcif_input_fmt *input;
+	struct v4l2_mbus_framefmt *sink, *src;
+
+	/* the format on the source pad always matches the sink pad */
+	if (format->pad == RKCIF_IF_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	input = rkcif_interface_find_input_fmt(interface, true,
+					       format->format.code);
+	format->format.code = input->mbus_code;
+
+	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!sink)
+		return -EINVAL;
+
+	*sink = format->format;
+
+	/* propagate the format to the source pad */
+	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!src)
+		return -EINVAL;
+
+	*src = *sink;
+
+	return 0;
+}
+
+static int rkcif_interface_get_sel(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *sink;
+	struct v4l2_rect *crop;
+	int ret = 0;
+
+	if (sel->pad != RKCIF_IF_PAD_SRC)
+		return -EINVAL;
+
+	sink = v4l2_subdev_state_get_opposite_stream_format(state, sel->pad,
+							    sel->stream);
+	if (!sink)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
+	if (!crop)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = sink->width;
+		sel->r.height = sink->height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *crop;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int rkcif_interface_set_sel(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *sink, *src;
+	struct v4l2_rect *crop;
+
+	if (sel->pad != RKCIF_IF_PAD_SRC || sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	sink = v4l2_subdev_state_get_opposite_stream_format(state, sel->pad,
+							    sel->stream);
+	if (!sink)
+		return -EINVAL;
+
+	src = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
+	if (!src)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
+	if (!crop)
+		return -EINVAL;
+
+	/* only starting point of crop can be specified */
+	sel->r.height = sink->height - sel->r.top;
+	sel->r.width = sink->width - sel->r.left;
+	*crop = sel->r;
+
+	src->height = sel->r.height;
+	src->width = sel->r.width;
+
+	return 0;
+}
+
+static int rkcif_interface_set_routing(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       enum v4l2_subdev_format_whence which,
+				       struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+
+	return ret;
+}
+
+static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
+{
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	u64 mask;
+
+	remote_pad =
+		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
+					       RKCIF_IF_PAD_SRC, &streams_mask);
+
+	return v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
+}
+
+static int rkcif_interface_disable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	u64 mask;
+
+	remote_pad =
+		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
+					       RKCIF_IF_PAD_SRC, &streams_mask);
+
+	return v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+}
+
+static const struct v4l2_subdev_pad_ops rkcif_interface_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = rkcif_interface_set_fmt,
+	.get_selection = rkcif_interface_get_sel,
+	.set_selection = rkcif_interface_set_sel,
+	.set_routing = rkcif_interface_set_routing,
+	.enable_streams = rkcif_interface_enable_streams,
+	.disable_streams = rkcif_interface_disable_streams,
+};
+
+static const struct v4l2_subdev_ops rkcif_interface_ops = {
+	.pad = &rkcif_interface_pad_ops,
+};
+
+static int rkcif_interface_init_state(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state)
+{
+	struct rkcif_interface *interface = to_rkcif_interface(sd);
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RKCIF_IF_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = RKCIF_IF_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	const struct v4l2_mbus_framefmt dvp_default_format = {
+		.width = 3840,
+		.height = 2160,
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_REC709,
+		.ycbcr_enc = V4L2_YCBCR_ENC_709,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_NONE,
+	};
+	const struct v4l2_mbus_framefmt mipi_default_format = {
+		.width = 3840,
+		.height = 2160,
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_RAW,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_NONE,
+	};
+	const struct v4l2_mbus_framefmt *default_format;
+	int ret;
+
+	default_format = (interface->type == RKCIF_IF_DVP) ?
+				 &dvp_default_format :
+				 &mipi_default_format;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+					       default_format);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_internal_ops rkcif_interface_internal_ops = {
+	.init_state = rkcif_interface_init_state,
+};
+
+static int rkcif_interface_add(struct rkcif_interface *interface)
+{
+	struct rkcif_device *rkcif = interface->rkcif;
+	struct rkcif_remote *remote;
+	struct v4l2_async_notifier *ntf = &rkcif->notifier;
+	struct v4l2_fwnode_endpoint *vep = &interface->vep;
+	struct device *dev = rkcif->dev;
+	struct fwnode_handle *ep;
+	u32 dvp_clk_delay = 0;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), interface->index,
+					     0, 0);
+	if (!ep)
+		return -ENODEV;
+
+	vep->bus_type = V4L2_MBUS_UNKNOWN;
+	ret = v4l2_fwnode_endpoint_parse(ep, vep);
+	if (ret)
+		goto complete;
+
+	if (interface->type == RKCIF_IF_DVP) {
+		if (vep->bus_type != V4L2_MBUS_BT656 &&
+		    vep->bus_type != V4L2_MBUS_PARALLEL) {
+			ret = dev_err_probe(dev, -EINVAL,
+					    "unsupported bus type\n");
+			goto complete;
+		}
+
+		fwnode_property_read_u32(ep, "rockchip,dvp-clk-delay",
+					 &dvp_clk_delay);
+		interface->dvp.dvp_clk_delay = dvp_clk_delay;
+	}
+
+	remote = v4l2_async_nf_add_fwnode_remote(ntf, ep, struct rkcif_remote);
+	if (IS_ERR(remote)) {
+		ret = PTR_ERR(remote);
+		goto complete;
+	}
+
+	remote->interface = interface;
+	interface->remote = remote;
+	interface->status = RKCIF_IF_ACTIVE;
+	ret = 0;
+
+complete:
+	fwnode_handle_put(ep);
+
+	return ret;
+}
+
+int rkcif_interface_register(struct rkcif_device *rkcif,
+			     struct rkcif_interface *interface)
+{
+	struct media_pad *pads = interface->pads;
+	struct v4l2_subdev *sd = &interface->sd;
+	int ret;
+
+	interface->rkcif = rkcif;
+
+	v4l2_subdev_init(sd, &rkcif_interface_ops);
+	sd->dev = rkcif->dev;
+	sd->entity.ops = &rkcif_interface_media_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	sd->internal_ops = &rkcif_interface_internal_ops;
+	sd->owner = THIS_MODULE;
+
+	if (interface->type == RKCIF_IF_DVP)
+		snprintf(sd->name, sizeof(sd->name), "rkcif-dvp0");
+	else if (interface->type == RKCIF_IF_MIPI)
+		snprintf(sd->name, sizeof(sd->name), "rkcif-mipi%d",
+			 interface->index - RKCIF_MIPI_BASE);
+
+	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[RKCIF_IF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, RKCIF_IF_PAD_MAX, pads);
+	if (ret)
+		goto err;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_device_register_subdev(&rkcif->v4l2_dev, sd);
+	if (ret) {
+		dev_err(sd->dev, "failed to register subdev\n");
+		goto err_subdev_cleanup;
+	}
+
+	ret = rkcif_interface_add(interface);
+	if (ret)
+		goto err_subdev_unregister;
+
+	return 0;
+
+err_subdev_unregister:
+	v4l2_device_unregister_subdev(sd);
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+err:
+	return ret;
+}
+
+void rkcif_interface_unregister(struct rkcif_interface *interface)
+{
+	struct v4l2_subdev *sd = &interface->sd;
+
+	if (interface->status != RKCIF_IF_ACTIVE)
+		return;
+
+	v4l2_device_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+}
+
+const struct rkcif_input_fmt *
+rkcif_interface_find_input_fmt(struct rkcif_interface *interface, bool ret_def,
+			       u32 mbus_code)
+{
+	const struct rkcif_input_fmt *fmt;
+
+	WARN_ON(interface->in_fmts_num == 0);
+
+	for (unsigned int i = 0; i < interface->in_fmts_num; i++) {
+		fmt = &interface->in_fmts[i];
+		if (fmt->mbus_code == mbus_code)
+			return fmt;
+	}
+	if (ret_def)
+		return &interface->in_fmts[0];
+	else
+		return NULL;
+}
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.h b/drivers/media/platform/rockchip/rkcif/rkcif-interface.h
new file mode 100644
index 000000000000..817ef633b3fe
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Abstraction for the INTERFACE and CROP parts of the different CIF variants.
+ * They shall be represented as V4L2 subdevice with one sink pad and one
+ * source pad. The sink pad is connected to a subdevice: either the subdevice
+ * provided by the driver of the companion chip connected to the DVP, or the
+ * subdevice provided by the MIPI CSI-2 receiver driver. The source pad is
+ * to V4l2 device(s) provided by one or many instance(s) of the DMA
+ * abstraction.
+ *
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ */
+
+#ifndef _RKCIF_INTERFACE_H
+#define _RKCIF_INTERFACE_H
+
+#include "rkcif-common.h"
+
+int rkcif_interface_register(struct rkcif_device *rkcif,
+			     struct rkcif_interface *interface);
+
+void rkcif_interface_unregister(struct rkcif_interface *interface);
+
+const struct rkcif_input_fmt *
+rkcif_interface_find_input_fmt(struct rkcif_interface *interface, bool ret_def,
+			       u32 mbus_code);
+
+#endif

-- 
2.39.5



