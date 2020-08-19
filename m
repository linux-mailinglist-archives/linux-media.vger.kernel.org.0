Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3008E249E87
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 14:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgHSMr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 08:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbgHSMrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 08:47:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30476C061757;
        Wed, 19 Aug 2020 05:47:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5750629E;
        Wed, 19 Aug 2020 14:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597841224;
        bh=hakRn6Nhw4gIvTP0YD9FEplP8AUuMe5llXl6Si1c+V4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fa1PJdgx69/BZlm2eUSB+sf1AQywZ/iQumNZnzyiyn6HdCpOwo/H2EGGKP4+V3Qfm
         5Jw8w6/iO+zfmZjS2LmRi99V7dE138N8C9AGuKwT2mt8NaaM3oKbhU24Ae9aXhNx7K
         UnJwB3UWQV51dA9kAEhJOqCzgGOsYbFUxcbqQMfo=
Date:   Wed, 19 Aug 2020 15:46:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 2/4] media: i2c: max9286: Get format from remote ends
Message-ID: <20200819124646.GB10049@pendragon.ideasonboard.com>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
 <20200817143540.247340-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817143540.247340-3-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Aug 17, 2020 at 04:35:38PM +0200, Jacopo Mondi wrote:
> The MAX9286 chip does not allow any modification to the image stream
> format it de-serializes from the GMSL bus to its MIPI CSI-2 output
> interface.
> 
> For this reason, when the format is queried from on any of the MAX9286
> pads, get the remote subdevice format and return it.

That's not how MC-based drivers are supposed to work though. Userspace
has to propagate formats between subdevs, it must not be done internally
in the kernel.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 7c292f2e2704..e6a70dbd27df 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -742,8 +742,10 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_format *format)
>  {
>  	struct max9286_priv *priv = sd_to_max9286(sd);
> -	struct v4l2_mbus_framefmt *cfg_fmt;
> +	struct v4l2_subdev_format remote_fmt = {};
> +	struct device *dev = &priv->client->dev;
>  	unsigned int pad = format->pad;
> +	int ret;
>  
>  	/*
>  	 * Multiplexed Stream Support: Support link validation by returning the
> @@ -754,12 +756,26 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>  	if (pad == MAX9286_SRC_PAD)
>  		pad = __ffs(priv->bound_sources);
>  
> -	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
> -	if (!cfg_fmt)
> -		return -EINVAL;
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		mutex_lock(&priv->mutex);
> +		format->format = *v4l2_subdev_get_try_format(&priv->sd,
> +							     cfg, pad);
> +		mutex_unlock(&priv->mutex);
> +
> +		return 0;
> +	}
> +
> +	remote_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	remote_fmt.pad = 0;
> +	ret = v4l2_subdev_call(priv->sources[pad].sd, pad, get_fmt, NULL,
> +			       &remote_fmt);
> +	if (ret) {
> +		dev_err(dev, "Unable get format on source %d\n", pad);
> +		return ret;
> +	}
>  
>  	mutex_lock(&priv->mutex);
> -	format->format = *cfg_fmt;
> +	format->format = remote_fmt.format;
>  	mutex_unlock(&priv->mutex);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
