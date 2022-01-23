Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDCA4971EA
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 15:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236698AbiAWONb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 09:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236678AbiAWONa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 09:13:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CC3C06173B;
        Sun, 23 Jan 2022 06:13:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CF3125E;
        Sun, 23 Jan 2022 15:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642947209;
        bh=47P3YfcXCcgPCK6z/c9ZNbPd6O4dI41T3XLuSPjigy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZqFvJLznQVdNpMXtux8xjDLwpkiVb2Exk5Xd+XunPMe30xjn2doKyHjcuzAF4RMG4
         RMc+6nojKw2rNLZMH3bAQd4yDGZt2xluzxkLSNc44A+HKwjnPgQ/tJuqSA8PA1mpCg
         2LeFbjowBR9pL1VNirlxj1hsJ7FNy4qk/gLE9r9o=
Date:   Sun, 23 Jan 2022 16:13:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 09/13] media: rcar-csi2: Implement set_routing
Message-ID: <Ye1ieevqEBfOJHKy@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-10-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211017182449.64192-10-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Oct 17, 2021 at 08:24:45PM +0200, Jacopo Mondi wrote:
> Add the set_routing() subdev operation to allow userspace to configure
> routing on the R-Car CSI-2 receiver.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 40 +++++++++++++++------
>  1 file changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index a74087b49e71..451a6da26e03 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -752,6 +752,33 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int _rcsi2_set_routing(struct v4l2_subdev *sd,

__ is more customary.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			      struct v4l2_subdev_state *state,
> +			      struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_routing_simple_verify(routing);
> +	if (ret)
> +		return ret;
> +
> +	state = v4l2_subdev_validate_and_lock_state(sd, state);
> +
> +	ret = v4l2_subdev_set_routing(sd, state, routing);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int rcsi2_set_routing(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state,
> +			     enum v4l2_subdev_format_whence which,
> +			     struct v4l2_subdev_krouting *routing)
> +{
> +	return _rcsi2_set_routing(sd, state, routing);
> +}
> +
>  static int rcsi2_init_cfg(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *state)
>  {
> @@ -792,17 +819,7 @@ static int rcsi2_init_cfg(struct v4l2_subdev *sd,
>  		.routes = routes,
>  	};
>  
> -	int ret = v4l2_routing_simple_verify(&routing);
> -	if (ret)
> -		return ret;
> -
> -	state = v4l2_subdev_validate_and_lock_state(sd, state);
> -
> -	ret = v4l2_subdev_set_routing(sd, state, &routing);
> -
> -	v4l2_subdev_unlock_state(state);
> -
> -	return ret;
> +	return _rcsi2_set_routing(sd, state, &routing);
>  }
>  
>  static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
> @@ -813,6 +830,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.init_cfg = rcsi2_init_cfg,
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = rcsi2_get_pad_format,
> +	.set_routing = rcsi2_set_routing,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {

-- 
Regards,

Laurent Pinchart
