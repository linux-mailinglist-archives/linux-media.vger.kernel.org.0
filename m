Return-Path: <linux-media+bounces-20633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EFD9B781C
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA0DA285D9D
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE4A198E92;
	Thu, 31 Oct 2024 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="nJTIFcni"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94914197A9A;
	Thu, 31 Oct 2024 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730368667; cv=none; b=DW5mu5EAebSrCRgskIKVIvQD0gFPaHsHnKo612ExzXvp5aROznihyiKt6noCQyOktA+pA6oDA0v9jR0dQLmqcNikbCiVpKB9W9WfmkYCSBxPT6AnPSFg/xOUuhJN0dVtfp6Q2j8V+YuaTpM+6CWuJrdVXflUoZtU9iUHhMFa+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730368667; c=relaxed/simple;
	bh=pxgGzth4IoWDkB1mXKh2V+epPBdJxqmOD5Ygrsdyuyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rs3eYuhI8LSi5vOHy8gv6Zk1KiuoE573jF5lr5BiISwvbshrSgGbBffed0qiBf1lhMY+mVPmClrUDJ8LSRuX7enIxxXxbErqyubAtmzxvYr1FQEktxcUVGmh0LEzQamU9BBan2thj4W6Hs0IkNKEalL1repuQ7wBwqKXJs31muQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=nJTIFcni; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1730368655; bh=pxgGzth4IoWDkB1mXKh2V+epPBdJxqmOD5Ygrsdyuyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJTIFcnisahWBn9pWTB2osHgg6GfrgCfzGBNKQ4eHRN/9TvluuxXELkoSBq4iouEB
	 uNOQMWSaEAva6Wz5NMBPpj0SkX1jacZZ/g0X2K5gS+uQ8kZEOxrVjNBZbcVBE2JtLr
	 eH7Cf3VrCHhlmYQymUbf55fZRtnmo/zIDgt8N5UD1XixT06eEzm3Uhc4yW6p0Rek6o
	 CtnC6PZ8RFdxsU5gA0w2scgixhJzEicMBcp6G+tAfeRYMRQCO7eaPbU7LmNPiO+TJ3
	 tss2J7fFg7cfXJSrRns9c5uCP0ZWAIh3GEcR+nycp4uGTilyn/nkXmwAiEePSQd4a9
	 e6/CC9O+msq0Q==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id C73821000C4; Thu, 31 Oct 2024 09:57:35 +0000 (GMT)
Date: Thu, 31 Oct 2024 09:57:35 +0000
From: Sean Young <sean@mess.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux@treblig.org, awalls@md.metrocast.net, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: cx18: Remove unused cx18_reset_ir_gpio
Message-ID: <ZyNUj4CxU2_2Zhc_@gofer.mess.org>
References: <20241012233932.255211-1-linux@treblig.org>
 <Zx_s76gUaQwAxzip@gofer.mess.org>
 <b580805b-8f00-40d1-bc1c-3ac19a19ac45@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b580805b-8f00-40d1-bc1c-3ac19a19ac45@xs4all.nl>

On Tue, Oct 29, 2024 at 11:57:16AM +0100, Hans Verkuil wrote:
> On 10/28/24 20:58, Sean Young wrote:
> > On Sun, Oct 13, 2024 at 12:39:32AM +0100, linux@treblig.org wrote:
> >> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >>
> >> cx18_reset_ir_gpio() has been unused in tree since 2009
> >> commit eefe1010a465 ("V4L/DVB (10759): cx18: Convert GPIO connected
> >> functions to act as v4l2_subdevices")
> >>
> >> It has a comment saying it's exported for use by 'lirc_pvr150' but I don't
> >> see any sign of it in the lirc git, and I see it removed support
> >> for lirc_i2c.c 'Flavors of the Hauppage PVR-150...' in 2014.
> >>
> >> Remove it.
> > 
> > Interesting, I can't find any call site either. The ir-i2c-kbd driver could
> > potentially use this, but it would to know the correct v4l2_dev for the
> > device; also there are devices other than the cx18 which use the same IR
> > module, so they would not have a way to force a reset or need a different
> > mechanism (e.g. ivtv driver).
> > 
> > So I don't understand how this could be wired up or how it was ever wired
> > up.
> > 
> > This could be great because if done correctly, we could remove the
> > VIDIOC_INT_RESET ioctl completely. Then again, I don't know how often the
> > device hangs. With the current driver the IR module I don't know of any
> > hangs -- maybe the ioctl could just go anyway.
> > 
> > 
> > Sean
> > 
> >>
> >> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> >> ---
> >>  drivers/media/pci/cx18/cx18-gpio.c | 15 ---------------
> >>  drivers/media/pci/cx18/cx18-gpio.h |  1 -
> >>  2 files changed, 16 deletions(-)
> >>
> >> diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
> >> index c85eb8d25837..485a6cbeb15a 100644
> >> --- a/drivers/media/pci/cx18/cx18-gpio.c
> >> +++ b/drivers/media/pci/cx18/cx18-gpio.c
> >> @@ -305,21 +305,6 @@ int cx18_gpio_register(struct cx18 *cx, u32 hw)
> >>  	return v4l2_device_register_subdev(&cx->v4l2_dev, sd);
> >>  }
> >>  
> >> -void cx18_reset_ir_gpio(void *data)
> >> -{
> >> -	struct cx18 *cx = to_cx18(data);
> >> -
> >> -	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
> >> -		return;
> >> -
> >> -	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
> >> -
> >> -	v4l2_subdev_call(&cx->sd_resetctrl,
> >> -			 core, reset, CX18_GPIO_RESET_Z8F0811);
> 
> Ah, this calls core.reset. But VIDIOC_INT_RESET in cx18_default() does the
> same (actually, it calls this for all subdevs). So dropping this code should
> be fine since you can still do the same thing with cx18-ctl --reset.

That's true.

> This function was probably used a long time ago by lirc_pvr150, but I can't
> even find the source for that anymore. I assume it has a modern replacement.

ir-kbd-i2c.c handles this now, both receiving and sending. I've done some work
on this driver and done a fair amount of testing. It certainly is possible
to make the firmware hang - by sending it the wrong commands.

With the current driver I've never seen any hangs or heard of reports of hangs.

> This is the original commit adding this function:
> 
> commit 02fa272fcb6edda9059d6dbaab20dfe919f4f4d2
> Author: Andy Walls <awalls@radix.net>
> Date:   Sun Jul 13 19:30:15 2008 -0300
> 
>     V4L/DVB (8332): cx18: Suport external reset of the Z8F0811 IR controller on HVR-1600 for lirc
> 
>     cx18: added in cx18_ir_reset_gpio function for lirc_pvr150 like module.  Also
>     added the ability to reset the IR chip via ioctl like ivtv.  This needs the
>     mutex to protect gpio_dir and gpio_val in struct cx18 as gpio changes can
>     come from a few different asynchronous sources now.
> 
>     Signed-off-by: Andy Walls <awalls@radix.net>
>     Signed-off-by: Mauro Carvalho Chehab <mchehab@infradead.org>
> 
> Perhaps Andy remembers how frequent the lock ups were.
> 
> Regards,
> 
> 	Hans
> 
> >> -}
> >> -EXPORT_SYMBOL(cx18_reset_ir_gpio);

So I've been looking everywhere including the lirc cvs repo, and I can't where 
this function is used. Looking at the history with cvs is awful of course,
so I may have missed something.

I think since we don't know of any lockups and we don't know of any users,
we can safely remove the function, i.e. let's apply this patch.


The reason I was looking for users of this function is that I thought it
would be nice if ir-kbd-i2c could use this function directly, and therefore
the cx18-ctl --reset is no longer needed (and no need for the ioctl either).

Something for another day.


Sean

