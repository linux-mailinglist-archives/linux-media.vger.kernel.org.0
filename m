Return-Path: <linux-media+bounces-18521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A0984A38
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 19:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AEC8B2138E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 17:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3F51AC427;
	Tue, 24 Sep 2024 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kbrpGWm2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A892E419;
	Tue, 24 Sep 2024 17:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727198295; cv=none; b=mA7sS1n8c/BS7rsUuvogYYgyKjvAM0aZh3O2bvCbLgmFFYnK2+n7fStplkM2sa0kfsliSN3uT4A6+b7p4h2hyfMhgMbMDnH/IHZlSFxfmo7GcIq3i2nqedQ/OiIubdj9wPn71cOAmtTS88a7Xpl33ROYfulAK1OYBL8GtbpfZ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727198295; c=relaxed/simple;
	bh=SDh/w9bYOwefz7vHc6h1SwrveHXcT778HDAlVUqm8NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJrGUhVBf0Cb+TOy03yrqByspOkPAgTaJhCWy0SuThL7Mhy8WkBjC/R0Url79T1ZYCqq5NJsNGT+JtH/L72ScWJ2JfcSWXwDqdzeIbW+SdtC60sUlIodvV3TzyE6yc9Qx7JqkYQ8lU3BXAXpzRbdctbcVIur1dzcX8psBoTA+og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kbrpGWm2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 090B719BA;
	Tue, 24 Sep 2024 19:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727198202;
	bh=SDh/w9bYOwefz7vHc6h1SwrveHXcT778HDAlVUqm8NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbrpGWm2C3eLPF/4upHVSAiEaLjx9FeY7fwYC/vIXZJvsY9NSOFOASb5EgvjOBkO2
	 uR+ekoGYYdJAP+5ML8I9sb65FZuss09drV6f+wqenx5H4sUexHkMs4X354Au7j+Mvl
	 mFcyubbPes5HkZTBXY9pBNO+ix8Al7Sz00Leq9qo=
Date: Tue, 24 Sep 2024 20:17:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/4] media: v4l2-subdev: Add cleanup macros for active
 state
Message-ID: <20240924171736.GE30551@pendragon.ideasonboard.com>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
 <20240917-scoped-state-v1-1-b8ba3fbe5952@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917-scoped-state-v1-1-b8ba3fbe5952@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Sep 17, 2024 at 05:09:29PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add cleanup macros for active state. These can be used to call
> v4l2_subdev_lock_and_get_active_state() and manage the unlocking either
> in unscoped or scoped fashion:
> 
> This locks the state, gets it to the 'state' variable, and unlocks when
> exiting the surrounding scope:
> 
> CLASS(v4l2_subdev_lock_and_get_active_state, state)(subdev);
> 
> This does the same, but inside the given scope:
> 
> scoped_v4l2_subdev_lock_and_get_active_state(subdev) {
> }
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index bd235d325ff9..699007cfffd7 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -8,6 +8,7 @@
>  #ifndef _V4L2_SUBDEV_H
>  #define _V4L2_SUBDEV_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/types.h>
>  #include <linux/v4l2-subdev.h>
>  #include <media/media-entity.h>
> @@ -1854,6 +1855,15 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>  	return sd->active_state;
>  }
>  
> +DEFINE_CLASS(v4l2_subdev_lock_and_get_active_state, struct v4l2_subdev_state *,
> +	     v4l2_subdev_unlock_state(_T),
> +	     v4l2_subdev_lock_and_get_active_state(sd), struct v4l2_subdev *sd);
> +
> +#define scoped_v4l2_subdev_lock_and_get_active_state(sd)              \
> +	for (CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd), \
> +	     *done = NULL;                                            \
> +	     !done; done = (void *)1)

That a very long name :-S Could this be done using the scoped_guard()
macro instead ? For instance, with spinlocks you can do

	scoped_guard(spinlock_irqsave, &dev->lock) {
		...
	}

It would be nice to be able to write

	scoped_guard(v4l2_subdev_state, sd) {
		...
	}

This being said, we would then end up with the state variable being
named scope, which wouldn't be great.

This is actually one of my issues with the above macros, and especially
scoped_v4l2_subdev_lock_and_get_active_state(). It creates a local state
variable in the scope, which makes the code less readable in my opinion.

We could keep the class and drop
scoped_v4l2_subdev_lock_and_get_active_state(). I think I would like to
shorten the class name then.

Another option is to use DEFINE_FREE() and __free() instead.

> +
>  /**
>   * v4l2_subdev_init - initializes the sub-device struct
>   *
> 

-- 
Regards,

Laurent Pinchart

