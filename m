Return-Path: <linux-media+bounces-50775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA0D245DE
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA9BD306705D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C327338B7B8;
	Thu, 15 Jan 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qKmheO08"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783A321F27;
	Thu, 15 Jan 2026 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768478518; cv=none; b=p1/vPO6yW4FRD3NcrIHjVGRbys/vM2lqofFCNMgOJh+j2zcmv+Ahdu+I2wr1oHg+PVg4zSeTIxjm5y2m7Wn44ikTwDBbeJPEH8LogGFb7HPDw/OYeXSFX4juRmFeqywZaPZiPZ9UX1D2qX/3SDIl4UGrI8LyI9EFItNyZsnXsKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768478518; c=relaxed/simple;
	bh=FO5LI/HL+npxQl0SN2wYLEAFagFohr7ACRLXQC77Rh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVguGWK6vLbopsCGB83lfr5pyuAJbnDs/vn2vgstbhyJeK4NeMCisVnXdip8epqfROlvXj128dOxj438yDsymZTIi+PPS/N2Udw0K6YHUDK6w73nQCzJEgV7SKXZCEdTrLZR6gB7ztRKvLx8h4M5xgsyUzYXn/GsOdcVC8reaiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qKmheO08; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA14465;
	Thu, 15 Jan 2026 13:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768478485;
	bh=FO5LI/HL+npxQl0SN2wYLEAFagFohr7ACRLXQC77Rh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qKmheO08hlFuTs11QrV+o+yrQo8a1E2hmqXXFy0znpt8yOoT2soUZI1KjM3l2moJ2
	 uaCC3/PQ8sJ0Edtrs/U4DMmijJoeFEWg3tCLjlfztcdLD6HdODti2lAQyR97i/2nmm
	 FdERbbhj387Keyi6d+Q6C8Ia4xSZXcpDfoMsJVd4=
Message-ID: <1029b7b3-44cf-4ed5-b90a-a476d39da5a8@ideasonboard.com>
Date: Thu, 15 Jan 2026 14:01:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/19] media: cadence: csi2rx: add multistream support
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-13-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251230083220.2405247-13-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
> of data over the same physical interface using MIPI Virtual Channels.
> 
> While the hardware IP supports usecases where streams coming in the sink
> pad can be broadcasted to multiple source pads, the driver will need
> significant re-architecture to make that possible. The two users of this
> IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
> have only integrated the first source pad i.e stream0 of this IP. So for
> now keep it simple and only allow 1-to-1 mapping of streams from sink to
> source, without any broadcasting.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 248 +++++++++++++++----
>  1 file changed, 201 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 65c6acb02f85b..5c16a2e509136 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -135,6 +135,7 @@ struct csi2rx_priv {
>  	struct phy			*dphy;
>  
>  	u8				num_pixels[CSI2RX_STREAMS_MAX];
> +	u32				vc_select[CSI2RX_STREAMS_MAX];
>  	u8				lanes[CSI2RX_LANES_MAX];
>  	u8				num_lanes;
>  	u8				max_lanes;
> @@ -273,30 +274,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>  
>  static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  {
> -	struct media_pad *src_pad =
> -		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>  	union phy_configure_opts opts = { };
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> -	struct v4l2_subdev_state *state;
>  	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_subdev_state *state;
>  	const struct csi2rx_fmt *fmt;
> +	int source_pad = csi2rx->source_pad;
> +	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
>  	s64 link_freq;
>  	int ret;
> +	u32 bpp;
>  
>  	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>  
> -	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
> -	if (!framefmt) {
> -		dev_err(csi2rx->dev, "Did not find active sink format\n");
> -		return -EINVAL;
> -	}
> +	/*
> +	 * For multi-stream transmitters there is no single pixel rate.
> +	 *
> +	 * In multistream usecase pass bpp as 0 so that v4l2_get_link_freq()
> +	 * returns an error if it falls back to V4L2_CID_PIXEL_RATE.
> +	 */
> +	if (state->routing.num_routes > 1) {
> +		bpp = 0;
> +	} else {
> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
> +		if (!framefmt) {
> +			dev_err(csi2rx->dev, "Did not find active sink format\n");
> +			return -EINVAL;
> +		}
>  
> -	fmt = csi2rx_get_fmt_by_code(framefmt->code);
> +		fmt = csi2rx_get_fmt_by_code(framefmt->code);
> +		bpp = fmt->bpp;
> +	}
>  
> -	link_freq = v4l2_get_link_freq(src_pad,
> -				       fmt->bpp, 2 * csi2rx->num_lanes);
> -	if (link_freq < 0)
> +	link_freq = v4l2_get_link_freq(pad, bpp, 2 * csi2rx->num_lanes);
> +	if (link_freq < 0) {
> +		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
>  		return link_freq;
> +	}
>  
>  	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>  							 csi2rx->num_lanes, cfg);
> @@ -394,11 +408,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  					  csi2rx->num_pixels[i]),
>  		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
>  
> -		/*
> -		 * Enable one virtual channel. When multiple virtual channels
> -		 * are supported this will have to be changed.
> -		 */
> -		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
> +		writel(csi2rx->vc_select[i],
>  		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
>  
>  		writel(CSI2RX_STREAM_CTRL_START,
> @@ -486,18 +496,59 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>  	return 0;
>  }
>  
> +static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
> +				    struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_frame_desc fd = {0};
> +	struct v4l2_subdev_route *route;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Capture VC=0 by default */
> +	for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
> +		csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);

This should be inside the if-block below, as in the other code path you
just memset the whole vc_select.

With that fixed:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi


