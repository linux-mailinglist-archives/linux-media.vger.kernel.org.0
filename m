Return-Path: <linux-media+bounces-10633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F7C8B9FA2
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 19:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63E72283E16
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 17:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32C116FF4E;
	Thu,  2 May 2024 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MukSpDUQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC315155350;
	Thu,  2 May 2024 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714671478; cv=none; b=X4UxIt60b4kkpSChlfIEpy/TrsBzkap2cwqFe9+MnE12Z3v59+QtNV8KvO+crNr/p89Zo/WMPMEehV23xqQ3Rsg5PQUucRPSxW6c6uBoOgVJ8q1yKuGJ9kI9LbdiMSois85IMZdqLMXJyUqIjX28kC2rWs8ypPY5zhHwBLaE3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714671478; c=relaxed/simple;
	bh=/VR2vqqmw7Z7s7lzDBMUc6wHSgDzkL1tV6+Y27k8LF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaeB/sLmlvh5XqrcusH+L21FZNwtxu4TkvCfY9I5LOtlaArI+PKpgEEXYONwVmFzX1SvK+Fw/GdR71ajc5X0Y09g+HWazm28pqWvyImXZHY0TCs69jkJWI84IAAjwKXq0NEt5wyy9z3MvqiMV+Q0Fi5mkRihl64sgpWMInGLaAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MukSpDUQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DCFA552;
	Thu,  2 May 2024 19:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714671417;
	bh=/VR2vqqmw7Z7s7lzDBMUc6wHSgDzkL1tV6+Y27k8LF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MukSpDUQKsU0RlLOBs36IyAMGydaJ/BP8pRI5jE/MGKXChUpvjGLPuULjXDycCIhD
	 UkFJ3ESh/AqLItlOYj3uxbAfuL9YI/W3WT5b/j2wsytfojshWVVvfPNJEQiqGIEt2e
	 ma8r1s5HmS/uZTABKv34Gh7gBWyKsSMEvlnO3XhU=
Date: Thu, 2 May 2024 20:37:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/19] media: adv748x: Add flags to adv748x_subdev_init()
Message-ID: <20240502173747.GH15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:38PM +0200, Jacopo Mondi wrote:
> Add a flags parameter to the adv748x_subdev_init() function that
> allows to pass additional flags to the v4l2_subdevice.
> 
> This will be used to identify the CSI-2 subdevices as multiplexed.

"as supporting streams" ?

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-afe.c  | 2 +-
>  drivers/media/i2c/adv748x/adv748x-core.c | 4 ++--
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 2 +-
>  drivers/media/i2c/adv748x/adv748x-hdmi.c | 2 +-
>  drivers/media/i2c/adv748x/adv748x.h      | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
> index 50d9fbadbe38..5951ddebc59d 100644
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> @@ -510,7 +510,7 @@ int adv748x_afe_init(struct adv748x_afe *afe)
>  	afe->curr_norm = V4L2_STD_NTSC_M;
>  
>  	adv748x_subdev_init(&afe->sd, state, &adv748x_afe_ops,
> -			    MEDIA_ENT_F_ATV_DECODER, "afe");
> +			    MEDIA_ENT_F_ATV_DECODER, 0, "afe");
>  
>  	/* Identify the first connector found as a default input if set */
>  	for (i = ADV748X_PORT_AIN0; i <= ADV748X_PORT_AIN7; i++) {
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 3eb6d5e8f082..3abc73ea8ccb 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -583,10 +583,10 @@ static int __maybe_unused adv748x_resume_early(struct device *dev)
>  
>  void adv748x_subdev_init(struct v4l2_subdev *sd, struct adv748x_state *state,
>  			 const struct v4l2_subdev_ops *ops, u32 function,
> -			 const char *ident)
> +			 u32 flags, const char *ident)

I'd name the argument sd_flags to make it clearer. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  {
>  	v4l2_subdev_init(sd, ops);
> -	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | flags;
>  
>  	/* the owner is the same as the i2c_client's driver owner */
>  	sd->owner = state->dev->driver->owner;
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 435b0909bbef..60bf1dc0f58b 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -245,7 +245,7 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>  		return 0;
>  
>  	adv748x_subdev_init(&tx->sd, state, &adv748x_csi2_ops,
> -			    MEDIA_ENT_F_VID_IF_BRIDGE,
> +			    MEDIA_ENT_F_VID_IF_BRIDGE, 0,
>  			    is_txa(tx) ? "txa" : "txb");
>  
>  	/* Register internal ops for incremental subdev registration */
> diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
> index a4db9bae5f79..9e4a5aa4ed55 100644
> --- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
> +++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
> @@ -741,7 +741,7 @@ int adv748x_hdmi_init(struct adv748x_hdmi *hdmi)
>  	hdmi->aspect_ratio.denominator = 9;
>  
>  	adv748x_subdev_init(&hdmi->sd, state, &adv748x_ops_hdmi,
> -			    MEDIA_ENT_F_IO_DTV, "hdmi");
> +			    MEDIA_ENT_F_IO_DTV, 0, "hdmi");
>  
>  	hdmi->pads[ADV748X_HDMI_SINK].flags = MEDIA_PAD_FL_SINK;
>  	hdmi->pads[ADV748X_HDMI_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index 9bc0121d0eff..be24bc57767c 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -424,7 +424,7 @@ static inline struct v4l2_subdev *adv748x_get_remote_sd(struct media_pad *pad)
>  
>  void adv748x_subdev_init(struct v4l2_subdev *sd, struct adv748x_state *state,
>  			 const struct v4l2_subdev_ops *ops, u32 function,
> -			 const char *ident);
> +			 u32 flags, const char *ident);
>  
>  int adv748x_tx_power(struct adv748x_csi2 *tx, bool on);
>  

-- 
Regards,

Laurent Pinchart

