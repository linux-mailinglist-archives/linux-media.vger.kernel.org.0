Return-Path: <linux-media+bounces-11598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C08C85A8
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 13:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 431661F234BD
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 11:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA8B3D996;
	Fri, 17 May 2024 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOQa9Onp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5623DB97;
	Fri, 17 May 2024 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715945239; cv=none; b=bPjiXBQ9QSUKKkt/fUeyXre1NcWbbiXalCx7yqILQJUxVkWI8BunkCqa/x77YP8wZx4cVWzVDaixyW7Pt5Azb2xRR95ylJS9P1vnAQIEB+O2RmHUotMg0ExR4LYtSjTHPtizO1KEg+y97a9PRsYCyShvcBf1N16pIWo63ABimnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715945239; c=relaxed/simple;
	bh=fpVvY/LZY/vKTE7bG/mC6scP9pewqO3D9xWRvpwv24g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjljeckeYZ6oYMMbFrtMSFiLKIKiTloScm56FONA/zDBGg+DVkroS0OMD6SnT+CuJOAzJZISRO5NnLXsMUj1Cm9g3UJ9Pk9FFo4bdv+BWWYU+QBynaPiQxthmtvz+l69W1Qm+ETy6S7r2HOdYma2IPOMmrf0ggBkSgQ+VCunUU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOQa9Onp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715945238; x=1747481238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fpVvY/LZY/vKTE7bG/mC6scP9pewqO3D9xWRvpwv24g=;
  b=dOQa9OnpQyOC6K7t2BiYrkv0dXnXwThAvphUS6f+yzs8X/Vuz8p0jWmn
   w0EjqAu6eU6bGJMy8qVOFBf+1Lz9JxqvyWbojO9I87rgbUdl4EsayTFa7
   6nN6wKd8VUrqt0oizyHNyCsj/e7aUU9tdmkGPiwymQ5TjZrHpksj81F1X
   ngVCV+XQq2/ZFr1iaeWLchdySX0/P1W3lCSJeMzSNrMXtVK4MoMMnwJVW
   eWMsL/GzImXCKlhwUM35IjWMa2h49D2ofwC3kOGHDDndryaZnBtkWYJqH
   jPDfw502yXsTp4CzyrMze3RHxcXgf8x+QoetXV2jC9EYbDiCyRjdkavPh
   w==;
X-CSE-ConnectionGUID: HvJ2EG23QpGNQk1P5L8GTw==
X-CSE-MsgGUID: G3jJuVEHSr+aJb2K2EB4wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15903882"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="15903882"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 04:27:17 -0700
X-CSE-ConnectionGUID: yNcSpiBvQPuNLT2ErlOdKA==
X-CSE-MsgGUID: lnVV0l0bRIaaI4uoY7eNvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="36332736"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 04:27:15 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AA27E11FA44;
	Fri, 17 May 2024 14:27:12 +0300 (EEST)
Date: Fri, 17 May 2024 11:27:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ChiYuan Huang <cy_huang@richtek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix NULL pointer when v4l2 flash
 subdev binding
Message-ID: <Zkc_ENTqovMg_WnD@kekkonen.localdomain>
References: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>
 <ZkXi_U5Js34dUQsA@kekkonen.localdomain>
 <20240517063150.GA12245@linuxcarl2.richtek.com>
 <ZkcOoLQQRdRYYacd@kekkonen.localdomain>
 <20240517111944.GD19755@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517111944.GD19755@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, May 17, 2024 at 02:19:44PM +0300, Laurent Pinchart wrote:
> On Fri, May 17, 2024 at 08:00:32AM +0000, Sakari Ailus wrote:
> > Hi Chi Yuan,
> > 
> > On Fri, May 17, 2024 at 02:31:50PM +0800, ChiYuan Huang wrote:
> > > Hi, Sakari:
> > > 
> > > 	Thanks for your reply.
> > > If any misunderstanding, please correct me.
> > > 
> > > On Thu, May 16, 2024 at 10:42:05AM +0000, Sakari Ailus wrote:
> > > > Hi Chi Yuan,
> > > > 
> > > > On Wed, May 08, 2024 at 10:51:49AM +0800, cy_huang@richtek.com wrote:
> > > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > > > 
> > > > > In v4l2_async_create_ancillary_links(), if v4l2 async notifier is
> > > > > created from v4l2 device, the v4l2 flash subdev async binding will enter
> > > > > the logic to create media link. Due to the subdev of notifier is NULL,
> > > > > this will cause NULL pointer to access the subdev entity. Therefore, add
> > > > > the check to bypass it.
> > > > > 
> > > > > Fixes: aa4faf6eb271 ("media: v4l2-async: Create links during v4l2_async_match_notify()")
> > > > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > > > ---
> > > > > Hi,
> > > > > 
> > > > >   I'm trying to bind the v4l2 subdev for flashlight testing. It seems
> > > > > some logic in v4l2 asynd binding is incorrect.
> > > > > 
> > > > > From the change, I modified vim2m as the test driver to bind mt6370 flashlight.
> > > > > 
> > > > > Here's the backtrace log.
> > > > > 
> > > > >  vim2m soc:vim2m: bound [white:flash-2]
> > > > >  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
> > > > >  ......skipping
> > > > >  Call trace:
> > > > >   media_create_ancillary_link+0x48/0xd8 [mc]
> > > > >   v4l2_async_match_notify+0x17c/0x208 [v4l2_async]
> > > > >   v4l2_async_register_subdev+0xb8/0x1d0 [v4l2_async]
> > > > 
> > > > There's something wrong obviously somewhere but wherea?
> > >
> > > In vim2m driver, I added v4l2_async_nf_init -> v4l2_async_nf_add_fwnode_remote ->
> > > v4l2_async_nf_register.
> > > 
> > > From the async flow, in notifier complete ops to create v4l-subdevX node for the 
> > > specified subdev.
> > >
> > > > A sub-notifier does have a sub-device after the notifier initialisation.
> > > 
> > > Why? Are you saying to the notifier can only be used for subdev and subdev binding, 
> > > not v4l2 and subdev binding?
> > > 
> > > But to create v4l-subdevX, the key is only v4l2 device and its needed subdev.
> > > 
> > > > Maybe the initialisation does not happen in the right order?
> > >
> > > AFAIK, Async flow can solve the probe order and makes the user no need to care
> > > the probe order.
> > > 
> > > From the stacktrace, I'm pretty sure it's not the probe order issue.
> > >
> > > > >   __v4l2_flash_init.part.0+0x3b4/0x4b0 [v4l2_flash_led_class]
> > > > >   v4l2_flash_init+0x28/0x48 [v4l2_flash_led_class]
> > > > >   mt6370_led_probe+0x348/0x690 [leds_mt6370_flash]
> > > > > 
> > > > > After tracing the code, it will let the subdev labeled as F_LENS or
> > > > > F_FLASH function to create media link. To prevent the NULL pointer
> > > > > issue, the simplest way is add a check when 'n->sd' is NULL and bypass
> > > > > the later media link creataion.
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-async.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > index 3ec323bd528b..9d3161c51954 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > @@ -324,6 +324,9 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > > >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > > > >  		return 0;
> > > > >  
> > > > > +	if (!n->sd)
> > > > > +		return 0;
> > > > 
> > > > This isn't the right fix: the ancillary link won't be created as a result.
> > >
> > > Due to the notifier is created by v4l2 device not subdev, this 'n->sd' is NULL.
> > > The NULL 'n->sd' will be referenced by the next flow 'media_create_ancillary_link'.
> > 
> > Ah, right. I took a new look into the code and agree this is a problem.
> > This probably hasn't been hit previously as the root notifier driver tends
> > not to have any lens or flash devices.
> > 
> > I'd change the commit message slightly:
> > 
> > --------8<-------------
> > In v4l2_async_create_ancillary_links(), ancillary links are created for
> > lens and flash sub-devices. These are sub-device to sub-device links and if
> > the async notifier is related to a V4L2 device, the source sub-device of
> > the ancillary link is NULL, leading to a NULL pointer dereference. Check
> > the notifier's sd field is non-NULL in v4l2_async_create_ancillary_links().
> > --------8<-------------
> 
> What's the use case for including lens or flash devices in the root
> notifier ? Shouldn't lens and flash subdevices always be linked to
> something ? We should of course not crash, but it seems that simply
> ignoring the subdevs and not linking them isn't a great idea either.

Yes, I think triggering this does require a very peculiar setup if not a
driver bug. We could also print a warning if this happens.

Also using the notifier's sub-device to create ancillary links is somewhat
opportunistic. We seem to rely on it currently but it would only seem
meaningful for a sensor in practice.

> 
> > > Or is it caused by the wrong usage? 
> > > 
> > > > > +
> > > > >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > > > >  
> > > > >  #endif
> 

-- 
Kind regards,

Sakari Ailus

