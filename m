Return-Path: <linux-media+bounces-28787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF92A715DB
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D0C1178394
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BDB1DC997;
	Wed, 26 Mar 2025 11:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lXm2WJCp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5684C1E1DE1;
	Wed, 26 Mar 2025 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742988869; cv=none; b=lDn1+ccIRBa7Pgf7wisT401VKWF47FBzqVCln6P5S0iaiPHB+1AgdoAgdhqUTWPNut6i1YCeQ0gsRPVwoyaLLPqIGfmMgnPoQOMtB+AZKREBjDSeCmX2u6Yo9o3UCt5OlDLfONubiMVRQHnn4hzola3LHIueEMzYVnKYM40c8R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742988869; c=relaxed/simple;
	bh=+PmnOASc5TlClBN+ihb2l6pc9ordFy/sg3Nc1IKIQeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYnGvyQ1o8rbNg0hJk1uL5f68WEi1kq2HczrEmIXBPkHdnNy/fkJwSSJE7sVuCeY+kyI2WZ2V7IFNQ6D37pDFeW+n7LU808YkF0L53BiNvTTm4K1hN7KcyUgM6zo9J73t4TPT2MFEqx0KVniYSGIrUDdUbeVUHZmriCMOWovhFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lXm2WJCp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BC271054;
	Wed, 26 Mar 2025 12:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742988754;
	bh=+PmnOASc5TlClBN+ihb2l6pc9ordFy/sg3Nc1IKIQeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lXm2WJCpQS3lMWOdcGaig+ZFeNRdFO01W3mZ0BJIH7TPc2V1OQ0gIJLzr7YuQJPcJ
	 I5oOCkxLXEMN8EnYueLV7aAAKanfPricy+R8R+qugthInkQ+A2TRTZDwBa0nQ4PFxD
	 t8R4zGQaNFl/k0RpVecZdGaSeqbLni5F1Z6cSFLU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:34:03 +0200
Subject: [PATCH v7 3/3] media: ti: cal: Add streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cal-streams-v7-3-659df87ad231@ideasonboard.com>
References: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
In-Reply-To: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benoit Parrot <bparrot@ti.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=27873;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+PmnOASc5TlClBN+ihb2l6pc9ordFy/sg3Nc1IKIQeI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+Y7HfVQbwrCNnCn3rKsQiKbPKIJ6sS6xyHRr
 tZwVavsyjCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PmOwAKCRD6PaqMvJYe
 9QFcD/9bmxiVqxM8pWQ2RJUT3ECBSetz/pZVMQRqSsbqXIf6gcfdHOTp8doTIVIfzgatqPOBXpY
 L+e8/OOMczO5EbuxETZrF2BPMmU78gfYJZY+sBM39uVL01ANQ5OsuV42DyEhFTw95P17YFwxd2l
 uyPyjKRZiDewCmH9MFNuZa6jMYSFjvVHWwBw6uaVGgHBg2Mvp0HgF/4AA+Qxqi5PJcPAY0v5Bne
 RwBbwgnxDWvxIxWffnERlLTNjrZ2e/al9plvY2SfCPs9dKIPORNzzmZiQR0OFwtdg81AMk2zVPo
 tlRvNnfhFoJePhK2cqbsgD3/786hOd7NeiMVcaAe0nlOai/yH3QKpkTlZ5ZoRrCKVV+ZKd7lqbK
 lwnRYnyGbFGOrL9m8coDXjPAcHeVHOvCunb0mgXJ5jEpqHimRe5FYdS215OjcaeglBG502kmAeg
 zS6s6/78XWfC0BsEb7md/YuGh6sMk0znSdODJo1wO3hV0d7nRa3mjJE5I7TXs0jRglcvxADQcTN
 JOV23HGbjzF0NoHmG2PUyqGh4rR6Q5JJ4jENSqSdQ22Po/IcmPEGs/u6aKJAntcr3efUiU5dm0X
 yS2GkpIiQtL8WNfSwc8pdqnGhsv/WrZH2cmUfzSWBsSofyd+0zrtMkFBMk7z8QORLKkvqSaHKxX
 lwwjGsCBItv7IvQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add multiplexed streams support. CAL has 8 DMA-engines and can capture 8
separate streams at the same time. The driver filters the streams based
on CSI-2 virtual channel number and datatype. CAL may have (depending on
the SoC) two CSI-2 RX blocks, which share the 8 DMA-engines, so the
number of capturable streams does not change even if there are two CSI-2
RX blocks.

Add 8 video device nodes, each representing a single DMA-engine, and set
the number of source pads on CSI-2 RX blocks to 8. Each video node can be
connected to any of the source pads on either of the CSI-2 RX instances
using media links. CSI-2 RX block's subdevice internal routing is used
to route the incoming CSI-2 streams to one of the 8 source pads.

Only video data streams are supported at the moment.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 270 +++++++++++++++++++++------
 drivers/media/platform/ti/cal/cal-video.c    | 127 ++++++++++---
 drivers/media/platform/ti/cal/cal.c          |  45 +++--
 drivers/media/platform/ti/cal/cal.h          |   3 +-
 4 files changed, 339 insertions(+), 106 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 42dfe08b765f..b0184f63f70a 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -49,21 +49,38 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 {
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
-	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *fmt;
 	u32 bpp;
 	s64 freq;
 
+	/*
+	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
+	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
+	 *
+	 * With multistream input there is no single pixel rate, and thus we
+	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
+	 * causes v4l2_get_link_freq() to return an error if it falls back to
+	 * V4L2_CID_PIXEL_RATE.
+	 */
+
 	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
 
-	fmt = v4l2_subdev_state_get_format(state, CAL_CAMERARX_PAD_SINK);
+	if (state->routing.num_routes > 1) {
+		bpp = 0;
+	} else {
+		struct v4l2_subdev_route *route = &state->routing.routes[0];
+		const struct cal_format_info *fmtinfo;
+		struct v4l2_mbus_framefmt *fmt;
 
-	fmtinfo = cal_format_by_code(fmt->code);
-	if (!fmtinfo)
-		return -EINVAL;
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
 
-	bpp = fmtinfo->bpp;
+		fmtinfo = cal_format_by_code(fmt->code);
+		if (!fmtinfo)
+			return -EINVAL;
+
+		bpp = fmtinfo->bpp;
+	}
 
 	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
 	if (freq < 0) {
@@ -284,15 +301,32 @@ static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
-static int cal_camerarx_start(struct cal_camerarx *phy)
+static int cal_camerarx_start(struct cal_camerarx *phy, u32 sink_stream)
 {
+	struct media_pad *remote_pad;
 	s64 link_freq;
 	u32 sscounter;
 	u32 val;
 	int ret;
 
+	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
+
+	/*
+	 * We need to enable the PHY hardware when enabling the first stream,
+	 * but for the following streams we just propagate the enable_streams
+	 * to the source.
+	 */
+
 	if (phy->enable_count > 0) {
+		ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
+						 BIT(sink_stream));
+		if (ret) {
+			phy_err(phy, "enable streams failed in source: %d\n", ret);
+			return ret;
+		}
+
 		phy->enable_count++;
+
 		return 0;
 	}
 
@@ -394,7 +428,8 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	 * Start the source to enable the CSI-2 HS clock. We can now wait for
 	 * CSI-2 PHY reset to complete.
 	 */
-	ret = v4l2_subdev_call(phy->source, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
+					 BIT(sink_stream));
 	if (ret) {
 		v4l2_subdev_call(phy->source, core, s_power, 0);
 		cal_camerarx_disable_irqs(phy);
@@ -425,12 +460,22 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	return 0;
 }
 
-static void cal_camerarx_stop(struct cal_camerarx *phy)
+static void cal_camerarx_stop(struct cal_camerarx *phy, u32 sink_stream)
 {
+	struct media_pad *remote_pad;
 	int ret;
 
-	if (--phy->enable_count > 0)
+	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
+
+	if (--phy->enable_count > 0) {
+		ret = v4l2_subdev_disable_streams(phy->source,
+						  remote_pad->index,
+						  BIT(sink_stream));
+		if (ret)
+			phy_err(phy, "stream off failed in subdev\n");
+
 		return;
+	}
 
 	cal_camerarx_ppi_disable(phy);
 
@@ -450,7 +495,9 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
 	/* Disable the phy */
 	cal_camerarx_disable(phy);
 
-	if (v4l2_subdev_call(phy->source, video, s_stream, 0))
+	ret = v4l2_subdev_disable_streams(phy->source, remote_pad->index,
+					  BIT(sink_stream));
+	if (ret)
 		phy_err(phy, "stream off failed in subdev\n");
 
 	ret = v4l2_subdev_call(phy->source, core, s_power, 0);
@@ -599,22 +646,50 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
 	return container_of(sd, struct cal_camerarx, subdev);
 }
 
-static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
+struct cal_camerarx *
+cal_camerarx_get_phy_from_entity(struct media_entity *entity)
+{
+	struct v4l2_subdev *sd;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+	if (!sd)
+		return NULL;
+
+	return to_cal_camerarx(sd);
+}
+
+static int cal_camerarx_sd_enable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
-	struct v4l2_subdev_state *state;
-	int ret = 0;
+	u32 sink_stream;
+	int ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
+						    NULL, &sink_stream);
+	if (ret)
+		return ret;
 
-	if (enable)
-		ret = cal_camerarx_start(phy);
-	else
-		cal_camerarx_stop(phy);
+	return cal_camerarx_start(phy, sink_stream);
+}
 
-	v4l2_subdev_unlock_state(state);
+static int cal_camerarx_sd_disable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	u32 sink_stream;
+	int ret;
 
-	return ret;
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
+						    NULL, &sink_stream);
+	if (ret)
+		return ret;
+
+	cal_camerarx_stop(phy, sink_stream);
+
+	return 0;
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
@@ -628,8 +703,12 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_state_get_format(state,
-						   CAL_CAMERARX_PAD_SINK);
+		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								   code->pad,
+								   code->stream);
+		if (!fmt)
+			return -EINVAL;
+
 		code->code = fmt->code;
 	} else {
 		if (code->index >= cal_num_formats)
@@ -654,8 +733,12 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (cal_rx_pad_is_source(fse->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_state_get_format(state,
-						   CAL_CAMERARX_PAD_SINK);
+		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								   fse->pad,
+								   fse->stream);
+		if (!fmt)
+			return -EINVAL;
+
 		if (fse->code != fmt->code)
 			return -EINVAL;
 
@@ -711,36 +794,77 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	/* Store the format and propagate it to the source pad. */
 
-	fmt = v4l2_subdev_state_get_format(state, CAL_CAMERARX_PAD_SINK);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_state_get_format(state,
-					   CAL_CAMERARX_PAD_FIRST_SOURCE);
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
 	return 0;
 }
 
+static int cal_camerarx_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       enum v4l2_subdev_format_whence which,
+				       struct v4l2_subdev_krouting *routing)
+{
+	return cal_camerarx_set_routing(sd, state, routing);
+}
+
 static int cal_camerarx_sd_init_state(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_state *state)
-{
-	struct v4l2_subdev_format format = {
-		.which = state ? V4L2_SUBDEV_FORMAT_TRY
-		: V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad = CAL_CAMERARX_PAD_SINK,
-		.format = {
-			.width = 640,
-			.height = 480,
-			.code = MEDIA_BUS_FMT_UYVY8_1X16,
-			.field = V4L2_FIELD_NONE,
-			.colorspace = V4L2_COLORSPACE_SRGB,
-			.ycbcr_enc = V4L2_YCBCR_ENC_601,
-			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-			.xfer_func = V4L2_XFER_FUNC_SRGB,
-		},
+				    struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = { {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = 1,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	} };
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = routes,
 	};
 
-	return cal_camerarx_sd_set_fmt(sd, state, &format);
+	/* Initialize routing to single route to the fist source pad */
+	return cal_camerarx_set_routing(sd, state, &routing);
 }
 
 static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
@@ -749,48 +873,71 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
 	struct v4l2_mbus_frame_desc remote_desc;
 	const struct media_pad *remote_pad;
+	struct v4l2_subdev_state *state;
+	u32 sink_stream;
+	unsigned int i;
 	int ret;
 
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+						    pad, 0,
+						    NULL, &sink_stream);
+	if (ret)
+		goto out_unlock;
+
 	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
-	if (!remote_pad)
-		return -EPIPE;
+	if (!remote_pad) {
+		ret = -EPIPE;
+		goto out_unlock;
+	}
 
 	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
 			       remote_pad->index, &remote_desc);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
 		cal_err(phy->cal,
 			"Frame descriptor does not describe CSI-2 link");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_unlock;
 	}
 
-	if (remote_desc.num_entries > 1)
-		cal_err(phy->cal,
-			"Multiple streams not supported in remote frame descriptor, using the first one\n");
+	for (i = 0; i < remote_desc.num_entries; i++) {
+		if (remote_desc.entry[i].stream == sink_stream)
+			break;
+	}
+
+	if (i == remote_desc.num_entries) {
+		cal_err(phy->cal, "Stream %u not found in remote frame desc\n",
+			sink_stream);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 	fd->num_entries = 1;
-	fd->entry[0] = remote_desc.entry[0];
+	fd->entry[0] = remote_desc.entry[i];
 
-	return 0;
-}
+out_unlock:
+	v4l2_subdev_unlock_state(state);
 
-static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
-	.s_stream = cal_camerarx_sd_s_stream,
-};
+	return ret;
+}
 
 static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
+	.enable_streams = cal_camerarx_sd_enable_streams,
+	.disable_streams = cal_camerarx_sd_disable_streams,
 	.enum_mbus_code = cal_camerarx_sd_enum_mbus_code,
 	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = cal_camerarx_sd_set_fmt,
+	.set_routing = cal_camerarx_sd_set_routing,
 	.get_frame_desc = cal_camerarx_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
-	.video = &cal_camerarx_video_ops,
 	.pad = &cal_camerarx_pad_ops,
 };
 
@@ -800,6 +947,7 @@ static const struct v4l2_subdev_internal_ops cal_camerarx_internal_ops = {
 
 static const struct media_entity_operations cal_camerarx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
 };
 
 /* ------------------------------------------------------------------
@@ -851,7 +999,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
 	sd->internal_ops = &cal_camerarx_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
 	sd->dev = cal->dev;
 
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 29c38bf8d7a1..d40e24ab1127 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -108,9 +108,10 @@ static int __subdev_get_format(struct cal_ctx *ctx,
 		.pad = 0,
 	};
 	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+	struct v4l2_subdev *sd = ctx->phy->source;
 	int ret;
 
-	ret = v4l2_subdev_call(ctx->phy->source, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -130,11 +131,12 @@ static int __subdev_set_format(struct cal_ctx *ctx,
 		.pad = 0,
 	};
 	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+	struct v4l2_subdev *sd = ctx->phy->source;
 	int ret;
 
 	*mbus_fmt = *fmt;
 
-	ret = v4l2_subdev_call(ctx->phy->source, pad, set_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -176,6 +178,7 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 				      struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -201,8 +204,8 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 	for (fse.index = 0; ; fse.index++) {
 		int ret;
 
-		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size,
-				       NULL, &fse);
+		ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_size,
+						    &fse);
 		if (ret)
 			break;
 
@@ -238,6 +241,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = &ctx->phy->subdev;
 	struct vb2_queue *q = &ctx->vb_vidq;
 	struct v4l2_subdev_format sd_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -277,7 +281,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 	ctx->v_fmt.fmt.pix.field = sd_fmt.format.field;
 	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
 
-	v4l2_subdev_call(&ctx->phy->subdev, pad, set_fmt, NULL, &sd_fmt);
+	v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
 
 	ctx->fmtinfo = fmtinfo;
 	*f = ctx->v_fmt;
@@ -289,6 +293,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
 				      struct v4l2_frmsizeenum *fsize)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse = {
 		.index = fsize->index,
@@ -307,8 +312,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
 
 	fse.code = fmtinfo->code;
 
-	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size, NULL,
-			       &fse);
+	ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_size, &fse);
 	if (ret)
 		return ret;
 
@@ -350,6 +354,7 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
 					  struct v4l2_frmivalenum *fival)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_interval_enum fie = {
 		.index = fival->index,
@@ -364,8 +369,8 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
 		return -EINVAL;
 
 	fie.code = fmtinfo->code;
-	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_interval,
-			       NULL, &fie);
+
+	ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_interval, &fie);
 	if (ret)
 		return ret;
 	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
@@ -432,6 +437,9 @@ static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	idx = 0;
 
 	for (i = 0; i < cal_num_formats; ++i) {
+		if (cal_formats[i].meta)
+			continue;
+
 		if (f->mbus_code && cal_formats[i].code != f->mbus_code)
 			continue;
 
@@ -459,7 +467,7 @@ static void cal_mc_try_fmt(struct cal_ctx *ctx, struct v4l2_format *f,
 	 * supported.
 	 */
 	fmtinfo = cal_format_by_fourcc(f->fmt.pix.pixelformat);
-	if (!fmtinfo)
+	if (!fmtinfo || fmtinfo->meta)
 		fmtinfo = &cal_formats[0];
 
 	/*
@@ -675,16 +683,16 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 {
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	struct media_pad *remote_pad;
+	struct media_pad *phy_source_pad;
 	int ret = 0;
 
-	remote_pad = media_pad_remote_pad_first(&ctx->pad);
-	if (!remote_pad)
+	phy_source_pad = media_pad_remote_pad_first(&ctx->pad);
+	if (!phy_source_pad)
 		return -ENODEV;
 
 	state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
 
-	format = v4l2_subdev_state_get_format(state, remote_pad->index);
+	format = v4l2_subdev_state_get_format(state, phy_source_pad->index, 0);
 	if (!format) {
 		ret = -EINVAL;
 		goto out;
@@ -707,16 +715,28 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
+	struct media_pad *phy_source_pad;
 	struct cal_buffer *buf;
 	dma_addr_t addr;
 	int ret;
 
+	phy_source_pad = media_pad_remote_pad_first(&ctx->pad);
+	if (!phy_source_pad) {
+		ctx_err(ctx, "Context not connected\n");
+		ret = -ENODEV;
+		goto error_release_buffers;
+	}
+
 	ret = video_device_pipeline_alloc_start(&ctx->vdev);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
 		goto error_release_buffers;
 	}
 
+	/* Find the PHY connected to this video device */
+	if (cal_mc_api)
+		ctx->phy = cal_camerarx_get_phy_from_entity(phy_source_pad->entity);
+
 	/*
 	 * Verify that the currently configured format matches the output of
 	 * the connected CAMERARX.
@@ -749,7 +769,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_set_dma_addr(ctx, addr);
 	cal_ctx_start(ctx);
 
-	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(&ctx->phy->subdev,
+					 phy_source_pad->index, BIT(0));
 	if (ret)
 		goto error_stop;
 
@@ -774,10 +795,14 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void cal_stop_streaming(struct vb2_queue *vq)
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
+	struct media_pad *phy_source_pad;
 
 	cal_ctx_stop(ctx);
 
-	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
+	phy_source_pad = media_pad_remote_pad_first(&ctx->pad);
+
+	v4l2_subdev_disable_streams(&ctx->phy->subdev, phy_source_pad->index,
+				    BIT(0));
 
 	pm_runtime_put_sync(ctx->cal->dev);
 
@@ -786,6 +811,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
 	video_device_pipeline_stop(&ctx->vdev);
+
+	if (cal_mc_api)
+		ctx->phy = NULL;
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -812,6 +840,7 @@ static const struct v4l2_file_operations cal_fops = {
 
 static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 {
+	struct v4l2_subdev *sd = ctx->phy->source;
 	struct v4l2_mbus_framefmt mbus_fmt;
 	const struct cal_format_info *fmtinfo;
 	unsigned int i, j, k;
@@ -831,20 +860,20 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		};
 
-		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_mbus_code,
-				       NULL, &mbus_code);
+		ret = v4l2_subdev_call_state_active(sd, pad, enum_mbus_code,
+						    &mbus_code);
 		if (ret == -EINVAL)
 			break;
 
 		if (ret) {
 			ctx_err(ctx, "Error enumerating mbus codes in subdev %s: %d\n",
-				ctx->phy->source->name, ret);
+				sd->name, ret);
 			return ret;
 		}
 
 		ctx_dbg(2, ctx,
 			"subdev %s: code: %04x idx: %u\n",
-			ctx->phy->source->name, mbus_code.code, j);
+			sd->name, mbus_code.code, j);
 
 		for (k = 0; k < cal_num_formats; k++) {
 			fmtinfo = &cal_formats[k];
@@ -862,7 +891,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 
 	if (i == 0) {
 		ctx_err(ctx, "No suitable format reported by subdev %s\n",
-			ctx->phy->source->name);
+			sd->name);
 		return -EINVAL;
 	}
 
@@ -948,16 +977,52 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 		return ret;
 	}
 
-	ret = media_create_pad_link(&ctx->phy->subdev.entity,
-				    CAL_CAMERARX_PAD_FIRST_SOURCE,
-				    &vfd->entity, 0,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret) {
-		ctx_err(ctx, "Failed to create media link for context %u\n",
-			ctx->dma_ctx);
-		video_unregister_device(vfd);
-		return ret;
+	if (cal_mc_api) {
+		u16 phy_idx;
+		u16 pad_idx;
+
+		/* Create links from all video nodes to all PHYs */
+
+		for (phy_idx = 0; phy_idx < ctx->cal->data->num_csi2_phy;
+		     ++phy_idx) {
+			struct media_entity *phy_entity =
+				&ctx->cal->phy[phy_idx]->subdev.entity;
+
+			for (pad_idx = 1; pad_idx < CAL_CAMERARX_NUM_PADS;
+			     ++pad_idx) {
+				/*
+				 * Enable only links from video0 to PHY0 pad 1,
+				 * and video1 to PHY1 pad 1.
+				 */
+				bool enable = (ctx->dma_ctx == 0 &&
+					       phy_idx == 0 && pad_idx == 1) ||
+					      (ctx->dma_ctx == 1 &&
+					       phy_idx == 1 && pad_idx == 1);
+
+				ret = media_create_pad_link(phy_entity, pad_idx,
+							    &vfd->entity, 0,
+							    enable ? MEDIA_LNK_FL_ENABLED : 0);
+				if (ret) {
+					ctx_err(ctx,
+						"Failed to create media link for context %u\n",
+						ctx->dma_ctx);
+					video_unregister_device(vfd);
+					return ret;
+				}
+			}
+		}
+	} else {
+		ret = media_create_pad_link(&ctx->phy->subdev.entity,
+					    CAL_CAMERARX_PAD_FIRST_SOURCE,
+					    &vfd->entity, 0,
+					    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			ctx_err(ctx,
+				"Failed to create media link for context %u\n",
+				ctx->dma_ctx);
+			video_unregister_device(vfd);
+			return ret;
+		}
 	}
 
 	ctx_info(ctx, "V4L2 device registered as %s\n",
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 4bd2092e0255..9389c444400e 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -481,8 +481,9 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
 		ctx->vc = 0;
 		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
 	} else if (!ret) {
-		ctx_dbg(2, ctx, "Framedesc: len %u, vc %u, dt %#x\n",
-			entry.length, entry.bus.csi2.vc, entry.bus.csi2.dt);
+		ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
+			entry.stream, entry.length, entry.bus.csi2.vc,
+			entry.bus.csi2.dt);
 
 		ctx->vc = entry.bus.csi2.vc;
 		ctx->datatype = entry.bus.csi2.dt;
@@ -490,7 +491,7 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
 		return ret;
 	}
 
-	ctx->use_pix_proc = !ctx->fmtinfo->meta;
+	ctx->use_pix_proc = ctx->vb_vidq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE;
 
 	if (ctx->use_pix_proc) {
 		ret = cal_reserve_pix_proc(ctx->cal);
@@ -1014,7 +1015,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 		return NULL;
 
 	ctx->cal = cal;
-	ctx->phy = cal->phy[inst];
 	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
@@ -1226,18 +1226,37 @@ static int cal_probe(struct platform_device *pdev)
 	}
 
 	/* Create contexts. */
-	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
-		if (!cal->phy[i]->source_node)
-			continue;
+	if (!cal_mc_api) {
+		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
+			struct cal_ctx *ctx;
+
+			if (!cal->phy[i]->source_node)
+				continue;
+
+			ctx = cal_ctx_create(cal, i);
+			if (!ctx) {
+				cal_err(cal, "Failed to create context %u\n", cal->num_contexts);
+				ret = -ENODEV;
+				goto error_context;
+			}
+
+			ctx->phy = cal->phy[i];
 
-		cal->ctx[cal->num_contexts] = cal_ctx_create(cal, i);
-		if (!cal->ctx[cal->num_contexts]) {
-			cal_err(cal, "Failed to create context %u\n", cal->num_contexts);
-			ret = -ENODEV;
-			goto error_context;
+			cal->ctx[cal->num_contexts++] = ctx;
 		}
+	} else {
+		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
+			struct cal_ctx *ctx;
+
+			ctx = cal_ctx_create(cal, i);
+			if (!ctx) {
+				cal_err(cal, "Failed to create context %u\n", i);
+				ret = -ENODEV;
+				goto error_context;
+			}
 
-		cal->num_contexts++;
+			cal->ctx[cal->num_contexts++] = ctx;
+		}
 	}
 
 	/* Register the media device. */
diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
index 0856297adc0b..44ee0bece56e 100644
--- a/drivers/media/platform/ti/cal/cal.h
+++ b/drivers/media/platform/ti/cal/cal.h
@@ -45,7 +45,7 @@
 
 #define CAL_CAMERARX_PAD_SINK		0
 #define CAL_CAMERARX_PAD_FIRST_SOURCE	1
-#define CAL_CAMERARX_NUM_SOURCE_PADS	1
+#define CAL_CAMERARX_NUM_SOURCE_PADS	8
 #define CAL_CAMERARX_NUM_PADS		(1 + CAL_CAMERARX_NUM_SOURCE_PADS)
 
 static inline bool cal_rx_pad_is_sink(u32 pad)
@@ -319,6 +319,7 @@ const struct cal_format_info *cal_format_by_code(u32 code);
 
 void cal_quickdump_regs(struct cal_dev *cal);
 
+struct cal_camerarx *cal_camerarx_get_phy_from_entity(struct media_entity *entity);
 void cal_camerarx_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
 struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,

-- 
2.43.0


