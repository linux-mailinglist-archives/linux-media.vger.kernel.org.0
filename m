Return-Path: <linux-media+bounces-5555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B95685D757
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 779961C22558
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3054745C10;
	Wed, 21 Feb 2024 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBaq7D4N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A74501C
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515906; cv=none; b=tzeN6VZxyZ850nsOKcKP+XISZ+0kVg0uY5plb/9XXoUzluLiM+M4eOmG5wb8p+k56L1mDHGgPljJTedGVeVqHGmGzRMNb63en6HKmNQiXX3Zpfk8ZZuZO4qDDH4eNY5ICnPwfNSt59TSud/AtGPhf6H0DRIawoyMOiu7bdeu2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515906; c=relaxed/simple;
	bh=UuyTWymEG76nzoSyRlLARs8xzRTnBmRyLkB21XMMPDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8knwSyBqV7bDYI+po9ak/P+ZbtEh4cruUZY9zHp4SytRxhgn1LjBQ8cP9oUGRc3GPmz/ck4F371d3JKlCJ5sc0xc9ViQqx29gS/ozbYI96W8d6g+qjqdHJIPmAEiBVyyXoesEpuXlLrfdtVId4qxvZtB0N6G51pJJvAiA4pt4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBaq7D4N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708515906; x=1740051906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UuyTWymEG76nzoSyRlLARs8xzRTnBmRyLkB21XMMPDA=;
  b=bBaq7D4N2OLvI9fs7nOsaMV8E2gyge7yvdlJt+Ayma9hcPv3C6Sq/rV/
   SdfchlS4bAxEU9ftvueEylBynScRGl45Xk5N1EdtnFCvP/5esfN/0arOO
   gsSQf4dwBMK2maqwqZFpONZ9z4M5y3YpWFoevtZN0kk4lKjfKY8ZCRn0G
   5TNMqX6mO+sjak/4zahhYauO6++ZX/xsSWqIj9Nhzkbe4FLlJ/0ayFOyJ
   yWYynFs6rmI6A/x1Kz34quR6YT68KKL4NxTLI8izNGSiN/pvKt1fuS8h4
   JdYkwdGrvUfY4sAzomW2nze9/3L7uMHeDMowKnkbcrHSJa9kLjE+NNKeA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2542273"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2542273"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="936632980"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="936632980"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:45:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7194211F855;
	Wed, 21 Feb 2024 13:44:59 +0200 (EET)
Date: Wed, 21 Feb 2024 11:44:59 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 17/29] media: v4l: Acquire a reference to the media
 device for every video device
Message-ID: <ZdXiOxOxKi6U6Ayn@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-18-sakari.ailus@linux.intel.com>
 <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>
 <ZdXTIW1Gu4eyp7QA@kekkonen.localdomain>
 <3c72b7ce-1f9f-4622-be0c-706f2af0273b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c72b7ce-1f9f-4622-be0c-706f2af0273b@xs4all.nl>

Hi Hans,

On Wed, Feb 21, 2024 at 11:51:08AM +0100, Hans Verkuil wrote:
> On 21/02/2024 11:40, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Many thanks for reviewing these.
> > 
> > On Mon, Feb 05, 2024 at 03:56:22PM +0100, Hans Verkuil wrote:
> >> On 20/12/2023 11:37, Sakari Ailus wrote:
> >>> The video device depends on the existence of its media device --- if there
> >>> is one. Acquire a reference to it.
> >>>
> >>> Note that when the media device release callback is used, then the V4L2
> >>> device release callback is ignored and a warning is issued if both are
> >>> set.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-dev.c | 51 ++++++++++++++++++++----------
> >>>  1 file changed, 34 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> >>> index d13954bd31fd..c1e4995eaf5c 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-dev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> >>> @@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
> >>>  {
> >>>  	struct video_device *vdev = to_video_device(cd);
> >>>  	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
> >>> +	bool v4l2_dev_has_release = v4l2_dev->release;
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +	struct media_device *mdev = v4l2_dev->mdev;
> >>> +	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
> >>> +#endif
> >>>  
> >>>  	mutex_lock(&videodev_lock);
> >>>  	if (WARN_ON(video_devices[vdev->minor] != vdev)) {
> >>> @@ -198,8 +203,8 @@ static void v4l2_device_release(struct device *cd)
> >>>  
> >>>  	mutex_unlock(&videodev_lock);
> >>>  
> >>> -#if defined(CONFIG_MEDIA_CONTROLLER)
> >>> -	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +	if (mdev && vdev->vfl_dir != VFL_DIR_M2M) {
> >>>  		/* Remove interfaces and interface links */
> >>>  		media_devnode_remove(vdev->intf_devnode);
> >>>  		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
> >>> @@ -207,23 +212,31 @@ static void v4l2_device_release(struct device *cd)
> >>>  	}
> >>>  #endif
> >>>  
> >>> -	/* Do not call v4l2_device_put if there is no release callback set.
> >>> -	 * Drivers that have no v4l2_device release callback might free the
> >>> -	 * v4l2_dev instance in the video_device release callback below, so we
> >>> -	 * must perform this check here.
> >>> -	 *
> >>> -	 * TODO: In the long run all drivers that use v4l2_device should use the
> >>> -	 * v4l2_device release callback. This check will then be unnecessary.
> >>> -	 */
> >>> -	if (v4l2_dev->release == NULL)
> >>> -		v4l2_dev = NULL;
> >>> -
> >>>  	/* Release video_device and perform other
> >>>  	   cleanups as needed. */
> >>>  	vdev->release(vdev);
> >>>  
> >>> -	/* Decrease v4l2_device refcount */
> >>> -	if (v4l2_dev)
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +	if (mdev)
> >>> +		media_device_put(mdev);
> >>> +
> >>> +	/*
> >>> +	 * Generally both struct media_device and struct v4l2_device are
> >>> +	 * embedded in the same driver's context struct so having a release
> >>> +	 * callback in both is a bug.
> >>> +	 */
> >>> +	WARN_ON(v4l2_dev_has_release && mdev_has_release);
> >>
> >> How about:
> >>
> >> 	if (WARN_ON(v4l2_dev_has_release && mdev_has_release))
> >> 		v4l2_dev_has_release = false;
> >>
> >>> +#endif
> >>> +
> >>> +	/*
> >>> +	 * Decrease v4l2_device refcount, but only if the media device doesn't
> >>> +	 * have a release callback.
> >>> +	 */
> >>> +	if (v4l2_dev_has_release
> >>> +#ifdef CONFIG_MEDIA_CONTROLLER
> >>> +	    && !mdev_has_release
> >>> +#endif
> >>> +	    )
> >>
> >> Then this change is no longer needed.
> > 
> > Good idea.
> > 
> > I'll also rename v4l2_dev_has_release as v4l2_dev_call_release.
> > 
> >>
> >> General question: do we have drivers today that set both release functions?
> >> Because that would now cause a WARN in the kernel log with this patch.
> > 
> > Indeed, the intention is to be vocal about it.
> > 
> > The only user of the v4l2_device release function I could find is
> > drivers/media/radio/dsbr100.c . I may have missed some but it certainly
> > isn't commonly used. Maybe we could try to drop refcounting from
> > v4l2_device later on?
> 
> There are a lot more drivers that use this. A quick grep shows gspca, hackrf,
> usbtv, pwc, au0828 and more.
> 
> git grep v4l2_dev.*release.*= drivers/media/
> 
> Currently it is the only way to properly release drivers that create multiple
> video (or other) devices.

I mistakenly grepped for ->release, .release is actually more common. I'll
check how this is currently being used.

-- 
Regards,

Sakari Ailus

