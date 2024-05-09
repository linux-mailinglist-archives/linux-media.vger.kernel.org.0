Return-Path: <linux-media+bounces-11210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC898C102A
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 15:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9108A285077
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 13:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01ED1514D8;
	Thu,  9 May 2024 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pXJ/9+dd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD36E60E;
	Thu,  9 May 2024 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715260321; cv=none; b=AhOUQSZr/V0MZWwe0CVyE+xcVt4rVjPDTjL8+oeYy8EVLfyNRENef8SvvxpKbQaBUB1eQg7wK/NMNRqzMFVy7R8nB+dJAzSs2t6296aOf3BxPPOzacbnOuE0fG6CD9EHxfGsDKcvw3kDW2BFRbP6AphaAiTsHOwnSmEl6qEK3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715260321; c=relaxed/simple;
	bh=/Qf/mWz+XXKW+lRjNx0M2dtOW6zFa+kGKme1+eNWgvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCjoQqi7cmh6H1pqinC5Gn4iv0Tw6W5Udho56aA6mfy8NtcoMcFY1fSxXlxNaSJrU8JTVMHDEahHxh+Z2EUfVbQ41qfVwdnuHkVoOdkcDVcCJB9WbgwTdOalu8VFq4HvgQZF4gZ1i6hUzfypXxhk5d3o5HHOKjSeHQghJcwpy2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pXJ/9+dd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F22C12320;
	Thu,  9 May 2024 15:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715260314;
	bh=/Qf/mWz+XXKW+lRjNx0M2dtOW6zFa+kGKme1+eNWgvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXJ/9+ddUTg8fVznnGsBLwp99o2SsqGRp6FhKxW8R9TmhB55NWPrlS3UCKFrzhG0Z
	 /G1Uv2hONeDi758QtbxmRicCyWsLltF3+fmcyPV3/ICTh2XwkjwYdj66os+/5kmo4t
	 FKDJxi+cHMxqkrQ3ggtaqaBE498moLS1Yb6Jz8Do=
Date: Thu, 9 May 2024 16:11:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
	niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: max9286: Move format to subdev state
Message-ID: <20240509131148.GA21069@pendragon.ideasonboard.com>
References: <20211216174746.147233-1-jacopo+renesas@jmondi.org>
 <20211216174746.147233-6-jacopo+renesas@jmondi.org>
 <Ybv4mnk/x3kBX74k@pendragon.ideasonboard.com>
 <Ybv/c/yDOCj563XB@pendragon.ideasonboard.com>
 <20211217141128.jfwgymso2admkfv5@uno.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211217141128.jfwgymso2admkfv5@uno.localdomain>

Hi Jacopo,

On Fri, Dec 17, 2021 at 03:11:28PM +0100, Jacopo Mondi wrote:
> On Fri, Dec 17, 2021 at 05:09:39AM +0200, Laurent Pinchart wrote:
> > On Fri, Dec 17, 2021 at 04:40:26AM +0200, Laurent Pinchart wrote:
> > > On Thu, Dec 16, 2021 at 06:47:45PM +0100, Jacopo Mondi wrote:
> > > > Move format handling to the v4l2_subdev state and store it per
> > > > (pad, stream) combination.
> > > >
> > > > Now that the image format is stored in the subdev state, it can be
> > > > accessed through v4l2_subdev_get_fmt() instead of open-coding it.
> > >
> > > It could still be good to move this to the beginning of the series, in
> > > order to merge the patch with 01/38 to 06/38 from the muxed streams
> > > series (which will be submitted standalone in a v11).
> > >
> > > This patch looks good to me otherwise.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Not quite yet actually :-)
> >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  drivers/media/i2c/max9286.c | 86 ++++++++++++-------------------------
> > > >  1 file changed, 27 insertions(+), 59 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > > index 5d728fa23f01..aa7cb7c10fc0 100644
> > > > --- a/drivers/media/i2c/max9286.c
> > > > +++ b/drivers/media/i2c/max9286.c
> > > > @@ -174,8 +174,6 @@ struct max9286_priv {
> > > >  	struct v4l2_ctrl_handler ctrls;
> > > >  	struct v4l2_ctrl *pixelrate;
> > > >
> > > > -	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
> > > > -
> > > >  	/* Protects controls and fmt structures */
> > > >  	struct mutex mutex;
> > > >
> > > > @@ -828,28 +826,17 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static struct v4l2_mbus_framefmt *
> > > > -max9286_get_pad_format(struct max9286_priv *priv,
> > > > -		       struct v4l2_subdev_state *sd_state,
> > > > -		       unsigned int pad, u32 which)
> > > > -{
> > > > -	switch (which) {
> > > > -	case V4L2_SUBDEV_FORMAT_TRY:
> > > > -		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
> > > > -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > > > -		return &priv->fmt[pad];
> > > > -	default:
> > > > -		return NULL;
> > > > -	}
> > > > -}
> > > > -
> > > >  static int max9286_set_fmt(struct v4l2_subdev *sd,
> > > > -			   struct v4l2_subdev_state *sd_state,
> > > > +			   struct v4l2_subdev_state *state,
> > > >  			   struct v4l2_subdev_format *format)
> > > >  {
> > > > -	struct max9286_priv *priv = sd_to_max9286(sd);
> > > > -	struct v4l2_mbus_framefmt *cfg_fmt;
> > > > +	struct v4l2_mbus_framefmt *fmt;
> > > > +	int ret = 0;
> > > >
> > > > +	/*
> > > > +	 * Refuse to set format on the multiplexed source pad.
> > > > +	 * Format is propagated from sinks streams to source streams.
> > > > +	 */
> > > >  	if (format->pad == MAX9286_SRC_PAD)
> > > >  		return -EINVAL;
> >
> > We should return v4l2_subdev_get_fmt() now.
> 
> I might have missed the reason.
> 
> The current documentation says
> 
> EINVAL
> The struct v4l2_subdev_format pad references a non-existing pad,
> 
> Should this be changd to "non-existing or invalid pad" ?

I don't think so. Setting the format is meant to be valid on any pad,
even pads that have a fixed format. "Non-existing" seems enough to me.
What would you envision "invalid pad" to cover ?

> > > >
> > > > @@ -865,44 +852,28 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
> > > >  		break;
> > > >  	}
> > > >
> > > > -	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
> > > > -					 format->which);
> > > > -	if (!cfg_fmt)
> > > > -		return -EINVAL;
> > > > -
> > > > -	mutex_lock(&priv->mutex);
> > > > -	*cfg_fmt = format->format;
> > > > -	mutex_unlock(&priv->mutex);
> > > > -
> > > > -	return 0;
> > > > -}
> > > > -
> > > > -static int max9286_get_fmt(struct v4l2_subdev *sd,
> > > > -			   struct v4l2_subdev_state *sd_state,
> > > > -			   struct v4l2_subdev_format *format)
> > > > -{
> > > > -	struct max9286_priv *priv = sd_to_max9286(sd);
> > > > -	struct v4l2_mbus_framefmt *cfg_fmt;
> > > > -	unsigned int pad = format->pad;
> > > > -
> > > > -	/*
> > > > -	 * Multiplexed Stream Support: Support link validation by returning the
> > > > -	 * format of the first bound link. All links must have the same format,
> > > > -	 * as we do not support mixing and matching of cameras connected to the
> > > > -	 * max9286.
> > > > -	 */
> > > > -	if (pad == MAX9286_SRC_PAD)
> > > > -		pad = __ffs(priv->bound_sources);
> > > > +	v4l2_subdev_lock_state(state);
> > > > +	fmt = v4l2_state_get_stream_format(state, format->pad,
> > > > +					   format->stream);
> > > > +	if (!fmt) {
> > > > +		ret = -EINVAL;
> > > > +		goto out;
> > > > +	}
> > > > +	*fmt = format->format;
> > > >
> > > > -	cfg_fmt = max9286_get_pad_format(priv, sd_state, pad, format->which);
> > > > -	if (!cfg_fmt)
> > > > -		return -EINVAL;
> > > > +	/* Propagate format to the other end of the route. */
> > > > +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> > > > +							   format->stream);
> > > > +	if (!fmt) {
> > > > +		ret = -EINVAL;
> > > > +		goto out;
> > > > +	}
> > > > +	*fmt = format->format;
> > > >
> > > > -	mutex_lock(&priv->mutex);
> > > > -	format->format = *cfg_fmt;
> > > > -	mutex_unlock(&priv->mutex);
> > > > +out:
> > > > +	v4l2_subdev_unlock_state(state);
> > > >
> > > > -	return 0;
> > > > +	return ret;
> > > >  }
> > > >
> > > >  static int max9286_routing_validate(struct max9286_priv *priv,
> > > > @@ -1052,7 +1023,7 @@ static const struct v4l2_subdev_video_ops max9286_video_ops = {
> > > >  static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
> > > >  	.init_cfg	= max9286_init_cfg,
> > > >  	.enum_mbus_code = max9286_enum_mbus_code,
> > > > -	.get_fmt	= max9286_get_fmt,
> > > > +	.get_fmt	= v4l2_subdev_get_fmt,
> > > >  	.set_fmt	= max9286_set_fmt,
> > > >  	.set_routing	= max9286_set_routing,
> > > >  };
> > > > @@ -1092,9 +1063,6 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
> > > >
> > > >  	/* Configure V4L2 for the MAX9286 itself */
> > > >
> > > > -	for (i = 0; i < MAX9286_N_SINKS; i++)
> > > > -		priv->fmt[i] = max9286_default_format;
> > > > -
> > > >  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
> > > >  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > >  			  V4L2_SUBDEV_FL_MULTIPLEXED;

-- 
Regards,

Laurent Pinchart

