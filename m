Return-Path: <linux-media+bounces-18522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4D984A3D
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 19:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63A2D28541F
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 17:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6008C1AC436;
	Tue, 24 Sep 2024 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CnZHShTU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085961ABECE;
	Tue, 24 Sep 2024 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727198699; cv=none; b=WHfVmi+x+xQq6lBrwAKdfGjNUthrhuA67zPbmw/7d33NM4RKWAF8CIi3gjqh501X91CqQ16v2OKkvGsFSPyGm0p927lRmXzfc4trFgdwjjQ8imR9GBC5e1gdd6U8AT4ONA3XDdYN7S0UtFYHOw5frfP7YsN2zZAxdZ/e0amW7fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727198699; c=relaxed/simple;
	bh=/9n6n8U1pSyEI53YdQBEQ4ZeotAN7YihFxgM3QNfvCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CA2SLzCS8iuGXI5LRoydoCFM9+NvJMYU69KWjKAqyAF2buYKrwd0VwvjpbJfevgKxGZ0sr1YfeeTOk6uN4uj9JzzL6JGreAM/FOWVSB4lsdF3a+lwqXuK787ZEYW8EwPd6jH7YfmT5zH9kzZyjQ88tVVbn+j+VS6aMtoEsm0zCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CnZHShTU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E427719BA;
	Tue, 24 Sep 2024 19:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727198609;
	bh=/9n6n8U1pSyEI53YdQBEQ4ZeotAN7YihFxgM3QNfvCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnZHShTUweVijTAVpojYstJMY4ZtlCaWcqN6qhZobKy8u2ziP08cJ51gx/m0lplFn
	 K0aPeDooX61IhGK+xafsO82iZwlAnkRmXgGgLmi7jIWZd/GsKqUTWZpAB8ymW/6GGr
	 JZ+ipLo9/ChE9AiN7YH9miKiDcd7/opxusY1TKhY=
Date: Tue, 24 Sep 2024 20:24:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/4] media: renesas: Use state cleanup macros
Message-ID: <20240924172423.GF30551@pendragon.ideasonboard.com>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
 <20240917-scoped-state-v1-3-b8ba3fbe5952@ideasonboard.com>
 <20240922101519.GA3490560@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240922101519.GA3490560@ragnatech.se>

On Sun, Sep 22, 2024 at 12:15:19PM +0200, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your work. I like the scoped management.
> 
> On 2024-09-17 17:09:31 +0300, Tomi Valkeinen wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > 
> > Use the new subdev state cleanup macros.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c            | 14 ++++----------
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c |  9 ++++-----
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c   |  9 ++-------
> >  3 files changed, 10 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index c419ddb4c5a2..03ef6566271f 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -1163,27 +1163,24 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
> >  static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > -	struct v4l2_subdev_state *state;
> >  	int ret = 0;
> >  
> >  	if (!priv->remote)
> >  		return -ENODEV;
> >  
> > -	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> > +	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&priv->subdev);
> >  
> >  	if (enable && priv->stream_count == 0) {
> >  		ret = rcsi2_start(priv, state);
> >  		if (ret)
> > -			goto out;
> > +			return ret;
> 
> As ret is now only used in this branch maybe we can move the declaration 
> of it here? At least I think you should remove the assignment to 0 above 
> as that behavior is not needed anymore but, at lest to me, keeping it 
> indicates there is an intent in initializing it.
> 
> With that fixed,
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> >  	} else if (!enable && priv->stream_count == 1) {
> >  		rcsi2_stop(priv);
> >  	}
> >  
> >  	priv->stream_count += enable ? 1 : -1;
> > -out:
> > -	v4l2_subdev_unlock_state(state);
> >  
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > @@ -1274,18 +1271,15 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
> >  
> >  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
> >  {
> > -	struct v4l2_subdev_state *state;
> >  	struct rcar_csi2 *priv = data;
> >  
> > -	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
> > +	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&priv->subdev);
> >  
> >  	rcsi2_stop(priv);
> >  	usleep_range(1000, 2000);
> >  	if (rcsi2_start(priv, state))
> >  		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> >  
> > -	v4l2_subdev_unlock_state(state);
> > -
> >  	return IRQ_HANDLED;
> >  }
> >  
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index e68fcdaea207..63b846f3e468 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -238,7 +238,6 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
> >  	struct v4l2_subdev *source = csi2->remote_source;
> >  	const struct rzg2l_csi2_format *format;
> >  	const struct v4l2_mbus_framefmt *fmt;
> > -	struct v4l2_subdev_state *state;
> >  	struct v4l2_ctrl *ctrl;
> >  	u64 mbps;
> >  
> > @@ -250,10 +249,10 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
> >  		return -EINVAL;
> >  	}
> >  
> > -	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
> > -	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
> > -	format = rzg2l_csi2_code_to_fmt(fmt->code);
> > -	v4l2_subdev_unlock_state(state);
> > +	scoped_v4l2_subdev_lock_and_get_active_state(&csi2->subdev) {
> > +		fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);

fmt could also become a local variable.

Now that I'm looking at this, another issue with
scoped_v4l2_subdev_lock_and_get_active_state() is that it creates a
non-const state variable, while there are use cases for const states.
I'm increasingly thinking we should use __free(), as neither the
scoped_* macro nor CLASS() allow the caller to indicate if the local
variable should be const or not.

> > +		format = rzg2l_csi2_code_to_fmt(fmt->code);
> > +	}
> >  
> >  	/*
> >  	 * Calculate hsfreq in Mbps
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > index ac8ebae4ed07..0b9e8a7cf22a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > @@ -36,14 +36,9 @@ static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int c
> >  
> >  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
> >  {
> > -	struct v4l2_subdev_state *state;
> > -	struct v4l2_mbus_framefmt *fmt;
> > +	CLASS(v4l2_subdev_lock_and_get_active_state, state)(&cru->ip.subdev);
> >  
> > -	state = v4l2_subdev_lock_and_get_active_state(&cru->ip.subdev);
> > -	fmt = v4l2_subdev_state_get_format(state, 1);
> > -	v4l2_subdev_unlock_state(state);
> > -
> > -	return fmt;
> > +	return v4l2_subdev_state_get_format(state, 1);
> >  }
> >  
> >  static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)
> > 

-- 
Regards,

Laurent Pinchart

