Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB9A2210A7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 17:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgGOPOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 11:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgGOPOO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 11:14:14 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F352C08C5DB
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 08:14:14 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id r19so2941109ljn.12
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 08:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uONZfFqoKk2OemHEk6YZgogfzfNyLnmNYNk1WWI5ZHc=;
        b=ieiW8EJlD51EZa3J+l3kNfMEdWh7f6Whd/f5ytIaNYaok1FtllONqck01fWB29AQoJ
         eMRSXwjdT39mLFfKGsigtXk7nEyBgVxrIzfn+w5AH2pzmU1GrDo5FZV9gqs81QxhHYfn
         02gyMbpAVoJV9kxQkSE71WlxbI7X/CZen/qKeQEP6A6DQQON3g14+cBrCyXFl3VhBc29
         1de1fWQk8H3DAGNjOY9Q7KiIJ1CncNqGBuf9mtA3+6Ib8XLMx34eG6E1lNKb2JWKmj3V
         Tny8u23BCdNOIf9HHIHUASDBoepBNLlD4oR5Ce4bnKdetTxs5NP53s03d46wVwhfKqVl
         36dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uONZfFqoKk2OemHEk6YZgogfzfNyLnmNYNk1WWI5ZHc=;
        b=CehBwYJcpEStzVDzLidXE8Ac2zRHd84wElvMPmkEf4euC/vgiM2/pMaQHdJDM5eSDx
         G8xgZQ9DqTwh1EFBWVcTLrExu3GnP50mX1RQ1yw7vlx9UZO9t0MRrkHBuu62KQAop5iK
         Bv2NAlv6pkzhheGFpWtvaOxBXbvDNkkHCGOemErgLXlmnd29zowwuUIvg9otL8M9f8Ns
         5SffvabeM0WMltEK0FiCMGD0iNI+rCQGgFjEFINGu/SgPBryOYcZ7VTwbAQocq2M1T8q
         NZRoAZKgDhAZ9DmGkjQNnJ135k4Oepd2o66OVl5gLzMmMboZ8CtxaRMnH+i+FGxMy+b2
         bVgA==
X-Gm-Message-State: AOAM5327IDULDVxpAG2W3Qz7qdOaO+Hywqdp8JOwoQmrLfThPuAwsCQR
        I4xaMOyLlhiXTMlW+wt2RN5c8A==
X-Google-Smtp-Source: ABdhPJyK8uxwIY6gmJMRW3TOIwKBgkx1XQzW78Ze7lhlddtvILye06a4wAcg6UA7dSIjkPuoexRTLQ==
X-Received: by 2002:a2e:80c8:: with SMTP id r8mr3577684ljg.423.1594826052720;
        Wed, 15 Jul 2020 08:14:12 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id t205sm301916lff.8.2020.07.15.08.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 08:14:11 -0700 (PDT)
Date:   Wed, 15 Jul 2020 17:14:11 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6.1 9/9] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200715151411.GK3051471@oden.dyn.berto.se>
References: <20200714135812.55158-10-jacopo+renesas@jmondi.org>
 <20200715143820.132677-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715143820.132677-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2020-07-15 16:38:20 +0200, Jacopo Mondi wrote:
> Use the newly introduced get_mbus_config() subdevice pad operation to
> retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> the number of active data lanes accordingly.
> 
> In order to be able to call the remote subdevice operation cache the
> index of the remote pad connected to the single CSI-2 input port.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v6.1 diff to address Niklas' comments:
> 
> - s/rcsi2_config_active_lanes()/rcsi2_get_active_lanes()
> - s/unsigned int num_lanes = (-1U);/unsigned int num_lanes = UINT_MAX;/
> - s/active_lanes/lanes
> 
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 74 +++++++++++++++++++--
>  1 file changed, 67 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index c6cc4f473a07..5dac8ea66358 100644
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
> +				unsigned int lanes)
>  {
>  	unsigned int timeout;
> 
>  	/* Wait for the clock and data lanes to enter LP-11 state. */
>  	for (timeout = 0; timeout <= 20; timeout++) {
> -		const u32 lane_mask = (1 << priv->lanes) - 1;
> +		const u32 lane_mask = (1 << lanes) - 1;
> 
>  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
>  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> @@ -447,7 +449,8 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  	return 0;
>  }
> 
> -static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
> +static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> +			   unsigned int lanes)
>  {
>  	struct v4l2_subdev *source;
>  	struct v4l2_ctrl *ctrl;
> @@ -472,15 +475,63 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
>  	 * bps = link_freq * 2
>  	 */
>  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> -	do_div(mbps, priv->lanes * 1000000);
> +	do_div(mbps, lanes * 1000000);
> 
>  	return mbps;
>  }
> 
> +static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
> +				  unsigned int *lanes)
> +{
> +	struct v4l2_mbus_config mbus_config = { 0 };
> +	unsigned int num_lanes = UINT_MAX;
> +	int ret;
> +
> +	*lanes = priv->lanes;

I would add a blank line here as assigning *lanes is quiet different 
from trying to updated it bellow. With this fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
> +	*lanes = num_lanes;
> +
> +	return 0;
> +}
> +
>  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  {
>  	const struct rcar_csi2_format *format;
>  	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> +	unsigned int lanes;
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
> +	ret = rcsi2_get_active_lanes(priv, &lanes);
> +	if (ret)
> +		return ret;
> +
>  	phycnt = PHYCNT_ENABLECLK;
> -	phycnt |= (1 << priv->lanes) - 1;
> +	phycnt |= (1 << lanes) - 1;
> 
> -	mbps = rcsi2_calc_mbps(priv, format->bpp);
> +	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
>  	if (mbps < 0)
>  		return mbps;
> 
> @@ -572,7 +631,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ);
>  	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ | PHYCNT_RSTZ);
> 
> -	ret = rcsi2_wait_phy_start(priv);
> +	ret = rcsi2_wait_phy_start(priv, lanes);
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
