Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5327C1AFFB1
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 04:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgDTCIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 22:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbgDTCIg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 22:08:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82318C061A0C;
        Sun, 19 Apr 2020 19:08:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0525528;
        Mon, 20 Apr 2020 04:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587348515;
        bh=P9AW49Ien7ZA1mlNf8oV4UNbiKJrQFuOD96E2TjzwH0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jBWfXlD+FZl4EVtQ+d4pWcM9qgf6ixWjxAKqSTcK+2IsIeBW05GpksGrWo3MmUzEb
         GQnECWwBGa+PyXMgBx6PYxQOpD6Lwpe9opMhzJnnWrWeno5CSr16JeNcToK6bV6wnG
         hhDZaULGlbDU/BKb/tu1GdGUSniS4IAny68HEzuI=
Date:   Mon, 20 Apr 2020 05:08:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: rcar-csi2: Negotiate data lanes number
Message-ID: <20200420020822.GG15673@pendragon.ideasonboard.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415105004.2497356-7-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Apr 15, 2020 at 12:50:03PM +0200, Jacopo Mondi wrote:
> Use the newly introduced get_mbus_config() subdevice pad operation to
> retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
> the number of active data lanes accordingly.
> 
> In order to be able to call the remote subdevice operation cache the
> index of the remote pad connected to the single CSI-2 input port.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> 
> Niklas I've not been able to fully address comments as -ENOIOCTL command
> has to be handled separately as reported by email.
> 
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 53 +++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index faa9fb23a2e9..0061d5ff37e3 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -363,6 +363,7 @@ struct rcar_csi2 {
>  	struct v4l2_async_notifier notifier;
>  	struct v4l2_async_subdev asd;
>  	struct v4l2_subdev *remote;
> +	unsigned short remote_pad;

You can make this an unsigned int, it will be more efficient and won't
consume more memory.

> 
>  	struct v4l2_mbus_framefmt mf;
> 
> @@ -371,6 +372,7 @@ struct rcar_csi2 {
> 
>  	unsigned short lanes;
>  	unsigned char lane_swap[4];
> +	unsigned short active_lanes;
>  };
> 
>  static inline struct rcar_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> @@ -414,7 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> 
>  	/* Wait for the clock and data lanes to enter LP-11 state. */
>  	for (timeout = 0; timeout <= 20; timeout++) {
> -		const u32 lane_mask = (1 << priv->lanes) - 1;
> +		const u32 lane_mask = (1 << priv->active_lanes) - 1;
> 
>  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
>  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> @@ -471,11 +473,49 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
>  	 * bps = link_freq * 2
>  	 */
>  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
> -	do_div(mbps, priv->lanes * 1000000);
> +	do_div(mbps, priv->active_lanes * 1000000);
> 
>  	return mbps;
>  }
> 
> +static int rcsi2_config_active_lanes(struct rcar_csi2 *priv)
> +{
> +	struct v4l2_mbus_pad_config mbus_config;

 = { 0 };

here and you can remove the memset().

> +	int ret;
> +
> +	priv->active_lanes = priv->lanes;
> +
> +	memset(&mbus_config, 0, sizeof(mbus_config));
> +	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
> +			       priv->remote_pad, &mbus_config);
> +	if (ret == -ENOIOCTLCMD) {
> +		dev_dbg(priv->dev, "No remote mbus configuration available\n");
> +		return 0;
> +	}
> +
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to get remote mbus configuration\n");

In the unlikely case that the source implements the operation but only
supports it on other pads (the adv748x driver returns -EINVAL when
called on the sink pad for instance), is this really an error ? I think
it's related to the question I've asked in another patch, regarding what
error values are allowed for this operation and under what conditions.

> +		return ret;
> +	}
> +
> +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(priv->dev, "Unsupported mbus type %u\n",
> +			mbus_config.type);
> +		return -EINVAL;
> +	}
> +
> +	if (mbus_config.csi2_dphy.data_lanes > priv->lanes) {
> +		dev_err(priv->dev,
> +			"Unsupported mbus config: too many data lanes %u\n",
> +			mbus_config.csi2_dphy.data_lanes);
> +		return -EINVAL;
> +	}
> +
> +	priv->active_lanes = mbus_config.csi2_dphy.data_lanes;
> +
> +	return 0;
> +}
> +
>  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  {
>  	const struct rcar_csi2_format *format;
> @@ -490,6 +530,11 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  	/* Code is validated in set_fmt. */
>  	format = rcsi2_code_to_fmt(priv->mf.code);
> 
> +	/* Get the remote mbus config to get the number of enabled lanes. */
> +	ret = rcsi2_config_active_lanes(priv);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * Enable all supported CSI-2 channels with virtual channel and
>  	 * data type matching.
> @@ -522,7 +567,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>  	}
> 
>  	phycnt = PHYCNT_ENABLECLK;
> -	phycnt |= (1 << priv->lanes) - 1;
> +	phycnt |= (1 << priv->active_lanes) - 1;
> 
>  	mbps = rcsi2_calc_mbps(priv, format->bpp);
>  	if (mbps < 0)
> @@ -748,6 +793,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
>  	}
> 
>  	priv->remote = subdev;
> +	priv->remote_pad = pad;
> 
>  	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
> 
> @@ -793,6 +839,7 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
>  			priv->lanes);
>  		return -EINVAL;
>  	}
> +	priv->active_lanes = priv->lanes;
> 
>  	for (i = 0; i < ARRAY_SIZE(priv->lane_swap); i++) {
>  		priv->lane_swap[i] = i < priv->lanes ?

-- 
Regards,

Laurent Pinchart
