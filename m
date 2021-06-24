Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548D33B2C05
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 11:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhFXKBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 06:01:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231974AbhFXKBr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 06:01:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC29961375;
        Thu, 24 Jun 2021 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624528768;
        bh=4vNra/ysCAO/400dpuyK8i8CCx6Jr7rPCY5U/MN8ex4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jIgdKaQ52wsgneAwmZUSRAir7jCqc0Ge3WA1bWJc1jGfqg42jsPw2s0iVUxJZg931
         dC9EpqTHKpnCwtbZBkvia7C3NpV6+12kVAn0iUDKHpUUfsaF+eB4Mr2hL/gRkKzhgI
         bg/LB/dAGW+qdA12PbJoY2sPzaEILBsAghtk3/O6tCS0HracWEhb7tPyT0Ru0WPEMW
         +XwFKoIDn9V5I74u5TMSl3lE0a0SSKGTuCshcAUabPIVf56mAzgx74ENNrXZlGsCk8
         oGRdwIu0xlinH73OYHpAi2UuYqzNA1TjwI4J9Gs/IqEUGorR0+NuPqx5e1XOHhyNGz
         QE8ygRbTMlGqQ==
Date:   Thu, 24 Jun 2021 11:59:25 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] media: v4l2-flash-led-class: drop an useless check
Message-ID: <20210624115925.357f98b6@coco.lan>
In-Reply-To: <20210624093153.GJ3@valkosipuli.retiisi.eu>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
        <e1629ac223470630eed4096361965d154aff70b7.1624276138.git.mchehab+huawei@kernel.org>
        <20210624093153.GJ3@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 24 Jun 2021 12:31:53 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> Could you check if your mail client could be configured not to add junk to
> To: field? It often leads anything in the Cc: field being dropped.

I have no idea why it is doing that. I'm just using git send-email
here. Perhaps a git bug?

	$ git --version
	git version 2.31.1

The setup is like this one:

	[sendemail]
	        confirm = always
	        multiedit = true
	        chainreplyto = false
	        aliasesfile = /home/mchehab/.addressbook
	        aliasfiletype = pine
	        assume8bitencoding = UTF-8


> 
> On Mon, Jun 21, 2021 at 01:56:47PM +0200, Mauro Carvalho Chehab wrote:
> > As pointed by smatch:
> > 	drivers/media/v4l2-core/v4l2-flash-led-class.c:264 v4l2_flash_s_ctrl() error: we previously assumed 'fled_cdev' could be null (see line 197)
> > 
> > It is too late to check if fled_cdev is NULL there. If such check is
> > needed, it should be, instead, inside v4l2_flash_init().
> > 
> > On other words, if v4l2_flash->fled_cdev() is NULL at
> > v4l2_flash_s_ctrl(), all led_*() function calls inside the function
> > would try to de-reference a NULL pointer, as the logic won't prevent
> > it.
> > 
> > So, remove the useless check.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-flash-led-class.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > index 10ddcc48aa17..a1653c635d82 100644
> > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > @@ -194,7 +194,7 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> >  {
> >  	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
> >  	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> > -	struct led_classdev *led_cdev = fled_cdev ? &fled_cdev->led_cdev : NULL;
> > +	struct led_classdev *led_cdev = &fled_cdev->led_cdev;  
> 
> fled_cdev may be NULL here. The reason is that some controls are for flash
> LEDs only but the same sub-device may also control an indicator. This is
> covered when the controls are created, so that the NULL pointer isn't
> dereferenced.

I double-checked the code: if a a NULL pointer is passed, the calls
to the leds framework will try to de-reference it or will return an
error.

For instance, those will return an error:

	static inline int led_set_flash_strobe(struct led_classdev_flash *fled_cdev,
	                                        bool state)
	{
	        if (!fled_cdev)
	                return -EINVAL;
	        return fled_cdev->ops->strobe_set(fled_cdev, state);
	}

	#define call_flash_op(fled_cdev, op, args...)           \
	        ((has_flash_op(fled_cdev, op)) ?                        \
	                        (fled_cdev->ops->op(fled_cdev, args)) : \
	                        -EINVAL)

No big issue here (except that the function will do nothing but
return an error).

However, there are places that it will cause it to de-reference 
a NULL pointer:

	int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value)
	{
	        if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
	                return -EBUSY;
	
	        led_cdev->brightness = min(value, led_cdev->max_brightness);

	        if (led_cdev->flags & LED_SUSPENDED)
	                return 0;

	        return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
	}

So, this is not a false-positive, but, instead, a real issue.

So, if led_cdev/fled_cdev can indeed be NULL, IMO, the right solution would be
to explicitly check it, and return an error, e. g.:

	static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
	{
        	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
        	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
		struct led_classdev *led_cdev;
        	struct v4l2_ctrl **ctrls = v4l2_flash->ctrls;
        	bool external_strobe;
        	int ret = 0;

		if (!fled_cdev)
			return -EINVAL;

		led_cdev = &fled_cdev->led_cdev;

		...

> 
> If you wish the false positive to be addressed while also improving the
> implementation, that could be done by e.g. splitting the switch into two,
> the part that needs fled_cdev and another that doesn't.
> 
> I can send a patch for that.
> 
> Please also cc me to V4L2 flash class patches. I noticed this one by
> accident only.

Better to add you as a reviewer at the MAINTAINERS file, to
ensure that you'll always be c/c on such code.

Thanks,
Mauro
