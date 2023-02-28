Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 315746A5E0B
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 18:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjB1RQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 12:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjB1RQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 12:16:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1461A22DF2
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 09:16:29 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD19656A;
        Tue, 28 Feb 2023 18:16:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677604587;
        bh=RcUDaAH6AMEBTMLijdMQU1HcdTtvyByKFi2d3/dpwKM=;
        h=From:To:Cc:Subject:Date:From;
        b=KXRz8qke9KoCMbi4N2zREdE7rImJuQBmppj0nXKjvYndFBv9Bppb2AZxVc5v6FD5f
         sJ1svoT6TE4vCo3QB4zUZ2SKh0opBg/zAkvjrly8kYIKIOdSwUwzy6rNQFMYOHmCdr
         ohH+kcQWAK7LJjO3j2d5nqtMugAqCnTuVLYYqGnY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/4] media: ti: cal: Streams support
Date:   Tue, 28 Feb 2023 19:16:16 +0200
Message-Id: <20230228171620.330978-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series is based on Laurent's "media: Zero-initialize structures
passed to subdev pad ops" series and my two patches adding
V4L2_SUBDEV_ROUTING_* flags.

Changes to v1:
- Drop the 2X8 formats and some other unsupported formats, and switch to
  1X16 formats where appropriate.
- New commit "Implement get_frame_desc for camera-rx" which adds a
  proper .get_frame_desc op for camerarx. This allows a bit simpler
  code in the patch that adds the multiplexed streams.
- Use V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING flag
- Simplified the code in places, where we, e.g., know the pad is the
  single camera-rx sink pad, so instead of using a pad variable passed
  around we just use the CAL_CAMERARX_PAD_SINK.

Range-diff to v1 below.

 Tomi

Tomi Valkeinen (4):
  media: ti: cal: Clean up mbus formats uses
  media: ti: cal: Use subdev state
  media: ti: cal: Implement get_frame_desc for camera-rx
  media: ti: cal: Add multiplexed streams support

 drivers/media/platform/ti/cal/cal-camerarx.c | 405 ++++++++++++-------
 drivers/media/platform/ti/cal/cal-video.c    | 142 +++++--
 drivers/media/platform/ti/cal/cal.c          | 107 +++--
 drivers/media/platform/ti/cal/cal.h          |  13 +-
 4 files changed, 409 insertions(+), 258 deletions(-)

Range-diff against v1:
1:  2a757d193135 < -:  ------------ media: ti: cal: Add support for 1X16 mbus formats
-:  ------------ > 1:  c4f423c12a1a media: ti: cal: Clean up mbus formats uses
2:  93d34b7c33c0 ! 2:  ca88904ee5d5 media: ti: cal: Use subdev state
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: void cal_camerarx_destroy(struct c
      }
     
      ## drivers/media/platform/ti/cal/cal-video.c ##
    -@@ drivers/media/platform/ti/cal/cal-video.c: static int cal_video_check_format(struct cal_ctx *ctx)
    +@@ drivers/media/platform/ti/cal/cal-video.c: static void cal_release_buffers(struct cal_ctx *ctx,
    + static int cal_video_check_format(struct cal_ctx *ctx)
      {
    - 	const struct cal_format_info *rx_fmtinfo;
      	const struct v4l2_mbus_framefmt *format;
     +	struct v4l2_subdev_state *state;
      	struct media_pad *remote_pad;
    @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_video_check_format(str
     +		goto out;
     +	}
      
    - 	rx_fmtinfo = cal_format_by_code(format->code);
    --	if (!rx_fmtinfo)
    --		return -EINVAL;
    -+	if (!rx_fmtinfo) {
    -+		ret = -EINVAL;
    -+		goto out;
    -+	}
    - 
    - 	if (ctx->fmtinfo->fourcc != rx_fmtinfo->fourcc ||
    + 	if (ctx->fmtinfo->code != format->code ||
      	    ctx->v_fmt.fmt.pix.height != format->height ||
      	    ctx->v_fmt.fmt.pix.width != format->width ||
     -	    ctx->v_fmt.fmt.pix.field != format->field)
-:  ------------ > 3:  15a8758f536a media: ti: cal: Implement get_frame_desc for camera-rx
3:  bbd8fcfa857f ! 4:  1b698d8bb0ee media: ti: cal: add multiplexed streams support
    @@ Metadata
     Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
     
      ## Commit message ##
    -    media: ti: cal: add multiplexed streams support
    +    media: ti: cal: Add multiplexed streams support
     
         Add routing and stream_config support to CAL driver.
     
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static s64 cal_camerarx_get_ext_li
      	u32 bpp;
      	s64 freq;
      
    --	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
     +	/*
     +	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
     +	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static s64 cal_camerarx_get_ext_li
     +	 * causes v4l2_get_link_freq() to return an error if it falls back to
     +	 * V4L2_CID_PIXEL_RATE.
     +	 */
    ++
    + 	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
      
     -	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
    -+	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
    - 
    --	fmtinfo = cal_format_by_code(fmt->code);
    --	if (!fmtinfo)
    -+	if (state->routing.num_routes == 0)
    - 		return -EINVAL;
    - 
    --	bpp = fmtinfo->bpp;
     +	if (state->routing.num_routes > 1) {
     +		bpp = 0;
     +	} else {
    -+		const struct cal_format_info *fmtinfo;
     +		struct v4l2_subdev_route *route = &state->routing.routes[0];
    ++		const struct cal_format_info *fmtinfo;
     +		struct v4l2_mbus_framefmt *fmt;
    -+
    + 
    +-	fmtinfo = cal_format_by_code(fmt->code);
    +-	if (!fmtinfo)
    +-		return -EINVAL;
     +		fmt = v4l2_subdev_state_get_stream_format(
     +			state, route->sink_pad, route->sink_stream);
    -+
    + 
    +-	bpp = fmtinfo->bpp;
     +		fmtinfo = cal_format_by_code(fmt->code);
     +		if (!fmtinfo)
     +			return -EINVAL;
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static void cal_camerarx_ppi_disab
      }
      
     -static int cal_camerarx_start(struct cal_camerarx *phy)
    -+static int cal_camerarx_start(struct cal_camerarx *phy, u32 pad, u32 stream)
    ++static int cal_camerarx_start(struct cal_camerarx *phy, u32 sink_stream)
      {
     +	struct media_pad *remote_pad;
      	s64 link_freq;
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static void cal_camerarx_ppi_disab
      	u32 val;
      	int ret;
      
    -+	remote_pad = media_pad_remote_pad_first(&phy->pads[pad]);
    ++	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
     +
    - 	if (phy->enable_count > 0) {
    - 		phy->enable_count++;
    ++	/*
    ++	 * We need to enable the PHY hardware when enabling the first stream,
    ++	 * but for the following streams we just propagate the enable_streams
    ++	 * to the source.
    ++	 */
     +
    + 	if (phy->enable_count > 0) {
     +		ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
    -+						 BIT(stream));
    ++						 BIT(sink_stream));
     +		if (ret) {
    -+			phy->enable_count--;
    -+
     +			phy_err(phy, "enable streams failed in source: %d\n", ret);
     +			return ret;
     +		}
    ++
    + 		phy->enable_count++;
     +
      		return 0;
      	}
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_start(stru
      	 * CSI-2 PHY reset to complete.
      	 */
     -	ret = v4l2_subdev_call(phy->source, video, s_stream, 1);
    -+
     +	ret = v4l2_subdev_enable_streams(phy->source, remote_pad->index,
    -+					 BIT(stream));
    ++					 BIT(sink_stream));
      	if (ret) {
      		v4l2_subdev_call(phy->source, core, s_power, 0);
      		cal_camerarx_disable_irqs(phy);
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_start(stru
      }
      
     -static void cal_camerarx_stop(struct cal_camerarx *phy)
    -+static void cal_camerarx_stop(struct cal_camerarx *phy, u32 pad, u32 stream)
    ++static void cal_camerarx_stop(struct cal_camerarx *phy, u32 sink_stream)
      {
     +	struct media_pad *remote_pad;
      	int ret;
      
     -	if (--phy->enable_count > 0)
    -+	remote_pad = media_pad_remote_pad_first(&phy->pads[pad]);
    ++	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
     +
     +	if (--phy->enable_count > 0) {
     +		ret = v4l2_subdev_disable_streams(phy->source,
     +						  remote_pad->index,
    -+						  BIT(stream));
    ++						  BIT(sink_stream));
     +		if (ret)
     +			phy_err(phy, "stream off failed in subdev\n");
     +
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static void cal_camerarx_stop(stru
      
     -	if (v4l2_subdev_call(phy->source, video, s_stream, 0))
     +	ret = v4l2_subdev_disable_streams(phy->source, remote_pad->index,
    -+					  BIT(stream));
    ++					  BIT(sink_stream));
     +	if (ret)
      		phy_err(phy, "stream off failed in subdev\n");
      
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static inline struct cal_camerarx
      	struct cal_camerarx *phy = to_cal_camerarx(sd);
     -	struct v4l2_subdev_state *state;
     -	int ret = 0;
    -+	u32 other_pad, other_stream;
    ++	u32 sink_stream;
     +	int ret;
      
     -	state = v4l2_subdev_lock_and_get_active_state(sd);
    -+	if (WARN_ON(streams_mask != 1))
    -+		return -EINVAL;
    ++	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
    ++						    NULL, &sink_stream);
    ++	if (ret)
    ++		return ret;
      
     -	if (enable)
     -		ret = cal_camerarx_start(phy);
     -	else
     -		cal_camerarx_stop(phy);
    -+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
    -+						    &other_pad, &other_stream);
    -+	if (ret)
    -+		return ret;
    - 
    --	v4l2_subdev_unlock_state(state);
    -+	return cal_camerarx_start(phy, other_pad, other_stream);
    ++	return cal_camerarx_start(phy, sink_stream);
     +}
      
    --	return ret;
    +-	v4l2_subdev_unlock_state(state);
     +static int cal_camerarx_sd_disable_streams(struct v4l2_subdev *sd,
     +					   struct v4l2_subdev_state *state,
     +					   u32 pad, u64 streams_mask)
     +{
     +	struct cal_camerarx *phy = to_cal_camerarx(sd);
    -+	u32 other_pad, other_stream;
    ++	u32 sink_stream;
     +	int ret;
    -+
    -+	if (WARN_ON(streams_mask != 1))
    -+		return -EINVAL;
    -+
    + 
    +-	return ret;
     +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
    -+						    &other_pad, &other_stream);
    ++						    NULL, &sink_stream);
     +	if (ret)
     +		return ret;
     +
    -+	cal_camerarx_stop(phy, other_pad, other_stream);
    ++	cal_camerarx_stop(phy, sink_stream);
     +
     +	return 0;
      }
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_sd_set_fmt
      	return 0;
      }
      
    -+static int _cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
    -+					struct v4l2_subdev_state *state,
    -+					struct v4l2_subdev_krouting *routing)
    ++static int cal_camerarx_set_routing(struct v4l2_subdev *sd,
    ++				    struct v4l2_subdev_state *state,
    ++				    struct v4l2_subdev_krouting *routing)
     +{
     +	static const struct v4l2_mbus_framefmt format = {
     +		.width = 640,
     +		.height = 480,
    -+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
    ++		.code = MEDIA_BUS_FMT_UYVY8_1X16,
     +		.field = V4L2_FIELD_NONE,
     +		.colorspace = V4L2_COLORSPACE_SRGB,
     +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_sd_set_fmt
     +	};
     +	int ret;
     +
    -+	ret = v4l2_subdev_routing_validate(sd, routing, V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
    ++	ret = v4l2_subdev_routing_validate(sd, routing,
    ++					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
    ++					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
     +	if (ret)
     +		return ret;
     +
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_sd_set_fmt
     +				       enum v4l2_subdev_format_whence which,
     +				       struct v4l2_subdev_krouting *routing)
     +{
    -+	return _cal_camerarx_sd_set_routing(sd, state, routing);
    ++	return cal_camerarx_set_routing(sd, state, routing);
     +}
     +
      static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_sd_set_fmt
     -		.format = {
     -			.width = 640,
     -			.height = 480,
    --			.code = MEDIA_BUS_FMT_UYVY8_2X8,
    +-			.code = MEDIA_BUS_FMT_UYVY8_1X16,
     -			.field = V4L2_FIELD_NONE,
     -			.colorspace = V4L2_COLORSPACE_SRGB,
     -			.ycbcr_enc = V4L2_YCBCR_ENC_601,
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_sd_set_fmt
      
     -	return cal_camerarx_sd_set_fmt(sd, state, &format);
     +	/* Initialize routing to single route to the fist source pad */
    -+	return _cal_camerarx_sd_set_routing(sd, state, &routing);
    ++	return cal_camerarx_set_routing(sd, state, &routing);
      }
      
    + static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
    +@@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
    + 	struct cal_camerarx *phy = to_cal_camerarx(sd);
    + 	struct v4l2_mbus_frame_desc remote_desc;
    + 	const struct media_pad *remote_pad;
    ++	struct v4l2_subdev_state *state;
    ++	u32 sink_stream;
    ++	unsigned int i;
    + 	int ret;
    + 
    ++	state = v4l2_subdev_lock_and_get_active_state(sd);
    ++
    ++	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
    ++						    pad, 0,
    ++						    NULL, &sink_stream);
    ++	if (ret)
    ++		goto out_unlock;
    ++
    + 	remote_pad = media_pad_remote_pad_first(&phy->pads[CAL_CAMERARX_PAD_SINK]);
    +-	if (!remote_pad)
    +-		return -EPIPE;
    ++	if (!remote_pad) {
    ++		ret = -EPIPE;
    ++		goto out_unlock;
    ++	}
    + 
    + 	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
    + 			       remote_pad->index, &remote_desc);
    + 	if (ret)
    +-		return ret;
    ++		goto out_unlock;
    + 
    + 	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
    + 		dev_err(phy->cal->dev,
    + 			"Frame descriptor does not describe CSI-2 link");
    +-		return -EINVAL;
    ++		ret = -EINVAL;
    ++		goto out_unlock;
    ++	}
    ++
    ++	for (i = 0; i < remote_desc.num_entries; i++) {
    ++		if (remote_desc.entry[i].stream == sink_stream)
    ++			break;
    + 	}
    + 
    +-	if (remote_desc.num_entries > 1)
    +-		dev_dbg(phy->cal->dev,
    +-			"Multiple streams not supported in remote frame descriptor, using the first one\n");
    ++	if (i == remote_desc.num_entries) {
    ++		ret = -EINVAL;
    ++		goto out_unlock;
    ++	}
    + 
    + 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
    + 	fd->num_entries = 1;
    +-	fd->entry[0] = remote_desc.entry[0];
    ++	fd->entry[0] = remote_desc.entry[i];
    + 
    +-	return 0;
    +-}
    ++out_unlock:
    ++	v4l2_subdev_unlock_state(state);
    + 
     -static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
     -	.s_stream = cal_camerarx_sd_s_stream,
     -};
    --
    ++	return ret;
    ++}
    + 
      static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
     +	.enable_streams = cal_camerarx_sd_enable_streams,
     +	.disable_streams = cal_camerarx_sd_disable_streams,
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: static int cal_camerarx_sd_set_fmt
      	.get_fmt = v4l2_subdev_get_fmt,
      	.set_fmt = cal_camerarx_sd_set_fmt,
     +	.set_routing = cal_camerarx_sd_set_routing,
    + 	.get_frame_desc = cal_camerarx_get_frame_desc,
      };
      
      static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
    @@ drivers/media/platform/ti/cal/cal-camerarx.c: struct cal_camerarx *cal_camerarx_
      	snprintf(sd->name, sizeof(sd->name), "CAMERARX%u", instance);
      	sd->dev = cal->dev;
      
    - 	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
    -+
    - 	for (i = CAL_CAMERARX_PAD_FIRST_SOURCE; i < CAL_CAMERARX_NUM_PADS; ++i)
    - 		phy->pads[i].flags = MEDIA_PAD_FL_SOURCE;
    - 	sd->entity.ops = &cal_camerarx_media_ops;
    -@@ drivers/media/platform/ti/cal/cal-camerarx.c: void cal_camerarx_destroy(struct cal_camerarx *phy)
    - 		return;
    - 
    - 	v4l2_device_unregister_subdev(&phy->subdev);
    -+
    - 	v4l2_subdev_cleanup(&phy->subdev);
    -+
    - 	media_entity_cleanup(&phy->subdev.entity);
    - 	of_node_put(phy->source_ep_node);
    - 	of_node_put(phy->source_node);
     
      ## drivers/media/platform/ti/cal/cal-video.c ##
     @@ drivers/media/platform/ti/cal/cal-video.c: static int __subdev_get_format(struct cal_ctx *ctx,
    - {
    - 	struct v4l2_subdev_format sd_fmt;
    + 		.pad = 0,
    + 	};
      	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
     +	struct v4l2_subdev *sd = ctx->phy->source;
      	int ret;
      
    - 	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
    - 	sd_fmt.pad = 0;
    - 
     -	ret = v4l2_subdev_call(ctx->phy->source, pad, get_fmt, NULL, &sd_fmt);
     +	ret = v4l2_subdev_call_state_active(sd, pad, get_fmt, &sd_fmt);
      	if (ret)
      		return ret;
      
     @@ drivers/media/platform/ti/cal/cal-video.c: static int __subdev_set_format(struct cal_ctx *ctx,
    - {
    - 	struct v4l2_subdev_format sd_fmt;
    + 		.pad = 0,
    + 	};
      	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
     +	struct v4l2_subdev *sd = ctx->phy->source;
      	int ret;
      
    - 	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
    - 	sd_fmt.pad = 0;
      	*mbus_fmt = *fmt;
      
     -	ret = v4l2_subdev_call(ctx->phy->source, pad, set_fmt, NULL, &sd_fmt);
    @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_legacy_try_fmt_vid_cap
      	struct cal_ctx *ctx = video_drvdata(file);
     +	struct v4l2_subdev *sd = ctx->phy->source;
      	const struct cal_format_info *fmtinfo;
    - 	struct v4l2_subdev_frame_size_enum fse;
    - 	int found;
    + 	struct v4l2_subdev_frame_size_enum fse = {
    + 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
     @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
      	for (fse.index = 0; ; fse.index++) {
      		int ret;
    @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_legacy_enum_framesizes
      	struct cal_ctx *ctx = video_drvdata(file);
     +	struct v4l2_subdev *sd = ctx->phy->source;
      	const struct cal_format_info *fmtinfo;
    - 	struct v4l2_subdev_frame_size_enum fse;
    - 	int ret;
    + 	struct v4l2_subdev_frame_size_enum fse = {
    + 		.index = fsize->index,
     @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_legacy_enum_framesizes(struct file *file, void *fh,
    + 
      	fse.code = fmtinfo->code;
    - 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
      
     -	ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size, NULL,
     -			       &fse);
    @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_legacy_enum_frameinter
      	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
     @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_video_check_format(struct cal_ctx *ctx)
      {
    - 	const struct cal_format_info *rx_fmtinfo;
      	const struct v4l2_mbus_framefmt *format;
    --	struct v4l2_subdev_state *state;
    - 	struct media_pad *remote_pad;
    -+	struct v4l2_subdev_state *state;
    + 	struct v4l2_subdev_state *state;
    +-	struct media_pad *remote_pad;
    ++	struct media_pad *phy_source_pad;
      	int ret = 0;
      
    - 	remote_pad = media_pad_remote_pad_first(&ctx->pad);
    -@@ drivers/media/platform/ti/cal/cal-video.c: static int cal_video_check_format(struct cal_ctx *ctx)
    +-	remote_pad = media_pad_remote_pad_first(&ctx->pad);
    +-	if (!remote_pad)
    ++	phy_source_pad = media_pad_remote_pad_first(&ctx->pad);
    ++	if (!phy_source_pad)
    + 		return -ENODEV;
      
      	state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
      
     -	format = v4l2_subdev_get_pad_format(&ctx->phy->subdev, state, remote_pad->index);
    -+	format = v4l2_subdev_state_get_stream_format(state, remote_pad->index,
    -+						     0);
    ++	format = v4l2_subdev_state_get_stream_format(state,
    ++						     phy_source_pad->index, 0);
      	if (!format) {
      		ret = -EINVAL;
      		goto out;
    @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_video_check_format(str
      static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
      {
      	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
    -+	struct media_pad *remote_pad;
    ++	struct media_pad *phy_source_pad;
      	struct cal_buffer *buf;
      	dma_addr_t addr;
      	int ret;
      
    -+	remote_pad = media_pad_remote_pad_first(&ctx->pad);
    -+	if (!remote_pad) {
    ++	phy_source_pad = media_pad_remote_pad_first(&ctx->pad);
    ++	if (!phy_source_pad) {
     +		ctx_err(ctx, "Context not connected\n");
     +		ret = -ENODEV;
     +		goto error_release_buffers;
     +	}
    -+
    -+	if (cal_mc_api) {
    -+		struct v4l2_subdev_route *route = NULL;
    -+		struct v4l2_subdev_route *r;
    -+		struct v4l2_subdev_state *state;
    -+
    -+		/* Find the PHY connected to this video device */
    -+
    -+		ctx->phy = cal_camerarx_get_phy_from_entity(remote_pad->entity);
    -+
    -+		state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
    -+
    -+		/* Find the stream */
    -+
    -+		for_each_active_route(&state->routing, r) {
    -+			if (r->source_pad != remote_pad->index)
    -+				continue;
    -+
    -+			route = r;
    -+
    -+			break;
    -+		}
    -+
    -+		if (!route) {
    -+			v4l2_subdev_unlock_state(state);
    -+			ctx_err(ctx, "Failed to find route\n");
    -+			ret = -ENODEV;
    -+			goto error_release_buffers;
    -+		}
    -+
    -+		ctx->stream = route->sink_stream;
    -+
    -+		v4l2_subdev_unlock_state(state);
    -+	}
     +
      	ret = video_device_pipeline_alloc_start(&ctx->vdev);
      	if (ret < 0) {
      		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
    + 		goto error_release_buffers;
    + 	}
    + 
    ++	/* Find the PHY connected to this video device */
    ++	if (cal_mc_api)
    ++		ctx->phy = cal_camerarx_get_phy_from_entity(phy_source_pad->entity);
    ++
    + 	/*
    + 	 * Verify that the currently configured format matches the output of
    + 	 * the connected CAMERARX.
     @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
      	cal_ctx_set_dma_addr(ctx, addr);
      	cal_ctx_start(ctx);
      
     -	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
    -+	ret = v4l2_subdev_enable_streams(&ctx->phy->subdev, remote_pad->index,
    -+					 BIT(0));
    ++	ret = v4l2_subdev_enable_streams(&ctx->phy->subdev,
    ++					 phy_source_pad->index, BIT(0));
      	if (ret)
      		goto error_stop;
      
    @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_start_streaming(struct
      static void cal_stop_streaming(struct vb2_queue *vq)
      {
      	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
    -+	struct media_pad *remote_pad;
    ++	struct media_pad *phy_source_pad;
      
      	cal_ctx_stop(ctx);
      
     -	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
    -+	remote_pad = media_pad_remote_pad_first(&ctx->pad);
    ++	phy_source_pad = media_pad_remote_pad_first(&ctx->pad);
     +
    -+	v4l2_subdev_disable_streams(&ctx->phy->subdev, remote_pad->index,
    ++	v4l2_subdev_disable_streams(&ctx->phy->subdev, phy_source_pad->index,
     +				    BIT(0));
      
      	pm_runtime_put_sync(ctx->cal->dev);
    @@ drivers/media/platform/ti/cal/cal-video.c: static void cal_stop_streaming(struct
      }
      
      static const struct vb2_ops cal_video_qops = {
    -@@ drivers/media/platform/ti/cal/cal-video.c: static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
    +@@ drivers/media/platform/ti/cal/cal-video.c: static const struct v4l2_file_operations cal_fops = {
    + 
    + static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
    + {
    ++	struct v4l2_subdev *sd = ctx->phy->source;
    + 	struct v4l2_mbus_framefmt mbus_fmt;
      	const struct cal_format_info *fmtinfo;
      	unsigned int i, j, k;
    - 	int ret = 0;
    -+	struct v4l2_subdev *sd = ctx->phy->source;
    - 
    - 	/* Enumerate sub device formats and enable all matching local formats */
    - 	ctx->active_fmt = devm_kcalloc(ctx->cal->dev, cal_num_formats,
     @@ drivers/media/platform/ti/cal/cal-video.c: static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
    - 		memset(&mbus_code, 0, sizeof(mbus_code));
    - 		mbus_code.index = j;
    - 		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
    + 			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
    + 		};
    + 
     -		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_mbus_code,
     -				       NULL, &mbus_code);
     +		ret = v4l2_subdev_call_state_active(sd, pad, enum_mbus_code,
    @@ drivers/media/platform/ti/cal/cal-video.c: int cal_ctx_v4l2_register(struct cal_
     +		}
     +	} else {
     +		ret = media_create_pad_link(&ctx->phy->subdev.entity,
    -+			CAL_CAMERARX_PAD_FIRST_SOURCE, &vfd->entity, 0,
    -+			MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
    ++					    CAL_CAMERARX_PAD_FIRST_SOURCE,
    ++					    &vfd->entity, 0,
    ++					    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
     +		if (ret) {
     +			ctx_err(ctx,
     +				"Failed to create media link for context %u\n",
    @@ drivers/media/platform/ti/cal/cal-video.c: int cal_ctx_v4l2_register(struct cal_
      	ctx_info(ctx, "V4L2 device registered as %s\n",
     
      ## drivers/media/platform/ti/cal/cal.c ##
    -@@ drivers/media/platform/ti/cal/cal.c: static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
    - }
    - 
    - static int
    --cal_get_remote_frame_desc_entry(struct cal_camerarx *phy,
    -+cal_get_remote_frame_desc_entry(struct cal_camerarx *phy, u32 stream,
    - 				struct v4l2_mbus_frame_desc_entry *entry)
    - {
    - 	struct v4l2_mbus_frame_desc fd;
    -+	unsigned int i;
    - 	int ret;
    - 
    - 	ret = cal_camerarx_get_remote_frame_desc(phy, &fd);
    -@@ drivers/media/platform/ti/cal/cal.c: cal_get_remote_frame_desc_entry(struct cal_camerarx *phy,
    - 		return ret;
    - 	}
    - 
    --	if (fd.num_entries == 0) {
    --		dev_err(phy->cal->dev,
    --			"No streams found in the remote frame descriptor\n");
    --
    --		return -ENODEV;
    -+	for (i = 0; i < fd.num_entries; i++) {
    -+		if (stream == fd.entry[i].stream) {
    -+			*entry = fd.entry[i];
    -+			return 0;
    -+		}
    - 	}
    - 
    --	if (fd.num_entries > 1)
    --		dev_dbg(phy->cal->dev,
    --			"Multiple streams not supported in remote frame descriptor, using the first one\n");
    -+	dev_err(phy->cal->dev,
    -+		"Failed to find stream %u from remote frame descriptor\n",
    -+		stream);
    - 
    --	*entry = fd.entry[0];
    --
    --	return 0;
    -+	return -ENODEV;
    - }
    - 
    - int cal_ctx_prepare(struct cal_ctx *ctx)
     @@ drivers/media/platform/ti/cal/cal.c: int cal_ctx_prepare(struct cal_ctx *ctx)
    - 	struct v4l2_mbus_frame_desc_entry entry;
    - 	int ret;
    - 
    --	ret = cal_get_remote_frame_desc_entry(ctx->phy, &entry);
    -+	ret = cal_get_remote_frame_desc_entry(ctx->phy, ctx->stream, &entry);
    - 
    - 	if (ret == -ENOIOCTLCMD) {
      		ctx->vc = 0;
      		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
      	} else if (!ret) {
    @@ drivers/media/platform/ti/cal/cal.c: static struct cal_ctx *cal_ctx_create(struc
      	ctx->dma_ctx = inst;
      	ctx->csi2_ctx = inst;
      	ctx->cport = inst;
    -+	ctx->stream = 0;
    - 
    - 	ret = cal_ctx_v4l2_init(ctx);
    - 	if (ret) {
     @@ drivers/media/platform/ti/cal/cal.c: static int cal_probe(struct platform_device *pdev)
      	}
      
    @@ drivers/media/platform/ti/cal/cal.c: static int cal_probe(struct platform_device
     -			continue;
     +	if (!cal_mc_api) {
     +		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
    ++			struct cal_ctx *ctx;
    ++
     +			if (!cal->phy[i]->source_node)
     +				continue;
     +
    -+			cal->ctx[cal->num_contexts] = cal_ctx_create(cal, i);
    -+			if (!cal->ctx[cal->num_contexts]) {
    ++			ctx = cal_ctx_create(cal, i);
    ++			if (!ctx) {
     +				cal_err(cal, "Failed to create context %u\n", cal->num_contexts);
     +				ret = -ENODEV;
     +				goto error_context;
     +			}
     +
    -+			cal->ctx[cal->num_contexts]->phy = cal->phy[i];
    ++			ctx->phy = cal->phy[i];
      
     -		cal->ctx[cal->num_contexts] = cal_ctx_create(cal, i);
     -		if (!cal->ctx[cal->num_contexts]) {
     -			cal_err(cal, "Failed to create context %u\n", cal->num_contexts);
     -			ret = -ENODEV;
     -			goto error_context;
    -+			cal->num_contexts++;
    ++			cal->ctx[cal->num_contexts++] = ctx;
      		}
     +	} else {
     +		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
    -+			cal->ctx[i] = cal_ctx_create(cal, i);
    -+			if (!cal->ctx[i]) {
    ++			struct cal_ctx *ctx;
    ++
    ++			ctx = cal_ctx_create(cal, i);
    ++			if (!ctx) {
     +				cal_err(cal, "Failed to create context %u\n", i);
     +				ret = -ENODEV;
     +				goto error_context;
     +			}
      
     -		cal->num_contexts++;
    -+			cal->num_contexts++;
    ++			cal->ctx[cal->num_contexts++] = ctx;
     +		}
      	}
      
    @@ drivers/media/platform/ti/cal/cal.h
      #define CAL_CAMERARX_NUM_PADS		(1 + CAL_CAMERARX_NUM_SOURCE_PADS)
      
      static inline bool cal_rx_pad_is_sink(u32 pad)
    -@@ drivers/media/platform/ti/cal/cal.h: struct cal_ctx {
    - 	u8			pix_proc;
    - 	u8			vc;
    - 	u8			datatype;
    -+	u32			stream;
    +@@ drivers/media/platform/ti/cal/cal.h: const struct cal_format_info *cal_format_by_code(u32 code);
      
    - 	bool			use_pix_proc;
    - };
    -@@ drivers/media/platform/ti/cal/cal.h: void cal_quickdump_regs(struct cal_dev *cal);
    + void cal_quickdump_regs(struct cal_dev *cal);
      
    - int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
    - 				       struct v4l2_mbus_frame_desc *desc);
     +struct cal_camerarx *cal_camerarx_get_phy_from_entity(struct media_entity *entity);
      void cal_camerarx_disable(struct cal_camerarx *phy);
      void cal_camerarx_i913_errata(struct cal_camerarx *phy);

base-commit: 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41
prerequisite-patch-id: e800a6da6afee40be8a946ccf63518f6109749dd
prerequisite-patch-id: eb409cc6ffb895128d98b3fa664dcdcafd5e7dfc
prerequisite-patch-id: dedc1c09e4cff1dc58ce909e469bae30a3778a07
prerequisite-patch-id: 1e85d833252748e723b59f90788019fdeca92884
prerequisite-patch-id: bb4f7477e206ed1936e4632e7baa6514f7d957f4
-- 
2.34.1

