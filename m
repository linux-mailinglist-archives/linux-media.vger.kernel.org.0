Return-Path: <linux-media+bounces-11578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2228C80F3
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 08:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E9B01F21A47
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 06:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F2A14A8D;
	Fri, 17 May 2024 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="OcB2CdCM"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E988472;
	Fri, 17 May 2024 06:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715927534; cv=none; b=BCXxgsquqE0g44NHfOw+MDAPhV27R2R6yx7jmRcmXkVUFMFF1/73i1BGD+2VEvKAOnnT8O7YawGKuBBQMOY17CGXxYhiKHElQu6UZnd5mvu/Je1ltTYiNl9rUrojZ0lPXcHH1GLPboVX3B8M0WiSPGiI/WfvmI3vSFmZGHuUuJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715927534; c=relaxed/simple;
	bh=SAb9BPrFdCY6bm78BVJ5rnJLzeV2qvsVCBYu6rx2eq4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmWOC0x+c/ECEfEGKOBUqN/9wvR1hQo72wOupC70bNHiGnaFTNT0bCLoCNc6jKHSeZ72SIrNt0Ajxt+87O3QFCkKO5Angh9bTL3bW+dCq31xAOQO61894wPmO4pLG9xhjbq2+w+O1KYye/s0fOZOn5wXsxaO2Yybju6F6lSyWps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=OcB2CdCM; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1715927528;
	bh=+tnHjAdOwn7MTvQ9Izy5ZraLSNprRXQmhSoT/2DAs2U=; l=3581;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=OcB2CdCM3Q2KLqdKTI/5YvcUYvx+1AmRoZ5uqDDtoYGMDU8KgxcUnO0USl90U22Eh
	 v/bYFrW9wfaQFMgzOmR7CvgihC2U2s+6e96385J02T9fZCjvegWL3zZiXzR4aW0I9k
	 wLdQR7apFBu33YENd6r6s2MOJlCwXzk8buPflw0PH7+eWZXiC79LpYGmddAerXDxRE
	 20mXdZ+yyXbSIbpal4fHv+Ig870lSvzQDQn3umwhjzaU+uNiK1JDmB3zmHcVlTlIme
	 x5rM6cXdrZLrbnHTu0GWQF5v8fQYpwIg6Mpno2DhCjHjxIcwymoqUtOn29uQF95EOB
	 8Ab+bj/HG6b+A==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(3213210:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 17 May 2024 14:31:50 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 17 May
 2024 14:31:50 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 17 May 2024 14:31:50 +0800
Date: Fri, 17 May 2024 14:31:50 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Daniel Scally
	<djrscally@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: v4l: async: Fix NULL pointer when v4l2 flash
 subdev binding
Message-ID: <20240517063150.GA12245@linuxcarl2.richtek.com>
References: <e2f9f2b7b7de956d70b8567a2ab285409fff988b.1715136478.git.cy_huang@richtek.com>
 <ZkXi_U5Js34dUQsA@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZkXi_U5Js34dUQsA@kekkonen.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)

Hi, Sakari:

	Thanks for your reply.
If any misunderstanding, please correct me.

On Thu, May 16, 2024 at 10:42:05AM +0000, Sakari Ailus wrote:
> Hi Chi Yuan,
> 
> On Wed, May 08, 2024 at 10:51:49AM +0800, cy_huang@richtek.com wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> > 
> > In v4l2_async_create_ancillary_links(), if v4l2 async notifier is
> > created from v4l2 device, the v4l2 flash subdev async binding will enter
> > the logic to create media link. Due to the subdev of notifier is NULL,
> > this will cause NULL pointer to access the subdev entity. Therefore, add
> > the check to bypass it.
> > 
> > Fixes: aa4faf6eb271 ("media: v4l2-async: Create links during v4l2_async_match_notify()")
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> > Hi,
> > 
> >   I'm trying to bind the v4l2 subdev for flashlight testing. It seems
> > some logic in v4l2 asynd binding is incorrect.
> > 
> > From the change, I modified vim2m as the test driver to bind mt6370 flashlight.
> > 
> > Here's the backtrace log.
> > 
> >  vim2m soc:vim2m: bound [white:flash-2]
> >  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
> >  ......skipping
> >  Call trace:
> >   media_create_ancillary_link+0x48/0xd8 [mc]
> >   v4l2_async_match_notify+0x17c/0x208 [v4l2_async]
> >   v4l2_async_register_subdev+0xb8/0x1d0 [v4l2_async]
> 
> There's something wrong obviously somewhere but wherea?
> 
In vim2m driver, I added v4l2_async_nf_init -> v4l2_async_nf_add_fwnode_remote ->
v4l2_async_nf_register.

From the async flow, in notifier complete ops to create v4l-subdevX node for the 
specified subdev.
> A sub-notifier does have a sub-device after the notifier initialisation.

Why? Are you saying to the notifier can only be used for subdev and subdev binding, 
not v4l2 and subdev binding?

But to create v4l-subdevX, the key is only v4l2 device and its needed subdev.

> Maybe the initialisation does not happen in the right order?
AFAIK, Async flow can solve the probe order and makes the user no need to care
the probe order.

From the stacktrace, I'm pretty sure it's not the probe order issue.
> 
> >   __v4l2_flash_init.part.0+0x3b4/0x4b0 [v4l2_flash_led_class]
> >   v4l2_flash_init+0x28/0x48 [v4l2_flash_led_class]
> >   mt6370_led_probe+0x348/0x690 [leds_mt6370_flash]
> > 
> > After tracing the code, it will let the subdev labeled as F_LENS or
> > F_FLASH function to create media link. To prevent the NULL pointer
> > issue, the simplest way is add a check when 'n->sd' is NULL and bypass
> > the later media link creataion.
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 3ec323bd528b..9d3161c51954 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -324,6 +324,9 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> >  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> >  		return 0;
> >  
> > +	if (!n->sd)
> > +		return 0;
> 
> This isn't the right fix: the ancillary link won't be created as a result.
> 
Due to the notifier is created by v4l2 device not subdev, this 'n->sd' is NULL.
The NULL 'n->sd' will be referenced by the next flow 'media_create_ancillary_link'.

Or is it caused by the wrong usage? 

> > +
> >  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> >  
> >  #endif
> 
> -- 
> Regards,
> 
> Sakari Ailus

