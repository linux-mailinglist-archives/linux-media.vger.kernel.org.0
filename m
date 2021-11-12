Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D86C44E4A0
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 11:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbhKLKfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 05:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234675AbhKLKfk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 05:35:40 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46CAC061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 02:32:49 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 133so7340117wme.0
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 02:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lEgRWZPJOnuaXyVqSLHqW3ZI0kRkx6uv+t5iGzsqTSQ=;
        b=b7I6dsuMphrrez1452Etqw93omgStljnKAbBEOtMb0GC+Ovdr5Kqqy+lGfhfsaIFTR
         8tEcA2Z5lukrTFWoTi39+kS9qsMEcJiv8iIVVcKvehsGQztk1ERCGK3qcbq9HQWRG8kR
         yl+SL6GEa2urMvovOHd4CZC0ZqnqYdgh8qwxbrK3DnYgdTOTJgTcAfJ23RRIXmvqwzWP
         VRmU/Jg5aFxEKkjjWI//IpZlW4593R9xyVlirYy/2zAq3+QY+/yEMpeL1vgVCoEzf7Ii
         Lq2MRpwN5Akj//6Bq+1sqiZzMmH3LgSYSxj0J629Q3Zs5vT08Bmyx1AucekD1beGjbdt
         acmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lEgRWZPJOnuaXyVqSLHqW3ZI0kRkx6uv+t5iGzsqTSQ=;
        b=0R4UXC8KhkwDbnKqVHxpcCIf9/1lhql6GILRBmwRxIwrpE62gdKhAoChJ40imosK55
         gkzhtL35Y9eSZ55OzHOivbY+uoZvuv02h68C/dVLahpEDGkYyQ15XXl/SBnzJrenVAhb
         Hkzn/6+w6GrP5UKzHg47LUV7SD5hKperk3fUb4Z7rsUj1kADGK3wTud3vpszUpB1qUXS
         sagRlzkps5ZZEQjw1KCvmFxQfcRX0rh1MSzeV05Mqbh+TLznSQ2t56vRZXC50h2H7vuk
         jVXr/tzmbFUTOj7W1pYzDyCbhvawoQjNT9qWRTpI5adoXdEBYY5rZGVtpXkSWyRDnuv9
         oN1g==
X-Gm-Message-State: AOAM533BGUycQepG7hM4dJxvarmvroPceXvdEtgh0cLk4BtiUhF5a71O
        HRe98u9jTRKVIDepIo9UE2/6ZXgox0Xs0gZF7i6doA==
X-Google-Smtp-Source: ABdhPJwXYjwXRutw8o9DY1Qex+uF2PYT5LR3N+WCFgoTOTNC06Xc/jtSC1DsVygCbsW49/96CmIn3pbi/sKjq6Sh0yo=
X-Received: by 2002:a05:600c:358a:: with SMTP id p10mr15622734wmq.180.1636713168180;
 Fri, 12 Nov 2021 02:32:48 -0800 (PST)
MIME-Version: 1.0
References: <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com> <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com> <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com> <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
 <6e832988-4810-fe59-7357-886b286697a0@redhat.com> <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
 <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
In-Reply-To: <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 12 Nov 2021 10:32:31 +0000
Message-ID: <CAPY8ntABHNcgO4iVOryYZsdePVvjTiddZJCBah60LuzSXkL3PA@mail.gmail.com>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass acpi_enforce_resources=lax
 on the Surface Go (version1))
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 11 Nov 2021 at 22:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Thu, Nov 11, 2021 at 07:30:39PM +0000, Dave Stevenson wrote:
> > On Thu, 11 Nov 2021 at 16:50, Hans de Goede wrote:
> > > On 11/11/21 16:51, Dave Stevenson wrote:
> > > > On Thu, 11 Nov 2021 at 15:23, Hans de Goede wrote:
> > > >> On 11/11/21 12:18, Daniel Scally wrote:
> > > >>
> > > >> <snip>
> > > >>
> > > >>>>> One problem I'm experiencing
> > > >>>>> is that the focus position I set isn't maintained; it holds for a couple
> > > >>>>> of seconds and then resets to the "normal" focus...this happens when the
> > > >>>>> .close() callback for the driver is called, which happens right after
> > > >>>>> the control value is applied. All the other VCM drivers in the kernel
> > > >>>>> power down on .close() so I did the same>
> > > >>>> Right, I believe that this is fine though, we expect people to use
> > > >>>> libcamera with this and once libcamera gets autofocus support, then
> > > >>>> I would expect libcamera to keep the fd open the entire time while
> > > >>>> streaming.
> > > >>>
> > > >>>
> > > >>> OK - as long as that's how it works then I agree that this is fine as is
> > > >>> yes.
> > > >>
> > > >> So I've just picked up an old project of mine, called gtk-v4l which
> > > >> is a nice simply v4l2 controls applet and patches it up to also
> > > >> work on v4l-subdevs:
> > > >>
> > > >> https://github.com/jwrdegoede/gtk-v4l/
> > > >>
> > > >> So now you can run:
> > > >>
> > > >> sudo gtk-v4l -d /dev/v4l-subdev8
> > > >>
> > > >> And it will give you a slider to control the focus; and as
> > > >> a bonus it keeps the v4l-subdev open, so no more runtime-pm
> > > >> issue :)
> > > >
> > > > Do the lens and sensor share a regulator / enable GPIO?
> > >
> > > No, if they did then there would be no runtime-pm issue,
> > > because then the VCM would not get turned off after
> > > a v4l2-set command (for a quick test) since then the
> > > streaming from the sensor would keep the sensor and
> > > thus the regulator on.
> >
> > Registering with the regulator was more so that it restored the
> > position on sensor power up, independent of whether the lens driver
> > was opened or not.
> >
> > > > I was looking at the same issue for a Sony IMX135 module with AD5398
> > > > VCM driver [1].
> > > > In my case they do share an enable GPIO, so using regulator-gpio we
> > > > can register via regulator_register_notifier for information on when
> > > > the regulator is powered up. It can then also reset to the last
> > > > position should the sensor subdev enable the regulator without the
> > > > lens driver being opened at all.
> > >
> > > That sounds like it is relying on board-depedent behavior
> > > (the enable GPIO and/or regulator being shared) which we don't
> > > want in the VCM drivers as those are supposed to be board
> > > agnostic.
> >
> > All platforms I've encountered so far have used the same GPIO to
> > control both VCM and sensor, hence why I asked. The number of use
> > cases where you want one without the other is incredibly low, and
> > hardware guys generally don't like wasting GPIOs or having to route
> > them around the PCB. It's interesting that your platform has separated
> > them.
> >
> > > This really is something which should be fixed in userspace
> > > where the userspace consumer of the sensor should also always
> > > open the vcm v4l-subdev.
> >
> > Not all use cases involve libcamera, and what you're proposing is
> > making life very difficult for the simple use cases.
> > There may be GStreamer folk on board with libcamera, but I've heard no
> > noises from FFmpeg about libcamera support. V4L2 is still the default
> > API that users generally care about. Particularly with mono sensors
> > the output is often directly usable without worrying about the
> > complexities of ISPs, but you're effectively saying "jump through lots
> > of hoops or you can't use a VCM with these sensors".
>
> Usage of libcamera is certainly not mandatory, but let's not forget that
> we're dealing with complex devices. In most cases applications will want
> auto-focus, which will require a userspace camera stack. Even when using
> manual focus, apart from moving the lens to the infinity position, there
> isn't much that an application could do without some sort of calibration
> data. Having to keep the VCM subdev open is the easy part. As long as
> this is documented properly in the V4L2 API, I don't think it's a big
> issue.

You know I've never been a huge fan of Media Controller, but at least
there you can preconfigure your pipeline via media-ctl and then stream
with v4l2-ctl. If the VCM isn't powered, then v4l2-ctl becomes largely
useless as a test tool without now having a second program to hold the
subdev open (as Hans has found out). The same goes for anything else
that streams a pre-configured pipeline (eg GStreamer v4l2src or FFmpeg
v4l2 plugin).

Preconfigure your lens position via "v4l2-ctl
--set-ctrl=focus_absolute=X", or have a sensible default in the VCM
driver config (it describes the hardware, so it could be in DT), have
the pipeline handle power, and you still have a usable capture device
through just V4L2. Otherwise you're saying that the powered down
position of the VCM (wherever that might be) is the best you get.

> > If userspace has called VIDIOC_STREAMON doesn't that mean they want
> > the whole entity (as configured) to be powered on and start streaming?
> > Are you saying that the lens isn't part of that entity? In which case
> > why does Media Controller include it (and eventually link it to the
> > sensor) in the media entity?
> >
> > Would you advocate making backlight control in DRM a function that
> > userspace is responsible for independently of the panel pipeline?
> > There are significant similarities to this situation as the panel
> > isn't usable without the backlight being powered, same as the sensor
> > isn't usable without the VCM being powered.
>
> Isn't the backlight actually controlled through sysfs separately from
> the display pipeline ?

Brightness is controlled via sysfs, same as lens position is set via
the VCM subdev.
It allows for an override of the state via sysfs, same as you can have
userspace open the VCM subdev.
However drm_panel_enable [1] calls backlight_enable, and
drm_panel_disable [2] calls backlight_disable for automatic control by
the framework.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_panel.c#L151
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_panel.c#L183

> > Sorry, but I just see isolating power control for the VCM from the
> > sensor in this way to be a very odd design decision. It'd be
> > interesting to hear other views.
>
> Despite the above, I wouldn't oppose powering the VCM automatically when
> the sensor is streaming, but I'm concerned about corner cases. For
> instance, one may want to keep the VCM powered when toggling streaming
> off and then back on. I wouldn't be surprised if there were other need
> to have control of VCM power from userspace. I haven't studied the
> question in details though.

Refcount the users. Opening the subdev counts as one, and streaming
counts as one. You can now hold the power on if you wish to do so.

It's the "let userspace worry about it" that worries me. The same
approach was taken with MC, and it was a pain in the neck for users
until libcamera comes along a decade later.
IMHO V4L2 as an API should be fit for purpose and usable with or
without libcamera.
Telling users that they need to go and read the EDID for their display
themselves and configure the mode would be viewed as daft, but the I2C
channel to a display is largely as independent of the display pipeline
as the VCM is to the video pipeline. Perhaps display pipelines aren't
complex enough?

Sorry, just my two-penneth as someone who has to support general
users, rather than just develop platforms or address specific use
cases.

  Dave
