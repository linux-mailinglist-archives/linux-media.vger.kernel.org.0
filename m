Return-Path: <linux-media+bounces-6408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BC187172E
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 08:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F98F285F10
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 07:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF2B7E787;
	Tue,  5 Mar 2024 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOc2M4ni"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ABA7E0E8
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709624619; cv=none; b=KFHLnzkn3hKWxUbqQQ3xiVMwT5sUiedykDJtq68OeWCzKsYxJ/VjMAvX0p0l6Q+6H9H1ko4wjM6gkKa44g+d2j5yXSgfspGxsVuiZrNjAydTxslen3DCX45bikeltTgaDjz62fCtckjc/MzBuBdrs2FlXNSRV4d0yT5j11PIZ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709624619; c=relaxed/simple;
	bh=8pv9rSbU2AvXCVWf99MYuJXnMKHzd+R2alpmu0dKZ9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miLlRvz36IwxrMnTJxumqQ1LF0rrP5a+VD2++fkuvI0PNRYVqgItANIuuRfQ4uH8T3xskz4xnbUtumC4XW5QZ+ntBwW8puVQCnju0CHd2C+XUVEZ1R3dKM2vBeO2nnoX2bVlgFCG5QRpigXKsYHi+t9HuidSP0/Rrne4EkQbxzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOc2M4ni; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709624617; x=1741160617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8pv9rSbU2AvXCVWf99MYuJXnMKHzd+R2alpmu0dKZ9Y=;
  b=ZOc2M4niz7JpDm2vkL68JRfJxpOCood/1X4300aO0URuekhEjT/kVJNP
   u7Kx863lCzAiUMFiSIqYW9tRTR3A1XItm67btfTJVVHd6XdIp/eUdBLyA
   GX1opD8XD1Ylu1A6+Krl16tWN3sZSVtEX7L8L7C+WPdEhrISUCExcBwez
   a8BzcUHkA+INOJ2XPEjb9AsnhoBS+9ew+CdRgreXBszuJA7K2bTqpqVgh
   7XIO/sbls2Q07/NXgpNO/AsNsvRQSuQJpCtb0vhWDpNlG4bE5lTniQYIk
   m6KmYfAUCu6Sf8bjeRzsVG2KXhpUCh1qvxGwr63dQ4QXK/Xv0L4wxdf38
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14802752"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14802752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 23:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9251034"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 23:43:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9A5FD11F871;
	Tue,  5 Mar 2024 09:43:32 +0200 (EET)
Date: Tue, 5 Mar 2024 07:43:32 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 17/29] media: v4l: Acquire a reference to the media
 device for every video device
Message-ID: <ZebNJK7TMcBJVLv6@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-18-sakari.ailus@linux.intel.com>
 <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>
 <ZdXTIW1Gu4eyp7QA@kekkonen.localdomain>
 <3c72b7ce-1f9f-4622-be0c-706f2af0273b@xs4all.nl>
 <ZdXiOxOxKi6U6Ayn@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdXiOxOxKi6U6Ayn@kekkonen.localdomain>

Hi Hans,

On Wed, Feb 21, 2024 at 11:44:59AM +0000, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Feb 21, 2024 at 11:51:08AM +0100, Hans Verkuil wrote:
> > On 21/02/2024 11:40, Sakari Ailus wrote:
> > > Hi Hans,
> > > 
> > > Many thanks for reviewing these.
> > > 
> > > On Mon, Feb 05, 2024 at 03:56:22PM +0100, Hans Verkuil wrote:
> > >> On 20/12/2023 11:37, Sakari Ailus wrote:
> > >>> The video device depends on the existence of its media device --- if there
> > >>> is one. Acquire a reference to it.
> > >>>
> > >>> Note that when the media device release callback is used, then the V4L2
> > >>> device release callback is ignored and a warning is issued if both are
> > >>> set.
> > >>>
> > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>> ---
> > >>>  drivers/media/v4l2-core/v4l2-dev.c | 51 ++++++++++++++++++++----------
> > >>>  1 file changed, 34 insertions(+), 17 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> > >>> index d13954bd31fd..c1e4995eaf5c 100644
> > >>> --- a/drivers/media/v4l2-core/v4l2-dev.c
> > >>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > >>> @@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
> > >>>  {
> > >>>  	struct video_device *vdev = to_video_device(cd);
> > >>>  	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
> > >>> +	bool v4l2_dev_has_release = v4l2_dev->release;
> > >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> > >>> +	struct media_device *mdev = v4l2_dev->mdev;
> > >>> +	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
> > >>> +#endif
> > >>>  
> > >>>  	mutex_lock(&videodev_lock);
> > >>>  	if (WARN_ON(video_devices[vdev->minor] != vdev)) {
> > >>> @@ -198,8 +203,8 @@ static void v4l2_device_release(struct device *cd)
> > >>>  
> > >>>  	mutex_unlock(&videodev_lock);
> > >>>  
> > >>> -#if defined(CONFIG_MEDIA_CONTROLLER)
> > >>> -	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> > >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> > >>> +	if (mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> > >>>  		/* Remove interfaces and interface links */
> > >>>  		media_devnode_remove(vdev->intf_devnode);
> > >>>  		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
> > >>> @@ -207,23 +212,31 @@ static void v4l2_device_release(struct device *cd)
> > >>>  	}
> > >>>  #endif
> > >>>  
> > >>> -	/* Do not call v4l2_device_put if there is no release callback set.
> > >>> -	 * Drivers that have no v4l2_device release callback might free the
> > >>> -	 * v4l2_dev instance in the video_device release callback below, so we
> > >>> -	 * must perform this check here.
> > >>> -	 *
> > >>> -	 * TODO: In the long run all drivers that use v4l2_device should use the
> > >>> -	 * v4l2_device release callback. This check will then be unnecessary.
> > >>> -	 */
> > >>> -	if (v4l2_dev->release == NULL)
> > >>> -		v4l2_dev = NULL;
> > >>> -
> > >>>  	/* Release video_device and perform other
> > >>>  	   cleanups as needed. */
> > >>>  	vdev->release(vdev);
> > >>>  
> > >>> -	/* Decrease v4l2_device refcount */
> > >>> -	if (v4l2_dev)
> > >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> > >>> +	if (mdev)
> > >>> +		media_device_put(mdev);
> > >>> +
> > >>> +	/*
> > >>> +	 * Generally both struct media_device and struct v4l2_device are
> > >>> +	 * embedded in the same driver's context struct so having a release
> > >>> +	 * callback in both is a bug.
> > >>> +	 */
> > >>> +	WARN_ON(v4l2_dev_has_release && mdev_has_release);
> > >>
> > >> How about:
> > >>
> > >> 	if (WARN_ON(v4l2_dev_has_release && mdev_has_release))
> > >> 		v4l2_dev_has_release = false;
> > >>
> > >>> +#endif
> > >>> +
> > >>> +	/*
> > >>> +	 * Decrease v4l2_device refcount, but only if the media device doesn't
> > >>> +	 * have a release callback.
> > >>> +	 */
> > >>> +	if (v4l2_dev_has_release
> > >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> > >>> +	    && !mdev_has_release
> > >>> +#endif
> > >>> +	    )
> > >>
> > >> Then this change is no longer needed.
> > > 
> > > Good idea.
> > > 
> > > I'll also rename v4l2_dev_has_release as v4l2_dev_call_release.
> > > 
> > >>
> > >> General question: do we have drivers today that set both release functions?
> > >> Because that would now cause a WARN in the kernel log with this patch.
> > > 
> > > Indeed, the intention is to be vocal about it.
> > > 
> > > The only user of the v4l2_device release function I could find is
> > > drivers/media/radio/dsbr100.c . I may have missed some but it certainly
> > > isn't commonly used. Maybe we could try to drop refcounting from
> > > v4l2_device later on?
> > 
> > There are a lot more drivers that use this. A quick grep shows gspca, hackrf,
> > usbtv, pwc, au0828 and more.
> > 
> > git grep v4l2_dev.*release.*= drivers/media/
> > 
> > Currently it is the only way to properly release drivers that create multiple
> > video (or other) devices.
> 
> I mistakenly grepped for ->release, .release is actually more common. I'll
> check how this is currently being used.

Getting back to the topic---indeed the V4L2 device release function is used
by a number of drivers today. Moving to the Media device release function
is no small task: I checked some drivers and while releasing the resources
is centralised in this case, unregistering the interfaces and releasing
actual resources may be intertwined so that fixing this requires reworking
much of the driver code. It's better to leave this for driver authors or at
least someone who has the hardware.

-- 
Sakari Ailus

