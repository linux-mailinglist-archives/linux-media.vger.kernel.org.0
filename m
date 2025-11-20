Return-Path: <linux-media+bounces-47514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D357EC755C7
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 17:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 11F0634A392
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 16:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEC1366559;
	Thu, 20 Nov 2025 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BhT/ostn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F9364EB3
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 16:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763655756; cv=none; b=B7oc+u/07ZeCHOI9qWABlgQ6ev7AZq/NtUqFWQC7XmqxhaH5yVsB98vrmATqCg56oX3v3gFxPAAtAtzZJQpsaf8NwLey1Hp2GktuNdtQ2RoHY/+3I4ZLAktfGpl/MNth0e9bw4Wp/5E7bQoC3SUFyyJpVu6TE1JrkWiywyOuqpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763655756; c=relaxed/simple;
	bh=ldU2hM/PJFgnKn4GVNs+eocEynXgauyHnjAB9Z3J/4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqiuS6A7eErJtzOGqaYgeo+zvr3LgHJC078SQAKJsicdklIWVfUERNqy658A/xWKbrwvY4aW/1rXehuPio8iHBGkoT+BJbRHIL4XpzDHzDEzZyPzBVDB/P8mg5Qr6vncLfyk1e54ZB5xusxeo40bvd0RPj2jvqwFbXuGngLM7MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BhT/ostn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (fs276ed015.tkyc509.ap.nuro.jp [39.110.208.21])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E6A7EB5;
	Thu, 20 Nov 2025 17:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763655624;
	bh=ldU2hM/PJFgnKn4GVNs+eocEynXgauyHnjAB9Z3J/4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhT/ostn7JIIu4uWlhLuisCjgdIO5kvjD4rs7mHRchTiw/yjc6G5+MsTFuKGR0m6a
	 aS+gKF1roL649jCClheY9Vk2SeRyeTphOycA0w7hRIcMuwD3glLFmhrrCkHY1cSKHT
	 JNO86jpwMFLPBeXsSalj4IN1St3cYzb+qguZJxCA=
Date: Fri, 21 Nov 2025 01:22:04 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v1 6/6] media: imx-mipi-csis: Add multi-channel support
Message-ID: <20251120162204.GN10711@pendragon.ideasonboard.com>
References: <20251107015813.5834-1-laurent.pinchart@ideasonboard.com>
 <20251107015813.5834-7-laurent.pinchart@ideasonboard.com>
 <aQ4iwFHVoweNl/mS@lizhi-Precision-Tower-5810>
 <AS8PR04MB90804FDFE5473E590A9570B9FAD4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS8PR04MB90804FDFE5473E590A9570B9FAD4A@AS8PR04MB9080.eurprd04.prod.outlook.com>

On Thu, Nov 20, 2025 at 03:12:56AM +0000, G.N. Zhou wrote:
> Hi Frank
> 
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: Saturday, November 8, 2025 12:48 AM
> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; G.N. Zhou
> > <guoniu.zhou@nxp.com>
> > Cc: linux-media@vger.kernel.org; Rui Miguel Silva <rmfrfs@gmail.com>; Martin
> > Kepplinger <martink@posteo.de>; Purism Kernel Team <kernel@puri.sm>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; imx@lists.linux.dev;
> > Stefan Klug <stefan.klug@ideasonboard.com>; Sakari Ailus <sakari.ailus@iki.fi>
> > Subject: Re: [PATCH v1 6/6] media: imx-mipi-csis: Add multi-channel support
> > 
> > On Fri, Nov 07, 2025 at 03:58:13AM +0200, Laurent Pinchart wrote:
> > > CSIS output channels can be used to demultiplex CSI-2 virtual
> > > channels, and likely data types. While this feature is not clearly
> > > documented, tests seem to indicate that each output channel includes
> > > filters to select which VC and DT to output, with the filtering mode
> > > being configured globally. Four modes are supported:
> > >
> > > - No filtering: all VCs and DTs are output on channel 0
> > > - VC filtering: each channel filters out all but the configured VC, the
> > >   DT is ignored
> > > - DT filtering: each channel filters out all but the configured DT, the
> > >   VC is ignored
> > > - DT and VC filtering: each channel filters out all but the configured
> > >   VC and DT
> > >
> > > Expose this feature to userspace through the streams API. The routing
> > > table is expanded to support multiple routes, with the source stream
> > > ID mapping to the output channel number. As the VC and DT values
> > > corresponding to a stream are not known until they get queried from
> > > the source, validation of the routes is postponed to stream enable
> > > time in the mipi_csis_calculate_params() function that extract the
> > > configuration of each output channel from the routing table. The
> > > validation ensures that, when filtering is enabled, each output
> > > channel is configured to output exactly one VC and one DT.
> > >
> > > When multiple streams are routed to the same output channel, the
> > > output heights is the sum of the heights of all the streams. This is
> > > implemented when propagating formats frim sink to source pads.
> > >
> > > Due to how the SoC glues together IP cores, multi-output operation in
> > > the i.MX8MP is used only for the purpose of capturing multi-exposure
> > > or multi-gain HDR streams from a camera sensor over different CSI-2
> > > VCs and transmitting them to the ISP. The streams are stitched
> > > together by the ISP and can't be captured individually. This has
> > > allowed testing VC filtering but not DT filtering. For that reason,
> > > multi-channel support is currently limited to VC filtering only.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Add guoniu.zhou@nxp.com, patch itself look good, but I am not famillar with
> > internal logic, Guoniu, can you help check it?
> 
> I searched the "Samsung MIPI_CSI-2_V3.6.3.1_User_Guide"

I wish I could access that document :-)

> and checked all
> descriptions about its interleave_mode. There is no details about the internal
> logic but according to the info in the User_Guide, I think Laurent's understanding
> is correct.

Thank you for the confirmation. I plan to send a new version of this
patch.

> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 264 ++++++++++++++++++---
> > >  1 file changed, 234 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > index d8c11223ed0a..b5c7ab7c541c 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -12,6 +12,7 @@
> > >   *
> > >   */
> > >
> > > +#include <linux/bitops.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/debugfs.h>
> > >  #include <linux/delay.h>
> > > @@ -334,7 +335,8 @@ struct mipi_csis_info {  };
> > >
> > >  struct mipi_csis_channel_params {
> > > -	unsigned int data_type;
> > > +	u16 vc_mask;
> > > +	u16 data_type;
> > >  	unsigned int width;
> > >  	unsigned int height;
> > >  };
> > > @@ -343,6 +345,7 @@ struct mipi_csis_params {
> > >  	u32 hs_settle;
> > >  	u32 clk_settle;
> > >
> > > +	bool interleave_vc;
> > >  	struct mipi_csis_channel_params
> > channels[MIPI_CSIS_MAX_CHANNELS];
> > > };
> > >
> > > @@ -626,7 +629,7 @@ static void mipi_csis_set_channel_params(struct
> > mipi_csis_device *csis,
> > >  		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> > >
> > >  	val |= MIPI_CSIS_ISPCFG_DATAFORMAT(params->data_type);
> > > -	val |= MIPI_CSIS_ISPCFG_VIRTUAL_CHANNEL(0);
> > > +	val |= MIPI_CSIS_ISPCFG_VIRTUAL_CHANNEL(ffs(params->vc_mask) -
> > 1);
> > >
> > >  	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(channel), val);
> > >
> > > @@ -645,20 +648,148 @@ static int mipi_csis_calculate_params(struct
> > mipi_csis_device *csis,
> > >  				      const struct v4l2_subdev_state *state,
> > >  				      struct mipi_csis_params *params)  {
> > > -	const struct v4l2_mbus_framefmt *format;
> > > -	const struct csis_pix_format *csis_fmt;
> > > +	const struct csis_pix_format *csis_fmt = NULL;
> > > +	struct v4l2_subdev_route *route;
> > > +	struct v4l2_mbus_frame_desc fd;
> > >  	s64 link_freq;
> > >  	u32 lane_rate;
> > > +	int ret;
> > >
> > > -	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > -	csis_fmt = find_csis_format(format->code);
> > > +	memset(params, 0, sizeof(*params));
> > >
> > > -	params->channels[0].data_type = csis_fmt->data_type;
> > > -	params->channels[0].width = format->width;
> > > -	params->channels[0].height = format->height;
> > > +	/*
> > > +	 * Translate routing configuration to output channels parameters.
> > > +	 *
> > > +	 * The CSIS VC and DT handling is poorly documented. The device
> > supports
> > > +	 * a global "interleave mode" parameter in the CMN_CTRL register that
> > > +	 * can be set to "VC and DT", "VC only", "DT only" or "CH0 only, no data
> > > +	 * interleave". The ISP_CONFIG registers specify DT and VC values per
> > > +	 * output channel.
> > > +	 *
> > > +	 * This can be interpreted as per-channel VC and DT filters, with the
> > > +	 * filter type being configured globally and the VC and DT configured
> > > +	 * per-channel. VC tests seem to corroborate this interpretation, but DT
> > > +	 * tests are yet to be performed.
> > > +	 */
> > > +	ret = v4l2_subdev_call(csis->source.sd, pad, get_frame_desc,
> > > +			       csis->source.pad->index, &fd);
> > > +	if (ret && ret != -ENOIOCTLCMD) {
> > > +		dev_err(csis->dev, "Failed to get source frame
> > descriptors: %d\n", ret);
> > > +		return ret;
> > > +	}
> > >
> > > -	/* Calculate the line rate from the pixel rate. */
> > > -	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
> > > +	if (ret == -ENOIOCTLCMD) {
> > > +		const struct v4l2_mbus_framefmt *format;
> > > +
> > > +		/*
> > > +		 * The source doesn't report frame descriptors. Assume a single
> > > +		 * stream on VC0.
> > > +		 */
> > > +		format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK,
> > 0);
> > > +		if (!format)
> > > +			return -EPIPE;
> > > +
> > > +		csis_fmt = find_csis_format(format->code);
> > > +
> > > +		fd.type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > > +		fd.num_entries = 1;
> > > +		fd.entry[0].pixelcode = format->code;
> > > +		fd.entry[0].bus.csi2.dt = csis_fmt->data_type;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Translate sink streams to source streams and fill the channel
> > > +	 * configuration vc_mask and data_type fields.
> > > +	 */
> > > +	for_each_active_route(&state->routing, route) {
> > > +		struct mipi_csis_channel_params *channel =
> > > +			&params->channels[route->source_stream];
> > > +		const struct v4l2_mbus_frame_desc_entry *entry = NULL;
> > > +
> > > +		/*
> > > +		 * Find the corresponding frame descriptor entry, to get the VC
> > > +		 * and DT for the stream. Multiple entries may match the
> > stream,
> > > +		 * but they have to all report the same VC and DT, so we can
> > > +		 * just use the first matching entry.
> > > +		 */
> > > +		for (unsigned int i = 0; i < fd.num_entries; ++i) {
> > > +			if (fd.entry[i].stream == route->sink_stream) {
> > > +				entry = &fd.entry[i];
> > > +				break;
> > > +			}
> > > +		}
> > > +
> > > +		if (!entry) {
> > > +			dev_dbg(csis->dev, "No frame descriptor for
> > stream %u\n",
> > > +				route->sink_stream);
> > > +			return -EPIPE;
> > > +		}
> > > +
> > > +		/*
> > > +		 * Routing constraint: all streams routed to the same output
> > > +		 * channel need to have the same DT.
> > > +		 */
> > > +		if (channel->data_type &&
> > > +		    channel->data_type != entry->bus.csi2.dt) {
> > > +			dev_dbg(csis->dev,
> > > +				"DT mismatch on channel %u: stream %u DT
> > 0x%02x != 0x%02x\n",
> > > +				route->source_stream, route->sink_stream,
> > > +				entry->bus.csi2.dt, channel->data_type);
> > > +			return -EPIPE;
> > > +		}
> > > +
> > > +		/* Record the VC and DT for the output channel. */
> > > +		channel->vc_mask |= BIT(entry->bus.csi2.vc);
> > > +		channel->data_type = entry->bus.csi2.dt;
> > > +
> > > +		/*
> > > +		 * If any output channel beside channel 0 is enabled, enable VC
> > > +		 * interleave mode.
> > > +		 */
> > > +		if (route->source_stream > 0)
> > > +			params->interleave_vc = true;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Iterate over the enabled output channels to record the width and
> > > +	 * height. Verify that the VC filtering matches the hardware
> > > +	 * constraints.
> > > +	 */
> > > +	for (unsigned int i = 0; i < csis->num_channels; ++i) {
> > > +		struct mipi_csis_channel_params *channel = &params-
> > >channels[i];
> > > +		const struct v4l2_mbus_framefmt *format;
> > > +
> > > +		if (!channel->vc_mask)
> > > +			continue;
> > > +
> > > +		/*
> > > +		 * In VC interleave mode, each output channel is limited to a
> > > +		 * single VC.
> > > +		 */
> > > +		if (params->interleave_vc && hweight8(channel->vc_mask) !=
> > 1) {
> > > +			dev_dbg(csis->dev,
> > > +				"Channel %u must output a single VCs\n", i);
> > > +			return -EPIPE;
> > > +		}
> > > +
> > > +		format = v4l2_subdev_state_get_format(state,
> > CSIS_PAD_SOURCE, i);
> > > +		if (!format) {
> > > +			dev_dbg(csis->dev, "No format for source
> > stream %u\n", i);
> > > +			return -EPIPE;
> > > +		}
> > > +
> > > +		channel->width = format->width;
> > > +		channel->height = format->height;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Calculate the line rate from the pixel rate. If the source supports
> > > +	 * the .get_frame_desc() operation it has to implement the LINK_FREQ
> > > +	 * control, as the link frequency can't be calculated from the pixel
> > > +	 * rate with multiple streams having possibly different data types.
> > > +	 */
> > > +	link_freq = v4l2_get_link_freq(csis->source.pad,
> > > +				       csis_fmt ? csis_fmt->width : 0,
> > >  				       csis->bus.num_data_lanes * 2);
> > >  	if (link_freq < 0) {
> > >  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
> > @@
> > > -704,6 +835,8 @@ static void mipi_csis_set_params(struct mipi_csis_device
> > *csis,
> > >  				 const struct mipi_csis_params *params)  {
> > >  	int lanes = csis->bus.num_data_lanes;
> > > +	u32 cmn_ctrl = 0;
> > > +	u32 clk_ctrl = 0;
> > >  	u32 val;
> > >
> > >  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL); @@ -714,19 +847,32
> > > @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> > >
> > >  	if (csis->info->version == MIPI_CSIS_V3_3)
> > >  		val |= MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT;
> > > +	if (params->interleave_vc)
> > > +		val |= MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_VC;
> > >
> > >  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
> > >
> > > -	mipi_csis_set_channel_params(csis, 0, &params->channels[0]);
> > > +	for (unsigned int i = 0; i < csis->num_channels; ++i) {
> > > +		const struct mipi_csis_channel_params *channel =
> > > +			&params->channels[i];
> > > +
> > > +		if (!channel->vc_mask)
> > > +			continue;
> > > +
> > > +		mipi_csis_set_channel_params(csis, i, channel);
> > > +
> > > +		cmn_ctrl |= MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(i);
> > > +		clk_ctrl |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(i, 15)
> > > +			 |  MIPI_CSIS_CLK_CTRL_WCLK_SRC(i);
> > > +	}
> > >
> > >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL,
> > >  			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(params-
> > >hs_settle) |
> > >  			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(params-
> > >clk_settle));
> > >
> > >  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> > > -	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
> > > -	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
> > >  	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
> > > +	val |= clk_ctrl;
> > >  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> > >
> > >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L, @@ -741,8 +887,7
> > @@
> > > static void mipi_csis_set_params(struct mipi_csis_device *csis,
> > >
> > >  	/* Update the shadow register. */
> > >  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > > -	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> > > -			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
> > > +	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val | cmn_ctrl |
> > >  			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
> > >  }
> > >
> > > @@ -1053,7 +1198,7 @@ static int mipi_csis_enum_mbus_code(struct
> > v4l2_subdev *sd,
> > >  		if (code->index > 0)
> > >  			return -EINVAL;
> > >
> > > -		fmt = v4l2_subdev_state_get_format(state, code->pad);
> > > +		fmt = v4l2_subdev_state_get_format(state, code->pad, code-
> > >stream);
> > >  		code->code = fmt->code;
> > >  		return 0;
> > >  	}
> > > @@ -1069,10 +1214,57 @@ static int mipi_csis_enum_mbus_code(struct
> > v4l2_subdev *sd,
> > >  	return 0;
> > >  }
> > >
> > > +static void mipi_csis_propagate_formats(struct mipi_csis_device *csis,
> > > +					struct v4l2_subdev_state *state) {
> > > +	const struct v4l2_mbus_framefmt
> > *channels[MIPI_CSIS_MAX_CHANNELS] = { };
> > > +	struct v4l2_subdev_route *route;
> > > +
> > > +	for_each_active_route(&state->routing, route) {
> > > +		const struct csis_pix_format *csis_fmt;
> > > +		struct v4l2_mbus_framefmt *sink_fmt;
> > > +		struct v4l2_mbus_framefmt *src_fmt;
> > > +
> > > +		sink_fmt = v4l2_subdev_state_get_format(state,
> > CSIS_PAD_SINK,
> > > +							route->sink_stream);
> > > +		src_fmt = v4l2_subdev_state_get_format(state,
> > CSIS_PAD_SOURCE,
> > > +						       route->source_stream);
> > > +
> > > +		csis_fmt = find_csis_format(sink_fmt->code);
> > > +
> > > +		/*
> > > +		 * If the output channel corresponding to this source stream
> > > +		 * isn't associated with a sink stream yet, simply propagate the
> > > +		 * format from sink stream to source stream and associate the
> > > +		 * sink stream with the channel.
> > > +		 *
> > > +		 * Otherwise, the sink stream format must match the primary
> > sink
> > > +		 * stream associated with the channel except for the height
> > that
> > > +		 * can be different. We propagate the format from the primary
> > to
> > > +		 * secondary sink stream, and accumulate the height in the
> > > +		 * source stream format.
> > > +		 */
> > > +		if (!channels[route->source_stream]) {
> > > +			*src_fmt = *sink_fmt;
> > > +			src_fmt->code = csis_fmt->output;
> > > +
> > > +			channels[route->source_stream] = sink_fmt;
> > > +		} else {
> > > +			unsigned int height = sink_fmt->height;
> > > +
> > > +			*sink_fmt = *channels[route->source_stream];
> > > +			sink_fmt->height = height;
> > > +
> > > +			src_fmt->height += sink_fmt->height;
> > > +		}
> > > +	}
> > > +}
> > > +
> > >  static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> > >  			     struct v4l2_subdev_state *state,
> > >  			     struct v4l2_subdev_format *sdformat)  {
> > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > >  	const struct csis_pix_format *csis_fmt;
> > >  	struct v4l2_mbus_framefmt *fmt;
> > >  	unsigned int align;
> > > @@ -1120,7 +1312,8 @@ static int mipi_csis_set_fmt(struct v4l2_subdev
> > *sd,
> > >  			      &sdformat->format.height, 1,
> > >  			      CSIS_MAX_PIX_HEIGHT, 0, 0);
> > >
> > > -	fmt = v4l2_subdev_state_get_format(state, sdformat->pad);
> > > +	fmt = v4l2_subdev_state_get_format(state, sdformat->pad,
> > > +					   sdformat->stream);
> > >
> > >  	fmt->code = csis_fmt->code;
> > >  	fmt->width = sdformat->format.width; @@ -1133,12 +1326,8 @@
> > static
> > > int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> > >
> > >  	sdformat->format = *fmt;
> > >
> > > -	/* Propagate the format from sink to source. */
> > > -	fmt = v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
> > > -	*fmt = sdformat->format;
> > > -
> > > -	/* The format on the source pad might change due to unpacking. */
> > > -	fmt->code = csis_fmt->output;
> > > +	/* Propagate the format. */
> > > +	mipi_csis_propagate_formats(csis, state);
> > >
> > >  	return 0;
> > >  }
> > > @@ -1155,7 +1344,7 @@ static int mipi_csis_get_frame_desc(struct
> > v4l2_subdev *sd, unsigned int pad,
> > >  		return -EINVAL;
> > >
> > >  	state = v4l2_subdev_lock_and_get_active_state(sd);
> > > -	fmt = v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
> > > +	fmt = v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE, 0);
> > >  	csis_fmt = find_csis_format(fmt->code);
> > >  	v4l2_subdev_unlock_state(state);
> > >
> > > @@ -1187,6 +1376,8 @@ static int __mipi_csis_set_routing(struct
> > v4l2_subdev *sd,
> > >  		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> > >  		.xfer_func = V4L2_XFER_FUNC_SRGB,
> > >  	};
> > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > +	struct v4l2_subdev_route *route;
> > >  	int ret;
> > >
> > >  	ret = v4l2_subdev_routing_validate(sd, routing, @@ -1194,15
> > +1385,27
> > > @@ static int __mipi_csis_set_routing(struct v4l2_subdev *sd,
> > >  	if (ret)
> > >  		return ret;
> > >
> > > -	/* Only a single route is supported for now. */
> > > -	if (routing->num_routes != 1 ||
> > > -	    !(routing->routes[0].flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> > > -		return -EINVAL;
> > > +	/*
> > > +	 * The source stream identifies the output channel. Validate that it
> > > +	 * does not exceed the number of channels available in the device. The
> > > +	 * other routing constraints can't be validated now as they require
> > > +	 * querying the frame descriptor on the sink side, which can only be
> > > +	 * done when enabling streaming.
> > > +	 */
> > > +	for_each_active_route(routing, route) {
> > > +		if (route->source_stream >= csis->num_channels) {
> > > +			dev_dbg(csis->dev, "Invalid source stream %u",
> > > +				route->source_stream);
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> > >
> > >  	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
> > >  	if (ret)
> > >  		return ret;
> > >
> > > +	mipi_csis_propagate_formats(csis, state);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -1554,7 +1757,8 @@ static int mipi_csis_subdev_init(struct
> > mipi_csis_device *csis)
> > >  	snprintf(sd->name, sizeof(sd->name), "csis-%s",
> > >  		 dev_name(csis->dev));
> > >
> > > -	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > V4L2_SUBDEV_FL_HAS_EVENTS;
> > > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > V4L2_SUBDEV_FL_HAS_EVENTS
> > > +		  |  V4L2_SUBDEV_FL_STREAMS;
> > >  	sd->ctrl_handler = NULL;
> > >
> > >  	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;

-- 
Regards,

Laurent Pinchart

