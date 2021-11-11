Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509DB44DDB8
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 23:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhKKWHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 17:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhKKWHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 17:07:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9BBC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 14:04:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A012556;
        Thu, 11 Nov 2021 23:04:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636668289;
        bh=JaXSSl6CfURdaRkByhsdCbwOkUqMFeBkAxaV0dyaN0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jc6Xfs532Wpf9FlPGhGh1ceCQQHpJykOH/PTaw8FfIkjtxuiVaivc7lWP9RkbcqSR
         VNXPkHk9oR/MdVimMs6rXlTz7rgW7CPfYj/HZFgI9tL0Jdtu1CO1ALjpon68HY/JVK
         MQPy+dY+4PsV+zKIRPHADzlJvYMxscWv+9Cky5nU=
Date:   Fri, 12 Nov 2021 00:04:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
References: <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
 <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
 <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Nov 11, 2021 at 07:30:39PM +0000, Dave Stevenson wrote:
> On Thu, 11 Nov 2021 at 16:50, Hans de Goede wrote:
> > On 11/11/21 16:51, Dave Stevenson wrote:
> > > On Thu, 11 Nov 2021 at 15:23, Hans de Goede wrote:
> > >> On 11/11/21 12:18, Daniel Scally wrote:
> > >>
> > >> <snip>
> > >>
> > >>>>> One problem I'm experiencing
> > >>>>> is that the focus position I set isn't maintained; it holds for a couple
> > >>>>> of seconds and then resets to the "normal" focus...this happens when the
> > >>>>> .close() callback for the driver is called, which happens right after
> > >>>>> the control value is applied. All the other VCM drivers in the kernel
> > >>>>> power down on .close() so I did the same>
> > >>>> Right, I believe that this is fine though, we expect people to use
> > >>>> libcamera with this and once libcamera gets autofocus support, then
> > >>>> I would expect libcamera to keep the fd open the entire time while
> > >>>> streaming.
> > >>>
> > >>>
> > >>> OK - as long as that's how it works then I agree that this is fine as is
> > >>> yes.
> > >>
> > >> So I've just picked up an old project of mine, called gtk-v4l which
> > >> is a nice simply v4l2 controls applet and patches it up to also
> > >> work on v4l-subdevs:
> > >>
> > >> https://github.com/jwrdegoede/gtk-v4l/
> > >>
> > >> So now you can run:
> > >>
> > >> sudo gtk-v4l -d /dev/v4l-subdev8
> > >>
> > >> And it will give you a slider to control the focus; and as
> > >> a bonus it keeps the v4l-subdev open, so no more runtime-pm
> > >> issue :)
> > >
> > > Do the lens and sensor share a regulator / enable GPIO?
> >
> > No, if they did then there would be no runtime-pm issue,
> > because then the VCM would not get turned off after
> > a v4l2-set command (for a quick test) since then the
> > streaming from the sensor would keep the sensor and
> > thus the regulator on.
> 
> Registering with the regulator was more so that it restored the
> position on sensor power up, independent of whether the lens driver
> was opened or not.
> 
> > > I was looking at the same issue for a Sony IMX135 module with AD5398
> > > VCM driver [1].
> > > In my case they do share an enable GPIO, so using regulator-gpio we
> > > can register via regulator_register_notifier for information on when
> > > the regulator is powered up. It can then also reset to the last
> > > position should the sensor subdev enable the regulator without the
> > > lens driver being opened at all.
> >
> > That sounds like it is relying on board-depedent behavior
> > (the enable GPIO and/or regulator being shared) which we don't
> > want in the VCM drivers as those are supposed to be board
> > agnostic.
> 
> All platforms I've encountered so far have used the same GPIO to
> control both VCM and sensor, hence why I asked. The number of use
> cases where you want one without the other is incredibly low, and
> hardware guys generally don't like wasting GPIOs or having to route
> them around the PCB. It's interesting that your platform has separated
> them.
> 
> > This really is something which should be fixed in userspace
> > where the userspace consumer of the sensor should also always
> > open the vcm v4l-subdev.
> 
> Not all use cases involve libcamera, and what you're proposing is
> making life very difficult for the simple use cases.
> There may be GStreamer folk on board with libcamera, but I've heard no
> noises from FFmpeg about libcamera support. V4L2 is still the default
> API that users generally care about. Particularly with mono sensors
> the output is often directly usable without worrying about the
> complexities of ISPs, but you're effectively saying "jump through lots
> of hoops or you can't use a VCM with these sensors".

Usage of libcamera is certainly not mandatory, but let's not forget that
we're dealing with complex devices. In most cases applications will want
auto-focus, which will require a userspace camera stack. Even when using
manual focus, apart from moving the lens to the infinity position, there
isn't much that an application could do without some sort of calibration
data. Having to keep the VCM subdev open is the easy part. As long as
this is documented properly in the V4L2 API, I don't think it's a big
issue.

> If userspace has called VIDIOC_STREAMON doesn't that mean they want
> the whole entity (as configured) to be powered on and start streaming?
> Are you saying that the lens isn't part of that entity? In which case
> why does Media Controller include it (and eventually link it to the
> sensor) in the media entity?
> 
> Would you advocate making backlight control in DRM a function that
> userspace is responsible for independently of the panel pipeline?
> There are significant similarities to this situation as the panel
> isn't usable without the backlight being powered, same as the sensor
> isn't usable without the VCM being powered.

Isn't the backlight actually controlled through sysfs separately from
the display pipeline ?

> Sorry, but I just see isolating power control for the VCM from the
> sensor in this way to be a very odd design decision. It'd be
> interesting to hear other views.

Despite the above, I wouldn't oppose powering the VCM automatically when
the sensor is streaming, but I'm concerned about corner cases. For
instance, one may want to keep the VCM powered when toggling streaming
off and then back on. I wouldn't be surprised if there were other need
to have control of VCM power from userspace. I haven't studied the
question in details though.

-- 
Regards,

Laurent Pinchart
