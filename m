Return-Path: <linux-media+bounces-15044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB09322F3
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 11:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFDC128333D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495561974F4;
	Tue, 16 Jul 2024 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uJiWXM45"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263586FB8;
	Tue, 16 Jul 2024 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122516; cv=none; b=muCCvx6LtsI/IaQRVgHA09dRB9dyk/MaVjfgW2teioCZnvUUvVz0EwrgvmJZVaxsBQN3q39mo5wskcVRDBazCu/RqqfTy0Ql+8QwKg2vLYquZiOu6MsMibHwSuEURQIoZFd5uGaMYeQUz1X3G2LZCrPG0KxtzSMWVxd/XaHsc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122516; c=relaxed/simple;
	bh=rAmYn2QPDXEkgSOp/N/xlU4sT8+yumY7pNoJT2xYRp8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJddDBJqhpoVFkmTpPRQr8QiUsR12HAR0dnpuJmA3aXugRBAuBFkBsKYpazmISeWRN6TCYM86drMF0OmDiX/RPYqpa6CncIoiIhJQGDqs03tIRBztsJjw7TVwvjn7jIv2Qo6MUk+PnQTQsQzwDa53Owy4OqCoLcK69vWmzUU7Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uJiWXM45; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G9YvEs108335;
	Tue, 16 Jul 2024 04:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721122497;
	bh=aklII5JObzOkaMsE9xNNsQblw6wwGiL6D9Zz55ekRQQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uJiWXM45STwYcuz9oDJaRhS6qz/kj9phRHJrfGh9X4g7Wa3Gakcf1T88tn4VS6Az5
	 moBMu0nR0yyE7Tr1IVuoMpBDpyt+Blhno7JI25ugDOc96ifi0ZM7XnO/1zu05wrW51
	 yDUdMkZguUzP17dPBBRNsXFlpH1ly/BD+ydVgFNo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G9YvbA040760
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 04:34:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 04:34:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 04:34:56 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G9YtZa081614;
	Tue, 16 Jul 2024 04:34:56 -0500
Date: Tue, 16 Jul 2024 15:04:55 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Aradhya
 Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Changhuang
 Liang <changhuang.liang@starfivetech.com>,
        Jack Zhu
	<jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Re: [PATCH v2 11/13] media: cadence: csi2rx: Enable multi-stream
 support
Message-ID: <3byg7obpmc5xfsnr4b3secs7d2cctvbfujudwp2zxyinlo75tn@77fkdjmagj7b>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-11-6ae96c54c1c3@ti.com>
 <s6zyk5t3ry7hlz6xjf2wnsefpym3meughrzyzidvht3wvogzwi@54bcbdadlp4b>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5jdmgen2edfcswzv"
Content-Disposition: inline
In-Reply-To: <s6zyk5t3ry7hlz6xjf2wnsefpym3meughrzyzidvht3wvogzwi@54bcbdadlp4b>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--5jdmgen2edfcswzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

Thanks for the review.

On Jul 12, 2024 at 18:09:48 +0200, Jacopo Mondi wrote:
> Hi Jai
>=20
> On Thu, Jun 27, 2024 at 06:40:06PM GMT, Jai Luthra wrote:
> > Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
> > of data over the same physical interface using MIPI Virtual Channels.
> >
> > The V4L2 subdev APIs should reflect this capability and allow per-stream
> > routing and controls.
> >
> > While the hardware IP supports usecases where streams coming in the sink
> > pad can be broadcasted to multiple source pads, the driver will need
> > significant re-architecture to make that possible. The two users of this
> > IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
> > have only integrated the first source pad i.e stream0 of this IP. So for
> > now keep it simple and only allow 1-to-1 mapping of streams from sink to
> > source, without any broadcasting.
> >
> > With stream routing now supported in the driver, implement the
> > enable_stream and disable_stream hooks in place of the stream-unaware
> > s_stream hook.
> >
> > This allows consumer devices like a DMA bridge or ISP, to enable
> > particular streams on a source pad, which in turn can be used to enable
> > only particular streams on the CSI-TX device connected on the sink pad.
> >
> > Implement a fallback s_stream hook that internally calls enable_stream
> > on each source pad, for consumer drivers that don't use multi-stream
> > APIs to still work.
> >
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  drivers/media/platform/cadence/cdns-csi2rx.c | 407 +++++++++++++++++++=
+-------
> >  1 file changed, 313 insertions(+), 94 deletions(-)
> >
> > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/med=
ia/platform/cadence/cdns-csi2rx.c
> > index 2ec34fc9c524..b0c91a9c65e8 100644
> > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > @@ -90,6 +90,7 @@ struct csi2rx_priv {
> >  	struct reset_control		*pixel_rst[CSI2RX_STREAMS_MAX];
> >  	struct phy			*dphy;
> >
> > +	u32				vc_select[CSI2RX_STREAMS_MAX];
> >  	u8				lanes[CSI2RX_LANES_MAX];
> >  	u8				num_lanes;
> >  	u8				max_lanes;
> > @@ -179,27 +180,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2=
rx)
> >
> >  static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
> >  {
> > +	struct v4l2_ctrl_handler *handler =3D csi2rx->source_subdev->ctrl_han=
dler;
> >  	union phy_configure_opts opts =3D { };
> >  	struct phy_configure_opts_mipi_dphy *cfg =3D &opts.mipi_dphy;
> > -	struct v4l2_subdev_format sd_fmt =3D {
> > -		.which	=3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > -		.pad	=3D CSI2RX_PAD_SINK,
> > -	};
> > +	struct v4l2_mbus_framefmt *framefmt;
> > +	struct v4l2_subdev_state *state;
> >  	const struct csi2rx_fmt *fmt;
> >  	s64 link_freq;
> >  	int ret;
> >
> > -	ret =3D v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
> > -					    &sd_fmt);
> > -	if (ret < 0)
> > -		return ret;
> > +	if (v4l2_ctrl_find(handler, V4L2_CID_LINK_FREQ)) {
>=20
> Do you need to do this by yourself ? afaict v4l2_get_link_freq()
> already checks if V4L2_CID_LINK_FREQ is available, and if not,
> fallsback to use PIXEL_RATE.
>=20
> > +		link_freq =3D v4l2_get_link_freq(handler, 0, 0);
> > +	} else {
> > +		state =3D v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
> > +		framefmt =3D v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
> > +							0);
> > +
> > +		if (framefmt) {
> > +			fmt =3D csi2rx_get_fmt_by_code(framefmt->code);
> > +		} else {
> > +			dev_err(csi2rx->dev,
> > +				"Did not find active sink format\n");
> > +			return -EINVAL;
>=20
> Is this possibile ?
>=20
> > +		}
> >
> > -	fmt =3D csi2rx_get_fmt_by_code(sd_fmt.format.code);
> > +		link_freq =3D v4l2_get_link_freq(handler, fmt->bpp,
> > +					       2 * csi2rx->num_lanes);
>=20
> Do we want to allow falling back on PIXEL_RATE for multiplexed
> transmitters ? I presume this will give you invalid results anyway.

This is mostly done to avoid breaking any single stream sensor that does=20
not have the LINK_FREQ control, and was working with this bridge before.
Thus the warning below for multi-format sources.
>=20
> I would simply call v4l2_get_link_freq(handler, 0, 0) to force the
> usage of LINK_FREQ which will become mandatory for transmitters

Ah I did not know LINK_FREQ will be mandatory soon. Any threads I can=20
look at where this was discussed?

>=20
> >
> > -	link_freq =3D v4l2_get_link_freq(csi2rx->source_subdev->ctrl_handler,
> > -				       fmt->bpp, 2 * csi2rx->num_lanes);
> > -	if (link_freq < 0)
> > +		dev_warn(csi2rx->dev,
> > +			 "Guessing link frequency using bitdepth of stream 0.\n");
> > +		dev_warn(csi2rx->dev,
> > +			 "V4L2_CID_LINK_FREQ control is required for multi format sources.\=
n");
>=20
> Exactly :)
>=20
> > +	}
> > +
> > +	if (link_freq < 0) {
> > +		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
> >  		return link_freq;
> > +	}
> >
> >  	ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
> >  							 csi2rx->num_lanes, cfg);
> > @@ -222,18 +239,10 @@ static int csi2rx_configure_ext_dphy(struct csi2r=
x_priv *csi2rx)
> >  static int csi2rx_start(struct csi2rx_priv *csi2rx)
> >  {
> >  	unsigned int i;
> > -	struct media_pad *remote_pad;
> >  	unsigned long lanes_used =3D 0;
> >  	u32 reg;
> >  	int ret;
> >
> > -	remote_pad =3D media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SI=
NK]);
> > -	if (!remote_pad) {
> > -		dev_err(csi2rx->dev,
> > -			"Failed to find connected source\n");
> > -		return -ENODEV;
> > -	}
> > -
> >  	ret =3D clk_prepare_enable(csi2rx->p_clk);
> >  	if (ret)
> >  		return ret;
> > @@ -300,11 +309,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
> >  		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
> >  		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
> >
> > -		/*
> > -		 * Enable one virtual channel. When multiple virtual channels
> > -		 * are supported this will have to be changed.
> > -		 */
> > -		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
> > +		writel(csi2rx->vc_select[i],
> >  		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
> >
> >  		writel(CSI2RX_STREAM_CTRL_START,
> > @@ -317,17 +322,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2r=
x)
> >
> >  	reset_control_deassert(csi2rx->sys_rst);
> >
> > -	ret =3D v4l2_subdev_enable_streams(csi2rx->source_subdev,
> > -					 remote_pad->index, BIT(0));
> > -	if (ret)
> > -		goto err_disable_sysclk;
> > -
> >  	clk_disable_unprepare(csi2rx->p_clk);
> >
> >  	return 0;
> >
> > -err_disable_sysclk:
> > -	clk_disable_unprepare(csi2rx->sys_clk);
> >  err_disable_pixclk:
> >  	for (; i > 0; i--) {
> >  		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> > @@ -346,7 +344,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
> >
> >  static void csi2rx_stop(struct csi2rx_priv *csi2rx)
> >  {
> > -	struct media_pad *remote_pad;
> >  	unsigned int i;
> >  	u32 val;
> >  	int ret;
> > @@ -375,13 +372,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
> >  	reset_control_assert(csi2rx->p_rst);
> >  	clk_disable_unprepare(csi2rx->p_clk);
> >
> > -	remote_pad =3D media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SI=
NK]);
> > -	if (!remote_pad ||
> > -	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
> > -					remote_pad->index, BIT(0))) {
> > -		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
> > -	}
> > -
> >  	if (csi2rx->dphy) {
> >  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
> >
> > @@ -390,47 +380,167 @@ static void csi2rx_stop(struct csi2rx_priv *csi2=
rx)
> >  	}
> >  }
> >
> > -static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
> > +static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
> > +				    struct v4l2_subdev_state *state)
> >  {
> > -	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> > -	int ret =3D 0;
> > +	struct v4l2_mbus_frame_desc fd =3D {0};
> > +	struct v4l2_subdev_route *route;
> > +	unsigned int i;
> > +	int ret;
> >
> > -	if (enable) {
> > -		ret =3D pm_runtime_resume_and_get(csi2rx->dev);
> > -		if (ret < 0)
> > -			return ret;
> > +	for (i =3D 0; i < CSI2RX_STREAMS_MAX; i++)
> > +		csi2rx->vc_select[i] =3D 0;
>=20
> or just memset ?

Will do.

>=20
> > +
> > +	ret =3D csi2rx_get_frame_desc_from_source(csi2rx, &fd);
> > +	if (ret || fd.type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> > +		dev_dbg(csi2rx->dev,
> > +			"Failed to get source frame desc, allowing only VC=3D0\n");
>=20
> I'm still not sure if picking a default fallback is a good idea or not,
> as this will only work by chance
>=20
> > +		goto err_no_fd;
> >  	}
> >
> > -	mutex_lock(&csi2rx->lock);
> > +	/* If source provides per-stream VC info, use it to filter by VC */
> > +	for_each_active_route(&state->routing, route) {
> > +		int cdns_stream =3D route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
>=20
> unsigned maybe ?

Will fix.

>=20
> > +		u8 used_vc =3D 0;
> >
> > -	if (enable) {
> > -		/*
> > -		 * If we're not the first users, there's no need to
> > -		 * enable the whole controller.
> > -		 */
> > -		if (!csi2rx->count) {
> > -			ret =3D csi2rx_start(csi2rx);
> > -			if (ret) {
> > -				pm_runtime_put(csi2rx->dev);
> > -				goto out;
> > +		for (i =3D 0; i < fd.num_entries; i++) {
> > +			if (fd.entry[i].stream =3D=3D route->sink_stream) {
> > +				used_vc =3D fd.entry[i].bus.csi2.vc;
> > +				break;
> >  			}
> >  		}
> > +		csi2rx->vc_select[cdns_stream] |=3D
>=20
> Why |=3D ? do you expect to be able to capture multiple VC per stream ?
> I don't think that's allowed ?

The intention here is to allow multiple VC on the same source pad.
Confusingly enough cadence calls the source pads as "stream0,1,2,3" and=20
this driver uses that convention in the macros :/

This cdns-csi2rx bridge is an intermediary between the sensor and ti's=20
wrapper IP (platform/ti/j721e-csi2rx.c) which is connected to the first=20
source pad of cdns-csi2rx on TI SoCs like AM62A [1]

Ultimately the wrapper will separate incoming streams by VC/DT into=20
different DMA channels, so no filtering is done here.

[1]: Section 12.6.4.1 CSI_RX_IF Block Diagram in AM62A TRM=20
https://www.ti.com/lit/pdf/spruj16

>=20
> > +			CSI2RX_STREAM_DATA_CFG_VC_SELECT(used_vc);
>=20
> In case no stream matching route->sink_stream is found in the remote's
> frame descriptor this sets CSI2RX_STREAM_DATA_CFG_VC_SELECT(0) for
> vc_select[x]...
>=20
> > +	}
> >
> > -		csi2rx->count++;
> > -	} else {
> > -		csi2rx->count--;
> > +err_no_fd:
> > +	for (i =3D 0; i < CSI2RX_STREAMS_MAX; i++) {
> > +		if (!csi2rx->vc_select[i]) {
> > +			csi2rx->vc_select[i] =3D
> > +				CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
>=20
> ... so why doing it again here (assuming the no_fd case should be
> dropped).

Ah good catch, will fix.

>=20
> Also, setting multiple streams to capture on VC=3D0 will multiplex the
> same stream or cause troubles ?
>=20
> Also, as you have an initial loop already this could maybe be:
>=20
>         /* Initialize all streams to capture VC 0 by default. */
> 	for (i =3D 0; i < CSI2RX_STREAMS_MAX; i++)
> 		csi2rx->vc_select[i] =3D  CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
>=20
> 	ret =3D csi2rx_get_frame_desc_from_source(csi2rx, &fd);
> 	if (ret || fd.type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> 		dev_dbg(csi2rx->dev,
> 			"Failed to get source frame desc, allowing only VC=3D0\n");
> 		return;
> 	}
>=20
> 	/* If source provides per-stream VC info, use it to filter by VC */
> 	for_each_active_route(&state->routing, route) {
> 		int cdns_stream =3D route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
>=20
> 		for (i =3D 0; i < fd.num_entries; i++) {
> 			if (fd.entry[i].stream !=3D route->sink_stream)
>                                 continue;
>=20
>                         csi2rx->vc_select[cdns_stream] =3D
>                                 CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry=
[i].bus.csi2.vc);

Thanks will do this in v3.

> 		}
> 	}
>=20
> > +		}
> > +	}
> > +}
> >
> > -		/*
> > -		 * Let the last user turn off the lights.
> > -		 */
> > -		if (!csi2rx->count)
> > -			csi2rx_stop(csi2rx);
> > +static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
> > +				 struct v4l2_subdev_state *state, u32 pad,
> > +				 u64 streams_mask)
> > +{
> > +	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> > +	struct media_pad *remote_pad;
> > +	u64 sink_streams;
> > +	int ret;
> > +
> > +	remote_pad =3D media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SI=
NK]);
> > +	if (!remote_pad) {
> > +		dev_err(csi2rx->dev,
> > +			"Failed to find connected source\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret =3D pm_runtime_resume_and_get(csi2rx->dev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	sink_streams =3D v4l2_subdev_state_xlate_streams(state, pad,
> > +						       CSI2RX_PAD_SINK,
> > +						       &streams_mask);
> >
> > -		pm_runtime_put(csi2rx->dev);
> > +	mutex_lock(&csi2rx->lock);
> > +	/*
> > +	 * If we're not the first users, there's no need to
> > +	 * enable the whole controller.
> > +	 */
> > +	if (!csi2rx->count) {
> > +		ret =3D csi2rx_start(csi2rx);
> > +		if (ret)
> > +			goto err_stream_start;
>=20
> I'm not 100% familiar with this new API but I was expecting you
> wouldn't need to do so
>=20
> >  	}
> >
> > -out:
> > +	/* Start streaming on the source */
> > +	ret =3D v4l2_subdev_enable_streams(csi2rx->source_subdev, remote_pad-=
>index,
> > +					 sink_streams);
> > +	if (ret) {
> > +		dev_err(csi2rx->dev,
> > +			"Failed to start streams %#llx on subdev\n",
> > +			sink_streams);
> > +		goto err_subdev_enable;
> > +	}
> > +
> > +	csi2rx->count++;
> > +	mutex_unlock(&csi2rx->lock);
> > +
> > +	return 0;
> > +
> > +err_subdev_enable:
> > +	if (!csi2rx->count)
> > +		csi2rx_stop(csi2rx);
> > +err_stream_start:
> >  	mutex_unlock(&csi2rx->lock);
> > +	pm_runtime_put(csi2rx->dev);
> > +	return ret;
> > +}
> > +
> > +static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
> > +				  struct v4l2_subdev_state *state, u32 pad,
> > +				  u64 streams_mask)
> > +{
> > +	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> > +	struct media_pad *remote_pad;
> > +	u64 sink_streams;
> > +
> > +	sink_streams =3D v4l2_subdev_state_xlate_streams(state, pad,
> > +						       CSI2RX_PAD_SINK,
> > +						       &streams_mask);
> > +
> > +	remote_pad =3D media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SI=
NK]);
> > +	if (!remote_pad ||
> > +	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
> > +					remote_pad->index, sink_streams)) {
> > +		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
> > +	}
> > +
> > +	mutex_lock(&csi2rx->lock);
> > +	csi2rx->count--;
> > +	/*
> > +	 * Let the last user turn off the lights.
> > +	 */
> > +	if (!csi2rx->count)
> > +		csi2rx_stop(csi2rx);
> > +	mutex_unlock(&csi2rx->lock);
> > +
> > +	pm_runtime_put(csi2rx->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int csi2rx_s_stream_fallback(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct v4l2_subdev_state *state;
> > +	struct v4l2_subdev_route *route;
> > +	u64 mask[CSI2RX_PAD_MAX] =3D {0};
> > +	int i, ret;
> > +
> > +	/* Find the stream mask on all source pads */
> > +	state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > +	for (i =3D CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> > +		for_each_active_route(&state->routing, route) {
> > +			if (route->source_pad =3D=3D i)
> > +				mask[i] |=3D BIT_ULL(route->source_stream);
> > +		}
> > +	}
> > +	v4l2_subdev_unlock_state(state);
> > +
> > +	/* Start streaming on each pad */
> > +	for (i =3D CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> > +		if (enable)
> > +			ret =3D v4l2_subdev_enable_streams(sd, i, mask[i]);
> > +		else
> > +			ret =3D v4l2_subdev_disable_streams(sd, i, mask[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	return ret;
> >  }
> >
> > @@ -446,12 +556,63 @@ static int csi2rx_enum_mbus_code(struct v4l2_subd=
ev *subdev,
> >  	return 0;
> >  }
> >
> > +static int _csi2rx_set_routing(struct v4l2_subdev *subdev,
> > +			       struct v4l2_subdev_state *state,
> > +			       struct v4l2_subdev_krouting *routing)
> > +{
> > +	static const struct v4l2_mbus_framefmt format =3D {
> > +		.width =3D 640,
> > +		.height =3D 480,
> > +		.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > +		.field =3D V4L2_FIELD_NONE,
> > +		.colorspace =3D V4L2_COLORSPACE_SRGB,
> > +		.ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> > +		.quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> > +		.xfer_func =3D V4L2_XFER_FUNC_SRGB,
> > +	};
> > +	int ret;
> > +
> > +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> > +		return -EINVAL;
>=20
> Isn't there a max number of routes supported by the HW ?
>=20

I guess yes, 16 VC x 4 output pads should be the total routes possible,=20
but that is much greater than the current FRAME_DESC_ENTRY_MAX (=3D 8)

This check was re-used from ds90ub9xx.c drivers.

> > +
> > +	ret =3D v4l2_subdev_routing_validate(subdev, routing,
> > +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &for=
mat);
>=20
>         return ...

Will fix.

>=20
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int csi2rx_set_routing(struct v4l2_subdev *subdev,
> > +			      struct v4l2_subdev_state *state,
> > +			      enum v4l2_subdev_format_whence which,
> > +			      struct v4l2_subdev_krouting *routing)
> > +{
> > +	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> > +	int ret;
> > +
> > +	if (which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && csi2rx->count)
> > +		return -EBUSY;
> > +
> > +	ret =3D _csi2rx_set_routing(subdev, state, routing);
> > +
>=20
> no empty line

Will fix.

>=20
> > +	if (ret)
> > +		return ret;
> > +
> > +	csi2rx_update_vc_select(csi2rx, state);
> > +
> > +	return 0;
> > +}
> > +
> >  static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
> >  			  struct v4l2_subdev_state *state,
> >  			  struct v4l2_subdev_format *format)
> >  {
> >  	struct v4l2_mbus_framefmt *fmt;
> > -	unsigned int i;
> >
> >  	/* No transcoding, source and sink formats must match. */
> >  	if (format->pad !=3D CSI2RX_PAD_SINK)
> > @@ -463,14 +624,19 @@ static int csi2rx_set_fmt(struct v4l2_subdev *sub=
dev,
> >  	format->format.field =3D V4L2_FIELD_NONE;
> >
> >  	/* Set sink format */
> > -	fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > +	fmt =3D v4l2_subdev_state_get_format(state, format->pad, format->stre=
am);
> > +	if (!fmt)
> > +		return -EINVAL;
> > +
> >  	*fmt =3D format->format;
> >
> > -	/* Propagate to source formats */
> > -	for (i =3D CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> > -		fmt =3D v4l2_subdev_state_get_format(state, i);
> > -		*fmt =3D format->format;
> > -	}
> > +	/* Propagate to source format */
> > +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(state, format->p=
ad,
> > +							   format->stream);
> > +	if (!fmt)
> > +		return -EINVAL;
>=20
> again I'm not sure this can happen

Will fix.

>=20
> > +
> > +	*fmt =3D format->format;
> >
> >  	return 0;
> >  }
> > @@ -478,40 +644,92 @@ static int csi2rx_set_fmt(struct v4l2_subdev *sub=
dev,
> >  static int csi2rx_init_state(struct v4l2_subdev *subdev,
> >  			     struct v4l2_subdev_state *state)
> >  {
> > -	struct v4l2_subdev_format format =3D {
> > -		.pad =3D CSI2RX_PAD_SINK,
> > -		.format =3D {
> > -			.width =3D 640,
> > -			.height =3D 480,
> > -			.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > -			.field =3D V4L2_FIELD_NONE,
> > -			.colorspace =3D V4L2_COLORSPACE_SRGB,
> > -			.ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> > -			.quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> > -			.xfer_func =3D V4L2_XFER_FUNC_SRGB,
> > +	struct v4l2_subdev_route routes[] =3D {
>=20
> static const ?

Will fix.

>=20
> > +		{
> > +			.sink_pad =3D CSI2RX_PAD_SINK,
> > +			.sink_stream =3D 0,
> > +			.source_pad =3D CSI2RX_PAD_SOURCE_STREAM0,
> > +			.source_stream =3D 0,
> > +			.flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> >  		},
> >  	};
> >
> > -	return csi2rx_set_fmt(subdev, state, &format);
> > +	struct v4l2_subdev_krouting routing =3D {
>=20
> static const ?

Will fix.

>=20
> > +		.num_routes =3D ARRAY_SIZE(routes),
> > +		.routes =3D routes,
> > +	};
> > +
> > +	return _csi2rx_set_routing(subdev, state, &routing);
> >  }
> >
> >  static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned =
int pad,
> >  				 struct v4l2_mbus_frame_desc *fd)
> >  {
> >  	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> > +	struct v4l2_mbus_frame_desc source_fd =3D {0};
> > +	struct v4l2_subdev_route *route;
> > +	struct v4l2_subdev_state *state;
> > +	int ret;
> > +
> > +	ret =3D csi2rx_get_frame_desc_from_source(csi2rx, &source_fd);
>=20
> Should this inspect the remote frame desc or only the local routing
> table ?

We want to use the correct VC, if the source is sending two streams with=20
VC=3D1 and VC=3D2, we want to make sure the output streams are also setting=
=20
that data in the frame descriptors for this subdev.

>=20
> > +	if (ret)
> > +		return ret;
> > +
> > +	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> >
> > -	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
> > +	state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > +
> > +	for_each_active_route(&state->routing, route) {
> > +		struct v4l2_mbus_frame_desc_entry *source_entry =3D NULL;
> > +		unsigned int i;
> > +
> > +		if (route->source_pad !=3D pad)
> > +			continue;
> > +
> > +		for (i =3D 0; i < source_fd.num_entries; i++) {
> > +			if (source_fd.entry[i].stream =3D=3D route->sink_stream) {
> > +				source_entry =3D &source_fd.entry[i];
> > +				break;
> > +			}
> > +		}
> > +
> > +		if (!source_entry) {
> > +			dev_err(csi2rx->dev,
> > +				"Failed to find stream from source frame desc\n");
> > +			ret =3D -EPIPE;
> > +			goto err_missing_stream;
> > +		}
> > +
> > +		fd->entry[fd->num_entries].stream =3D route->source_stream;
> > +		fd->entry[fd->num_entries].flags =3D source_entry->flags;
> > +		fd->entry[fd->num_entries].length =3D source_entry->length;
> > +		fd->entry[fd->num_entries].pixelcode =3D source_entry->pixelcode;
> > +		fd->entry[fd->num_entries].bus.csi2.vc =3D
> > +			source_entry->bus.csi2.vc;
> > +		fd->entry[fd->num_entries].bus.csi2.dt =3D
> > +			source_entry->bus.csi2.dt;
> > +
> > +		fd->num_entries++;
>=20
> as you
>=20
> 		if (route->source_pad !=3D pad)
> 			continue;
>=20
> can you have multiple entris on a pad ?

Yes, this IP will pass through all incoming streams on sink to the first=20
source.

>=20
> > +	}
> > +
> > +err_missing_stream:
> > +	v4l2_subdev_unlock_state(state);
> > +
> > +	return ret;
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops =3D {
> > -	.enum_mbus_code	=3D csi2rx_enum_mbus_code,
> > -	.get_fmt	=3D v4l2_subdev_get_fmt,
> > -	.set_fmt	=3D csi2rx_set_fmt,
> > -	.get_frame_desc =3D csi2rx_get_frame_desc,
> > +	.enum_mbus_code		=3D csi2rx_enum_mbus_code,
> > +	.get_fmt		=3D v4l2_subdev_get_fmt,
> > +	.set_fmt		=3D csi2rx_set_fmt,
> > +	.get_frame_desc		=3D csi2rx_get_frame_desc,
> > +	.set_routing		=3D csi2rx_set_routing,
> > +	.enable_streams		=3D csi2rx_enable_streams,
> > +	.disable_streams	=3D csi2rx_disable_streams,
> >  };
> >
> >  static const struct v4l2_subdev_video_ops csi2rx_video_ops =3D {
> > -	.s_stream	=3D csi2rx_s_stream,
> > +	.s_stream	=3D csi2rx_s_stream_fallback,
> >  };
> >
> >  static const struct v4l2_subdev_ops csi2rx_subdev_ops =3D {
> > @@ -766,7 +984,8 @@ static int csi2rx_probe(struct platform_device *pde=
v)
> >  	csi2rx->pads[CSI2RX_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> >  	for (i =3D CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
> >  		csi2rx->pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
> > -	csi2rx->subdev.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	csi2rx->subdev.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +		V4L2_SUBDEV_FL_STREAMS;
>=20
> nit: please align to the previous one
>=20
> 	csi2rx->subdev.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> 		                V4L2_SUBDEV_FL_STREAMS;
>=20
> and maybe the |=3D  should be just an =3D

Will fix.

>=20
> Thanks
>   j
>=20
> >  	csi2rx->subdev.entity.ops =3D &csi2rx_media_ops;
> >
> >  	ret =3D media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,
> >
> > --
> > 2.43.0
> >
> >

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--5jdmgen2edfcswzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmaWPr4ACgkQQ96R+SSa
cUWaqRAAtpATK/B7Imf0e37pKI4dlDWXyx64i58tiODXpNAZ/NV0H2BsBdQQdeJ6
OIRtoc4Y4wYRvpY0eii4gT/VXcwoq3TnygvBA3sorqxQp7T+jBWSPRXiz+M1MrmO
SkIk8JLoIf/+DLuW+k5NJB/TmOJPqbX0KLkOeKapfTyXlqq11N826rFXCNZNcUU2
S7WvRERfUuNH4TVjiadbsZM7dISkwUHo4dk2mm9pUwPkoU0LFm4h19395O0sWbEg
RrB93VT5dOfjMh2EPbHbGlIteMiAxB6pV2NYGk2Og02fY98c8LUAlPJLbnS2nG3m
o+kJzW+WHxdZ+QupYGxHFIa9vaFkYOAMCC50hl7qXzu6wsdY3yma3hWK91dZtHMM
Dm1rJcWzDVNF8c9lx/8m6VEcS/c9uECDjeOFtOH6xayqs5zYit+Fs6eJwqMeCElc
TZlZcBsIAmXWbaAI+o4UrxPJ8NsrAx4j0NVjLjiskRo0XKpPiGOfMCPsi9QMqAH8
3iQXKp2iweRS0lYQk4gS5Fb2pfJfIEnulEqieiTpZbMBnhn2Htq/eKjr3viKFqzQ
tqPhMy4dfGqbK6Ztub+WuzlQ3SjxC7TiCjlgJSrZEOQCRSaEAJO/MEdz860VV/9o
5ICaGX2RvvlNY1yo/bPh/i2hI08pOlaaeFA3efve1qmdOyCqnlw=
=YR+y
-----END PGP SIGNATURE-----

--5jdmgen2edfcswzv--

