Return-Path: <linux-media+bounces-26188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E392DA373B8
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 11:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FEEC3ADFA2
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 10:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BBA78F35;
	Sun, 16 Feb 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmnlTQfY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33F6DDD2;
	Sun, 16 Feb 2025 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739700093; cv=none; b=NbF7jf8zQSUrXmW3pZ7S7pELo5DUDYVsCM8lrr0y2a02GrWfFFbisPlj7wa/7nw7JNyuK8am6tJnBmuVMede6udfaTCxAyLdbg5Bi9PBsj1DN67hCUB/+lWbU8623tOYsqFJNY7o3LtwFV8eAFmwub60kJGdrv+l5RZ8vrU6BXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739700093; c=relaxed/simple;
	bh=mhUiE4v9ORggncnz5vatjFzHVsdnfBk2KU9GNIGLnk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0YF+BlOwfk03HA3cNf3NDfhkufvwR9w4QdyJz13hNBY5ANrpgJLMFf6Csnyd7eOxYPP7LQWtpEncMw6bPeeN+4J1eKONuCvjjPhnmuM5X8HXnGBHxyFwozAkIwTEPm39trkHLRuuqwd9MDtS6GxIR/VndR5AVUO8+UQ/Qzoe2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmnlTQfY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739700092; x=1771236092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mhUiE4v9ORggncnz5vatjFzHVsdnfBk2KU9GNIGLnk4=;
  b=YmnlTQfYlk/Fur35hDNRyMZG3XEdfpWrp+ldaWC0XhIk+qM0HH1b7C8c
   aNE4wBvEsdWKKL0+hwZaCYpvKX4CLcKZMBB3YUPuE/FQIa/cLYpNrWe9Y
   wnCkWboqR0SaARUvUDcj4Am5BKjEsr2CDLqppIWiACMmlrhmqBAnazL3V
   4Hjh8yE75JyrgCOTBv9DvdB1ur+aZFPn4BtIQk/wb6A4Tm4kpaoIVA70z
   cCrpJa+b5yEp0bX6lw2odSgnHjtyYOmOjSH7g/bsQ6v0QVSOJIelsrLae
   2s5GsEyzwzu2MzNr9FUQYYHBaBjkdH5uyTDNDUiiURdwPA3Tm0ajNZHjQ
   A==;
X-CSE-ConnectionGUID: 33xk1RY1RA6bwWQVVpa0zw==
X-CSE-MsgGUID: QmmSfMnTT4Cf5PTZRRWaPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="44051708"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="44051708"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 02:01:31 -0800
X-CSE-ConnectionGUID: epc5efekTl+/fOf2hvdH1g==
X-CSE-MsgGUID: uzJ+LKJRSl2gA3p8XoKDNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="118875042"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 02:01:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3072D11F7F2;
	Sun, 16 Feb 2025 12:01:27 +0200 (EET)
Date: Sun, 16 Feb 2025 10:01:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: imx335: Set vblank immediately
Message-ID: <Z7G3d_zEhqDuepNM@kekkonen.localdomain>
References: <20250214133709.1290585-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214133709.1290585-1-paul.elder@ideasonboard.com>

Hi Paul,

On Fri, Feb 14, 2025 at 10:37:09PM +0900, Paul Elder wrote:
> When the vblank v4l2 control is set, it does not get written to the
> hardware immediately. It only gets updated when exposure is set. Change
> the behavior such that the vblank is written immediately when the
> control is set.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  drivers/media/i2c/imx335.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index fcfd1d851bd4..e73a23bbbc89 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -559,12 +559,12 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
>  			imx335->vblank,
>  			imx335->vblank + imx335->cur_mode->height);
>  
> -		return __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> -						IMX335_EXPOSURE_MIN,
> -						imx335->vblank +
> -						imx335->cur_mode->height -
> -						IMX335_EXPOSURE_OFFSET,
> -						1, IMX335_EXPOSURE_DEFAULT);
> +		 __v4l2_ctrl_modify_range(imx335->exp_ctrl,

Indentation.

You're also missing an error check here.

> +					  IMX335_EXPOSURE_MIN,
> +					  imx335->vblank +
> +					  imx335->cur_mode->height -
> +					  IMX335_EXPOSURE_OFFSET,
> +					  1, IMX335_EXPOSURE_DEFAULT);
>  	}
>  
>  	/*
> @@ -575,6 +575,13 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
>  		return 0;
>  
>  	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		exposure = imx335->exp_ctrl->val;
> +		analog_gain = imx335->again_ctrl->val;
> +
> +		ret = imx335_update_exp_gain(imx335, exposure, analog_gain);
> +
> +		break;
>  	case V4L2_CID_EXPOSURE:
>  		exposure = ctrl->val;
>  		analog_gain = imx335->again_ctrl->val;

-- 
Regards,

Sakari Ailus

