Return-Path: <linux-media+bounces-27001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4539A458C7
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE78F7A40AE
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 08:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5CC20DD7A;
	Wed, 26 Feb 2025 08:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jxzeTuEh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270F1A5BA0;
	Wed, 26 Feb 2025 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559759; cv=none; b=pYbK4SyBdgG9c+QdoR7TjhiEkop32D3D0+cjVXMX6RzOEcFfPLyA2eGfM35Mj1Iyljp1G4ppNrSaOl520cmnUVABSubi60Edh7tWZnoxRekKoihId7oAfmBKaIPp9fGf6DJ0p9YDjLl71NKZETcp3VjA2wOZsGoMlfbvxlEgG+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559759; c=relaxed/simple;
	bh=GZU93GuKJIpFBlwgWh+llyo6u7uHzEINyAi3nPlwXUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0bSWA2XcOEGWy0adKdT33ap0ULWvY/8CHVJOVSJ5lztq81gYURJItWTlySmuvUhmkbe94uuTvr9B9nvr8FRL4614qcJhRWlx09lfdiUczFVbSPByaSJ/aMVsVJJJxI7Ltx7WCH0dmRjf+fHppueihIsdS7G5tO9abW8KXaqgOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jxzeTuEh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:c539:d123:6770:2110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFF9022A;
	Wed, 26 Feb 2025 09:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740559667;
	bh=GZU93GuKJIpFBlwgWh+llyo6u7uHzEINyAi3nPlwXUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxzeTuEhvTv0ndVVlS6KMPosDbk0rnLdjJcpn3L1yC0j2oOy/o0n0a/TevmFSURXn
	 oMbqnKgSDSMwgyyxLq94UwWGBb7nZAHiKxaJ3TdJFNaVHU4WHhvs4Wdga0ixC/1o78
	 62rl7aXZGKCq5HwABemop1ai6BC+USk8gjN9Qrfo=
Date: Wed, 26 Feb 2025 17:49:07 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: imx335: Set vblank immediately
Message-ID: <Z77Vg7zcnj_5a-0s@pyrite.rasen.tech>
References: <20250214133709.1290585-1-paul.elder@ideasonboard.com>
 <Z7G3d_zEhqDuepNM@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7G3d_zEhqDuepNM@kekkonen.localdomain>

Hi Sakari,

Thanks for the review.

On Sun, Feb 16, 2025 at 10:01:27AM +0000, Sakari Ailus wrote:
> Hi Paul,
> 
> On Fri, Feb 14, 2025 at 10:37:09PM +0900, Paul Elder wrote:
> > When the vblank v4l2 control is set, it does not get written to the
> > hardware immediately. It only gets updated when exposure is set. Change
> > the behavior such that the vblank is written immediately when the
> > control is set.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx335.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index fcfd1d851bd4..e73a23bbbc89 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -559,12 +559,12 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
> >  			imx335->vblank,
> >  			imx335->vblank + imx335->cur_mode->height);
> >  
> > -		return __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> > -						IMX335_EXPOSURE_MIN,
> > -						imx335->vblank +
> > -						imx335->cur_mode->height -
> > -						IMX335_EXPOSURE_OFFSET,
> > -						1, IMX335_EXPOSURE_DEFAULT);
> > +		 __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> 
> Indentation.
> 
> You're also missing an error check here.

I reasoned that it's fine to not have the error check.

afaiu, the only change this has to error is if try/s_ctrl on
V4L2_CID_EXPOSURE fails when the change to the range of valid exposure
values requires a new exposure value to be set. Setting the exposure
control comes back to this function, and goes through the switch-case
and imx335_update_exp_gain() below, which doesn't fail.

Also the imx219 has the exact same pattern in imx219_set_ctrl.


Thanks,

Paul

> > +					  IMX335_EXPOSURE_MIN,
> > +					  imx335->vblank +
> > +					  imx335->cur_mode->height -
> > +					  IMX335_EXPOSURE_OFFSET,
> > +					  1, IMX335_EXPOSURE_DEFAULT);
> >  	}
> >  
> >  	/*
> > @@ -575,6 +575,13 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		return 0;
> >  
> >  	switch (ctrl->id) {
> > +	case V4L2_CID_VBLANK:
> > +		exposure = imx335->exp_ctrl->val;
> > +		analog_gain = imx335->again_ctrl->val;
> > +
> > +		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
> > +
> > +		break;
> >  	case V4L2_CID_EXPOSURE:
> >  		exposure = ctrl->val;
> >  		analog_gain = imx335->again_ctrl->val;

