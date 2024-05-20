Return-Path: <linux-media+bounces-11634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 974E48C993F
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 09:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9321C20DA0
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 07:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BF21B7F4;
	Mon, 20 May 2024 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/HHQ3u6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1EBE576;
	Mon, 20 May 2024 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716190004; cv=none; b=USZXlbyJAwbHBkQ1eNDclDg5YuNXs1799HJHENKHwpC731hdaUyrKX59Ei8DDbSKWUrVSGEdisSDGI9+S+xZlFfhW5JmnfG2W5POMdUUMletTrqSmGcBcKUVJLpBQPV/+VbkDZSywtWDMpED6yOg7UwLQ2CqpXU3Mdj/2Sd1YWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716190004; c=relaxed/simple;
	bh=apBE2pTbmBbFcYHimRdQ1kpi82s9fT1HcMCWf4b0aEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDGhEJhJ2QIyAyLkuIE7crfXRcGWdKbDJGRvxOsxWdaL9g+snRJ8OAqsz1DmDs6p+3IoafxThWUCN+hydJu1oIA8RG09pIiBzfJiyV5UB7pakGgJ8Cd3zRau9Gev6EkFpGoEU6TUGL0WL2Bf/7gf36qOkQPsecEFQKKc5rZ8UAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/HHQ3u6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716190003; x=1747726003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=apBE2pTbmBbFcYHimRdQ1kpi82s9fT1HcMCWf4b0aEI=;
  b=X/HHQ3u6ahe+4VjxqWoNiLfKrT7JayQ3arUPXs/0ZjqLiyBtrB0hq5U8
   gDyPnZWGq2c1LCo8iAdAkETiNIkpMyE8Hd8rHva2EG8J/gLfXAsTUzLnE
   nGljNunsALH+DlEjjIMRHJiCQ572NtlXUXeu4OczYa/iXdgDeYfPoRJeo
   dDELvN2Iyfhe3vlb6heCXiUlbkVz9EIrmL3C5NA0xKc/nud21mGdkU01v
   cNNOATssaEzkoZEHXukXYd61agZV0Ii+vmYKlbAT4PLXf4qq2QvJHX4ro
   h3sZBwchKWdXETXGY6fW7iVm39hVzAQ42KTqyIG6ECyXGs5vaOxyno3Zn
   g==;
X-CSE-ConnectionGUID: HMneAFPqRfOGhvHCvpFo8Q==
X-CSE-MsgGUID: 0Sz67SRvQXCOkEF6QKCUNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12100355"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12100355"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 00:26:42 -0700
X-CSE-ConnectionGUID: ONgvNaJqSMaQjEBmnKevgw==
X-CSE-MsgGUID: pYprwVBRT9COeBcLng1LZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32578989"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 00:26:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D66D511F82A;
	Mon, 20 May 2024 10:26:37 +0300 (EEST)
Date: Mon, 20 May 2024 07:26:37 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ChiYuan Huang <cy_huang@richtek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix NULL pointer when v4l2 flash
 subdev binding
Message-ID: <Zkr7Lco5_0RLTQ4h@kekkonen.localdomain>
References: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>
 <ZkXi_U5Js34dUQsA@kekkonen.localdomain>
 <20240517063150.GA12245@linuxcarl2.richtek.com>
 <ZkcOoLQQRdRYYacd@kekkonen.localdomain>
 <20240517111944.GD19755@pendragon.ideasonboard.com>
 <Zkc_ENTqovMg_WnD@kekkonen.localdomain>
 <20240517113730.GF19755@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517113730.GF19755@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, May 17, 2024 at 02:37:30PM +0300, Laurent Pinchart wrote:
> On Fri, May 17, 2024 at 11:27:12AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Fri, May 17, 2024 at 02:19:44PM +0300, Laurent Pinchart wrote:
> > > On Fri, May 17, 2024 at 08:00:32AM +0000, Sakari Ailus wrote:
> > > > Hi Chi Yuan,
> > > > 
> > > > On Fri, May 17, 2024 at 02:31:50PM +0800, ChiYuan Huang wrote:
> > > > > Hi, Sakari:
> > > > > 
> > > > > 	Thanks for your reply.
> > > > > If any misunderstanding, please correct me.
> > > > > 
> > > > > On Thu, May 16, 2024 at 10:42:05AM +0000, Sakari Ailus wrote:
> > > > > > Hi Chi Yuan,
> > > > > > 
> > > > > > On Wed, May 08, 2024 at 10:51:49AM +0800, cy_huang@richtek.com wrote:
> > > > > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > > > > > 
> > > > > > > In v4l2_async_create_ancillary_links(), if v4l2 async notifier is
> > > > > > > created from v4l2 device, the v4l2 flash subdev async binding will enter
> > > > > > > the logic to create media link. Due to the subdev of notifier is NULL,
> > > > > > > this will cause NULL pointer to access the subdev entity. Therefore, add
> > > > > > > the check to bypass it.
> > > > > > > 
> > > > > > > Fixes: aa4faf6eb271 ("media: v4l2-async: Create links during v4l2_async_match_notify()")
> > > > > > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > > > > > ---
> > > > > > > Hi,
> > > > > > > 
> > > > > > >   I'm trying to bind the v4l2 subdev for flashlight testing. It seems
> > > > > > > some logic in v4l2 asynd binding is incorrect.
> > > > > > > 
> > > > > > > From the change, I modified vim2m as the test driver to bind mt6370 flashlight.
> > > > > > > 
> > > > > > > Here's the backtrace log.
> > > > > > > 
> > > > > > >  vim2m soc:vim2m: bound [white:flash-2]
> > > > > > >  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
> > > > > > >  ......skipping
> > > > > > >  Call trace:
> > > > > > >   media_create_ancillary_link+0x48/0xd8 [mc]
> > > > > > >   v4l2_async_match_notify+0x17c/0x208 [v4l2_async]
> > > > > > >   v4l2_async_register_subdev+0xb8/0x1d0 [v4l2_async]
> > > > > > 
> > > > > > There's something wrong obviously somewhere but wherea?
> > > > >
> > > > > In vim2m driver, I added v4l2_async_nf_init -> v4l2_async_nf_add_fwnode_remote ->
> > > > > v4l2_async_nf_register.
> > > > > 
> > > > > From the async flow, in notifier complete ops to create v4l-subdevX node for the 
> > > > > specified subdev.
> > > > >
> > > > > > A sub-notifier does have a sub-device after the notifier initialisation.
> > > > > 
> > > > > Why? Are you saying to the notifier can only be used for subdev and subdev binding, 
> > > > > not v4l2 and subdev binding?
> > > > > 
> > > > > But to create v4l-subdevX, the key is only v4l2 device and its needed subdev.
> > > > > 
> > > > > > Maybe the initialisation does not happen in the right order?
> > > > >
> > > > > AFAIK, Async flow can solve the probe order and makes the user no need to care
> > > > > the probe order.
> > > > > 
> > > > > From the stacktrace, I'm pretty sure it's not the probe order issue.
> > > > >
> > > > > > >   __v4l2_flash_init.part.0+0x3b4/0x4b0 [v4l2_flash_led_class]
> > > > > > >   v4l2_flash_init+0x28/0x48 [v4l2_flash_led_class]
> > > > > > >   mt6370_led_probe+0x348/0x690 [leds_mt6370_flash]
> > > > > > > 
> > > > > > > After tracing the code, it will let the subdev labeled as F_LENS or
> > > > > > > F_FLASH function to create media link. To prevent the NULL pointer
> > > > > > > issue, the simplest way is add a check when 'n->sd' is NULL and bypass
> > > > > > > the later media link creataion.
> > > > > > > ---
> > > > > > >  drivers/media/v4l2-core/v4l2-async.c | 3 +++
> > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > > > index 3ec323bd528b..9d3161c51954 100644
> > > > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > > > @@ -324,6 +324,9 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > > > > >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > > > > > >  		return 0;
> > > > > > >  
> > > > > > > +	if (!n->sd)
> > > > > > > +		return 0;
> > > > > > 
> > > > > > This isn't the right fix: the ancillary link won't be created as a result.
> > > > >
> > > > > Due to the notifier is created by v4l2 device not subdev, this 'n->sd' is NULL.
> > > > > The NULL 'n->sd' will be referenced by the next flow 'media_create_ancillary_link'.
> > > > 
> > > > Ah, right. I took a new look into the code and agree this is a problem.
> > > > This probably hasn't been hit previously as the root notifier driver tends
> > > > not to have any lens or flash devices.
> > > > 
> > > > I'd change the commit message slightly:
> > > > 
> > > > --------8<-------------
> > > > In v4l2_async_create_ancillary_links(), ancillary links are created for
> > > > lens and flash sub-devices. These are sub-device to sub-device links and if
> > > > the async notifier is related to a V4L2 device, the source sub-device of
> > > > the ancillary link is NULL, leading to a NULL pointer dereference. Check
> > > > the notifier's sd field is non-NULL in v4l2_async_create_ancillary_links().
> > > > --------8<-------------
> > > 
> > > What's the use case for including lens or flash devices in the root
> > > notifier ? Shouldn't lens and flash subdevices always be linked to
> > > something ? We should of course not crash, but it seems that simply
> > > ignoring the subdevs and not linking them isn't a great idea either.
> > 
> > Yes, I think triggering this does require a very peculiar setup if not a
> > driver bug. We could also print a warning if this happens.
> 
> I think a warning would be good.
> 
> > Also using the notifier's sub-device to create ancillary links is somewhat
> > opportunistic. We seem to rely on it currently but it would only seem
> > meaningful for a sensor in practice.
> 
> This should be improved indeed.

This requires a little more work actually. The CCS driver should probably
have the lens and flash bound to its pixel array rather than the source
(binner or scaler) sub-device.

I'll post a patch to add a warning for non-subdev use of this now, the rest
will need to wait a little.

> 
> > > > > Or is it caused by the wrong usage? 
> > > > > 
> > > > > > > +
> > > > > > >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > > > > > >  
> > > > > > >  #endif
> 

-- 
Regards,

Sakari Ailus

