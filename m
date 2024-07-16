Return-Path: <linux-media+bounces-15046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF0932371
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 11:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68929284918
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DA0197A86;
	Tue, 16 Jul 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qFqm4261"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047B12E832;
	Tue, 16 Jul 2024 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721123720; cv=none; b=KrjARhTmbPFhR82amFXWKgzpgDn3aird0a7vH/zO3aV4fHeZ49Ed19KIYyAM3jzzlFQjDscT3fXgEPEk3tF+ELdmkr4v4PjiHSah1yYocsZz1akFQTVJiOXPSI1N7RZ9DjQiKKbYogUDx3giRdSdLvfp+5hMk+S6MZ+8DCVg11I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721123720; c=relaxed/simple;
	bh=+IVxiYVNQqICQzSWlcX+zgvRLJrhC5CF+n4fONciDVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNHFc4Ep1KxBi6Ytw5Eae4LlbyYT14RTvJ9a2SeTr2MAMUCHqgCMRR9uCcgtJQptn3Cp/S6WlN3lGX+U72Nra2DWonXBkvT9bgrgspN/fjioco3krNbRyH9+vPHdcXtftCGzK36oVWU+32k/caNJJVkWQdLdeojHpVWmeb1s2Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qFqm4261; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6D6D2B3;
	Tue, 16 Jul 2024 11:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721123678;
	bh=+IVxiYVNQqICQzSWlcX+zgvRLJrhC5CF+n4fONciDVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFqm4261XJfyyPVlQvDlSHuwQAm9N3CY1dXE3I0okzbFk0G41FPTHujQ1oUi4N6Hp
	 SpsdQ9EDB2Yusq2UiT9eTN05AVA7IBzMqGlN7ihLC8gYYChmXw8vCrIFLrnXmxwAdv
	 IC0LHfBgJOks7JdBdmtg1/FhvJQNOGOtP+Zbtu0g=
Date: Tue, 16 Jul 2024 11:55:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Devarsh Thakkar <devarsht@ti.com>, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Julien Massot <julien.massot@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 11/13] media: cadence: csi2rx: Enable multi-stream
 support
Message-ID: <njzoj4seict4trpjkhu25y23abtbqwujvn7vaabxuy4v2litd4@eyw7k4mq6fve>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-11-6ae96c54c1c3@ti.com>
 <s6zyk5t3ry7hlz6xjf2wnsefpym3meughrzyzidvht3wvogzwi@54bcbdadlp4b>
 <3byg7obpmc5xfsnr4b3secs7d2cctvbfujudwp2zxyinlo75tn@77fkdjmagj7b>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tthsmqu7jhlbraye"
Content-Disposition: inline
In-Reply-To: <3byg7obpmc5xfsnr4b3secs7d2cctvbfujudwp2zxyinlo75tn@77fkdjmagj7b>


--tthsmqu7jhlbraye
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Subject: Re: [PATCH v2 11/13] media: cadence: csi2rx: Enable multi-stream
 support
MIME-Version: 1.0

Hi Jai

On Tue, Jul 16, 2024 at 03:04:55PM GMT, Jai Luthra wrote:
> Hi Jacopo,
>
> Thanks for the review.
>
> On Jul 12, 2024 at 18:09:48 +0200, Jacopo Mondi wrote:
> > Hi Jai
> >
> > On Thu, Jun 27, 2024 at 06:40:06PM GMT, Jai Luthra wrote:
> > > Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
> > > of data over the same physical interface using MIPI Virtual Channels.
> > >
> > > The V4L2 subdev APIs should reflect this capability and allow per-stream
> > > routing and controls.
> > >
> > > While the hardware IP supports usecases where streams coming in the sink
> > > pad can be broadcasted to multiple source pads, the driver will need
> > > significant re-architecture to make that possible. The two users of this
> > > IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
> > > have only integrated the first source pad i.e stream0 of this IP. So for
> > > now keep it simple and only allow 1-to-1 mapping of streams from sink to
> > > source, without any broadcasting.
> > >
> > > With stream routing now supported in the driver, implement the
> > > enable_stream and disable_stream hooks in place of the stream-unaware
> > > s_stream hook.
> > >
> > > This allows consumer devices like a DMA bridge or ISP, to enable
> > > particular streams on a source pad, which in turn can be used to enable
> > > only particular streams on the CSI-TX device connected on the sink pad.
> > >
> > > Implement a fallback s_stream hook that internally calls enable_stream
> > > on each source pad, for consumer drivers that don't use multi-stream
> > > APIs to still work.
> > >
> > > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > > ---
> > >  drivers/media/platform/cadence/cdns-csi2rx.c | 407 ++++++++++++++++++++-------
> > >  1 file changed, 313 insertions(+), 94 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> > > index 2ec34fc9c524..b0c91a9c65e8 100644
> > > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > > @@ -90,6 +90,7 @@ struct csi2rx_priv {
> > >  	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
> > >  	struct phy			*dphy;
> > >
> > > +	u32				vc_select[CSI2RX_STREAMS_MAX];
> > >  	u8				lanes[CSI2RX_LANES_MAX];
> > >  	u8				num_lanes;
> > >  	u8				max_lanes;
> > > @@ -179,27 +180,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
> > >
> > >  static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
> > >  {
> > > +	struct v4l2_ctrl_handler *handler = csi2rx->source_subdev->ctrl_handler;
> > >  	union phy_configure_opts opts = { };
> > >  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> > > -	struct v4l2_subdev_format sd_fmt = {
> > > -		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
> > > -		.pad	= CSI2RX_PAD_SINK,
> > > -	};
> > > +	struct v4l2_mbus_framefmt *framefmt;
> > > +	struct v4l2_subdev_state *state;
> > >  	const struct csi2rx_fmt *fmt;
> > >  	s64 link_freq;
> > >  	int ret;
> > >
> > > -	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
> > > -					    &sd_fmt);
> > > -	if (ret < 0)
> > > -		return ret;
> > > +	if (v4l2_ctrl_find(handler, V4L2_CID_LINK_FREQ)) {
> >
> > Do you need to do this by yourself ? afaict v4l2_get_link_freq()
> > already checks if V4L2_CID_LINK_FREQ is available, and if not,
> > fallsback to use PIXEL_RATE.
> >
> > > +		link_freq = v4l2_get_link_freq(handler, 0, 0);
> > > +	} else {
> > > +		state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
> > > +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
> > > +							0);
> > > +
> > > +		if (framefmt) {
> > > +			fmt = csi2rx_get_fmt_by_code(framefmt->code);
> > > +		} else {
> > > +			dev_err(csi2rx->dev,
> > > +				"Did not find active sink format\n");
> > > +			return -EINVAL;
> >
> > Is this possibile ?
> >
> > > +		}
> > >
> > > -	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
> > > +		link_freq = v4l2_get_link_freq(handler, fmt->bpp,
> > > +					       2 * csi2rx->num_lanes);
> >
> > Do we want to allow falling back on PIXEL_RATE for multiplexed
> > transmitters ? I presume this will give you invalid results anyway.
>
> This is mostly done to avoid breaking any single stream sensor that does
> not have the LINK_FREQ control, and was working with this bridge before.
> Thus the warning below for multi-format sources.

Is it possible to allow usage of PIXEL_LINK only for non-multiplexed
transmitters ?

> >
> > I would simply call v4l2_get_link_freq(handler, 0, 0) to force the
> > usage of LINK_FREQ which will become mandatory for transmitters
>
> Ah I did not know LINK_FREQ will be mandatory soon. Any threads I can
> look at where this was discussed?
>

I meant mandatory for multiplexed transmitters, which will have to be
'forced' to use LINK_FREQ as PIXEL_RATE doesn't make much sense for
them

> >
> > >
> > > -	link_freq = v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
> > > -				       fmt->bpp, 2 * csi2rx->num_lanes);
> > > -	if (link_freq < 0)
> > > +		dev_warn(csi2rx->dev,
> > > +			 "Guessing link frequency using bitdepth of stream 0.\n");
> > > +		dev_warn(csi2rx->dev,
> > > +			 "V4L2_CID_LINK_FREQ control is required for multi format sources.\n");
> >
> > Exactly :)
> >
> > > +	}
> > > +
> > > +	if (link_freq < 0) {
> > > +		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
> > >  		return link_freq;
> > > +	}
> > >
> > >  	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
> > >  							 csi2rx->num_lanes, cfg);
> > > @@ -222,18 +239,10 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
> > >  static int csi2rx_start(struct csi2rx_priv *csi2rx)
> > >  {
> > >  	unsigned int i;
> > > -	struct media_pad *remote_pad;
> > >  	unsigned long lanes_used = 0;
> > >  	u32 reg;
> > >  	int ret;
> > >
> > > -	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> > > -	if (!remote_pad) {
> > > -		dev_err(csi2rx->dev,
> > > -			"Failed to find connected source\n");
> > > -		return -ENODEV;
> > > -	}
> > > -
> > >  	ret = clk_prepare_enable(csi2rx->p_clk);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -300,11 +309,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
> > >  		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
> > >  		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
> > >
> > > -		/*
> > > -		 * Enable one virtual channel. When multiple virtual channels
> > > -		 * are supported this will have to be changed.
> > > -		 */
> > > -		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
> > > +		writel(csi2rx->vc_select[i],
> > >  		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
> > >
> > >  		writel(CSI2RX_STREAM_CTRL_START,
> > > @@ -317,17 +322,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
> > >
> > >  	reset_control_deassert(csi2rx->sys_rst);
> > >
> > > -	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev,
> > > -					 remote_pad->index, BIT(0));
> > > -	if (ret)
> > > -		goto err_disable_sysclk;
> > > -
> > >  	clk_disable_unprepare(csi2rx->p_clk);
> > >
> > >  	return 0;
> > >
> > > -err_disable_sysclk:
> > > -	clk_disable_unprepare(csi2rx->sys_clk);
> > >  err_disable_pixclk:
> > >  	for (; i > 0; i--) {
> > >  		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> > > @@ -346,7 +344,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
> > >
> > >  static void csi2rx_stop(struct csi2rx_priv *csi2rx)
> > >  {
> > > -	struct media_pad *remote_pad;
> > >  	unsigned int i;
> > >  	u32 val;
> > >  	int ret;
> > > @@ -375,13 +372,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
> > >  	reset_control_assert(csi2rx->p_rst);
> > >  	clk_disable_unprepare(csi2rx->p_clk);
> > >
> > > -	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> > > -	if (!remote_pad ||
> > > -	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
> > > -					remote_pad->index, BIT(0))) {
> > > -		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
> > > -	}
> > > -
> > >  	if (csi2rx->dphy) {
> > >  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
> > >
> > > @@ -390,47 +380,167 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
> > >  	}
> > >  }
> > >
> > > -static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
> > > +static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
> > > +				    struct v4l2_subdev_state *state)
> > >  {
> > > -	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> > > -	int ret = 0;
> > > +	struct v4l2_mbus_frame_desc fd = {0};
> > > +	struct v4l2_subdev_route *route;
> > > +	unsigned int i;
> > > +	int ret;
> > >
> > > -	if (enable) {
> > > -		ret = pm_runtime_resume_and_get(csi2rx->dev);
> > > -		if (ret < 0)
> > > -			return ret;
> > > +	for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
> > > +		csi2rx->vc_select[i] = 0;
> >
> > or just memset ?
>
> Will do.
>
> >
> > > +
> > > +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
> > > +	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> > > +		dev_dbg(csi2rx->dev,
> > > +			"Failed to get source frame desc, allowing only VC=0\n");
> >
> > I'm still not sure if picking a default fallback is a good idea or not,
> > as this will only work by chance
> >
> > > +		goto err_no_fd;
> > >  	}
> > >
> > > -	mutex_lock(&csi2rx->lock);
> > > +	/* If source provides per-stream VC info, use it to filter by VC */
> > > +	for_each_active_route(&state->routing, route) {
> > > +		int cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
> >
> > unsigned maybe ?
>
> Will fix.
>
> >
> > > +		u8 used_vc = 0;
> > >
> > > -	if (enable) {
> > > -		/*
> > > -		 * If we're not the first users, there's no need to
> > > -		 * enable the whole controller.
> > > -		 */
> > > -		if (!csi2rx->count) {
> > > -			ret = csi2rx_start(csi2rx);
> > > -			if (ret) {
> > > -				pm_runtime_put(csi2rx->dev);
> > > -				goto out;
> > > +		for (i = 0; i < fd.num_entries; i++) {
> > > +			if (fd.entry[i].stream == route->sink_stream) {
> > > +				used_vc = fd.entry[i].bus.csi2.vc;
> > > +				break;
> > >  			}
> > >  		}
> > > +		csi2rx->vc_select[cdns_stream] |=
> >
> > Why |= ? do you expect to be able to capture multiple VC per stream ?
> > I don't think that's allowed ?
>
> The intention here is to allow multiple VC on the same source pad.
> Confusingly enough cadence calls the source pads as "stream0,1,2,3" and
> this driver uses that convention in the macros :/
>
> This cdns-csi2rx bridge is an intermediary between the sensor and ti's
> wrapper IP (platform/ti/j721e-csi2rx.c) which is connected to the first
> source pad of cdns-csi2rx on TI SoCs like AM62A [1]
>
> Ultimately the wrapper will separate incoming streams by VC/DT into
> different DMA channels, so no filtering is done here.
>
> [1]: Section 12.6.4.1 CSI_RX_IF Block Diagram in AM62A TRM
> https://www.ti.com/lit/pdf/spruj16
>
> >
> > > +			CSI2RX_STREAM_DATA_CFG_VC_SELECT(used_vc);
> >
> > In case no stream matching route->sink_stream is found in the remote's
> > frame descriptor this sets CSI2RX_STREAM_DATA_CFG_VC_SELECT(0) for
> > vc_select[x]...
> >
> > > +	}
> > >
> > > -		csi2rx->count++;
> > > -	} else {
> > > -		csi2rx->count--;
> > > +err_no_fd:
> > > +	for (i = 0; i < CSI2RX_STREAMS_MAX; i++) {
> > > +		if (!csi2rx->vc_select[i]) {
> > > +			csi2rx->vc_select[i] =
> > > +				CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
> >
> > ... so why doing it again here (assuming the no_fd case should be
> > dropped).
>
> Ah good catch, will fix.
>
> >
> > Also, setting multiple streams to capture on VC=0 will multiplex the
> > same stream or cause troubles ?
> >
> > Also, as you have an initial loop already this could maybe be:
> >
> >         /* Initialize all streams to capture VC 0 by default. */
> > 	for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
> > 		csi2rx->vc_select[i] =  CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
> >
> > 	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
> > 	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> > 		dev_dbg(csi2rx->dev,
> > 			"Failed to get source frame desc, allowing only VC=0\n");
> > 		return;
> > 	}
> >
> > 	/* If source provides per-stream VC info, use it to filter by VC */
> > 	for_each_active_route(&state->routing, route) {
> > 		int cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
> >
> > 		for (i = 0; i < fd.num_entries; i++) {
> > 			if (fd.entry[i].stream != route->sink_stream)
> >                                 continue;
> >
> >                         csi2rx->vc_select[cdns_stream] =
> >                                 CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
>
> Thanks will do this in v3.
>
> > 		}
> > 	}
> >
> > > +		}
> > > +	}
> > > +}
> > >
> > > -		/*
> > > -		 * Let the last user turn off the lights.
> > > -		 */
> > > -		if (!csi2rx->count)
> > > -			csi2rx_stop(csi2rx);
> > > +static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
> > > +				 struct v4l2_subdev_state *state, u32 pad,
> > > +				 u64 streams_mask)
> > > +{
> > > +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> > > +	struct media_pad *remote_pad;
> > > +	u64 sink_streams;
> > > +	int ret;
> > > +
> > > +	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> > > +	if (!remote_pad) {
> > > +		dev_err(csi2rx->dev,
> > > +			"Failed to find connected source\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	ret = pm_runtime_resume_and_get(csi2rx->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> > > +						       CSI2RX_PAD_SINK,
> > > +						       &streams_mask);
> > >
> > > -		pm_runtime_put(csi2rx->dev);
> > > +	mutex_lock(&csi2rx->lock);
> > > +	/*
> > > +	 * If we're not the first users, there's no need to
> > > +	 * enable the whole controller.
> > > +	 */
> > > +	if (!csi2rx->count) {
> > > +		ret = csi2rx_start(csi2rx);
> > > +		if (ret)
> > > +			goto err_stream_start;
> >
> > I'm not 100% familiar with this new API but I was expecting you
> > wouldn't need to do so
> >
> > >  	}
> > >
> > > -out:
> > > +	/* Start streaming on the source */
> > > +	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, remote_pad->index,
> > > +					 sink_streams);
> > > +	if (ret) {
> > > +		dev_err(csi2rx->dev,
> > > +			"Failed to start streams %#llx on subdev\n",
> > > +			sink_streams);
> > > +		goto err_subdev_enable;
> > > +	}
> > > +
> > > +	csi2rx->count++;
> > > +	mutex_unlock(&csi2rx->lock);
> > > +
> > > +	return 0;
> > > +
> > > +err_subdev_enable:
> > > +	if (!csi2rx->count)
> > > +		csi2rx_stop(csi2rx);
> > > +err_stream_start:
> > >  	mutex_unlock(&csi2rx->lock);
> > > +	pm_runtime_put(csi2rx->dev);
> > > +	return ret;
> > > +}
> > > +
> > > +static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
> > > +				  struct v4l2_subdev_state *state, u32 pad,
> > > +				  u64 streams_mask)
> > > +{
> > > +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> > > +	struct media_pad *remote_pad;
> > > +	u64 sink_streams;
> > > +
> > > +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> > > +						       CSI2RX_PAD_SINK,
> > > +						       &streams_mask);
> > > +
> > > +	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> > > +	if (!remote_pad ||
> > > +	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
> > > +					remote_pad->index, sink_streams)) {
> > > +		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
> > > +	}
> > > +
> > > +	mutex_lock(&csi2rx->lock);
> > > +	csi2rx->count--;
> > > +	/*
> > > +	 * Let the last user turn off the lights.
> > > +	 */
> > > +	if (!csi2rx->count)
> > > +		csi2rx_stop(csi2rx);
> > > +	mutex_unlock(&csi2rx->lock);
> > > +
> > > +	pm_runtime_put(csi2rx->dev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int csi2rx_s_stream_fallback(struct v4l2_subdev *sd, int enable)
> > > +{
> > > +	struct v4l2_subdev_state *state;
> > > +	struct v4l2_subdev_route *route;
> > > +	u64 mask[CSI2RX_PAD_MAX] = {0};
> > > +	int i, ret;
> > > +
> > > +	/* Find the stream mask on all source pads */
> > > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > > +	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> > > +		for_each_active_route(&state->routing, route) {
> > > +			if (route->source_pad == i)
> > > +				mask[i] |= BIT_ULL(route->source_stream);
> > > +		}
> > > +	}
> > > +	v4l2_subdev_unlock_state(state);
> > > +
> > > +	/* Start streaming on each pad */
> > > +	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> > > +		if (enable)
> > > +			ret = v4l2_subdev_enable_streams(sd, i, mask[i]);
> > > +		else
> > > +			ret = v4l2_subdev_disable_streams(sd, i, mask[i]);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > >  	return ret;
> > >  }
> > >
> > > @@ -446,12 +556,63 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
> > >  	return 0;
> > >  }
> > >
> > > +static int _csi2rx_set_routing(struct v4l2_subdev *subdev,
> > > +			       struct v4l2_subdev_state *state,
> > > +			       struct v4l2_subdev_krouting *routing)
> > > +{
> > > +	static const struct v4l2_mbus_framefmt format = {
> > > +		.width = 640,
> > > +		.height = 480,
> > > +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> > > +		.field = V4L2_FIELD_NONE,
> > > +		.colorspace = V4L2_COLORSPACE_SRGB,
> > > +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
> > > +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> > > +		.xfer_func = V4L2_XFER_FUNC_SRGB,
> > > +	};
> > > +	int ret;
> > > +
> > > +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> > > +		return -EINVAL;
> >
> > Isn't there a max number of routes supported by the HW ?
> >
>
> I guess yes, 16 VC x 4 output pads should be the total routes possible,
> but that is much greater than the current FRAME_DESC_ENTRY_MAX (= 8)

I was not expecting FRAME_DESC_ENTRY_MAX to be that small :/

>
> This check was re-used from ds90ub9xx.c drivers.
>
> > > +
> > > +	ret = v4l2_subdev_routing_validate(subdev, routing,
> > > +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &format);
> >
> >         return ...
>
> Will fix.
>
> >
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int csi2rx_set_routing(struct v4l2_subdev *subdev,
> > > +			      struct v4l2_subdev_state *state,
> > > +			      enum v4l2_subdev_format_whence which,
> > > +			      struct v4l2_subdev_krouting *routing)
> > > +{
> > > +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> > > +	int ret;
> > > +
> > > +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csi2rx->count)
> > > +		return -EBUSY;
> > > +
> > > +	ret = _csi2rx_set_routing(subdev, state, routing);
> > > +
> >
> > no empty line
>
> Will fix.
>
> >
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	csi2rx_update_vc_select(csi2rx, state);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
> > >  			  struct v4l2_subdev_state *state,
> > >  			  struct v4l2_subdev_format *format)
> > >  {
> > >  	struct v4l2_mbus_framefmt *fmt;
> > > -	unsigned int i;
> > >
> > >  	/* No transcoding, source and sink formats must match. */
> > >  	if (format->pad != CSI2RX_PAD_SINK)
> > > @@ -463,14 +624,19 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
> > >  	format->format.field = V4L2_FIELD_NONE;
> > >
> > >  	/* Set sink format */
> > > -	fmt = v4l2_subdev_state_get_format(state, format->pad);
> > > +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> > > +	if (!fmt)
> > > +		return -EINVAL;
> > > +
> > >  	*fmt = format->format;
> > >
> > > -	/* Propagate to source formats */
> > > -	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> > > -		fmt = v4l2_subdev_state_get_format(state, i);
> > > -		*fmt = format->format;
> > > -	}
> > > +	/* Propagate to source format */
> > > +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> > > +							   format->stream);
> > > +	if (!fmt)
> > > +		return -EINVAL;
> >
> > again I'm not sure this can happen
>
> Will fix.
>
> >
> > > +
> > > +	*fmt = format->format;
> > >
> > >  	return 0;
> > >  }
> > > @@ -478,40 +644,92 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
> > >  static int csi2rx_init_state(struct v4l2_subdev *subdev,
> > >  			     struct v4l2_subdev_state *state)
> > >  {
> > > -	struct v4l2_subdev_format format = {
> > > -		.pad = CSI2RX_PAD_SINK,
> > > -		.format = {
> > > -			.width = 640,
> > > -			.height = 480,
> > > -			.code = MEDIA_BUS_FMT_UYVY8_1X16,
> > > -			.field = V4L2_FIELD_NONE,
> > > -			.colorspace = V4L2_COLORSPACE_SRGB,
> > > -			.ycbcr_enc = V4L2_YCBCR_ENC_601,
> > > -			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> > > -			.xfer_func = V4L2_XFER_FUNC_SRGB,
> > > +	struct v4l2_subdev_route routes[] = {
> >
> > static const ?
>
> Will fix.
>
> >
> > > +		{
> > > +			.sink_pad = CSI2RX_PAD_SINK,
> > > +			.sink_stream = 0,
> > > +			.source_pad = CSI2RX_PAD_SOURCE_STREAM0,
> > > +			.source_stream = 0,
> > > +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > >  		},
> > >  	};
> > >
> > > -	return csi2rx_set_fmt(subdev, state, &format);
> > > +	struct v4l2_subdev_krouting routing = {
> >
> > static const ?
>
> Will fix.
>
> >
> > > +		.num_routes = ARRAY_SIZE(routes),
> > > +		.routes = routes,
> > > +	};
> > > +
> > > +	return _csi2rx_set_routing(subdev, state, &routing);
> > >  }
> > >
> > >  static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> > >  				 struct v4l2_mbus_frame_desc *fd)
> > >  {
> > >  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> > > +	struct v4l2_mbus_frame_desc source_fd = {0};
> > > +	struct v4l2_subdev_route *route;
> > > +	struct v4l2_subdev_state *state;
> > > +	int ret;
> > > +
> > > +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &source_fd);
> >
> > Should this inspect the remote frame desc or only the local routing
> > table ?
>
> We want to use the correct VC, if the source is sending two streams with
> VC=1 and VC=2, we want to make sure the output streams are also setting
> that data in the frame descriptors for this subdev.
>

Isn't it something related to the routing table validation ?

> >
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > >
> > > -	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
> > > +	state = v4l2_subdev_lock_and_get_active_state(subdev);
> > > +
> > > +	for_each_active_route(&state->routing, route) {
> > > +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> > > +		unsigned int i;
> > > +
> > > +		if (route->source_pad != pad)
> > > +			continue;
> > > +
> > > +		for (i = 0; i < source_fd.num_entries; i++) {
> > > +			if (source_fd.entry[i].stream == route->sink_stream) {
> > > +				source_entry = &source_fd.entry[i];
> > > +				break;
> > > +			}
> > > +		}
> > > +
> > > +		if (!source_entry) {
> > > +			dev_err(csi2rx->dev,
> > > +				"Failed to find stream from source frame desc\n");
> > > +			ret = -EPIPE;
> > > +			goto err_missing_stream;
> > > +		}
> > > +
> > > +		fd->entry[fd->num_entries].stream = route->source_stream;
> > > +		fd->entry[fd->num_entries].flags = source_entry->flags;
> > > +		fd->entry[fd->num_entries].length = source_entry->length;
> > > +		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
> > > +		fd->entry[fd->num_entries].bus.csi2.vc =
> > > +			source_entry->bus.csi2.vc;
> > > +		fd->entry[fd->num_entries].bus.csi2.dt =
> > > +			source_entry->bus.csi2.dt;
> > > +
> > > +		fd->num_entries++;
> >
> > as you
> >
> > 		if (route->source_pad != pad)
> > 			continue;
> >
> > can you have multiple entris on a pad ?
>
> Yes, this IP will pass through all incoming streams on sink to the first
> source.
>
> >
> > > +	}
> > > +
> > > +err_missing_stream:
> > > +	v4l2_subdev_unlock_state(state);
> > > +
> > > +	return ret;
> > >  }
> > >
> > >  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
> > > -	.enum_mbus_code	= csi2rx_enum_mbus_code,
> > > -	.get_fmt	= v4l2_subdev_get_fmt,
> > > -	.set_fmt	= csi2rx_set_fmt,
> > > -	.get_frame_desc = csi2rx_get_frame_desc,
> > > +	.enum_mbus_code		= csi2rx_enum_mbus_code,
> > > +	.get_fmt		= v4l2_subdev_get_fmt,
> > > +	.set_fmt		= csi2rx_set_fmt,
> > > +	.get_frame_desc		= csi2rx_get_frame_desc,
> > > +	.set_routing		= csi2rx_set_routing,
> > > +	.enable_streams		= csi2rx_enable_streams,
> > > +	.disable_streams	= csi2rx_disable_streams,
> > >  };
> > >
> > >  static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
> > > -	.s_stream	= csi2rx_s_stream,
> > > +	.s_stream	= csi2rx_s_stream_fallback,
> > >  };
> > >
> > >  static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
> > > @@ -766,7 +984,8 @@ static int csi2rx_probe(struct platform_device *pdev)
> > >  	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> > >  	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
> > >  		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> > > -	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > +		V4L2_SUBDEV_FL_STREAMS;
> >
> > nit: please align to the previous one
> >
> > 	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > 		                V4L2_SUBDEV_FL_STREAMS;
> >
> > and maybe the |=  should be just an =
>
> Will fix.
>
> >
> > Thanks
> >   j
> >
> > >  	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
> > >
> > >  	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,
> > >
> > > --
> > > 2.43.0
> > >
> > >
>
> --
> Thanks,
> Jai
>
> GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145



--tthsmqu7jhlbraye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmaWQ4AACgkQcjQGjxah
Vjy+xxAAsOYaD4rC9w7/7AbII/TTjDZzJyTiZ64I1ctRGxrOj4P+wFwo8DiappUl
tzJXdXXTjAL/s5nxHaDQuwX4GbZzil/rWnJ1B0ZDpP4mTaK+kzuP+47W+CN06CVQ
NVe1MjymNdYsardiErry1tXV77ToZO3TEbVX8QDrhCz7w1G9CuWzdlqKklqDU7RY
Q2zmNftPFfmPRravUtLzPzvMSZ2hGTHGzbW+8s+dh2+DZUWyjYDNPhG4Sxv89MSs
qr9nskY0TowVpUnoswGH0ybq7hzEgdesGw8fIVveCxqBfg7b+cBs3n1bS8wfyeFp
8SKtgOmjFmjc3KxrL8qorOF4Xg7paUxS5Qq+O26Ga4DLJBlXxYQ9rdQmAJR10GEC
98xKPijK9y9EzYNxdkDCqUCKx0xhPFK6bIDhCEp2Y0CDLz1IBHELM6yCuFXkqvVX
m7zYmjNICqZ4uAcV7om+mwn6f/Ii7adckhSIlCFw86SldRTD0gP0MD854MQIKuM2
g1TA0WhBBMhEoPXjSs6HejPZAezyYekCsfamSWTHdsQj0z2HfltOt1NIjvlWuits
fD+CncjIVsz+/rdggr0lTpoat89PGngUP1tgvtsOxa48IqWjigiMk2EyELF5by65
HtMz6p2eLBheeaCaqqi8ypTmOkIm1itro5Q8hleqnaKb2gPYpKo=
=f3NJ
-----END PGP SIGNATURE-----

--tthsmqu7jhlbraye--

