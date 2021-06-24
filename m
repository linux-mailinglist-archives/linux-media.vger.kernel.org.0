Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93773B2D66
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 13:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbhFXLPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 07:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbhFXLPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 07:15:13 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A882C061574;
        Thu, 24 Jun 2021 04:12:54 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 5DC6E1B001A5;
        Thu, 24 Jun 2021 14:12:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1624533172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1qzhlrXC0wPeGZ7oSreUo8Do8dTv//1G8zRRIlr3ERI=;
        b=OQafcfPYTuhH956c14NnhD8jFOynZ8GeazG+91DZ7fxkJq9QMwDyT3rqU1ADFzPYzjAj1d
        XHOb8jM7udyc7irXKwsNXvk7s6F7cjGwP7olkyLKCBEoeYFuczolzISS3zmbsw2KqRF9+0
        ZhOHSfuBgniUu/TnU/p/KVG5RycVlp+p0iHW0kqP86Hh8dEiKgHXjBc+O5nPJaww3R4Dlj
        +aLkowAfW52sKpEhQNMFsVnGtKDzGlhnLBRVUgl4T4LOuv0UjmGw6sa+WYnK6DAi1/Tv3u
        DvvWpF+8+8kWSSGl4Me5iJhCZxCxAQvXUY0dxkOnEJ14XaEeKZV9/adJ3c9eXA==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B1B3D634C87;
        Thu, 24 Jun 2021 14:12:36 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lwNHw-00019i-Bt; Thu, 24 Jun 2021 14:12:52 +0300
Date:   Thu, 24 Jun 2021 14:12:52 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] media: v4l2-flash-led-class: drop an useless check
Message-ID: <20210624111252.GL3@valkosipuli.retiisi.eu>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
 <e1629ac223470630eed4096361965d154aff70b7.1624276138.git.mchehab+huawei@kernel.org>
 <20210624093153.GJ3@valkosipuli.retiisi.eu>
 <20210624115925.357f98b6@coco.lan>
 <20210624101443.GK3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624101443.GK3@valkosipuli.retiisi.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1624533172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1qzhlrXC0wPeGZ7oSreUo8Do8dTv//1G8zRRIlr3ERI=;
        b=GrEOJBOJrl8vL3Xci9So2WG53d3dIPb1LCR1TgL5qjrL0iW03lj99xcZs4um+jBCzPbOZU
        Lt1GpHF9lRjisn2wsteNKyPE6jn+sU0711MMxophJphnZMpFOhv75zyvY/35XaFDpKQtrH
        W5ssbibwOrLX0XS8gIYnsu/ieYaVsAouVZO2eQ3ztoA3aZ4xIdvRFFz2w1c+tqaUQlyWbg
        gQgrhmajuF5l3ZCtxTvPW90nVHpqCq7PqNId1T9/ZreXl6x8iHyqaAKepyHcb7fN2eS5tj
        Qrdscn/Oh1D/9phkodtn8QGoSB8syh8nPSzoaSIeFArUHlCeyWJkHMzfYH1GlA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1624533172; a=rsa-sha256;
        cv=none;
        b=MgRNuuRmSy/ELOy08p5GEckKmc9079X4jO0pI826tGtPj7twSpMQG/Ep3mqvSRZPyTGYgx
        /N7sxnJWOxtOIJNz6V5y+CkMWW77HT1MnNjPWXpRkBgIcgtB5RQvIvaUuCVAgK7jpUEck7
        UVOX94RoW3PJyMGFEIYGiKbSiyr7URudclEvBh4a/ibSj8bI0T9gRn62OMGGMr9lBeKajD
        4niHXrG17EOAVP8xCCF5/z3maJQJ1F+C/n4SbEKrzDpAtIGIm+vfOcfVRwNUzQ6DSxvkBJ
        e3P1AxMaeS5/FjZuGL3zRddZMgWNQsDiJfags13q6r5RI62rE9YKao0Ni1o4Fg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 01:14:43PM +0300, Sakari Ailus wrote:

...

> > > On Mon, Jun 21, 2021 at 01:56:47PM +0200, Mauro Carvalho Chehab wrote:
> > > > As pointed by smatch:
> > > > 	drivers/media/v4l2-core/v4l2-flash-led-class.c:264 v4l2_flash_s_ctrl() error: we previously assumed 'fled_cdev' could be null (see line 197)
> > > > 
> > > > It is too late to check if fled_cdev is NULL there. If such check is
> > > > needed, it should be, instead, inside v4l2_flash_init().
> > > > 
> > > > On other words, if v4l2_flash->fled_cdev() is NULL at
> > > > v4l2_flash_s_ctrl(), all led_*() function calls inside the function
> > > > would try to de-reference a NULL pointer, as the logic won't prevent
> > > > it.
> > > > 
> > > > So, remove the useless check.
> > > > 
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-flash-led-class.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > > index 10ddcc48aa17..a1653c635d82 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > > @@ -194,7 +194,7 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> > > >  {
> > > >  	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
> > > >  	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> > > > -	struct led_classdev *led_cdev = fled_cdev ? &fled_cdev->led_cdev : NULL;
> > > > +	struct led_classdev *led_cdev = &fled_cdev->led_cdev;  
> > > 
> > > fled_cdev may be NULL here. The reason is that some controls are for flash
> > > LEDs only but the same sub-device may also control an indicator. This is
> > > covered when the controls are created, so that the NULL pointer isn't
> > > dereferenced.
> > 
> > I double-checked the code: if a a NULL pointer is passed, the calls
> > to the leds framework will try to de-reference it or will return an
> > error.
> > 
> > For instance, those will return an error:
> > 
> > 	static inline int led_set_flash_strobe(struct led_classdev_flash *fled_cdev,
> > 	                                        bool state)
> > 	{
> > 	        if (!fled_cdev)
> > 	                return -EINVAL;
> > 	        return fled_cdev->ops->strobe_set(fled_cdev, state);
> > 	}
> > 
> > 	#define call_flash_op(fled_cdev, op, args...)           \
> > 	        ((has_flash_op(fled_cdev, op)) ?                        \
> > 	                        (fled_cdev->ops->op(fled_cdev, args)) : \
> > 	                        -EINVAL)
> > 
> > No big issue here (except that the function will do nothing but
> > return an error).
> > 
> > However, there are places that it will cause it to de-reference 
> > a NULL pointer:
> > 
> > 	int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value)
> > 	{
> > 	        if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
> > 	                return -EBUSY;
> > 	
> > 	        led_cdev->brightness = min(value, led_cdev->max_brightness);
> > 
> > 	        if (led_cdev->flags & LED_SUSPENDED)
> > 	                return 0;
> > 
> > 	        return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
> > 	}
> > 
> > So, this is not a false-positive, but, instead, a real issue.
> > 
> > So, if led_cdev/fled_cdev can indeed be NULL, IMO, the right solution would be
> > to explicitly check it, and return an error, e. g.:
> > 
> > 	static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> > 	{
> >         	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
> >         	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> > 		struct led_classdev *led_cdev;
> >         	struct v4l2_ctrl **ctrls = v4l2_flash->ctrls;
> >         	bool external_strobe;
> >         	int ret = 0;
> > 
> > 		if (!fled_cdev)
> > 			return -EINVAL;
> 
> The approach is correct, but as noted, the check needs to be done later.

I checked that the same pattern is used throughout much of the file. I
suppose if smatch isn't happy with this instance, it may not be happy with
the rest either. Admittedly, the pattern isn't entirely trouble-free, as it
requires the parts of the file to be in sync.

Addressing this takes probably a few patches at least.

-- 
Sakari Ailus
