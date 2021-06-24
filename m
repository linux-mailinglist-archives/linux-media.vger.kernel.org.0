Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23303B2C35
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 12:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhFXKRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 06:17:05 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:47762 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbhFXKRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 06:17:04 -0400
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010::e64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id D2C181B0024A;
        Thu, 24 Jun 2021 13:14:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1624529684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Cm6oRAO7Qf+up/gBztYdDymHQXRC9xRTdhrEzbUV7+w=;
        b=SqzMHaGhTqQ7p1i6I9/0ccY8iyH/zA4RCqdbZY3AaTMS9oSqjjUBIcpWWxyqR+NA9Az/FF
        N/Tq7wfmsyjL5VPZNgcwYHhzRwi5EWvEQ2P1HPN8xH/9wZ64441BUmmFpGYfu2CNWP9Lt8
        HmJH1WKjJtcpnGWy/e3yon1s4wg4iDYkIjX2eWUiAQx6uKwaUPBLbO+EfkZxaw+mBpc3w9
        OfX1IUyqgmzZYWgSRBW/bwAQgnGVO5S+BQhOSrVX3G5ti1lKgNMOYVl4p73n/CLAS0yoSE
        M/jIaJisHHQw+3e3hm+AXWWrzJ19rebgxEUJJBwa8o7/DCsXAiqMao/AWkCjfw==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E0F1C634C87;
        Thu, 24 Jun 2021 13:14:27 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lwMNf-00019I-CK; Thu, 24 Jun 2021 13:14:43 +0300
Date:   Thu, 24 Jun 2021 13:14:43 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] media: v4l2-flash-led-class: drop an useless check
Message-ID: <20210624101443.GK3@valkosipuli.retiisi.eu>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
 <e1629ac223470630eed4096361965d154aff70b7.1624276138.git.mchehab+huawei@kernel.org>
 <20210624093153.GJ3@valkosipuli.retiisi.eu>
 <20210624115925.357f98b6@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624115925.357f98b6@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1624529684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Cm6oRAO7Qf+up/gBztYdDymHQXRC9xRTdhrEzbUV7+w=;
        b=N1mknJQazMQyjdxm03zhYg+OIaW/1jaqdjeNgQ7NAtNX2/4MJhLvVFCRi7Of8L6tYLN86G
        I3E/1sbuBD9yZBCvH+VzHwzcV84oprxuGSfN4f/AAAftCi5RgNOGBA5Sa/wUBsiN1Lcq11
        bUhe0nc35Wont37c4pIytgtmWuCwUGQASNBBQ1uJxYma+gcI4bRd1WlCG0NrwlNpbXhj0d
        Z8gp3a8vNGIqPUVgJEH2QWZyUifNLW0HoG4UDn8+W9QZi4T46o+6gA1CNMaW/fp7r/f9Tc
        5l9k0QS4Xr8A3Gea2TEyhH+cRRE8PN6DIH6HS7aWWaqyVkSQtrWxuU4FKa81wQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1624529684; a=rsa-sha256;
        cv=none;
        b=eZm1BFR6S81Ij3D/Yc1NTw1jNBMZIDBZnWc0oruuK3iuN7116ShTi76+dC+hic9il0NUjp
        gpRV1LvcRnxT6QpYBfue7/cJSFhEaDqRv8YeWgCr7Q/ASE5rSBHe9mrCzbMn2PX9DnYQXj
        NupyMtvqSUXKRNU8OE2CWmFXU1X+1VoEo9b0zdhaLpk3011Foi39YWKSjPaHsSsh18fLhP
        tOVP2psLJau0y/XfTVNyWTdw82Fu6rMUb6bwoDPD3ZLqj432H8zPnoromwDsalEuQelETS
        8H4BCJAniSNsqb974jYUSlkkX9oRRKEBGiN38XBAEt93Uh8DPgjZ+bcslKwghA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Jun 24, 2021 at 11:59:25AM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 24 Jun 2021 12:31:53 +0300
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Mauro,
> > 
> > Could you check if your mail client could be configured not to add junk to
> > To: field? It often leads anything in the Cc: field being dropped.
> 
> I have no idea why it is doing that. I'm just using git send-email
> here. Perhaps a git bug?
> 
> 	$ git --version
> 	git version 2.31.1
> 
> The setup is like this one:
> 
> 	[sendemail]
> 	        confirm = always
> 	        multiedit = true
> 	        chainreplyto = false
> 	        aliasesfile = /home/mchehab/.addressbook
> 	        aliasfiletype = pine
> 	        assume8bitencoding = UTF-8

I tried sending a message to myself using git send-email with an empty To:
field and it came through just fine, with To: field remaining empty. I
wonder if it could be the list server?

It could be difficult to fix, but what I'm saying leaving the To: field
empty now has this effect. :-I

> 
> 
> > 
> > On Mon, Jun 21, 2021 at 01:56:47PM +0200, Mauro Carvalho Chehab wrote:
> > > As pointed by smatch:
> > > 	drivers/media/v4l2-core/v4l2-flash-led-class.c:264 v4l2_flash_s_ctrl() error: we previously assumed 'fled_cdev' could be null (see line 197)
> > > 
> > > It is too late to check if fled_cdev is NULL there. If such check is
> > > needed, it should be, instead, inside v4l2_flash_init().
> > > 
> > > On other words, if v4l2_flash->fled_cdev() is NULL at
> > > v4l2_flash_s_ctrl(), all led_*() function calls inside the function
> > > would try to de-reference a NULL pointer, as the logic won't prevent
> > > it.
> > > 
> > > So, remove the useless check.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-flash-led-class.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > index 10ddcc48aa17..a1653c635d82 100644
> > > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > @@ -194,7 +194,7 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> > >  {
> > >  	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
> > >  	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> > > -	struct led_classdev *led_cdev = fled_cdev ? &fled_cdev->led_cdev : NULL;
> > > +	struct led_classdev *led_cdev = &fled_cdev->led_cdev;  
> > 
> > fled_cdev may be NULL here. The reason is that some controls are for flash
> > LEDs only but the same sub-device may also control an indicator. This is
> > covered when the controls are created, so that the NULL pointer isn't
> > dereferenced.
> 
> I double-checked the code: if a a NULL pointer is passed, the calls
> to the leds framework will try to de-reference it or will return an
> error.
> 
> For instance, those will return an error:
> 
> 	static inline int led_set_flash_strobe(struct led_classdev_flash *fled_cdev,
> 	                                        bool state)
> 	{
> 	        if (!fled_cdev)
> 	                return -EINVAL;
> 	        return fled_cdev->ops->strobe_set(fled_cdev, state);
> 	}
> 
> 	#define call_flash_op(fled_cdev, op, args...)           \
> 	        ((has_flash_op(fled_cdev, op)) ?                        \
> 	                        (fled_cdev->ops->op(fled_cdev, args)) : \
> 	                        -EINVAL)
> 
> No big issue here (except that the function will do nothing but
> return an error).
> 
> However, there are places that it will cause it to de-reference 
> a NULL pointer:
> 
> 	int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value)
> 	{
> 	        if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
> 	                return -EBUSY;
> 	
> 	        led_cdev->brightness = min(value, led_cdev->max_brightness);
> 
> 	        if (led_cdev->flags & LED_SUSPENDED)
> 	                return 0;
> 
> 	        return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
> 	}
> 
> So, this is not a false-positive, but, instead, a real issue.
> 
> So, if led_cdev/fled_cdev can indeed be NULL, IMO, the right solution would be
> to explicitly check it, and return an error, e. g.:
> 
> 	static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> 	{
>         	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
>         	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> 		struct led_classdev *led_cdev;
>         	struct v4l2_ctrl **ctrls = v4l2_flash->ctrls;
>         	bool external_strobe;
>         	int ret = 0;
> 
> 		if (!fled_cdev)
> 			return -EINVAL;

The approach is correct, but as noted, the check needs to be done later.

Could you drop this patch, please?

> 
> 		led_cdev = &fled_cdev->led_cdev;
> 
> 		...
> 
> > 
> > If you wish the false positive to be addressed while also improving the
> > implementation, that could be done by e.g. splitting the switch into two,
> > the part that needs fled_cdev and another that doesn't.
> > 
> > I can send a patch for that.
> > 
> > Please also cc me to V4L2 flash class patches. I noticed this one by
> > accident only.
> 
> Better to add you as a reviewer at the MAINTAINERS file, to
> ensure that you'll always be c/c on such code.

There's no separate entry for flash class, just like the rest of the V4L2
core. I think it could be worth addressing this for all the bits in V4L2
core, but that's separate from this issue in any case.

-- 
Kind regards,

Sakari Ailus
