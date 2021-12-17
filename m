Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E243C478354
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 03:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhLQCpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 21:45:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhLQCpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 21:45:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD56C061574;
        Thu, 16 Dec 2021 18:45:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03BF092A;
        Fri, 17 Dec 2021 03:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639709105;
        bh=WTLGcHv2JkBr04OsbAmBlpxElYU5LnYuHjX3OBVTwiE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u4f/SWdSFCVkX5WAeCVnkq3rynX/x9gvS1Fz37gdnqnkk52JE5lLc7E7lpntwDZWa
         jgjL3TWCYkvz9oWRhs8PvjRUAJLwYblfIQr4UcaWOcGEnCVqfpeDnjM34qVKaJ2eyc
         uFNX4w2WE8qdlFTyYcSza+s6K2vLPsO1Si/mDHMI=
Date:   Fri, 17 Dec 2021 04:45:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] media: max9286: Implement get_frame_desc()
Message-ID: <Ybv5roGoqemlQ/NH@pendragon.ideasonboard.com>
References: <20211216174746.147233-1-jacopo+renesas@jmondi.org>
 <20211216174746.147233-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211216174746.147233-7-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Dec 16, 2021 at 06:47:46PM +0100, Jacopo Mondi wrote:
> Implement the get_frame_desc pad operation to allow retrieving the
> stream configuration of the max9286 subdevice.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 53 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index aa7cb7c10fc0..78988f2bdf91 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -876,6 +876,58 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret = 0;
> +
> +	if (pad != MAX9286_SRC_PAD)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_active_state(sd);
> +
> +	memset(fd, 0, sizeof(*fd));
> +
> +	/* One stream entry per each connected route. */
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *entry =
> +						&fd->entry[fd->num_entries];
> +		struct v4l2_mbus_framefmt *fmt;

This can be const.

> +
> +		fmt = v4l2_state_get_stream_format(state, pad,
> +						   route->source_stream);
> +		if (!fmt) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		/*
> +		 * Assume a YUYV format (0x1e DT) and 16 bpp: we only support
> +		 * these formats at the moment.
> +		 */
> +		entry->stream = fd->num_entries++;
> +		entry->flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
> +		entry->length = fmt->width * fmt->height * 16 / 8;
> +		entry->pixelcode = fmt->code;
> +
> +		/*
> +		 * The source stream id corresponds to the virtual channel a
> +		 * stream is output on.
> +		 */
> +		entry->bus.csi2.vc = route->source_stream;
> +		entry->bus.csi2.dt = 0x1e;

A header file for the CSI-2 data types could be useful (out of scope for
this series, unless you insist :-)).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
>  static int max9286_routing_validate(struct max9286_priv *priv,
>  				    struct v4l2_subdev_krouting *routing)
>  {
> @@ -1025,6 +1077,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
>  	.enum_mbus_code = max9286_enum_mbus_code,
>  	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= max9286_set_fmt,
> +	.get_frame_desc = max9286_get_frame_desc,
>  	.set_routing	= max9286_set_routing,
>  };
>  

-- 
Regards,

Laurent Pinchart
