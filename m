Return-Path: <linux-media+bounces-19910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D09A46FF
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 21:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91832B22195
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 19:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436F1204943;
	Fri, 18 Oct 2024 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6B+5et7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668820E33D;
	Fri, 18 Oct 2024 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729279837; cv=none; b=rNdr3neBbPFnnWjARXS6Njp9AgGs0REEo3xYzSR0yrb3YVzH+q4mjCLFdxVYatGn7oQOPrazuKdkv4DuigR3b59RfWSHrzw4gMTmCYqOnz/YP5F+0kfKspAAcJt4Lx9+UlblLndJYqT048JhfAapB4r3W/tEfTb19JXUE25ItHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729279837; c=relaxed/simple;
	bh=Pf211wAd6uXT3f9WYNiR63aBdshGbUFzLA1xgDWeEn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7MI57NzuyD7IdHVy3ALjQwVQs517y+9s/5E/PnRm2Vo+byCuQshrnZ+IRynP/Kgypx8rbKrDqg/aCLe7ePoW49kUgt6B1MaQe5MdQKCkoYcCK7TVkqYQqb5izexgfXDkNRMjE35nmCoMr+xIrx4IaV1GBEOdlXOy0vGLhWQvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6B+5et7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729279835; x=1760815835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pf211wAd6uXT3f9WYNiR63aBdshGbUFzLA1xgDWeEn0=;
  b=R6B+5et7p+qyHnaq59M99wVQmg44Q1akyzM1YqKjxEqY0K7y9UiXU9f3
   1TVDEYEVTiMcrn84WkRmQvSE7dw5lQ0H2lZY4BHtVRMhCAZmpkB2lRybV
   hhHJNKHmoOdBkvtfRe+rgnHHEVoYdg6GraK7H/TVAvMktMW/Peuz47rzU
   FCp7oggBO0I5jz+6KhjkD9OsLQJhDV5a3+dk7uZbcgsTEaZ+pMuYlFaCE
   UwvHxi72MiAtCOrgwzyW+AUCXgVRXrLEu/q5GJJr0KjWjCre0uf/BrWv/
   DpYoIM1tZqyz4+rYtRhCu1CLFRjkQ/4REHx/X6TfqsCsqXIUCGtOSNND/
   w==;
X-CSE-ConnectionGUID: WFwW/OljSruKFnAsvttAcg==
X-CSE-MsgGUID: UUnxOJcZQGCFSceFd2wBpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="54234388"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="54234388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:30:35 -0700
X-CSE-ConnectionGUID: 352hPPzgSxey+NVSEw/EJw==
X-CSE-MsgGUID: X+La72HmS8Cjy95DrQwtNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="102252232"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:30:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 341F611F832;
	Fri, 18 Oct 2024 22:30:30 +0300 (EEST)
Date: Fri, 18 Oct 2024 19:30:30 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, prabhakar.csengg@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Refactor events
Message-ID: <ZxK3VsNdFjULfRxK@kekkonen.localdomain>
References: <20241018171104.1624426-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018171104.1624426-1-tomm.merciai@gmail.com>

Hi Tommaso,

Thanks for working on this.

On Fri, Oct 18, 2024 at 07:11:03PM +0200, Tommaso Merciai wrote:
> Controls can be exposed to userspace via a v4l-subdevX device, and
> userspace has to be able to subscribe to control events so that it is
> notified when the control changes value.
> If a control handler is set for the subdev then set the HAS_EVENTS
> flag automatically into v4l2_subdev_init_finalize() and use
> v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> as default if subdev don't have .(un)subscribe control operations.
> 
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 3a4ba08810d2..77ca829b9983 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -691,10 +691,25 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
>  
>  	case VIDIOC_SUBSCRIBE_EVENT:
> -		return v4l2_subdev_call(sd, core, subscribe_event, vfh, arg);
> +		if (v4l2_subdev_has_op(sd, core, subscribe_event))
> +			return v4l2_subdev_call(sd, core, subscribe_event,
> +						vfh, arg);
> +
> +		if ((sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS) &&
> +		     vfh->ctrl_handler)
> +			return v4l2_ctrl_subdev_subscribe_event(sd, vfh, arg);
> +
> +		return -ENOIOCTLCMD;

While this mostly does the same thing, I prefer the order of tests below.
Could you align event subscription with unsubscription?

>  
>  	case VIDIOC_UNSUBSCRIBE_EVENT:
> -		return v4l2_subdev_call(sd, core, unsubscribe_event, vfh, arg);
> +		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> +			return -ENOIOCTLCMD;
> +
> +		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
> +			return v4l2_subdev_call(sd, core, unsubscribe_event,
> +						vfh, arg);
> +
> +		return v4l2_event_subdev_unsubscribe(sd, vfh, arg);
>  
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>  	case VIDIOC_DBG_G_REGISTER:
> @@ -1641,6 +1656,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
>  		}
>  	}
>  
> +	if (sd->ctrl_handler)
> +		sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> +
>  	state = __v4l2_subdev_state_alloc(sd, name, key);
>  	if (IS_ERR(state))
>  		return PTR_ERR(state);

-- 
Kind regards,

Sakari Ailus

