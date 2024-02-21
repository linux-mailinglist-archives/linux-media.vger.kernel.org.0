Return-Path: <linux-media+bounces-5539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C1C85D5EA
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69DB61C21872
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 10:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9444376E2;
	Wed, 21 Feb 2024 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayyJ2gz5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9582E3EB
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708512236; cv=none; b=DmuiUtlMLBAiOx10zCvURrRpNJLIan/Vuy0lXJYoUlJygGhVnzr849JHvDnBHW634qSHnzbUYOQKyAJBi6iMGoAaYN/6ZV1WosKVsIvhsQRSTuiwjCQeCDOj5zBqtHb0uOPTcypSlk+rC1xPawr38KcQQzfAmYV30JL4l/IcXds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708512236; c=relaxed/simple;
	bh=J+I89HA5K+Pv46OoDbeTlA2G/ry8EkmeAVxqfZ7UxYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5k3Pt8zTTAsnBc82NX8SDGOJztGsiP+KK6sNdRC2Z/pnh86LC+hsmbigA2qrwgnszcdaXaSsnf9Hw3JtcFpPvmgoem002mVyYROV813Jna9q9Tojc+j7kCLL7XaNKKw+LZ2kEh7wt+5yfQOqFHBxuPC0Zb89jYwKCgO3Cmorb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayyJ2gz5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708512234; x=1740048234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+I89HA5K+Pv46OoDbeTlA2G/ry8EkmeAVxqfZ7UxYo=;
  b=ayyJ2gz5pyMOy7Uo2o6beuqh+kAoqH5Hch9sMuW+8XOkbEbPPwwDury0
   Rxrw9Qf+cuSt9iPNGPAEI/eAjfxJRWZ3j2Vy60+1oJdL1MnQEdEtugKEv
   3e5Zt28RSipS2koAjB0JWTZakWvlN0RFRPoI1miA9zXvNZCAKkZpITdWA
   nl43lFfRgoZH9CgRUA4q+MMC3iSgjYV7Zp9zCbsr6OJfi8doflLsJVG1B
   13R6opIb1eTE3fvKlI4Xyh22cmgWc0ibHHOa4s2RS0XK11dKOmdQMZCEZ
   xB2PbgYmKSYD6U41tX1GzZllcwGkPa01eXCLKBZ52kbjY1dKYJ9BB/z0v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2802138"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2802138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:43:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5313408"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:43:50 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CC5CF11F855;
	Wed, 21 Feb 2024 12:43:47 +0200 (EET)
Date: Wed, 21 Feb 2024 10:43:47 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 17/29] media: v4l: Acquire a reference to the media
 device for every video device
Message-ID: <ZdXT43Fn8x2W5he-@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-18-sakari.ailus@linux.intel.com>
 <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>
 <20240207111344.GO23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207111344.GO23702@pendragon.ideasonboard.com>

Hi Laurent,

Thank you for reviewing the set!

On Wed, Feb 07, 2024 at 01:13:44PM +0200, Laurent Pinchart wrote:
> On Mon, Feb 05, 2024 at 03:56:22PM +0100, Hans Verkuil wrote:
> > On 20/12/2023 11:37, Sakari Ailus wrote:
> > > The video device depends on the existence of its media device --- if there
> > > is one. Acquire a reference to it.
> > > 
> > > Note that when the media device release callback is used, then the V4L2
> > > device release callback is ignored and a warning is issued if both are
> > > set.
> 
> Why is that ? The two are distinct objects, why can't they both have a
> release function ?

You could, in principle, but in practice both of the structs are part of
the same driver's device context struct which is a single allocation. You
can only have a single release callback for it.

> 
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-dev.c | 51 ++++++++++++++++++++----------
> > >  1 file changed, 34 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > > index d13954bd31fd..c1e4995eaf5c 100644
> > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > @@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
> > >  {
> > >  	struct video_device *vdev = to_video_device(cd);
> > >  	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
> > > +	bool v4l2_dev_has_release = v4l2_dev->release;
> > > +#ifdef CONFIG_MEDIA_CONTROLLER
> > > +	struct media_device *mdev = v4l2_dev->mdev;
> > > +	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
> > > +#endif
> > >  
> > >  	mutex_lock(&videodev_lock);
> > >  	if (WARN_ON(video_devices[vdev->minor] != vdev)) {
> > > @@ -198,8 +203,8 @@ static void v4l2_device_release(struct device *cd)
> > >  
> > >  	mutex_unlock(&videodev_lock);
> > >  
> > > -#if defined(CONFIG_MEDIA_CONTROLLER)
> > > -	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> > > +#ifdef CONFIG_MEDIA_CONTROLLER
> > > +	if (mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> > >  		/* Remove interfaces and interface links */
> > >  		media_devnode_remove(vdev->intf_devnode);
> > >  		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
> > > @@ -207,23 +212,31 @@ static void v4l2_device_release(struct device *cd)
> > >  	}
> > >  #endif
> > >  
> > > -	/* Do not call v4l2_device_put if there is no release callback set.
> > > -	 * Drivers that have no v4l2_device release callback might free the
> > > -	 * v4l2_dev instance in the video_device release callback below, so we
> > > -	 * must perform this check here.
> > > -	 *
> > > -	 * TODO: In the long run all drivers that use v4l2_device should use the
> > > -	 * v4l2_device release callback. This check will then be unnecessary.
> > > -	 */
> > > -	if (v4l2_dev->release == NULL)
> > > -		v4l2_dev = NULL;
> > > -
> > >  	/* Release video_device and perform other
> > >  	   cleanups as needed. */
> > >  	vdev->release(vdev);
> > >  
> > > -	/* Decrease v4l2_device refcount */
> > > -	if (v4l2_dev)
> > > +#ifdef CONFIG_MEDIA_CONTROLLER
> > > +	if (mdev)
> > > +		media_device_put(mdev);
> > > +
> > > +	/*
> > > +	 * Generally both struct media_device and struct v4l2_device are
> > > +	 * embedded in the same driver's context struct so having a release
> > > +	 * callback in both is a bug.
> > > +	 */
> > > +	WARN_ON(v4l2_dev_has_release && mdev_has_release);
> > 
> > How about:
> > 
> > 	if (WARN_ON(v4l2_dev_has_release && mdev_has_release))
> > 		v4l2_dev_has_release = false;
> > 
> > > +#endif
> > > +
> > > +	/*
> > > +	 * Decrease v4l2_device refcount, but only if the media device doesn't
> > > +	 * have a release callback.
> > > +	 */
> > > +	if (v4l2_dev_has_release
> > > +#ifdef CONFIG_MEDIA_CONTROLLER
> > > +	    && !mdev_has_release
> > > +#endif
> > > +	    )
> > 
> > Then this change is no longer needed.
> > 
> > General question: do we have drivers today that set both release functions?
> > Because that would now cause a WARN in the kernel log with this patch.
> > 
> > >  		v4l2_device_put(v4l2_dev);
> > >  }
> > >  
> > > @@ -792,11 +805,14 @@ static int video_register_media_controller(struct video_device *vdev)
> > >  	u32 intf_type;
> > >  	int ret;
> > >  
> > > -	/* Memory-to-memory devices are more complex and use
> > > +	/*
> > > +	 * Memory-to-memory devices are more complex and use
> > >  	 * their own function to register its mc entities.
> 
> If you fix the comment style as a drive-by change, you could as well
> reflow it to 80 columns.

I'll update this for the next version.

> 
> > >  	 */
> > > -	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M)
> > > +	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M) {
> > > +		media_device_get(vdev->v4l2_dev->mdev);
> > >  		return 0;
> > > +	}
> > >  
> > >  	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
> > >  	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
> > > @@ -875,6 +891,7 @@ static int video_register_media_controller(struct video_device *vdev)
> > >  
> > >  	/* FIXME: how to create the other interface links? */
> > >  
> > > +	media_device_get(vdev->v4l2_dev->mdev);
> > >  #endif
> > >  	return 0;
> > >  }
> 

-- 
Regards,

Sakari Ailus

