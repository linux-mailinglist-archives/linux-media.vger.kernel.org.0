Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC26773EA1
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbjHHQdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232922AbjHHQcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:32:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B770831025
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:52:00 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F921D8B;
        Tue,  8 Aug 2023 10:42:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691484142;
        bh=UivyGh3CF7urmLUlWoUm0rdvczj+nOxCCrJxWNBM+Y8=;
        h=From:Date:Subject:To:Cc:From;
        b=nTpJT83QIDThd2xJnfUHyZq0uTE3oRdyfYa6tW5FRF7pEzSOC4wQAxwpl5d6grP45
         UNilPsLYblPx68n6jwHIYM4IwETfX7AktGuOQw1mDGFx4suZdtgxVRpVPXGD3SkLoc
         Tdcc7Czb/RYc618SGOVMjtTYydwpXTnkisHcjmXc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Tue, 08 Aug 2023 11:43:12 +0300
Subject: [PATCH v4] media: ti: cal: Add multiplexed streams support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-cal-streams-v4-1-1f37610e0946@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAB8A0mQC/0XMywqDMBCF4VeRWXdkEi9VV32P0kWMYx1qkpKIF
 MR3b+imyw/O+Q9IHIUTDMUBkXdJEnxGfSnALsY/GWXKBk26oo46tGbFtEU2LuHYq6ojbdt+riE
 /3pFn+fxq90f2HIPDbcnjf6MirYiuTVOqXqm2RoVbcFLuZn2xePY3mdik4Mdg4lTa4OA8vxtoT
 f2nAAAA
To:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=28518;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=UivyGh3CF7urmLUlWoUm0rdvczj+nOxCCrJxWNBM+Y8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk0gAwXvuI9sUtSlNa2v1YF9DUUdvJJAbwgQr8o
 XfkIfa0O5OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNIAMAAKCRD6PaqMvJYe
 9ZD1D/4v5HbU4zrem0AACnfXxJK17SJ5uJsw6/pPoqS6iCrggEmNP2E+0KVo6+6mC+u4ME8FBgX
 7gl00qx4egK6aQlUfSjSLlvWhr1flRv7CMKZGA3novbr/8AgSymwxcMkTFz7Fn2IZZ4dVxiVbT/
 Af4LpdV0Y5lXtsQBe6H+ofdRy157iQhNQMGwPbNXYfqKYCfV0AyGAezqw0G9m4oTwMsdXDyqGuX
 r1QEC9SV5XSd19cAvjtrYPKuJN18G4ghbgTqpZB7zYsbqnOWF5TKJw3d1Y0ieMe0DJHCQtxV/nO
 bbFjnNBLpUNUOJtrYMVrrYlUGxrCJfvZmWcflO+/XLrpkBsKj8riBVQwPFfEVICC3rnChqibpOk
 0bUS0Core+wTObo6ap6ur7jLe4XikXQAaZ+SMvXz3rh/eclJy4pEh13nl0bzvYk8MeHdFmGWqhS
 MzoEHYvD/pgVZlZ6/u2WjKhnQGKsxSGXoDqxzlNzIyKRboTTKcJXK4ZXtJrBnqoR+SXPNYg7+u9
 o1MCvnDRndvxAzHBm9WYta6VsE4L2/qw1V1YyJO7yCIe4doOZHaFqR/pM88km6ncR1SBxHK5b0T
 jZhcNsb8hpW8+xRts8/A4yqA4IEBztZHzKUeFvf+1BLT1AGnqX2EsD+QPqZHs1trrXbvmDF7KL/
 2PpNfw5YwdMh2sw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add routing and stream_config support to CAL driver.

Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
separate streams at the same time.

Add 8 video device nodes, each representing a single dma-engine, and set
the number of source pads on camerarx to 8. Each video node can be
connected to any of the source pads on either of the camerarx instances
using media links. Camerarx internal routing is used to route the
incoming CSI-2 streams to one of the 8 source pads.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
This patch was patch 5/5 of a previous series (v3, link below). The
other patches in the series have been merged.
---
Changes in v4:
- A few minor formatting changes
- Small changes regarding how the code handles metadata formats.
  No metadata formats are supported yet, but we do have some code to
  ensure that metadata formats aren't allowed on video nodes in video
  capture mode. A future patch will enable metadata capture, allowing
  the runtime change of video nodes between video and meta capture.
- Link to v3: https://lore.kernel.org/all/20230302100755.191164-6-tomi.valkeinen@ideasonboard.com/
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 269 +++++++++++++++++++++------
 drivers/media/platform/ti/cal/cal-video.c    | 128 ++++++++++---
 drivers/media/platform/ti/cal/cal.c          |  45 +++--
 drivers/media/platform/ti/cal/cal.h          |   3 +-
 4 files changed, 339 insertions(+), 106 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 1a4273bbe752..1ba9f06e4c2e 100644
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
 
-	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
+	if (state->routing.num_routes > 1) {
+		bpp = 0;
+	} else {
+		struct v4l2_subdev_route *route = &state->routing.routes[0];
+		const struct cal_format_info *fmtinfo;
+		struct v4l2_mbus_framefmt *fmt;
 
-	fmtinfo = cal_format_by_code(fmt->code);
-	if (!fmtinfo)
-		return -EINVAL;
+		fmt = v4l2_subdev_state_get_stream_format(state,
+			route->sink_pad, route->sink_stream);
 
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
@@ -599,30 +646,56 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
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
 					  struct v4l2_subdev_state *state,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct cal_camerarx *phy = to_cal_camerarx(sd);
-
 	/* No transcoding, source and sink codes must match. */
 	if (cal_rx_pad_is_source(code->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
@@ -630,8 +703,12 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_get_pad_format(&phy->subdev, state,
-						 CAL_CAMERARX_PAD_SINK);
+		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								   code->pad,
+								   code->stream);
+		if (!fmt)
+			return -EINVAL;
+
 		code->code = fmt->code;
 	} else {
 		if (code->index >= cal_num_formats)
@@ -656,8 +733,12 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (cal_rx_pad_is_source(fse->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_pad_format(sd, state,
-						 CAL_CAMERARX_PAD_SINK);
+		fmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								   fse->pad,
+								   fse->stream);
+		if (!fmt)
+			return -EINVAL;
+
 		if (fse->code != fmt->code)
 			return -EINVAL;
 
@@ -713,36 +794,78 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	/* Store the format and propagate it to the source pad. */
 
-	fmt = v4l2_subdev_get_pad_format(sd, state, CAL_CAMERARX_PAD_SINK);
+	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
+						  format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_get_pad_format(sd, state,
-					 CAL_CAMERARX_PAD_FIRST_SOURCE);
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
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state)
 {
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
@@ -751,54 +874,78 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
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
 	.init_cfg = cal_camerarx_sd_init_cfg,
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
 
 static struct media_entity_operations cal_camerarx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
 };
 
 /* ------------------------------------------------------------------
@@ -849,7 +996,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	sd = &phy->subdev;
 	v4l2_subdev_init(sd, &cal_camerarx_subdev_ops);
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
 	sd->dev = cal->dev;
 
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index a8abcd0fee17..85638c56953c 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -122,9 +122,10 @@ static int __subdev_get_format(struct cal_ctx *ctx,
 		.pad = 0,
 	};
 	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
+	struct v4l2_subdev *sd = ctx->phy->source;
 	int ret;
 
-	ret = v4l2_subdev_call(ctx->phy->source, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -144,11 +145,12 @@ static int __subdev_set_format(struct cal_ctx *ctx,
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
 
@@ -190,6 +192,7 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 				      struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -215,8 +218,8 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
 	for (fse.index = 0; ; fse.index++) {
 		int ret;
 
-		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size,
-				       NULL, &fse);
+		ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_size,
+						    &fse);
 		if (ret)
 			break;
 
@@ -252,6 +255,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = &ctx->phy->subdev;
 	struct vb2_queue *q = &ctx->vb_vidq;
 	struct v4l2_subdev_format sd_fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -291,7 +295,7 @@ static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
 	ctx->v_fmt.fmt.pix.field = sd_fmt.format.field;
 	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
 
-	v4l2_subdev_call(&ctx->phy->subdev, pad, set_fmt, NULL, &sd_fmt);
+	v4l2_subdev_call_state_active(sd, pad, set_fmt, &sd_fmt);
 
 	ctx->fmtinfo = fmtinfo;
 	*f = ctx->v_fmt;
@@ -303,6 +307,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
 				      struct v4l2_frmsizeenum *fsize)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_size_enum fse = {
 		.index = fsize->index,
@@ -321,8 +326,7 @@ static int cal_legacy_enum_framesizes(struct file *file, void *fh,
 
 	fse.code = fmtinfo->code;
 
-	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size, NULL,
-			       &fse);
+	ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_size, &fse);
 	if (ret)
 		return ret;
 
@@ -364,6 +368,7 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
 					  struct v4l2_frmivalenum *fival)
 {
 	struct cal_ctx *ctx = video_drvdata(file);
+	struct v4l2_subdev *sd = ctx->phy->source;
 	const struct cal_format_info *fmtinfo;
 	struct v4l2_subdev_frame_interval_enum fie = {
 		.index = fival->index,
@@ -378,8 +383,8 @@ static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
 		return -EINVAL;
 
 	fie.code = fmtinfo->code;
-	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_interval,
-			       NULL, &fie);
+
+	ret = v4l2_subdev_call_state_active(sd, pad, enum_frame_interval, &fie);
 	if (ret)
 		return ret;
 	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
@@ -446,6 +451,9 @@ static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	idx = 0;
 
 	for (i = 0; i < cal_num_formats; ++i) {
+		if (cal_formats[i].meta)
+			continue;
+
 		if (f->mbus_code && cal_formats[i].code != f->mbus_code)
 			continue;
 
@@ -473,7 +481,7 @@ static void cal_mc_try_fmt(struct cal_ctx *ctx, struct v4l2_format *f,
 	 * supported.
 	 */
 	fmtinfo = cal_format_by_fourcc(f->fmt.pix.pixelformat);
-	if (!fmtinfo)
+	if (!fmtinfo || fmtinfo->meta)
 		fmtinfo = &cal_formats[0];
 
 	/*
@@ -688,16 +696,17 @@ static int cal_video_check_format(struct cal_ctx *ctx)
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
 
-	format = v4l2_subdev_get_pad_format(&ctx->phy->subdev, state, remote_pad->index);
+	format = v4l2_subdev_state_get_stream_format(state,
+						     phy_source_pad->index, 0);
 	if (!format) {
 		ret = -EINVAL;
 		goto out;
@@ -720,16 +729,28 @@ static int cal_video_check_format(struct cal_ctx *ctx)
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
@@ -762,7 +783,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_set_dma_addr(ctx, addr);
 	cal_ctx_start(ctx);
 
-	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(&ctx->phy->subdev,
+					 phy_source_pad->index, BIT(0));
 	if (ret)
 		goto error_stop;
 
@@ -787,10 +809,14 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
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
 
@@ -799,6 +825,9 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	cal_release_buffers(ctx, VB2_BUF_STATE_ERROR);
 
 	video_device_pipeline_stop(&ctx->vdev);
+
+	if (cal_mc_api)
+		ctx->phy = NULL;
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -827,6 +856,7 @@ static const struct v4l2_file_operations cal_fops = {
 
 static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 {
+	struct v4l2_subdev *sd = ctx->phy->source;
 	struct v4l2_mbus_framefmt mbus_fmt;
 	const struct cal_format_info *fmtinfo;
 	unsigned int i, j, k;
@@ -846,20 +876,20 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
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
@@ -877,7 +907,7 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 
 	if (i == 0) {
 		ctx_err(ctx, "No suitable format reported by subdev %s\n",
-			ctx->phy->source->name);
+			sd->name);
 		return -EINVAL;
 	}
 
@@ -963,16 +993,52 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
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
+					&vfd->entity, 0,
+					enable ? MEDIA_LNK_FL_ENABLED : 0);
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
index 528909ae4bd6..1883f9a50f2a 100644
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

---
base-commit: c0f209bc6ce60d4662436100a263e82dfae76a8e
change-id: 20230808-cal-streams-b913802c69f4

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

