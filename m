Return-Path: <linux-media+bounces-4805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F084C94A
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 12:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E584E2822D3
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCC61864D;
	Wed,  7 Feb 2024 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t5N3ws56"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBEC1D529
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707304425; cv=none; b=ao4QMP4WBo6fRImjPx7mGyPyHPVZyyzK9Ueepfe3PP2+XveoW62Gc2ceFidOHodpBpy/8UYrOhvBmnF2Cnw8VeZkgpeHPo/s+ogP2oeEqNh66RgGt8g6g4M3vN0HMKe7WNh6Wk7E6+qhtd4w+hrNaUOiTNPhUZf5ctSdaTVp024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707304425; c=relaxed/simple;
	bh=Pvo99eG4UuY08DPmkK9E8XwAomfoSNnORgZhF4Zs5zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/B4z5NkpEruTqmKXGdIlSZ90YPqTewLOZcpNoDUzwVasG7Dv00Iz07D7jcPoLPF/Y+r6h6e9FCsTE7V3kbL0jGkC3eN9dLeHL27N86R3110tcpfQwmQ78D33/gVL4x48xvoGZe0vppSILzGk3GM1u3LGdAhZ6mcL2ZLzSovCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t5N3ws56; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE3AF975;
	Wed,  7 Feb 2024 12:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707304338;
	bh=Pvo99eG4UuY08DPmkK9E8XwAomfoSNnORgZhF4Zs5zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5N3ws56WYH9B2tgATdkogktYE8LYOpgaa/VYwFMOahhM6/20mePJRror+ro8jL+Z
	 OerC8bbmuy8aZC4xf8GTQPGIZk/WV7LWl+Ek5ZaLeDP4MPBM0HTBldi9nxbweT8jox
	 VG33aZhEOZAPuDTSXm9I39gu1Ud/XGsL2/Jx27HU=
Date: Wed, 7 Feb 2024 13:13:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 17/29] media: v4l: Acquire a reference to the media
 device for every video device
Message-ID: <20240207111344.GO23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-18-sakari.ailus@linux.intel.com>
 <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>

On Mon, Feb 05, 2024 at 03:56:22PM +0100, Hans Verkuil wrote:
> On 20/12/2023 11:37, Sakari Ailus wrote:
> > The video device depends on the existence of its media device --- if there
> > is one. Acquire a reference to it.
> > 
> > Note that when the media device release callback is used, then the V4L2
> > device release callback is ignored and a warning is issued if both are
> > set.

Why is that ? The two are distinct objects, why can't they both have a
release function ?

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
> 
> General question: do we have drivers today that set both release functions?
> Because that would now cause a WARN in the kernel log with this patch.
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

If you fix the comment style as a drive-by change, you could as well
reflow it to 80 columns.

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
Regards,

Laurent Pinchart

