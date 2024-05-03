Return-Path: <linux-media+bounces-10660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E79138BA81F
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 09:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CE2F28288D
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 07:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF0E147C87;
	Fri,  3 May 2024 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aZg74kC0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D912B89;
	Fri,  3 May 2024 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714722914; cv=none; b=kW5ne/+kkXwlLeGpzzPmEYZM7lL9BOiLheBrSYHSvgAxSX7UBgZ3t0pDYIKy9jfAk/IYkhBP+7BNLn727E6Aa9y/E6mXnhgQGN4LjP+rRWXKh/PPRlXYgmdOdgubx3TslOqx884M92BWoXhfaozaZooZ71GEoU/jDUXzGWSf3mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714722914; c=relaxed/simple;
	bh=U0mKYSQM+iT4Ik304apKIeqKnUTFT1ZibgFP5UMGmAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvSx3q4amdcYsPBRM1kk38cfK6+tbbBDJP07keYXhetu7Lq46QpmgtBMFRl/S0YUC6IZVytK1ELqrsOQN1eCsIrBjZhgVM+VFL/lChmhF5tpBxOLAdAfR4D4f7E0G871pmgALnCITnPIcSgJ/clmlz105HhTTlGC3SfygS24bqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aZg74kC0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F09803A3;
	Fri,  3 May 2024 09:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714722852;
	bh=U0mKYSQM+iT4Ik304apKIeqKnUTFT1ZibgFP5UMGmAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZg74kC0JxbZwUYUcOud7rDgaH8+DlKEHETc7RYQt+MSTB7a+PZgn+V6Dgk2NQ5GY
	 FSD/BbEKNl6OBD77VW0xvmTVmrjLRveTrl+IElCPknpxxYBZz0Vd4H2kGYMqiziSeA
	 E75Ejv4rvPVJZL0tK9F+GLVrXqqniURsHroxNqQE=
Date: Fri, 3 May 2024 09:55:07 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/19] media: adv748x: Add support for active state
Message-ID: <vnfopqtz2mziczzovjrdnkmlwvh5jlywtmtw7rf7ezghlmt2nv@upkno4eaeeuh>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-2-jacopo.mondi@ideasonboard.com>
 <20240502173430.GF15807@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240502173430.GF15807@pendragon.ideasonboard.com>

Hi Laurent

On Thu, May 02, 2024 at 08:34:30PM GMT, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Apr 30, 2024 at 12:39:37PM +0200, Jacopo Mondi wrote:
> > Initialize and use the subdev active state to store the subdevice
> > format.
> >
> > This simplifies the implementation of the get_fmt and set_fmt pad
> > operations.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/adv748x/adv748x-csi2.c | 69 ++++--------------------
> >  drivers/media/i2c/adv748x/adv748x.h      |  1 -
> >  2 files changed, 11 insertions(+), 59 deletions(-)
> >
> > diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > index 5b265b722394..435b0909bbef 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> > @@ -139,78 +139,26 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
> >   * But we must support setting the pad formats for format propagation.
> >   */
> >
> > -static struct v4l2_mbus_framefmt *
> > -adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
> > -			    struct v4l2_subdev_state *sd_state,
> > -			    unsigned int pad, u32 which)
> > -{
> > -	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > -
> > -	if (which == V4L2_SUBDEV_FORMAT_TRY)
> > -		return v4l2_subdev_state_get_format(sd_state, pad);
> > -
> > -	return &tx->format;
> > -}
> > -
> > -static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
> > -				   struct v4l2_subdev_state *sd_state,
> > -				   struct v4l2_subdev_format *sdformat)
> > -{
> > -	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > -	struct adv748x_state *state = tx->state;
> > -	struct v4l2_mbus_framefmt *mbusformat;
> > -
> > -	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> > -						 sdformat->which);
> > -	if (!mbusformat)
> > -		return -EINVAL;
> > -
> > -	mutex_lock(&state->mutex);
> > -
> > -	sdformat->format = *mbusformat;
> > -
> > -	mutex_unlock(&state->mutex);
> > -
> > -	return 0;
> > -}
> > -
> >  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
> >  				   struct v4l2_subdev_state *sd_state,
> >  				   struct v4l2_subdev_format *sdformat)
> >  {
> > -	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> > -	struct adv748x_state *state = tx->state;
> >  	struct v4l2_mbus_framefmt *mbusformat;
> > -	int ret = 0;
> > -
> > -	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> > -						 sdformat->which);
> > -	if (!mbusformat)
> > -		return -EINVAL;
> >
> > -	mutex_lock(&state->mutex);
> > +	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
> >
> > +	/* Format on the source pad is always copied from the sink one. */
> >  	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
> >  		const struct v4l2_mbus_framefmt *sink_fmt;
> >
> > -		sink_fmt = adv748x_csi2_get_pad_format(sd, sd_state,
> > -						       ADV748X_CSI2_SINK,
> > -						       sdformat->which);
> > -
> > -		if (!sink_fmt) {
> > -			ret = -EINVAL;
> > -			goto unlock;
> > -		}
> > -
> > +		sink_fmt = v4l2_subdev_state_get_format(sd_state,
> > +							ADV748X_CSI2_SINK);
> >  		sdformat->format = *sink_fmt;
>
> That's not the right way to do it. You should propagate the format from
> sink to source when pad == ADV748X_CSI2_SINK, and return
> adv748x_csi2_get_format() when pad == ADV748X_CSI2_SOURCE. Otherwise

I think it's done later and this patch doesn't change the currently
implemented behaviour, doesn't it ?

Anyway, I got that you would prefer to squash the first patches in a
single one, so this will be solved


> setting the format on the sink pad will not update the state of the
> source pad, and a get format call on the source pad will return an
> incorrect format.
>
> >  	}
> >
> >  	*mbusformat = sdformat->format;
> >
> > -unlock:
> > -	mutex_unlock(&state->mutex);
> > -
> > -	return ret;
> > +	return 0;
> >  }
> >
> >  static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> > @@ -228,7 +176,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
> >  }
> >
> >  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
> > -	.get_fmt = adv748x_csi2_get_format,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> >  	.set_fmt = adv748x_csi2_set_format,
> >  	.get_mbus_config = adv748x_csi2_get_mbus_config,
> >  };
> > @@ -320,6 +268,11 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
> >  	if (ret)
> >  		goto err_cleanup_subdev;
> >
> > +	tx->sd.state_lock = tx->ctrl_hdl.lock;
>
> Maybe that's addressed in subsequent patches, but do we need a
> device-wide lock ? The code you replace above uses the

device-wide as global to the CSI-2, the HDMI and the AFE subdevices ?

> adv748x_state.mutex lock, which covers all subdevs. I don't think this
> patch introduces race conditions, so this could possibly be handled on
> top.
>
> > +	ret = v4l2_subdev_init_finalize(&tx->sd);
> > +	if (ret)
> > +		goto err_free_ctrl;
> > +
> >  	ret = v4l2_async_register_subdev(&tx->sd);
> >  	if (ret)
> >  		goto err_free_ctrl;
> > diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> > index d2b5e722e997..9bc0121d0eff 100644
> > --- a/drivers/media/i2c/adv748x/adv748x.h
> > +++ b/drivers/media/i2c/adv748x/adv748x.h
> > @@ -75,7 +75,6 @@ enum adv748x_csi2_pads {
> >
> >  struct adv748x_csi2 {
> >  	struct adv748x_state *state;
> > -	struct v4l2_mbus_framefmt format;
> >  	unsigned int page;
> >  	unsigned int port;
> >  	unsigned int num_lanes;
>
> --
> Regards,
>
> Laurent Pinchart

