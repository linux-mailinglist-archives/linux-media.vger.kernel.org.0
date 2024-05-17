Return-Path: <linux-media+bounces-11599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558478C85C1
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 13:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A2B11C2323F
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 11:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864EE3E48F;
	Fri, 17 May 2024 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wonq8Dnz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66455BE4A;
	Fri, 17 May 2024 11:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715945863; cv=none; b=kfu/JX5DaTBySR70MjNy5GfJrg3F8cM9e8w+EdLZ/ARHOrkRfhKuvCTWcoK3ad6Qxyinsz1t1GiwKxHmjCnHEtl0IO7yjl+7vRTu8MgBtaXVyLOxM7tRQ6aLiB+VMKmqjlZHwTeG75lqSHsbOeG/WEYj1u4YZ0T8kYuvnKzqyYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715945863; c=relaxed/simple;
	bh=aqGgQDx8JqQb1TBydwsm0go4suIdDmmkfQxkdVhpHyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvBwth16oBenJgeDdGBKO40pGyvgtPZ+0XGMjSo3rFs57OwQfWhazEcXiyVRnIDoK0mzfkyZl1rHm3p6w7uIrLScEW2MtzWLIrFDHxKjwK/6e0IhG9zN0voCRIdqj8Nyi5PCH0FT+6u01vwNyPoLibS3g7FiaFZgD4+qqyuqz1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wonq8Dnz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59D3CA9A;
	Fri, 17 May 2024 13:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715945850;
	bh=aqGgQDx8JqQb1TBydwsm0go4suIdDmmkfQxkdVhpHyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wonq8DnzoMDfcTjkqS2yP1mkP6fuyDEcbEHK+L9rY04eaVqzEDdq/bhE9vMgodzK7
	 lkd//XLxag3kpJ5kdNmiEbmaOIBHMEOdQt7hNLOxc45EubdhRwZLbax4Q16LCXdyfz
	 76gMX4dPRGxLGFGMVq6vOCHsSycAEcct6MI0+ywI=
Date: Fri, 17 May 2024 14:37:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: ChiYuan Huang <cy_huang@richtek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix NULL pointer when v4l2 flash
 subdev binding
Message-ID: <20240517113730.GF19755@pendragon.ideasonboard.com>
References: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>
 <ZkXi_U5Js34dUQsA@kekkonen.localdomain>
 <20240517063150.GA12245@linuxcarl2.richtek.com>
 <ZkcOoLQQRdRYYacd@kekkonen.localdomain>
 <20240517111944.GD19755@pendragon.ideasonboard.com>
 <Zkc_ENTqovMg_WnD@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zkc_ENTqovMg_WnD@kekkonen.localdomain>

On Fri, May 17, 2024 at 11:27:12AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, May 17, 2024 at 02:19:44PM +0300, Laurent Pinchart wrote:
> > On Fri, May 17, 2024 at 08:00:32AM +0000, Sakari Ailus wrote:
> > > Hi Chi Yuan,
> > > 
> > > On Fri, May 17, 2024 at 02:31:50PM +0800, ChiYuan Huang wrote:
> > > > Hi, Sakari:
> > > > 
> > > > 	Thanks for your reply.
> > > > If any misunderstanding, please correct me.
> > > > 
> > > > On Thu, May 16, 2024 at 10:42:05AM +0000, Sakari Ailus wrote:
> > > > > Hi Chi Yuan,
> > > > > 
> > > > > On Wed, May 08, 2024 at 10:51:49AM +0800, cy_huang@richtek.com wrote:
> > > > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > > > > 
> > > > > > In v4l2_async_create_ancillary_links(), if v4l2 async notifier is
> > > > > > created from v4l2 device, the v4l2 flash subdev async binding will enter
> > > > > > the logic to create media link. Due to the subdev of notifier is NULL,
> > > > > > this will cause NULL pointer to access the subdev entity. Therefore, add
> > > > > > the check to bypass it.
> > > > > > 
> > > > > > Fixes: aa4faf6eb271 ("media: v4l2-async: Create links during v4l2_async_match_notify()")
> > > > > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > > > > ---
> > > > > > Hi,
> > > > > > 
> > > > > >   I'm trying to bind the v4l2 subdev for flashlight testing. It seems
> > > > > > some logic in v4l2 asynd binding is incorrect.
> > > > > > 
> > > > > > From the change, I modified vim2m as the test driver to bind mt6370 flashlight.
> > > > > > 
> > > > > > Here's the backtrace log.
> > > > > > 
> > > > > >  vim2m soc:vim2m: bound [white:flash-2]
> > > > > >  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
> > > > > >  ......skipping
> > > > > >  Call trace:
> > > > > >   media_create_ancillary_link+0x48/0xd8 [mc]
> > > > > >   v4l2_async_match_notify+0x17c/0x208 [v4l2_async]
> > > > > >   v4l2_async_register_subdev+0xb8/0x1d0 [v4l2_async]
> > > > > 
> > > > > There's something wrong obviously somewhere but wherea?
> > > >
> > > > In vim2m driver, I added v4l2_async_nf_init -> v4l2_async_nf_add_fwnode_remote ->
> > > > v4l2_async_nf_register.
> > > > 
> > > > From the async flow, in notifier complete ops to create v4l-subdevX node for the 
> > > > specified subdev.
> > > >
> > > > > A sub-notifier does have a sub-device after the notifier initialisation.
> > > > 
> > > > Why? Are you saying to the notifier can only be used for subdev and subdev binding, 
> > > > not v4l2 and subdev binding?
> > > > 
> > > > But to create v4l-subdevX, the key is only v4l2 device and its needed subdev.
> > > > 
> > > > > Maybe the initialisation does not happen in the right order?
> > > >
> > > > AFAIK, Async flow can solve the probe order and makes the user no need to care
> > > > the probe order.
> > > > 
> > > > From the stacktrace, I'm pretty sure it's not the probe order issue.
> > > >
> > > > > >   __v4l2_flash_init.part.0+0x3b4/0x4b0 [v4l2_flash_led_class]
> > > > > >   v4l2_flash_init+0x28/0x48 [v4l2_flash_led_class]
> > > > > >   mt6370_led_probe+0x348/0x690 [leds_mt6370_flash]
> > > > > > 
> > > > > > After tracing the code, it will let the subdev labeled as F_LENS or
> > > > > > F_FLASH function to create media link. To prevent the NULL pointer
> > > > > > issue, the simplest way is add a check when 'n->sd' is NULL and bypass
> > > > > > the later media link creataion.
> > > > > > ---
> > > > > >  drivers/media/v4l2-core/v4l2-async.c | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > > index 3ec323bd528b..9d3161c51954 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > > @@ -324,6 +324,9 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > > > >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > > > > >  		return 0;
> > > > > >  
> > > > > > +	if (!n->sd)
> > > > > > +		return 0;
> > > > > 
> > > > > This isn't the right fix: the ancillary link won't be created as a result.
> > > >
> > > > Due to the notifier is created by v4l2 device not subdev, this 'n->sd' is NULL.
> > > > The NULL 'n->sd' will be referenced by the next flow 'media_create_ancillary_link'.
> > > 
> > > Ah, right. I took a new look into the code and agree this is a problem.
> > > This probably hasn't been hit previously as the root notifier driver tends
> > > not to have any lens or flash devices.
> > > 
> > > I'd change the commit message slightly:
> > > 
> > > --------8<-------------
> > > In v4l2_async_create_ancillary_links(), ancillary links are created for
> > > lens and flash sub-devices. These are sub-device to sub-device links and if
> > > the async notifier is related to a V4L2 device, the source sub-device of
> > > the ancillary link is NULL, leading to a NULL pointer dereference. Check
> > > the notifier's sd field is non-NULL in v4l2_async_create_ancillary_links().
> > > --------8<-------------
> > 
> > What's the use case for including lens or flash devices in the root
> > notifier ? Shouldn't lens and flash subdevices always be linked to
> > something ? We should of course not crash, but it seems that simply
> > ignoring the subdevs and not linking them isn't a great idea either.
> 
> Yes, I think triggering this does require a very peculiar setup if not a
> driver bug. We could also print a warning if this happens.

I think a warning would be good.

> Also using the notifier's sub-device to create ancillary links is somewhat
> opportunistic. We seem to rely on it currently but it would only seem
> meaningful for a sensor in practice.

This should be improved indeed.

> > > > Or is it caused by the wrong usage? 
> > > > 
> > > > > > +
> > > > > >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > > > > >  
> > > > > >  #endif

-- 
Regards,

Laurent Pinchart

