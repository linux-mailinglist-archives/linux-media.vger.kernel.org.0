Return-Path: <linux-media+bounces-10637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D438B9FD0
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 19:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7F961C21EB6
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 17:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D531F171068;
	Thu,  2 May 2024 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vtuDtSjf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A9516FF58;
	Thu,  2 May 2024 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714672284; cv=none; b=DDC9eoaI2UaOstZyZ/4/sZNZqTi51Ms2OC5CLsEn4sW92d4r6Uq6V+R7WFpDOlstE6WSN8OIbLIsaibnk1HrHqK1/jJRKlSFkMrvTK5D0eWVpUzdFRn4EHaOf22xR7fHUsGZS4G1krfFU7nNfyXwCfvVm/ucp2EV0gjobUM5MjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714672284; c=relaxed/simple;
	bh=4h5t+8p9orWMBnoU2H1J68rCJ6XjAvK6P1dC9rLfx6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAzMBcG5NwA/Mou/jnoXykMEqO2UcajVUcTbs2mTxCAtimgBOEH+2avfyO9yXzTaoP6z61+7R2ISR5EBYlMR6S0osB+19f7rbMBcu6MLacAA8Viobp20a42/Kbw9aCoiafSSfJ1DtPMTOpMqOz1imcZs8Vnv3XxlmP32xVAGFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vtuDtSjf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82221552;
	Thu,  2 May 2024 19:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714672223;
	bh=4h5t+8p9orWMBnoU2H1J68rCJ6XjAvK6P1dC9rLfx6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vtuDtSjfpDv/XGnDCOGAu6X/arVj1WSwJr1NtFhbWMWU21ej4Ac3dhsCcDXUVF/hG
	 3H1D3LbtpIQR4uMqVzuvuNacBnMq1cklyxM+VQ382t+0PXL/8DfoPVifrEeiKXvSRt
	 bUZReo8gwZ4DKuyLEgxSoSIXDw/POslEPcnuArFQ=
Date: Thu, 2 May 2024 20:51:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/19] media: adv748x: Use routes to configure VC
Message-ID: <20240502175115.GL15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-7-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-7-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:42PM +0200, Jacopo Mondi wrote:
> Use the newly introduced routing table to configure on which MIPI
> CSI-2 Virtual Channel to send the image stream on.

The stream ID in the routing API isn't meant to be mapped directly to a
virtual channel number.

Sakari, your opinion would be appreciated.

> Perform Virtual Channel selection at s_stream() time instead of
> forcing it to 0 during the chip reset.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-core.c |  8 ++------
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 22 ++++++++++++++++++++--
>  drivers/media/i2c/adv748x/adv748x.h      |  1 -
>  3 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 3abc73ea8ccb..c9d917135709 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -530,14 +530,10 @@ static int adv748x_reset(struct adv748x_state *state)
>  	io_write(state, ADV748X_IO_PD, ADV748X_IO_PD_RX_EN);
>  
>  	/* Conditionally enable TXa and TXb. */
> -	if (is_tx_enabled(&state->txa)) {
> +	if (is_tx_enabled(&state->txa))
>  		regval |= ADV748X_IO_10_CSI4_EN;
> -		adv748x_csi2_set_virtual_channel(&state->txa, 0);
> -	}
> -	if (is_tx_enabled(&state->txb)) {
> +	if (is_tx_enabled(&state->txb))
>  		regval |= ADV748X_IO_10_CSI1_EN;
> -		adv748x_csi2_set_virtual_channel(&state->txb, 0);
> -	}
>  	io_write(state, ADV748X_IO_10, regval);
>  
>  	/* Use vid_std and v_freq as freerun resolution for CP */
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 7fa72340e66e..a7bfed393ff0 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -14,7 +14,8 @@
>  
>  #include "adv748x.h"
>  
> -int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
> +static int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx,
> +					    unsigned int vc)
>  {
>  	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
>  }
> @@ -175,13 +176,30 @@ static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
>  static int adv748x_csi2_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> +	struct v4l2_subdev_state *state;
>  	struct v4l2_subdev *src;
> +	int ret;
>  
>  	src = adv748x_get_remote_sd(&tx->pads[ADV748X_CSI2_SINK]);
>  	if (!src)
>  		return -EPIPE;
>  
> -	return v4l2_subdev_call(src, video, s_stream, enable);
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	if (enable) {
> +		/* A single route is available. */
> +		struct v4l2_subdev_route *route = &state->routing.routes[0];
> +
> +		ret = adv748x_csi2_set_virtual_channel(tx, route->source_stream);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	ret = v4l2_subdev_call(src, video, s_stream, enable);
> +unlock:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
>  }
>  
>  static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index be24bc57767c..95d04468af9d 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -434,7 +434,6 @@ int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input);
>  
>  int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx);
>  void adv748x_csi2_cleanup(struct adv748x_csi2 *tx);
> -int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc);
>  int adv748x_csi2_set_pixelrate(struct v4l2_subdev *sd, s64 rate);
>  
>  int adv748x_hdmi_init(struct adv748x_hdmi *hdmi);

-- 
Regards,

Laurent Pinchart

