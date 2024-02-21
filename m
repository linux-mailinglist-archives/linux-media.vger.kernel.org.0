Return-Path: <linux-media+bounces-5537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73B85D5CA
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 033B1282B55
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 10:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B4322095;
	Wed, 21 Feb 2024 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFL5o0MJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6854C87
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708512039; cv=none; b=uLJmhnxecjS/YA1z2mcbQGJ0wDsZiMf0rKi25ClEn4L/3tIE+gHANhrjFC6qAKbudT5/t+Xv1Xh/D11tZXVB3A6++jMDGxTNZ2ayKNxycFs9fJ0FMfOKn2XAwLFRD4HN8mm1dNqwzqxkrMDKR0mZSUwP7fcplakeXUnJpb04bcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708512039; c=relaxed/simple;
	bh=rhdmYaBh65YHIrcDvPBnqAPlqWFGCggwa9Kpz+k2r9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5Pm+QW47L299GK1W/DFU9Z3HXXCy5ZGtW7kgW8+nmKS6uJOUyxFCbIZ6w6uRTVUqxNXD9L1e0HynD8p1aQVkjl8wsBbjetOTP1CjWg5XCud+iqjzGu/9PDluwWJOsYecFhiOnWXGjFQH12De7pHjCTs3+1KQl7S/iZfdTCtE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFL5o0MJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708512038; x=1740048038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rhdmYaBh65YHIrcDvPBnqAPlqWFGCggwa9Kpz+k2r9c=;
  b=NFL5o0MJ+LVcbWgy9+Ye/01AYmRJJM9pYGXREfX0iXjnreaNaNbaq42D
   sQ2ppEZp1t0zTGWzA+IbppFod0B3HACYCTqc7iYbkbs80lcl5c6MHrNoX
   5SiYxavXmBmikHaLrasNKSF/8IESfBSUer7btDgNscBYb0uB3o1jL7Fib
   asNnMAmFXXebiTKwt54lkTxvEFOhElBMUsuVIuVoLtlkoq6PNy2Y6Gbnt
   iQ2R5ItYqOHFkTKdsQDvrKRzKXzfZe4APcIG3fhPb5ywrk7CyDCH11t2m
   uCr07ihsJnPbo/6KeDVChAafrrkSZ0xDVmb6ZGOwMHpIx7EDXgMHCut1T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="3143339"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="3143339"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="936623102"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="936623102"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:40:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C0BC11F855;
	Wed, 21 Feb 2024 12:40:33 +0200 (EET)
Date: Wed, 21 Feb 2024 10:40:33 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 17/29] media: v4l: Acquire a reference to the media
 device for every video device
Message-ID: <ZdXTIW1Gu4eyp7QA@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-18-sakari.ailus@linux.intel.com>
 <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>

Hi Hans,

Many thanks for reviewing these.

On Mon, Feb 05, 2024 at 03:56:22PM +0100, Hans Verkuil wrote:
> On 20/12/2023 11:37, Sakari Ailus wrote:
> > The video device depends on the existence of its media device --- if there
> > is one. Acquire a reference to it.
> > 
> > Note that when the media device release callback is used, then the V4L2
> > device release callback is ignored and a warning is issued if both are
> > set.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c | 51 ++++++++++++++++++++----------
> >  1 file changed, 34 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > index d13954bd31fd..c1e4995eaf5c 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
> >  {
> >  	struct video_device *vdev = to_video_device(cd);
> >  	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
> > +	bool v4l2_dev_has_release = v4l2_dev->release;
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +	struct media_device *mdev = v4l2_dev->mdev;
> > +	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
> > +#endif
> >  
> >  	mutex_lock(&videodev_lock);
> >  	if (WARN_ON(video_devices[vdev->minor] != vdev)) {
> > @@ -198,8 +203,8 @@ static void v4l2_device_release(struct device *cd)
> >  
> >  	mutex_unlock(&videodev_lock);
> >  
> > -#if defined(CONFIG_MEDIA_CONTROLLER)
> > -	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +	if (mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> >  		/* Remove interfaces and interface links */
> >  		media_devnode_remove(vdev->intf_devnode);
> >  		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
> > @@ -207,23 +212,31 @@ static void v4l2_device_release(struct device *cd)
> >  	}
> >  #endif
> >  
> > -	/* Do not call v4l2_device_put if there is no release callback set.
> > -	 * Drivers that have no v4l2_device release callback might free the
> > -	 * v4l2_dev instance in the video_device release callback below, so we
> > -	 * must perform this check here.
> > -	 *
> > -	 * TODO: In the long run all drivers that use v4l2_device should use the
> > -	 * v4l2_device release callback. This check will then be unnecessary.
> > -	 */
> > -	if (v4l2_dev->release == NULL)
> > -		v4l2_dev = NULL;
> > -
> >  	/* Release video_device and perform other
> >  	   cleanups as needed. */
> >  	vdev->release(vdev);
> >  
> > -	/* Decrease v4l2_device refcount */
> > -	if (v4l2_dev)
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +	if (mdev)
> > +		media_device_put(mdev);
> > +
> > +	/*
> > +	 * Generally both struct media_device and struct v4l2_device are
> > +	 * embedded in the same driver's context struct so having a release
> > +	 * callback in both is a bug.
> > +	 */
> > +	WARN_ON(v4l2_dev_has_release && mdev_has_release);
> 
> How about:
> 
> 	if (WARN_ON(v4l2_dev_has_release && mdev_has_release))
> 		v4l2_dev_has_release = false;
> 
> > +#endif
> > +
> > +	/*
> > +	 * Decrease v4l2_device refcount, but only if the media device doesn't
> > +	 * have a release callback.
> > +	 */
> > +	if (v4l2_dev_has_release
> > +#ifdef CONFIG_MEDIA_CONTROLLER
> > +	    && !mdev_has_release
> > +#endif
> > +	    )
> 
> Then this change is no longer needed.

Good idea.

I'll also rename v4l2_dev_has_release as v4l2_dev_call_release.

> 
> General question: do we have drivers today that set both release functions?
> Because that would now cause a WARN in the kernel log with this patch.

Indeed, the intention is to be vocal about it.

The only user of the v4l2_device release function I could find is
drivers/media/radio/dsbr100.c . I may have missed some but it certainly
isn't commonly used. Maybe we could try to drop refcounting from
v4l2_device later on?

> 
> >  		v4l2_device_put(v4l2_dev);
> >  }
> >  
> > @@ -792,11 +805,14 @@ static int video_register_media_controller(struct video_device *vdev)
> >  	u32 intf_type;
> >  	int ret;
> >  
> > -	/* Memory-to-memory devices are more complex and use
> > +	/*
> > +	 * Memory-to-memory devices are more complex and use
> >  	 * their own function to register its mc entities.
> >  	 */
> > -	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M)
> > +	if (!vdev->v4l2_dev->mdev || vdev->vfl_dir == VFL_DIR_M2M) {
> > +		media_device_get(vdev->v4l2_dev->mdev);
> >  		return 0;
> > +	}
> >  
> >  	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
> >  	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
> > @@ -875,6 +891,7 @@ static int video_register_media_controller(struct video_device *vdev)
> >  
> >  	/* FIXME: how to create the other interface links? */
> >  
> > +	media_device_get(vdev->v4l2_dev->mdev);
> >  #endif
> >  	return 0;
> >  }

-- 
Kind regards,

Sakari Ailus

