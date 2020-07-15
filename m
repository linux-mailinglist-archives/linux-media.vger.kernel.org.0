Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D2522058F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 08:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbgGOGzq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 02:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbgGOGzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 02:55:42 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1584C061794
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 23:55:41 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u25so479929lfm.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 23:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=67Tr7HEpPVaXulQ6DCVXP1kyI49KrSiP1ADUlmD8SYo=;
        b=EK7TkPrhrLPSobRHOO9Lx08Euv2cwLGbUjVyGJ7f3A0FqhowS4H7pphI7dNUTs6jpJ
         KWGtTgy2LonTr4FUxpOWe013RXAmluFVHD7mI7GzzoJGGT8nhgQkO2xh7JQG+KVf+FOk
         6ZJKSjbicWg4E/F46eZhBPmxXkiJlQ5SyzuG7L9m6zzQjBU5Yfx37H+MYLcKfmZe5ptQ
         GNLxHi2PEEu2farVhiR2Ta8g1HzarXp3nFTjZlnzMoV/jSH/B7fkrv3Mn1pnhggB/C6v
         e4EBcjJdov++faUNXYZ6y01yurzvDXrbv+V7+agKa6dXf8XSZuAvrbN2bVZO1cFTw+Bw
         1TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=67Tr7HEpPVaXulQ6DCVXP1kyI49KrSiP1ADUlmD8SYo=;
        b=COxe78OZ+jhS7WXrYlmAenvXXh+zHXPq8lP/zM/XLfoc0yzg/x0WBtSut/lH3pb7/s
         K7hxleCHa8KNMad5dt8Pfz08Lx8JgFkqO1d1TkGbFM3L2OMOg5LsWQm21qdmeYiQLHUl
         oa0dIJqwbxbeLCLf9n+lmYhqx13xdVjBa6Hp5uwxWQGZjcz7/mt7R0aRc1umMlswrVxn
         ReO10dxdv+vkOgk4MMl3h8dbPd/yTlrB5N8WP5vp22zRvWkIdRLEr6RmEp+FY0f2SGs/
         OTS91mVoWJhXGI3kuaOQ38G90yX1I3ZtF9YQdNTp4+qSnd4Bn0Ttg5KhLQ0mA9Xfuys9
         rZFA==
X-Gm-Message-State: AOAM5329rk+4hz22orIFFmiR6sl13MlFMRox4j14waVNB4Maagzi33uv
        eP7LlBHeWQ5yNjfeJcov0Mx/RA==
X-Google-Smtp-Source: ABdhPJwYgHWF3yQgnNR6x2XoAq4H7fqAKuteKT3RDd7tfW9twhTZDH/A9wljjz9Po43U6gJZPVn1hg==
X-Received: by 2002:ac2:5090:: with SMTP id f16mr4144689lfm.86.1594796140273;
        Tue, 14 Jul 2020 23:55:40 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y188sm348987lfc.36.2020.07.14.23.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 23:55:39 -0700 (PDT)
Date:   Wed, 15 Jul 2020 08:55:38 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 9/9] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200715065538.GI3051471@oden.dyn.berto.se>
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
 <20200714135812.55158-10-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200714135812.55158-10-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2020-07-14 15:58:12 +0200, Jacopo Mondi wrote:
> Use the newly introduced get_mbus_config() subdevice pad operation to
> retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> the number of active data lanes accordingly.
> 
> In order to be able to call the remote subdevice operation cache the
> index of the remote pad connected to the single CSI-2 input port.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 74 +++++++++++++++++++--
>  1 file changed, 67 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index c6cc4f473a07..d39f312ebff9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -364,6 +364,7 @@ struct rcar_csi2 {
>  	struct v4l2_async_notifier notifier;
>  	struct v4l2_async_subdev asd;
>  	struct v4l2_subdev *remote;
> +	unsigned int remote_pad;
>  
>  	struct v4l2_mbus_framefmt mf;
>  
> @@ -409,13 +410,14 @@ static void rcsi2_exit_standby(struct rcar_csi2 *priv)
>  	reset_control_deassert(priv->rstc);
>  }
>  
> -static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> +static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
> +				unsigned int active_lanes)

Maybe s/active_lanes/lanes/ here and below?

>  {
>  	unsigned int timeout;
>  
>  	/* Wait for the clock and data lanes to enter LP-11 state. */
>  	for (timeout = 0; timeout <= 20; timeout++) {
> -		const u32 lane_mask = (1 << priv->lanes) - 1;
> +		const u32 lane_mask = (1 << active_lanes) - 1;
>  
>  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
>  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> @@ -447,7 +449,8 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  	return 0;
>  }
>  
> -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> +static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> +			   unsigned int active_lanes)
>  {
>  	struct v4l2_subdev *source;
>  	struct v4l2_ctrl *ctrl;
> @@ -472,15 +475,63 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
>  	 * bps = link_freq * 2
>  	 */
>  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> -	do_div(mbps, priv->lanes * 1000000);
> +	do_div(mbps, active_lanes * 1000000);
>  
>  	return mbps;
>  }
>  
> +static int rcsi2_config_active_lanes(struct rcar_csi2 *priv,
> +				     unsigned int *active_lanes)

I would name this rcsi2_get_active_lanes() as it does not configure 
anything just queries the subdevice for information.

> +{
> +	struct v4l2_mbus_config mbus_config = { 0 };
> +	unsigned int num_lanes = (-1U);

This looks odd and could just be set 0 with the same effect but clearer 
to read.

> +	int ret;
> +
> +	*active_lanes = priv->lanes;
> +	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
> +			       priv->remote_pad, &mbus_config);
> +	if (ret == -ENOIOCTLCMD) {
> +		dev_dbg(priv->dev, "No remote mbus configuration available\n");
> +		return 0;
> +	}
> +
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to get remote mbus configuration\n");
> +		return ret;
> +	}
> +
> +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(priv->dev, "Unsupported media bus type %u\n",
> +			mbus_config.type);
> +		return -EINVAL;
> +	}
> +
> +	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> +		num_lanes = 1;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> +		num_lanes = 2;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> +		num_lanes = 3;
> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> +		num_lanes = 4;
> +
> +	if (num_lanes > priv->lanes) {
> +		dev_err(priv->dev,
> +			"Unsupported mbus config: too many data lanes %u\n",
> +			num_lanes);
> +		return -EINVAL;
> +	}
> +
> +	*active_lanes = num_lanes;
> +
> +	return 0;
> +}
> +
>  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  {
>  	const struct rcar_csi2_format *format;
>  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> +	unsigned int active_lanes;
>  	unsigned int i;
>  	int mbps, ret;
>  
> @@ -522,10 +573,18 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  			fld |= FLD_FLD_NUM(1);
>  	}
>  
> +	/*
> +	 * Get the number of active data lanes inspecting the remote mbus
> +	 * configuration.
> +	 */
> +	ret = rcsi2_config_active_lanes(priv, &active_lanes);
> +	if (ret)
> +		return ret;
> +
>  	phycnt = PHYCNT_ENABLECLK;
> -	phycnt |= (1 << priv->lanes) - 1;
> +	phycnt |= (1 << active_lanes) - 1;
>  
> -	mbps = rcsi2_calc_mbps(priv, format->bpp);
> +	mbps = rcsi2_calc_mbps(priv, format->bpp, active_lanes);
>  	if (mbps < 0)
>  		return mbps;
>  
> @@ -572,7 +631,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ);
>  	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ | PHYCNT_RSTZ);
>  
> -	ret = rcsi2_wait_phy_start(priv);
> +	ret = rcsi2_wait_phy_start(priv, active_lanes);
>  	if (ret)
>  		return ret;
>  
> @@ -749,6 +808,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
>  	}
>  
>  	priv->remote = subdev;
> +	priv->remote_pad = pad;
>  
>  	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
>  
> -- 
> 2.27.0
> 

-- 
Regards,
Niklas Söderlund
