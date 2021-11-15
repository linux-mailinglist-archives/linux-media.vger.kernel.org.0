Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3B6450551
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 14:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhKONZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 08:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbhKONZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 08:25:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D97FC061227
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 05:21:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6278D3E;
        Mon, 15 Nov 2021 14:21:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636982511;
        bh=329VKU0UvdAuIl1wN6Agna/xvoBSDTGsR2K5uKVAuKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=evTEDJd2E2aJ1XfFYE6ZAsGczrgrqa1OQl0gR2nA+ttiv07wDFuXF9KdbaF89aHa2
         SGnnzSvJm8jZcbOQMDBntANZ8RfrOE+dwFafysZXuLKh3NHqtm2/5/B0FkU0P2sWmZ
         44iGGn7mrxLtwPgZ1Dq1pOIUI9gvI5011WhT5T8E=
Date:   Mon, 15 Nov 2021 15:21:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YZJe2cWiJYBU4ZGW@pendragon.ideasonboard.com>
References: <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
 <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
 <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
 <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
 <CAPY8ntABHNcgO4iVOryYZsdePVvjTiddZJCBah60LuzSXkL3PA@mail.gmail.com>
 <YY5GIFudxS81q/Qp@pendragon.ideasonboard.com>
 <CAPY8ntAP5LuuRGA8iqupLPXdSbEbcVhrVMFCU44i9cOG=NNjLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAP5LuuRGA8iqupLPXdSbEbcVhrVMFCU44i9cOG=NNjLA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Nov 12, 2021 at 11:43:55AM +0000, Dave Stevenson wrote:
> On Fri, 12 Nov 2021 at 10:47, Laurent Pinchart wrote:
> > On Fri, Nov 12, 2021 at 10:32:31AM +0000, Dave Stevenson wrote:
> > > On Thu, 11 Nov 2021 at 22:04, Laurent Pinchart wrote:
> > > > On Thu, Nov 11, 2021 at 07:30:39PM +0000, Dave Stevenson wrote:
> > > > > On Thu, 11 Nov 2021 at 16:50, Hans de Goede wrote:
> > > > > > On 11/11/21 16:51, Dave Stevenson wrote:
> > > > > > > On Thu, 11 Nov 2021 at 15:23, Hans de Goede wrote:
> > > > > > >> On 11/11/21 12:18, Daniel Scally wrote:
> > > > > > >>
> > > > > > >> <snip>
> > > > > > >>
> > > > > > >>>>> One problem I'm experiencing
> > > > > > >>>>> is that the focus position I set isn't maintained; it holds for a couple
> > > > > > >>>>> of seconds and then resets to the "normal" focus...this happens when the
> > > > > > >>>>> .close() callback for the driver is called, which happens right after
> > > > > > >>>>> the control value is applied. All the other VCM drivers in the kernel
> > > > > > >>>>> power down on .close() so I did the same>
> > > > > > >>>> Right, I believe that this is fine though, we expect people to use
> > > > > > >>>> libcamera with this and once libcamera gets autofocus support, then
> > > > > > >>>> I would expect libcamera to keep the fd open the entire time while
> > > > > > >>>> streaming.
> > > > > > >>>
> > > > > > >>>
> > > > > > >>> OK - as long as that's how it works then I agree that this is fine as is
> > > > > > >>> yes.
> > > > > > >>
> > > > > > >> So I've just picked up an old project of mine, called gtk-v4l which
> > > > > > >> is a nice simply v4l2 controls applet and patches it up to also
> > > > > > >> work on v4l-subdevs:
> > > > > > >>
> > > > > > >> https://github.com/jwrdegoede/gtk-v4l/
> > > > > > >>
> > > > > > >> So now you can run:
> > > > > > >>
> > > > > > >> sudo gtk-v4l -d /dev/v4l-subdev8
> > > > > > >>
> > > > > > >> And it will give you a slider to control the focus; and as
> > > > > > >> a bonus it keeps the v4l-subdev open, so no more runtime-pm
> > > > > > >> issue :)
> > > > > > >
> > > > > > > Do the lens and sensor share a regulator / enable GPIO?
> > > > > >
> > > > > > No, if they did then there would be no runtime-pm issue,
> > > > > > because then the VCM would not get turned off after
> > > > > > a v4l2-set command (for a quick test) since then the
> > > > > > streaming from the sensor would keep the sensor and
> > > > > > thus the regulator on.
> > > > >
> > > > > Registering with the regulator was more so that it restored the
> > > > > position on sensor power up, independent of whether the lens driver
> > > > > was opened or not.
> > > > >
> > > > > > > I was looking at the same issue for a Sony IMX135 module with AD5398
> > > > > > > VCM driver [1].
> > > > > > > In my case they do share an enable GPIO, so using regulator-gpio we
> > > > > > > can register via regulator_register_notifier for information on when
> > > > > > > the regulator is powered up. It can then also reset to the last
> > > > > > > position should the sensor subdev enable the regulator without the
> > > > > > > lens driver being opened at all.
> > > > > >
> > > > > > That sounds like it is relying on board-depedent behavior
> > > > > > (the enable GPIO and/or regulator being shared) which we don't
> > > > > > want in the VCM drivers as those are supposed to be board
> > > > > > agnostic.
> > > > >
> > > > > All platforms I've encountered so far have used the same GPIO to
> > > > > control both VCM and sensor, hence why I asked. The number of use
> > > > > cases where you want one without the other is incredibly low, and
> > > > > hardware guys generally don't like wasting GPIOs or having to route
> > > > > them around the PCB. It's interesting that your platform has separated
> > > > > them.
> > > > >
> > > > > > This really is something which should be fixed in userspace
> > > > > > where the userspace consumer of the sensor should also always
> > > > > > open the vcm v4l-subdev.
> > > > >
> > > > > Not all use cases involve libcamera, and what you're proposing is
> > > > > making life very difficult for the simple use cases.
> > > > > There may be GStreamer folk on board with libcamera, but I've heard no
> > > > > noises from FFmpeg about libcamera support. V4L2 is still the default
> > > > > API that users generally care about. Particularly with mono sensors
> > > > > the output is often directly usable without worrying about the
> > > > > complexities of ISPs, but you're effectively saying "jump through lots
> > > > > of hoops or you can't use a VCM with these sensors".
> > > >
> > > > Usage of libcamera is certainly not mandatory, but let's not forget that
> > > > we're dealing with complex devices. In most cases applications will want
> > > > auto-focus, which will require a userspace camera stack. Even when using
> > > > manual focus, apart from moving the lens to the infinity position, there
> > > > isn't much that an application could do without some sort of calibration
> > > > data. Having to keep the VCM subdev open is the easy part. As long as
> > > > this is documented properly in the V4L2 API, I don't think it's a big
> > > > issue.
> > >
> > > You know I've never been a huge fan of Media Controller, but at least
> > > there you can preconfigure your pipeline via media-ctl and then stream
> > > with v4l2-ctl. If the VCM isn't powered, then v4l2-ctl becomes largely
> > > useless as a test tool without now having a second program to hold the
> > > subdev open (as Hans has found out). The same goes for anything else
> > > that streams a pre-configured pipeline (eg GStreamer v4l2src or FFmpeg
> > > v4l2 plugin).
> > >
> > > Preconfigure your lens position via "v4l2-ctl
> > > --set-ctrl=focus_absolute=X", or have a sensible default in the VCM
> > > driver config (it describes the hardware, so it could be in DT), have
> > > the pipeline handle power, and you still have a usable capture device
> > > through just V4L2. Otherwise you're saying that the powered down
> > > position of the VCM (wherever that might be) is the best you get.
> > >
> > > > > If userspace has called VIDIOC_STREAMON doesn't that mean they want
> > > > > the whole entity (as configured) to be powered on and start streaming?
> > > > > Are you saying that the lens isn't part of that entity? In which case
> > > > > why does Media Controller include it (and eventually link it to the
> > > > > sensor) in the media entity?
> > > > >
> > > > > Would you advocate making backlight control in DRM a function that
> > > > > userspace is responsible for independently of the panel pipeline?
> > > > > There are significant similarities to this situation as the panel
> > > > > isn't usable without the backlight being powered, same as the sensor
> > > > > isn't usable without the VCM being powered.
> > > >
> > > > Isn't the backlight actually controlled through sysfs separately from
> > > > the display pipeline ?
> > >
> > > Brightness is controlled via sysfs, same as lens position is set via
> > > the VCM subdev.
> > > It allows for an override of the state via sysfs, same as you can have
> > > userspace open the VCM subdev.
> > > However drm_panel_enable [1] calls backlight_enable, and
> > > drm_panel_disable [2] calls backlight_disable for automatic control by
> > > the framework.
> > >
> > > [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_panel.c#L151
> > > [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_panel.c#L183
> > >
> > > > > Sorry, but I just see isolating power control for the VCM from the
> > > > > sensor in this way to be a very odd design decision. It'd be
> > > > > interesting to hear other views.
> > > >
> > > > Despite the above, I wouldn't oppose powering the VCM automatically when
> > > > the sensor is streaming, but I'm concerned about corner cases. For
> > > > instance, one may want to keep the VCM powered when toggling streaming
> > > > off and then back on. I wouldn't be surprised if there were other need
> > > > to have control of VCM power from userspace. I haven't studied the
> > > > question in details though.
> > >
> > > Refcount the users. Opening the subdev counts as one, and streaming
> > > counts as one. You can now hold the power on if you wish to do so.
> > >
> > > It's the "let userspace worry about it" that worries me. The same
> > > approach was taken with MC, and it was a pain in the neck for users
> > > until libcamera comes along a decade later.
> > > IMHO V4L2 as an API should be fit for purpose and usable with or
> > > without libcamera.
> >
> > It really depends on the type of device I'm afraid :-) If you want to
> > capture processed image with a raw bayer sensor on RPi, you need to
> > control the ISP, and the 3A algorithms need to run in userspace. For
> > other types of devices, going straight to the kernel API is easier (and
> > can sometimes be preferred).
> 
> But you're forcing a YUYV sensor with VCM to jump through hoops.

Doesn't the YUV sensor with VCM control the VCM from the sensor (or
include a VCM controller in the sensor chip) ? The YUV camera modules
I've seen so far don't require manual power management of the VCM.

> Or a mono sensor with onboard AE (eg most of the OnSemi global shutter
> sensors) and external VCM. Focus control there would have uses in CV
> applications.

That's a valid use case, but I'd still expect it to go through libcamera
(at least on platforms that have an ISP).

> > At the end of the day, I don't think it makes much of a difference
> > though. Once the libcamera API stabilizes, the library gets packaged by
> > distributions and applications start using it (or possibly even through
> > pipewire), nobody will complain about MC anymore :-) The important part,
> > in my opinion, is to handle the complexity somewhere in a framework so
> > that applications don't have to do so manually.
> 
> Has anyone approached FFmpeg then about doing a libcamera integration?

Not that I know of. We've started with GStreamer, and I think we're
approaching a point where we can start working on native libcamera
support in more projects.

> Or is the V4L2 compatibility layer being uprated from "best efforts"
> for "complete support"?

100% compatibility isn't realistic I think, as there are corner cases in
V4L2 that are mostly unused and would be very difficult to emulate.
There's no strict line, and improvements to the V4L2 adaptation layer
are being considered (for instance DMABUF support, as we currently
support MMAP only).

> Until ALL applications support libcamera somehow, then plain old V4L2
> still has a significant place.
> 
> And don't get me started on getting all the examples on the internet
> updated to reflect the new and shiny way of doing things. Have a look
> at the Pi forums at the moment as we've switched to using libcamera
> with Bullseye, and all the complaints of "but I followed these random
> instructions (for V4L2) and it doesn't work".

I think we all agree it will take time (it reminds me a bit of the V4L1
to V4L2 transition).

> > > Telling users that they need to go and read the EDID for their display
> > > themselves and configure the mode would be viewed as daft, but the I2C
> > > channel to a display is largely as independent of the display pipeline
> > > as the VCM is to the video pipeline. Perhaps display pipelines aren't
> > > complex enough?
> >
> > Cameras are too complex :-S
> 
> *Some* cameras are too complex.
> Some display pipelines are pretty hideous as well.

Display pipelines are slowly getting there, I dread to think about the
first display device that will require pushing pipeline configuration
from kernelspace to userspace. I just hope I won't be the one who will
have to work on it :-)

> > > Sorry, just my two-penneth as someone who has to support general
> > > users, rather than just develop platforms or address specific use
> > > cases.
> >
> > As mentioned above, I certainly don't oppose improving power management
> > for VCMs, as well as the VCM control API in general, as long as we can
> > cover all use cases. I'm not familiar enough with the use cases to tell
> > whether making the kernel side more "clever" would be just fine or could
> > cause issues.
> 
> Can I request that it is seriously considered then, rather than just
> documenting it as userspace's responsibility?

Sure, I second that.

> OK, I'll stop pushing my point now.

Thanks for sharing your opinion, it was useful.

-- 
Regards,

Laurent Pinchart
