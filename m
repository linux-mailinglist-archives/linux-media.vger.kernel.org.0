Return-Path: <linux-media+bounces-13413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7590AACC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 093901F23884
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79724194092;
	Mon, 17 Jun 2024 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xoh9O1g/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD610799
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618978; cv=none; b=QKZXyTZrRd2fsvyGaF8Ll0xHqFkx5yVftFYa7zaM9khssN0baZRK63aHHYPPRXGQKRqHOMtWBdoXxGDbzR4xRQ0k41FSbivvkoR1Mf16UTqOzg89JafbkmKjsx5yLp9OuqFxXZ4sKdGIZjNrrexaf12HoU17g27WS8z+djdJzwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618978; c=relaxed/simple;
	bh=abXbalBwk1bAskMNTjj2kM5zTlGBm3tx7/ix4cyjFtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PclQYLqRv3i30fIkAcNb9jcbfKGU71Vhmo5XanUwYg/H5zkA/j7R9eJ5BLTMSUXtN7zQjvXk/MIx+7W0BiXydXXRK7OLqEWk4z5nGFylygYK2ty96BcxPKD8DDtFurUuFvlqrjFm37Swa9tVGCcUWdu7deGXvo1IWFXVlbTBSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xoh9O1g/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718618977; x=1750154977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=abXbalBwk1bAskMNTjj2kM5zTlGBm3tx7/ix4cyjFtI=;
  b=Xoh9O1g/zlsXI1+oyZpO8VVklCATE58v0JMPnEvIErptoNW3EVSrs4wO
   emFL7NYqbq/OFeZaSmhFVmmwduDFF9t2rrWMbOMVUG6Ya+W1+lSpf4JFG
   f2CZwQoYE9xv9FymbIXiLfCCCboViTcy1jQF8Pzqir/L0aXHdnW+L7M/8
   OQb9DUsWbVzcMvoKwYJ6ZwqvwZomau6fMZwsH83E9t6tR7ZtioyV+lf/9
   STKdJfVarqmN3iD17WcgspznXEDKtlm53SOIsvP8AW4ZwcOJTybeVhu5T
   GK0gUBkP6PMB8CAIQP1wy9/bfYPHErn8j+DSF2Z2l2NHdvsvoJMNDiDa0
   A==;
X-CSE-ConnectionGUID: 7PHC9dCLQT2kx0c/x8gexQ==
X-CSE-MsgGUID: /pit8KiYTMe857FruXFPiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15208432"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15208432"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 03:09:36 -0700
X-CSE-ConnectionGUID: gDThXDRPRXWa0ls7yaAMwg==
X-CSE-MsgGUID: W+LfE2w7SF64ejNwET4tYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46081898"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 03:09:36 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 165D411F7E1;
	Mon, 17 Jun 2024 13:09:33 +0300 (EEST)
Date: Mon, 17 Jun 2024 10:09:33 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 19/26] media: vimc: Release resources on media device
 release
Message-ID: <ZnALXQw1bcnR07NO@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-20-sakari.ailus@linux.intel.com>
 <a7be89a1-3049-4513-bb58-e372138c7f81@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7be89a1-3049-4513-bb58-e372138c7f81@xs4all.nl>

Hi Hans,

Thank you for the review.

On Mon, Jun 17, 2024 at 11:49:54AM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > Release all the resources when the media device is released, moving away
> > from the struct v4l2_device used for that purpose. This is done to
> > exemplify the use of the media device's release callback.
> > 
> > Switch to container_of_const(), too, while we're changing the code anyway.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/test-drivers/vimc/vimc-core.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> > index af127476e920..3e59f8c256c7 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-core.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> > @@ -264,13 +264,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
> >  	return 0;
> >  }
> >  
> > -static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> > +static void vimc_mdev_release(struct media_device *mdev)
> >  {
> >  	struct vimc_device *vimc =
> > -		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
> > +		container_of_const(mdev, struct vimc_device, mdev);
> 
> Please don't mix this in. It makes no sense here since vimc is never
> const. Such a change doesn't belong in this series. So just leave it
> at container_of and update the commit log.

Ok, I can remove it.

I also posted a patch to address the matter in container_of()
documentation. Let's see.

> 
> With that change you can add my:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thank you!

-- 
Kind regards,

Sakari Ailus

