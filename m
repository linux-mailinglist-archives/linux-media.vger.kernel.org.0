Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5546477336
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 14:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbhLPNcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 08:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234599AbhLPNcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 08:32:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F239C061574;
        Thu, 16 Dec 2021 05:32:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D83A73F6;
        Thu, 16 Dec 2021 14:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639661536;
        bh=6BYTwDMJAz48uY5rsME4qy/+7JNglc7H0Z0Mllf4mKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AE5wgl1m5jSCxesha4wTw2PTyxTTc1F1tq854Q2KTrDmmJ6yXIz4eCEk3kqf6dIhn
         FuUSSuG2stJwpp0Jh8N7ELyf6p3FX4ibcsYavGJfqbT9eJ0TTsbtEBHhgc/nwZI6Xl
         4t6r7KndPtAdGWnEHPywQ8ZNbMtyKvpyGZmzMXe4=
Date:   Thu, 16 Dec 2021 15:32:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 05/13] media: max9286: Move format to subdev state
Message-ID: <Ybs/3RJEvbMQXcLc@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-6-jacopo+renesas@jmondi.org>
 <Ybs0Tl3qqfXbwO50@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ybs0Tl3qqfXbwO50@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Dec 16, 2021 at 02:42:55PM +0200, Laurent Pinchart wrote:
> On Sun, Oct 17, 2021 at 08:24:41PM +0200, Jacopo Mondi wrote:
> > Move format handling to the v4l2_subdev state and store it per
> > (pad, stream) combination.
> > 
> > Now that the image format is stored in the subdev state, it can be
> > accessed through v4l2_subdev_get_fmt() instead of open-coding it.
> 
> Would it be possible to move this to 02/13 in the series ? Storing the
> formats in the state doesn't depend on multiplexed streams support, we
> could thus merge it early. The current 01/13 would need to be split in
> two, with one part to allocate the active state and implement
> .init_cfg() without muxed streams support, and another part to add muxed
> streams support on top.

It looks like not all patches required for this have been upstreamed yet
:-( Still, we may be able to merge the "V4L2 Subdev State" subset of the
muxed streams series sooner than latter, so moving this patch to the
beginning of the series may make sense.

> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 85 ++++++++++++-------------------------
> >  1 file changed, 27 insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 3485478f08a5..e51771d99437 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -175,8 +175,6 @@ struct max9286_priv {
> >  	struct v4l2_ctrl_handler ctrls;
> >  	struct v4l2_ctrl *pixelrate;
> >  
> > -	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> > -
> >  	/* Protects controls and fmt structures */
> >  	struct mutex mutex;
> >  
> > @@ -829,28 +827,18 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >  
> > -static struct v4l2_mbus_framefmt *
> > -max9286_get_pad_format(struct max9286_priv *priv,
> > -		       struct v4l2_subdev_state *sd_state,
> > -		       unsigned int pad, u32 which)
> > -{
> > -	switch (which) {
> > -	case V4L2_SUBDEV_FORMAT_TRY:
> > -		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
> > -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > -		return &priv->fmt[pad];
> > -	default:
> > -		return NULL;
> > -	}
> > -}
> > -
> >  static int max9286_set_fmt(struct v4l2_subdev *sd,
> >  			   struct v4l2_subdev_state *sd_state,
> >  			   struct v4l2_subdev_format *format)
> >  {
> > -	struct max9286_priv *priv = sd_to_max9286(sd);
> > -	struct v4l2_mbus_framefmt *cfg_fmt;
> > +	struct v4l2_mbus_framefmt *fmt;
> > +	struct v4l2_subdev_state *state;
> > +	int ret = 0;
> >  
> > +	/*
> > +	 * Refuse to set format on the multiplexed source pad.
> > +	 * Format is propagated from sinks streams to source streams.
> > +	 */
> >  	if (format->pad == MAX9286_SRC_PAD)
> >  		return -EINVAL;
> >  
> > @@ -866,44 +854,28 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> >  		break;
> >  	}
> >  
> > -	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
> > -					 format->which);
> > -	if (!cfg_fmt)
> > -		return -EINVAL;
> > -
> > -	mutex_lock(&priv->mutex);
> > -	*cfg_fmt = format->format;
> > -	mutex_unlock(&priv->mutex);
> > -
> > -	return 0;
> > -}
> > -
> > -static int max9286_get_fmt(struct v4l2_subdev *sd,
> > -			   struct v4l2_subdev_state *sd_state,
> > -			   struct v4l2_subdev_format *format)
> > -{
> > -	struct max9286_priv *priv = sd_to_max9286(sd);
> > -	struct v4l2_mbus_framefmt *cfg_fmt;
> > -	unsigned int pad = format->pad;
> > -
> > -	/*
> > -	 * Multiplexed Stream Support: Support link validation by returning the
> > -	 * format of the first bound link. All links must have the same format,
> > -	 * as we do not support mixing and matching of cameras connected to the
> > -	 * max9286.
> > -	 */
> > -	if (pad == MAX9286_SRC_PAD)
> > -		pad = __ffs(priv->bound_sources);
> > +	state = v4l2_subdev_validate_and_lock_state(sd, sd_state);
> > +	fmt = v4l2_state_get_stream_format(state, format->pad,
> > +					   format->stream);
> > +	if (!fmt) {
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> > +	*fmt = format->format;
> >  
> > -	cfg_fmt = max9286_get_pad_format(priv, sd_state, pad, format->which);
> > -	if (!cfg_fmt)
> > -		return -EINVAL;
> > +	/* Propagate format to the other end of the route. */
> > +	fmt = v4l2_state_get_opposite_stream_format(state, format->pad,
> > +						    format->stream);
> > +	if (!fmt) {
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> > +	*fmt = format->format;
> >  
> > -	mutex_lock(&priv->mutex);
> > -	format->format = *cfg_fmt;
> > -	mutex_unlock(&priv->mutex);
> > +out:
> > +	v4l2_subdev_unlock_state(state);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static int max9286_routing_verify(struct max9286_priv *priv,
> > @@ -1052,7 +1024,7 @@ static const struct v4l2_subdev_video_ops max9286_video_ops = {
> >  static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
> >  	.init_cfg	= max9286_init_cfg,
> >  	.enum_mbus_code = max9286_enum_mbus_code,
> > -	.get_fmt	= max9286_get_fmt,
> > +	.get_fmt	= v4l2_subdev_get_fmt,
> >  	.set_fmt	= max9286_set_fmt,
> >  	.set_routing	= max9286_set_routing,
> >  };
> > @@ -1092,9 +1064,6 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
> >  
> >  	/* Configure V4L2 for the MAX9286 itself */
> >  
> > -	for (i = 0; i < MAX9286_N_SINKS; i++)
> > -		priv->fmt[i] = max9286_default_format;
> > -
> >  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
> >  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> >  			  V4L2_SUBDEV_FL_MULTIPLEXED;

-- 
Regards,

Laurent Pinchart
