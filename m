Return-Path: <linux-media+bounces-11580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F6A8C81FC
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 10:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25992829B0
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 08:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92DD29CE6;
	Fri, 17 May 2024 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djaxws3o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D922318;
	Fri, 17 May 2024 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715932839; cv=none; b=fGCN4zoWBkBwUf8eOdh8W4HPQx+DZXAxXXDLtJF7LRFdjiEPgw564hRwLzHu9+f0FfQIk/szUIeJo3LWM4L6UYo4qij+X9ZAbfZmwesaatGu3dylVpN0s08zwKAsM+hRJ8huB7a+NKgFaZH6mAh3hW8CdZoixG+RgMUOJtvKRQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715932839; c=relaxed/simple;
	bh=QxgA8GZnoup8zGH9AmZ4cladIL6JafKC2tee8EIHg/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2kLWD9hhOMT3BflT2LL0i7B5+4VR8230BV429is5oIaFT9262p4MfJSmFjOFZOCRjw0B2697OqEm0pKlGzZm1ck3lKsev2ROZoseL41ujzXuDzsDoKcD8qnaJtBwrD22FMgJ3ClwLRfTmE8hHaW3IY/AAr7BIGMxvEwQqmXUtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djaxws3o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715932838; x=1747468838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QxgA8GZnoup8zGH9AmZ4cladIL6JafKC2tee8EIHg/o=;
  b=djaxws3oJzRB4mp9eq2cYEWXO3wu+1dlnJkR+DTPCkg6I2W1dIIHBBqC
   B4QC/lhWQJpDP9ctTqZH1So3aZKvwE3PP7b3lOrnmTnQ0E1u96qSBEtZp
   lXnaoRf2nzZzm/DRiawKLXjOMgF08S6M73v/ctP38+4yDQeu7aI+hbu33
   Gelvh8p4ux3Zz5slSUvtVZaA18hB/DcQKXW+QmVTXKJGCGf9Fpcc911PZ
   rN62dYnNHK8HEpOCMGgFZeigLZyO/47Wk9dp7EmZNxfoNCpadhtyi8vb4
   i0KxlrdGWKWQ9x5X+qk1VB7VlT5dAKSdXitbjsu3HNZnf0B+GPLyjz4YN
   Q==;
X-CSE-ConnectionGUID: hMHaV31sSyWuAcfDFjxfTQ==
X-CSE-MsgGUID: Q0tWMaZLRtC3fkK25ZhO5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11936373"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="11936373"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 01:00:37 -0700
X-CSE-ConnectionGUID: a9vvjHZlRoqS19wgv+zALQ==
X-CSE-MsgGUID: Hetpc9OuS2iqE3maXU0NqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="62918843"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 01:00:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 34A9B11FA44;
	Fri, 17 May 2024 11:00:32 +0300 (EEST)
Date: Fri, 17 May 2024 08:00:32 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix NULL pointer when v4l2 flash
 subdev binding
Message-ID: <ZkcOoLQQRdRYYacd@kekkonen.localdomain>
References: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>
 <ZkXi_U5Js34dUQsA@kekkonen.localdomain>
 <20240517063150.GA12245@linuxcarl2.richtek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517063150.GA12245@linuxcarl2.richtek.com>

Hi Chi Yuan,

On Fri, May 17, 2024 at 02:31:50PM +0800, ChiYuan Huang wrote:
> Hi, Sakari:
> 
> 	Thanks for your reply.
> If any misunderstanding, please correct me.
> 
> On Thu, May 16, 2024 at 10:42:05AM +0000, Sakari Ailus wrote:
> > Hi Chi Yuan,
> > 
> > On Wed, May 08, 2024 at 10:51:49AM +0800, cy_huang@richtek.com wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > 
> > > In v4l2_async_create_ancillary_links(), if v4l2 async notifier is
> > > created from v4l2 device, the v4l2 flash subdev async binding will enter
> > > the logic to create media link. Due to the subdev of notifier is NULL,
> > > this will cause NULL pointer to access the subdev entity. Therefore, add
> > > the check to bypass it.
> > > 
> > > Fixes: aa4faf6eb271 ("media: v4l2-async: Create links during v4l2_async_match_notify()")
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> > > Hi,
> > > 
> > >   I'm trying to bind the v4l2 subdev for flashlight testing. It seems
> > > some logic in v4l2 asynd binding is incorrect.
> > > 
> > > From the change, I modified vim2m as the test driver to bind mt6370 flashlight.
> > > 
> > > Here's the backtrace log.
> > > 
> > >  vim2m soc:vim2m: bound [white:flash-2]
> > >  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
> > >  ......skipping
> > >  Call trace:
> > >   media_create_ancillary_link+0x48/0xd8 [mc]
> > >   v4l2_async_match_notify+0x17c/0x208 [v4l2_async]
> > >   v4l2_async_register_subdev+0xb8/0x1d0 [v4l2_async]
> > 
> > There's something wrong obviously somewhere but wherea?
> > 
> In vim2m driver, I added v4l2_async_nf_init -> v4l2_async_nf_add_fwnode_remote ->
> v4l2_async_nf_register.
> 
> From the async flow, in notifier complete ops to create v4l-subdevX node for the 
> specified subdev.
> > A sub-notifier does have a sub-device after the notifier initialisation.
> 
> Why? Are you saying to the notifier can only be used for subdev and subdev binding, 
> not v4l2 and subdev binding?
> 
> But to create v4l-subdevX, the key is only v4l2 device and its needed subdev.
> 
> > Maybe the initialisation does not happen in the right order?
> AFAIK, Async flow can solve the probe order and makes the user no need to care
> the probe order.
> 
> From the stacktrace, I'm pretty sure it's not the probe order issue.
> > 
> > >   __v4l2_flash_init.part.0+0x3b4/0x4b0 [v4l2_flash_led_class]
> > >   v4l2_flash_init+0x28/0x48 [v4l2_flash_led_class]
> > >   mt6370_led_probe+0x348/0x690 [leds_mt6370_flash]
> > > 
> > > After tracing the code, it will let the subdev labeled as F_LENS or
> > > F_FLASH function to create media link. To prevent the NULL pointer
> > > issue, the simplest way is add a check when 'n->sd' is NULL and bypass
> > > the later media link creataion.
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index 3ec323bd528b..9d3161c51954 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -324,6 +324,9 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> > >  		return 0;
> > >  
> > > +	if (!n->sd)
> > > +		return 0;
> > 
> > This isn't the right fix: the ancillary link won't be created as a result.
> > 
> Due to the notifier is created by v4l2 device not subdev, this 'n->sd' is NULL.
> The NULL 'n->sd' will be referenced by the next flow 'media_create_ancillary_link'.

Ah, right. I took a new look into the code and agree this is a problem.
This probably hasn't been hit previously as the root notifier driver tends
not to have any lens or flash devices.

I'd change the commit message slightly:

--------8<-------------
In v4l2_async_create_ancillary_links(), ancillary links are created for
lens and flash sub-devices. These are sub-device to sub-device links and if
the async notifier is related to a V4L2 device, the source sub-device of
the ancillary link is NULL, leading to a NULL pointer dereference. Check
the notifier's sd field is non-NULL in v4l2_async_create_ancillary_links().
--------8<-------------

> 
> Or is it caused by the wrong usage? 
> 
> > > +
> > >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > >  
> > >  #endif
> > 

-- 
Kind regards,

Sakari Ailus

