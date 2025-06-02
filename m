Return-Path: <linux-media+bounces-33918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B5ACAEE2
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C0A3AF578
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FA221FF39;
	Mon,  2 Jun 2025 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AGCOzzb5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C286ADD;
	Mon,  2 Jun 2025 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870534; cv=none; b=c5pFAdnHXJB8p4r8y5QZeOKwGIlsvfX9kIB+8ELGHWEJsP7Eg7lGecNrKDEr803RaWoimGetJ4YyVnxcKVAl9w1Cvqw/hhdb1uR1UMymuUIbn/6rPaZbg7sUsr4OYsilt7cAnxeBPEMGjtbGSp3Pz3zPSaHTb8vJoYOHlOO81lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870534; c=relaxed/simple;
	bh=jtsqkwWxMJ59NBFXcigEZb33daclENidcJqgOzkwCto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToKFjKDtuEfWRyxncq+PII0qhVpkJjvWRO6bC4F75DKVHUFd2hdn0jXYLbY7W6neHJCkW3PQFEZ7Q9Zsncgh04evp/g8N7J26aqZvm91vXBeyikUR3c9XU3poXHNQGBPOVh3mjjOvTjfJN4ETHX1Zz2H5n8iZFz8ZL4xB4rdsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AGCOzzb5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37F5DC9;
	Mon,  2 Jun 2025 15:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748870529;
	bh=jtsqkwWxMJ59NBFXcigEZb33daclENidcJqgOzkwCto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGCOzzb50CMOQSA7hqRykeGk5q0JAOcnGdChqGWnWf6jtBhBv5DftkpvYp5v4qKJS
	 j3KTJQdcv6zAyaY3Ka2dzUc3RsH5Sff2EqV7iiPiBu5yfN/JftKJGC4sEA0x6emxsp
	 Rv6ADD7vUFYgH8m3p+0NOUJzN4GjbHqKWW6WVKl0=
Date: Mon, 2 Jun 2025 16:22:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 11/15] media: rcar-isp: Call get_frame_desc to find
 out VC & DT
Message-ID: <20250602132202.GD11750@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-11-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-11-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:40PM +0300, Tomi Valkeinen wrote:
> Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
> routing and deducing the DT based on the mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 108 +++++++++++++++++-------
>  1 file changed, 77 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index a04cbf96b809..887d8eb21a3a 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -225,24 +225,86 @@ static void risp_power_off(struct rcar_isp *isp)
>  	pm_runtime_put(isp->dev);
>  }
>  
> -static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
> +static int risp_configure_routing(struct rcar_isp *isp,
> +				  struct v4l2_subdev_state *state)
>  {
> -	const struct v4l2_mbus_framefmt *fmt;
> -	const struct rcar_isp_format *format;
> -	unsigned int vc;
> -	u32 sel_csi = 0;
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_subdev_route *route;
>  	int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK, 0);
> -	if (!fmt)
> -		return -EINVAL;
> +	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
> +			       isp->remote_pad, &source_fd);
> +	if (ret)
> +		return ret;
>  
> -	format = risp_code_to_fmt(fmt->code);
> -	if (!format) {
> -		dev_err(isp->dev, "Unsupported bus format\n");
> -		return -EINVAL;
> +	/* Clear the channel registers */
> +	for (unsigned int ch = 0; ch < 12; ++ch) {

A macro for the number of channels would be nice.

> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
>  	}
>  
> +	/* Clear the proc mode registers */
> +	for (unsigned int dt = 0; dt < 64; ++dt)
> +		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), 0);

Do we really need to clear those ? These registers seem to be used to
select how to process a particular DT, likely to allow overriding the
default processing method. 0 means RAW8, so it's not a magic disable
value as far as I can tell. I think we can leave the registers as-is.

> +
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> +		const struct rcar_isp_format *format;
> +		const struct v4l2_mbus_framefmt *fmt;
> +		unsigned int i;
> +		u8 vc, dt, ch;
> +		u32 v;
> +
> +		for (i = 0; i < source_fd.num_entries; i++) {
> +			if (source_fd.entry[i].stream == route->sink_stream) {
> +				source_entry = &source_fd.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (!source_entry) {
> +			dev_err(isp->dev,
> +				"Failed to find stream from source frame desc\n");

Isn't it rather "Failed to find source frame desc for stream" ?

> +			return -EPIPE;
> +		}
> +
> +		vc = source_entry->bus.csi2.vc;
> +		dt = source_entry->bus.csi2.dt;
> +		/* Channels 4 - 11 go to VIN */
> +		ch = route->source_pad - 1 + 4;
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
> +		if (!fmt)
> +			return -EINVAL;
> +
> +		format = risp_code_to_fmt(fmt->code);
> +		if (!format) {
> +			dev_err(isp->dev, "Unsupported bus format\n");
> +			return -EINVAL;
> +		}
> +
> +		/* VC Filtering */
> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> +
> +		/* DT Filtering */
> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
> +			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> +
> +		/* Proc mode */
> +		v = risp_read_cs(isp, ISPPROCMODE_DT_REG(dt));
> +		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
> +		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), v);

If we want to minimize the register writes, we could store the
ISPPROCMODE_DT_REG values in a local variable and write all of them in
one go. Possible/probably overkill.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	}
> +
> +	return 0;
> +}
> +
> +static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
> +{
> +	u32 sel_csi = 0;
> +	int ret;
> +
>  	ret = risp_power_on(isp);
>  	if (ret) {
>  		dev_err(isp->dev, "Failed to power on ISP\n");
> @@ -256,25 +318,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  	risp_write_cs(isp, ISPINPUTSEL0_REG,
>  		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
>  
> -	/* Configure Channel Selector. */
> -	for (vc = 0; vc < 4; vc++) {
> -		u8 ch = vc + 4;
> -		u8 dt = format->datatype;
> -
> -		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> -		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
> -			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
> -			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
> -			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
> -			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> -	}
> -
> -	/* Setup processing method. */
> -	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
> +	ret = risp_configure_routing(isp, state);
> +	if (ret)
> +		return ret;
>  
>  	/* Start ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);

-- 
Regards,

Laurent Pinchart

