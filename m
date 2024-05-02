Return-Path: <linux-media+bounces-10649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D08BA2B5
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 00:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 191431C2269D
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 22:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDBF57C95;
	Thu,  2 May 2024 22:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EpuIDt7r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F9E57C83;
	Thu,  2 May 2024 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714687211; cv=none; b=ldSvyrFRX3d6JevIsDAz6A+eWvxdnVbws+WrSyOAB8PtH1mvMBmA+DNiYWBN+Q7a2Ei3dvfUk6+x6DR1hPVYr/oUsz+bGYXaMwqH34CQNXV/FN7DSPVH7aH9bzAZSj+9q0erNAZ4f9vzQAh//PItgSGvCe43283rg8almuo6dc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714687211; c=relaxed/simple;
	bh=DCIizbBtZO6uvkbPuAosI6BEPsNAeYfo1g4eub6d3bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtp9LIaJlPEHJsz939L3KetvkA37MsvtmgGdCAE3IwMwRo8vVu//Q+w1M7soE0FIDdIjhjesdI7+MSLWSWzWydGGt3TFMrkDLZfoOLS9fny/N5d9E8VKK9iC7Y/FiYqIr8M+bex7314otcZCkURPO7BsJ1L8GwKFG4osQUoXAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EpuIDt7r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEC9D4D4;
	Thu,  2 May 2024 23:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714687150;
	bh=DCIizbBtZO6uvkbPuAosI6BEPsNAeYfo1g4eub6d3bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpuIDt7rs/4aG/6loi2H26Lk2YElePXxMf4w6BqLaGYyd+CQI5wLKVUZRzD4jPj7s
	 8VTiLtEeo8kgG8yZZi1ED+PtTAA9aMsCg64qmhH1TPmkOMUTfHXOtPuH5f1W1rxVan
	 fENRK6btNxH7bYKOhH/0ubb8VLinxQZJXE4fBTFE=
Date: Fri, 3 May 2024 01:00:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 17/19] media: rcar-csi2: Store format in the subdev state
Message-ID: <20240502220000.GC4959@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-18-jacopo.mondi@ideasonboard.com>
 <20240502143232.GC3927860@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240502143232.GC3927860@ragnatech.se>

On Thu, May 02, 2024 at 04:32:32PM +0200, Niklas Söderlund wrote:
> Hi Jacpop,
> 
> Thanks for your work.
> 
> On 2024-04-30 12:39:53 +0200, Jacopo Mondi wrote:
> > Store the format in the subdevice state. Disallow setting format
> > on the source pads, as formats are set on the sink pad streams and
> > propagated to the source streams.
> > 
> > Now that the driver doesn't store the active format in the
> > driver-specific structure, also remove the mutex and use the lock
> > associated with the state.
> 
> Can't this whole patch be broken out to an independent patch and 
> upstreamed already independent from the streams work?

I think it's a good idea. We will need to move part of 15/19 here
(adding .init_state() and calling v4l2_subdev_init_finalize()).

> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 54 +++++++---------------
> >  1 file changed, 16 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index ffb73272543b..ed818a6fa655 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -621,8 +621,6 @@ struct rcar_csi2 {
> >  
> >  	int channel_vc[4];
> >  
> > -	struct mutex lock; /* Protects mf and stream_count. */
> > -	struct v4l2_mbus_framefmt mf;
> >  	int stream_count;
> >  
> >  	bool cphy;
> > @@ -1263,43 +1261,28 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
> >  }
> >  
> >  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > -				struct v4l2_subdev_state *sd_state,
> > +				struct v4l2_subdev_state *state,
> >  				struct v4l2_subdev_format *format)
> >  {
> > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -	struct v4l2_mbus_framefmt *framefmt;
> > +	struct v4l2_mbus_framefmt *fmt;
> >  
> > -	mutex_lock(&priv->lock);
> > +	/*
> > +	 * Format is propagated from sink streams to source streams, so
> > +	 * disallow setting format on the source pads.
> > +	 */
> > +	if (format->pad > RCAR_CSI2_SINK)
> > +		return -EINVAL;

		return v4l2_subdev_get_fmt(sd, state, format);

> >  
> >  	if (!rcsi2_code_to_fmt(format->format.code))
> >  		format->format.code = rcar_csi2_formats[0].code;
> >  
> > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -		priv->mf = format->format;
> > -	} else {
> > -		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
> > -		*framefmt = format->format;
> > -	}
> >  
> > -	mutex_unlock(&priv->lock);
> > +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> > +	*fmt = format->format;
> >  
> > -	return 0;
> > -}
> > -
> > -static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> > -				struct v4l2_subdev_state *sd_state,
> > -				struct v4l2_subdev_format *format)
> > -{
> > -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -
> > -	mutex_lock(&priv->lock);
> > -
> > -	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > -		format->format = priv->mf;
> > -	else
> > -		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
> > -
> > -	mutex_unlock(&priv->lock);
> > +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> > +							   format->stream);
> > +	*fmt = format->format;
> >  
> >  	return 0;
> >  }
> > @@ -1310,7 +1293,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
> >  
> >  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
> >  	.set_fmt = rcsi2_set_pad_format,
> > -	.get_fmt = rcsi2_get_pad_format,
> > +	.get_fmt = v4l2_subdev_get_fmt,
> >  };
> >  
> >  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> > @@ -2031,20 +2014,19 @@ static int rcsi2_probe(struct platform_device *pdev)
> >  
> >  	priv->dev = &pdev->dev;
> >  
> > -	mutex_init(&priv->lock);
> >  	priv->stream_count = 0;
> >  
> >  	ret = rcsi2_probe_resources(priv, pdev);
> >  	if (ret) {
> >  		dev_err(priv->dev, "Failed to get resources\n");
> > -		goto error_mutex;
> > +		return ret;
> >  	}
> >  
> >  	platform_set_drvdata(pdev, priv);
> >  
> >  	ret = rcsi2_parse_dt(priv);
> >  	if (ret)
> > -		goto error_mutex;
> > +		return ret;
> >  
> >  	priv->subdev.owner = THIS_MODULE;
> >  	priv->subdev.dev = &pdev->dev;
> > @@ -2094,8 +2076,6 @@ static int rcsi2_probe(struct platform_device *pdev)
> >  error_async:
> >  	v4l2_async_nf_unregister(&priv->notifier);
> >  	v4l2_async_nf_cleanup(&priv->notifier);
> > -error_mutex:
> > -	mutex_destroy(&priv->lock);
> >  
> >  	return ret;
> >  }
> > @@ -2110,8 +2090,6 @@ static void rcsi2_remove(struct platform_device *pdev)
> >  	v4l2_subdev_cleanup(&priv->subdev);
> >  
> >  	pm_runtime_disable(&pdev->dev);
> > -
> > -	mutex_destroy(&priv->lock);
> >  }
> >  
> >  static struct platform_driver rcar_csi2_pdrv = {

-- 
Regards,

Laurent Pinchart

