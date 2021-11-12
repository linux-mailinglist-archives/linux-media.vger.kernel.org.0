Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BD044E64B
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 13:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234900AbhKLM0K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 07:26:10 -0500
Received: from meesny.iki.fi ([195.140.195.201]:58324 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234749AbhKLM0K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 07:26:10 -0500
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 5DCCC202E2;
        Fri, 12 Nov 2021 14:23:13 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1636719793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qTnTR/P9VQRaKi4WoB5sdGuzMGKCX4bsgj6WJZH9P/4=;
        b=B4WnVCcg/TGW2WsAGpHaYxLKcQlF2oWhwpLm0ldSGAZ2fxPekPfoA4qEb2PZv5KAwfUu74
        aNUkwEJ0M/WmMkxB93634BRJf5LThr4GWXz/tRMxf1LlUtcjEmK2L5rUpSKx0Z2TiNKXR6
        ZoiIUKN4Cwm5av8teGFYXcVudf6E2Gw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CF5A5634C90;
        Fri, 12 Nov 2021 14:23:12 +0200 (EET)
Date:   Fri, 12 Nov 2021 14:23:12 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YY5csHGaqsW8KTui@valkosipuli.retiisi.eu>
References: <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
 <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
 <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
 <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
 <CAPY8ntABHNcgO4iVOryYZsdePVvjTiddZJCBah60LuzSXkL3PA@mail.gmail.com>
 <YY5GIFudxS81q/Qp@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YY5GIFudxS81q/Qp@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1636719793; a=rsa-sha256; cv=none;
        b=AwR4Q3/rRrM3trWfYkBhPwDUKcWyaxiekihKlXKDY9Yaqms5WuwWusb2ZdCzygc8QfUyxn
        axhQi8Zz4b/y/N3lb8RxzByG8RU47U1NwKkUBhPWLMOpMN7usAX9xA5K8jC8u14dYLc/C6
        akSP4P3X+vmHvc77bAZppdD1Hr44TQU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1636719793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qTnTR/P9VQRaKi4WoB5sdGuzMGKCX4bsgj6WJZH9P/4=;
        b=Oaf1qi4Z++NyX+AM3eT/43WlfmC3ADvMOS81fMazja1lOFbcvoRqQlaJvaP8rg31eEe/wI
        jL64xIh8klzV/lOrUl0YQEOFZimylFmVcz2r7oUE9UwCuFjDunQj6h4EAOTrB7cXul8pfF
        53hB4FJCSUn+c6zUQZUwl7ZvVnC/jKM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Dave,

On Fri, Nov 12, 2021 at 12:46:56PM +0200, Laurent Pinchart wrote:
> Hi Dave,
> 
> CC'ing Sakari.
> 
> On Fri, Nov 12, 2021 at 10:32:31AM +0000, Dave Stevenson wrote:
> > On Thu, 11 Nov 2021 at 22:04, Laurent Pinchart wrote:
> > > On Thu, Nov 11, 2021 at 07:30:39PM +0000, Dave Stevenson wrote:
> > > > On Thu, 11 Nov 2021 at 16:50, Hans de Goede wrote:
> > > > > On 11/11/21 16:51, Dave Stevenson wrote:
> > > > > > On Thu, 11 Nov 2021 at 15:23, Hans de Goede wrote:
> > > > > >> On 11/11/21 12:18, Daniel Scally wrote:
> > > > > >>
> > > > > >> <snip>
> > > > > >>
> > > > > >>>>> One problem I'm experiencing
> > > > > >>>>> is that the focus position I set isn't maintained; it holds for a couple
> > > > > >>>>> of seconds and then resets to the "normal" focus...this happens when the
> > > > > >>>>> .close() callback for the driver is called, which happens right after
> > > > > >>>>> the control value is applied. All the other VCM drivers in the kernel
> > > > > >>>>> power down on .close() so I did the same>
> > > > > >>>> Right, I believe that this is fine though, we expect people to use
> > > > > >>>> libcamera with this and once libcamera gets autofocus support, then
> > > > > >>>> I would expect libcamera to keep the fd open the entire time while
> > > > > >>>> streaming.
> > > > > >>>
> > > > > >>>
> > > > > >>> OK - as long as that's how it works then I agree that this is fine as is
> > > > > >>> yes.
> > > > > >>
> > > > > >> So I've just picked up an old project of mine, called gtk-v4l which
> > > > > >> is a nice simply v4l2 controls applet and patches it up to also
> > > > > >> work on v4l-subdevs:
> > > > > >>
> > > > > >> https://github.com/jwrdegoede/gtk-v4l/
> > > > > >>
> > > > > >> So now you can run:
> > > > > >>
> > > > > >> sudo gtk-v4l -d /dev/v4l-subdev8
> > > > > >>
> > > > > >> And it will give you a slider to control the focus; and as
> > > > > >> a bonus it keeps the v4l-subdev open, so no more runtime-pm
> > > > > >> issue :)
> > > > > >
> > > > > > Do the lens and sensor share a regulator / enable GPIO?
> > > > >
> > > > > No, if they did then there would be no runtime-pm issue,
> > > > > because then the VCM would not get turned off after
> > > > > a v4l2-set command (for a quick test) since then the
> > > > > streaming from the sensor would keep the sensor and
> > > > > thus the regulator on.
> > > >
> > > > Registering with the regulator was more so that it restored the
> > > > position on sensor power up, independent of whether the lens driver
> > > > was opened or not.
> > > >
> > > > > > I was looking at the same issue for a Sony IMX135 module with AD5398
> > > > > > VCM driver [1].
> > > > > > In my case they do share an enable GPIO, so using regulator-gpio we
> > > > > > can register via regulator_register_notifier for information on when
> > > > > > the regulator is powered up. It can then also reset to the last
> > > > > > position should the sensor subdev enable the regulator without the
> > > > > > lens driver being opened at all.
> > > > >
> > > > > That sounds like it is relying on board-depedent behavior
> > > > > (the enable GPIO and/or regulator being shared) which we don't
> > > > > want in the VCM drivers as those are supposed to be board
> > > > > agnostic.
> > > >
> > > > All platforms I've encountered so far have used the same GPIO to
> > > > control both VCM and sensor, hence why I asked. The number of use
> > > > cases where you want one without the other is incredibly low, and
> > > > hardware guys generally don't like wasting GPIOs or having to route
> > > > them around the PCB. It's interesting that your platform has separated
> > > > them.
> > > >
> > > > > This really is something which should be fixed in userspace
> > > > > where the userspace consumer of the sensor should also always
> > > > > open the vcm v4l-subdev.
> > > >
> > > > Not all use cases involve libcamera, and what you're proposing is
> > > > making life very difficult for the simple use cases.
> > > > There may be GStreamer folk on board with libcamera, but I've heard no
> > > > noises from FFmpeg about libcamera support. V4L2 is still the default
> > > > API that users generally care about. Particularly with mono sensors
> > > > the output is often directly usable without worrying about the
> > > > complexities of ISPs, but you're effectively saying "jump through lots
> > > > of hoops or you can't use a VCM with these sensors".
> > >
> > > Usage of libcamera is certainly not mandatory, but let's not forget that
> > > we're dealing with complex devices. In most cases applications will want
> > > auto-focus, which will require a userspace camera stack. Even when using
> > > manual focus, apart from moving the lens to the infinity position, there
> > > isn't much that an application could do without some sort of calibration
> > > data. Having to keep the VCM subdev open is the easy part. As long as
> > > this is documented properly in the V4L2 API, I don't think it's a big
> > > issue.
> > 
> > You know I've never been a huge fan of Media Controller, but at least
> > there you can preconfigure your pipeline via media-ctl and then stream
> > with v4l2-ctl. If the VCM isn't powered, then v4l2-ctl becomes largely
> > useless as a test tool without now having a second program to hold the
> > subdev open (as Hans has found out). The same goes for anything else
> > that streams a pre-configured pipeline (eg GStreamer v4l2src or FFmpeg
> > v4l2 plugin).
> > 
> > Preconfigure your lens position via "v4l2-ctl
> > --set-ctrl=focus_absolute=X", or have a sensible default in the VCM
> > driver config (it describes the hardware, so it could be in DT), have
> > the pipeline handle power, and you still have a usable capture device
> > through just V4L2. Otherwise you're saying that the powered down
> > position of the VCM (wherever that might be) is the best you get.

Note that on some camera modules, the sensor and the VCM power-up and
power-down sequences are intertwined. So if you power up one without the
other, powering up the other later on may no longer be possible.

I have to say I don't know how common such camera modules are nowadays. My
guess is that they're rare.

> > 
> > > > If userspace has called VIDIOC_STREAMON doesn't that mean they want
> > > > the whole entity (as configured) to be powered on and start streaming?
> > > > Are you saying that the lens isn't part of that entity? In which case
> > > > why does Media Controller include it (and eventually link it to the
> > > > sensor) in the media entity?
> > > >
> > > > Would you advocate making backlight control in DRM a function that
> > > > userspace is responsible for independently of the panel pipeline?
> > > > There are significant similarities to this situation as the panel
> > > > isn't usable without the backlight being powered, same as the sensor
> > > > isn't usable without the VCM being powered.
> > >
> > > Isn't the backlight actually controlled through sysfs separately from
> > > the display pipeline ?
> > 
> > Brightness is controlled via sysfs, same as lens position is set via
> > the VCM subdev.
> > It allows for an override of the state via sysfs, same as you can have
> > userspace open the VCM subdev.
> > However drm_panel_enable [1] calls backlight_enable, and
> > drm_panel_disable [2] calls backlight_disable for automatic control by
> > the framework.
> > 
> > [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_panel.c#L151
> > [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_panel.c#L183
> > 
> > > > Sorry, but I just see isolating power control for the VCM from the
> > > > sensor in this way to be a very odd design decision. It'd be
> > > > interesting to hear other views.
> > >
> > > Despite the above, I wouldn't oppose powering the VCM automatically when
> > > the sensor is streaming, but I'm concerned about corner cases. For
> > > instance, one may want to keep the VCM powered when toggling streaming
> > > off and then back on. I wouldn't be surprised if there were other need
> > > to have control of VCM power from userspace. I haven't studied the
> > > question in details though.
> > 
> > Refcount the users. Opening the subdev counts as one, and streaming
> > counts as one. You can now hold the power on if you wish to do so.
> > 
> > It's the "let userspace worry about it" that worries me. The same
> > approach was taken with MC, and it was a pain in the neck for users
> > until libcamera comes along a decade later.
> > IMHO V4L2 as an API should be fit for purpose and usable with or
> > without libcamera.
> 
> It really depends on the type of device I'm afraid :-) If you want to
> capture processed image with a raw bayer sensor on RPi, you need to
> control the ISP, and the 3A algorithms need to run in userspace. For
> other types of devices, going straight to the kernel API is easier (and
> can sometimes be preferred).
> 
> At the end of the day, I don't think it makes much of a difference
> though. Once the libcamera API stabilizes, the library gets packaged by
> distributions and applications start using it (or possibly even through
> pipewire), nobody will complain about MC anymore :-) The important part,
> in my opinion, is to handle the complexity somewhere in a framework so
> that applications don't have to do so manually.

Agreed.

The user space would need to open the device node of the lens, and a
non-test user space would in any case keep the device node open in order to
change lens drive current.

In the kernel I think we'd need probably a new (subdev) API for just that.
Poking other devices with runtime PM calls isn't the right way to do it.

This is a trivial matter compared to video node centric vs. MC centric
case.

> As mentioned above, I certainly don't oppose improving power management
> for VCMs, as well as the VCM control API in general, as long as we can
> cover all use cases. I'm not familiar enough with the use cases to tell
> whether making the kernel side more "clever" would be just fine or could
> cause issues.

Usually if you're using a VCM then you need a way to focus the image. I
guess VCMs have been getting better so you might be able to get decent
images without focussing in VCM resting position if the target is distant
enough, too. But that's just a guess. So theoretically there's possibility
of saving a little bit of power.

-- 
Regards,

Sakari Ailus
