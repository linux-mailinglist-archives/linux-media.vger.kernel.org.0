Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F31149720A
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 15:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbiAWOW6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 09:22:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41450 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbiAWOW6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 09:22:58 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1D1425E;
        Sun, 23 Jan 2022 15:22:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642947776;
        bh=AmccEnEsI46DISgn9jtM5vo07iXKINp3K4ZiCrIy+Vk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eqIPgdqZACm3FGSnw1g+bz6DnUWIz5MB6F2jGUBNJLQ4nlHDk3dbTehcXu6ZLJ+YG
         HHr1w+KrxUdDMTapVHvr+e6cdiDhiDMLa60kSynyqlsvtRs5hQKyVkAaujD/iRu6HU
         vtajPIcqFvWluyARSQaDlZdmUIsv5i5NmtxiYzSI=
Date:   Sun, 23 Jan 2022 16:22:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        niklas.soderlund@ragnatech.se, kieran.bingham@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 10/13] media: rcar-csi2: Move format to subdev state
Message-ID: <Ye1ksD5qAD9kqZdc@pendragon.ideasonboard.com>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
 <20211017182449.64192-11-jacopo+renesas@jmondi.org>
 <Ye1j4vOaGW60FZIY@pendragon.ideasonboard.com>
 <Ye1kD2rROMYTFE/X@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ye1kD2rROMYTFE/X@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 23, 2022 at 04:20:01PM +0200, Laurent Pinchart wrote:
> On Sun, Jan 23, 2022 at 04:19:16PM +0200, Laurent Pinchart wrote:
> > Hi Jacopo,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Oct 17, 2021 at 08:24:46PM +0200, Jacopo Mondi wrote:
> > > Move format handling to the v4l2_subdev state and store it per
> > > (pad, stream) combination.
> > > 
> > > Now that the image format is stored in the subdev state, it can be
> > > accessed through v4l2_subdev_get_fmt() instead of open-coding it.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 50 ++++++++++++---------
> > >  1 file changed, 29 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index 451a6da26e03..b60845b1e563 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -722,34 +722,42 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > >  				struct v4l2_subdev_state *sd_state,
> > >  				struct v4l2_subdev_format *format)
> > >  {
> > > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > > -	struct v4l2_mbus_framefmt *framefmt;
> > > +	struct v4l2_mbus_framefmt *fmt;
> > > +	struct v4l2_subdev_state *state;
> > > +	int ret = 0;
> > >  
> > >  	if (!rcsi2_code_to_fmt(format->format.code))
> > >  		format->format.code = rcar_csi2_formats[0].code;
> > >  
> > > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > -		priv->mf = format->format;
> > > -	} else {
> > > -		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> > > -		*framefmt = format->format;
> > > -	}
> > > +	/*
> > > +	 * Format is propagated from sink streams to source streams, so
> > > +	 * disallow setting format on the source pads.
> > > +	 */
> > > +	if (format->pad > RCAR_CSI2_SINK)
> > > +		return -EINVAL;
> > 
> > You should return v4l2_subdev_get_fmt() instead.
> > 
> > >  
> > > -	return 0;
> > > -}
> > > +	state = v4l2_subdev_validate_and_lock_state(sd, sd_state);
> > 
> > With v10 of the streams series I think you can use
> > v4l2_subdev_lock_state().
> > 
> > > +	fmt = v4l2_state_get_stream_format(state, format->pad,
> > > +					   format->stream);
> > > +	if (!fmt) {
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +	*fmt = format->format;
> > 
> > I would get the pointers to both formats before updating any of them, to
> > avoid a partial update in case of error:
> > 
> > 	sink_fmt = v4l2_state_get_stream_format(state, format->pad,
> > 						format->stream);
> > 	source_fmt = v4l2_state_get_opposite_stream_format(state, format->pad,
> > 							   format->stream);
> > 	if (!sink_fmt || !source_fmt) {
> > 		ret = -EINVAL;
> > 		goto out;
> > 	}
> > 
> > 	*sink_fmt = format->format;
> > 	*source_fmt = format->format;
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Actually, the rest of the driver still uses priv->mf, so this patch will
> cause a breakage. You can squash it with 11/13.

Or, looking at 11/13, it may be best to replace all usages of priv->mf
with the format from the state in this patch, and keep 11/13 separate.

> > >  
> > > -static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> > > -				struct v4l2_subdev_state *sd_state,
> > > -				struct v4l2_subdev_format *format)
> > > -{
> > > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > > +	/* Propagate format to the other end of the route. */
> > > +	fmt = v4l2_state_get_opposite_stream_format(state, format->pad,
> > > +						    format->stream);
> > > +	if (!fmt) {
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +	*fmt = format->format;
> > >  
> > > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > > -		format->format = priv->mf;
> > > -	else
> > > -		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
> > > +out:
> > > +	v4l2_subdev_unlock_state(state);
> > >  
> > > -	return 0;
> > > +	return ret;
> > >  }
> > >  
> > >  static int _rcsi2_set_routing(struct v4l2_subdev *sd,
> > > @@ -829,7 +837,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
> > >  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
> > >  	.init_cfg = rcsi2_init_cfg,
> > >  	.set_fmt = rcsi2_set_pad_format,
> > > -	.get_fmt = rcsi2_get_pad_format,
> > > +	.get_fmt = v4l2_subdev_get_fmt,
> > >  	.set_routing = rcsi2_set_routing,
> > >  };
> > >  

-- 
Regards,

Laurent Pinchart
