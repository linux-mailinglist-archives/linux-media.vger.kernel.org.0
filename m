Return-Path: <linux-media+bounces-5559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD8085D795
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 13:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566CC283EC3
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2247E4D11B;
	Wed, 21 Feb 2024 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfZDZAV3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9309B3FE2B
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708516982; cv=none; b=c5CWTHy2vN8Ce1s/qKNO5ernLeX4cMYoqkmv4OTmiReSsWreFPJ1Z5uwkcJ999Imk43Y6bBViWmmutXVCrLmajk9lJO+XcHTLLwiF0kjHsvuzTH/z2s0tNZDDe73ZJqBqTEDxBeIQ9+9z+pBnGN7+RG4vDQKpk0nWaH8+NFHnfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708516982; c=relaxed/simple;
	bh=LwxOulIjAqhtPFfTnvjdbQ5D00Ti7AZ4XReVsjvXLrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFJvqQAZcfJyUB0x0jB9KsAODqPDl4UgsacE6yEpZ2KJljsWVUNb/iGHG4VTbb7P26f3YM1QWDlCzFZkJAn7bt0HCigbWFC8kIfj46HNOvykc4mz3Y26atzHEHL4/iil2BwrHd41kyXbJ041RG6SI3eaRSSlIzTmvj0T1VMSwRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfZDZAV3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708516981; x=1740052981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LwxOulIjAqhtPFfTnvjdbQ5D00Ti7AZ4XReVsjvXLrE=;
  b=JfZDZAV31AdLiUUYedWUKzZwelPzikYdM6mb8oG6J6vdE7S2DV6+qpz2
   KT2gsBrWDGDYLmv7WNw4HS73sT55ULeXccpUSJQom049HtImhxWfCPlgR
   4QyCbXrOkO8pjbBgkddWl0tlZ7V3lAA4vfJGkZM4JrusZZoTwUOwkKKz7
   MI8EWvqRoiwX+g5AeblwlOIASzGkn+08HjBI3dE04hTtXOmSMSemvOUGb
   KwfYUS+yUadIVKJxJCTUB3DZtEAvlAgumWEsydfP+vX3EfYwlR0SwzxJu
   9cAaJttlSGngacBjzTlxJu+DEnCDJIKRKoz2av1cou8yZ4zTyoPeyZEFU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5626746"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5626746"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 04:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9704767"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 04:02:58 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3ED4411F855;
	Wed, 21 Feb 2024 14:02:56 +0200 (EET)
Date: Wed, 21 Feb 2024 12:02:56 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 23/29] media: vimc: Release resources on media device
 release
Message-ID: <ZdXmcFYD0kt5Ro_c@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-24-sakari.ailus@linux.intel.com>
 <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>
 <ZdXWN4wPqT7XdK7K@kekkonen.localdomain>
 <77c003ad-a841-40ae-8f15-58fd6e0e22ff@xs4all.nl>
 <ZdXhGAmJhzQcXbN2@kekkonen.localdomain>
 <e0014623-aac2-41f5-9102-196caaddc582@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0014623-aac2-41f5-9102-196caaddc582@xs4all.nl>

Hi Hans,

On Wed, Feb 21, 2024 at 12:48:51PM +0100, Hans Verkuil wrote:
> On 21/02/2024 12:40, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Wed, Feb 21, 2024 at 12:19:21PM +0100, Hans Verkuil wrote:
> >> On 21/02/2024 11:53, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Mon, Feb 05, 2024 at 04:02:24PM +0100, Hans Verkuil wrote:
> >>>> On 20/12/2023 11:37, Sakari Ailus wrote:
> >>>>> Release all the resources when the media device is related, moving away
> >>>
> >>> s/related/released/
> >>>
> >>>>> form the struct v4l2_device used for that purpose.
> >>>>
> >>>> form -> from
> >>>
> >>> Yes.
> >>>
> >>>>
> >>>>>
> >>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>>> ---
> >>>>>  drivers/media/test-drivers/vimc/vimc-core.c | 15 +++++++++------
> >>>>>  1 file changed, 9 insertions(+), 6 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> >>>>> index af127476e920..3e59f8c256c7 100644
> >>>>> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> >>>>> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> >>>>> @@ -264,13 +264,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
> >>>>>  	return 0;
> >>>>>  }
> >>>>>  
> >>>>> -static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> >>>>> +static void vimc_mdev_release(struct media_device *mdev)
> >>>>>  {
> >>>>>  	struct vimc_device *vimc =
> >>>>> -		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
> >>>>> +		container_of_const(mdev, struct vimc_device, mdev);
> >>>>
> >>>> Why this change?
> >>>
> >>> I changed the line already. There's no reason to continue using
> >>> container_of() instead of container_of_const() that takes const-ness into
> >>> account, too.
> >>
> >> But neither vimc nor mdev can be const anyway, that would make no sense
> >> here.
> > 
> > Neither is const, true. Yet container_of_const() is preferred over
> 
> Says who?

container_of() documentation comes with a big, fat warning on this issue.

I can post a patch to add an explicit recommentation, too.

> 
> It makes sense in generic defines that use it, e.g.:
> 
> drivers/base/firmware_loader/sysfs.h:#define to_fw_sysfs(__dev) container_of_const(__dev, struct fw_sysfs, dev)
> 
> That way it can handle both const and non-const __dev pointers.
> 
> In cases where this doesn't come into play I think there is no need to
> make code changes. Perhaps when writing new code it might make sense to
> use it, but changing it in existing code, esp. as part of a patch that
> deals with something else entirely, seems just unnecessary churn.
> 
> I won't block this, but I recommend just dropping this change in this patch.

-- 
Regards,

Sakari Ailus

