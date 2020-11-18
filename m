Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419092B7CE5
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgKRLil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:38:41 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54699 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727814AbgKRLik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:38:40 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8696CFF812;
        Wed, 18 Nov 2020 11:38:35 +0000 (UTC)
Date:   Wed, 18 Nov 2020 12:38:38 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v5 2/3] media: atmel: introduce microchip csi2dc driver
Message-ID: <20201118113838.kyz2qw24yowgkerj@uno.localdomain>
References: <20201112133437.372475-1-eugen.hristev@microchip.com>
 <20201112133437.372475-2-eugen.hristev@microchip.com>
 <20201117115902.unnrnccoj3s4gtam@uno.localdomain>
 <20201117120951.GC3940@pendragon.ideasonboard.com>
 <3615c6eb-e475-9a2b-21e5-0b8d8f64f9c6@microchip.com>
 <20201118091133.hr5iwjqijnj6tjfs@uno.localdomain>
 <29449196-f67b-06bd-a586-03309459cc72@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29449196-f67b-06bd-a586-03309459cc72@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Wed, Nov 18, 2020 at 09:48:19AM +0000, Eugen.Hristev@microchip.com wrote:
> On 18.11.2020 11:11, Jacopo Mondi wrote:
> > Hello Eugen,
> >

[snip]

> >> Hello,
> >>
> >> First of all thank you for the review and explanations.
> >>
> >> I am still confused about how does the userspace know which elements are
> >> in the pipeline and how to connect them ?
> >
> > Using the media-controller uAPI to inspect, explore and configure the
> > media graph (it's mostly about enabling and disabling media links),
> > and using the v4l2 subdev uAPI to configure formats, sizes and such on
> > each subdevice device node associated with a media entity. Finally,
> > using the v4l2 uAPI to stream from the top-level driver that expose a
> > video device node.
>
> Okay but which application in userspace uses this userAPI ?

media-ctl which is part of v4l2-utils.

existing applications or frameworks like gstreamer have no notion of
the platform they run on, they can't configure it, they only
understand '/dev/video0'

> So I could use it to test my pipeline.
>

The first step is to use media-ctl to manually setup the pipeline and
test. Once it's setup you can usually keep using the legacy
applications that only stream from /dev/video0.

Of course manually setting up the pipeline using a script does not
scale, that's what the 'libcamera pipeline handler' does in facts.
It implements the same logic that you would manually apply with
media-ctl

> >
> > It's really (conceptually) not different than doing the same using
> > media-ctl and v4l2-ctl.
> >
> >> And if this is the case, what is the purpose of the endpoints in the DT ?
> >>
> >
> > DTS describe the hardware. Usually a driver parses the firmware graph
> > to create and model the media graph and the available connections
> > between media entities but there's no requirement to have a 1-to-1
> > match (as far I'm aware).
>
> So the top level v4l2 driver should parse the whole graph ?
>

Userspace should :)

> >
> > Media links on a media graph then need to be enabled opportunely
> > depending on the desired use case, the platform topology etc
> >
> >> At this moment, I just use the /dev/video0, because the top v4l2 driver
> >> configures the subdevice, and this subdevice configures it's own
> >> subdevice and so on, until the sensor itself.
> >>
> >> My top v4l2 driver will not 'complete' unless a subdevice registers
> >> itself , and if this subdevice does not provide any information
> >> regarding its formats, the probe of the top v4l2 driver will fail,
> >> because it will not find compatibility between it's supported input
> >> formats and what the subdevice provides.
> >
> > ouch, I see.. Which driver is that ?
>
> The atmel image sensor controller driver.
> All sensor drivers that we use (for example : ov5640, ov7740, ov7670)
> register as subdevices, and the atmel-isc will 'complete' when the
> sensor is probed and registered.

That's ok, the complete callback is called when all the async devices
registered in a notifier are matched.

> To have the csi2dc module compatible with what we have on atmel-isc,
> it's natural to have the csi2dc register itself as a subdevice such that
> the atmel-isc can 'complete'.

the csi2d registering as subdev is all good (apart from the issue of
having 2 v4l2_device, but as you've see there's a solution for that
and it's called sub-notifiers).

The 'issue' here is that your top driver wants to match formats to initialize
its supported format list (in isc_formats_init() from what I can see).

An MC driver should not care about that. Each piece of the pipeline
has to be considered in isolation, and the format matching happens at
link_validate() time for links between subdevices and usually at
s_stream(1) time between sub-devices and video devices.

In example, format enumeration on the video device registered by the
top v4l2 driver is conditional to the presence of the mbus_code field
as you can read in:
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-enum-fmt.html?highlight=enum_fmt#c.V4L.VIDIOC_ENUM_FMT

And it should be possible by setting mbus_code = 0 to get a list of
all formats supported -by the hardware- not limited to the current use
case.

Userspace knows the platform and if asked for 640x480[YUV420] will go
and set the right format on each piece of the pipeline, after having
enabled the relevant links, using the right media bus codes and sizes

Totally random example:

        [video0] s_fmt(640x480, PIXFMT_YUV422)
         (pad 0)
           |
           v
         (pad 1) sudev_s_fmt(1, 640x480, MBUS_YUYV8_1X16)
        [csi2dc]       --- your subdev can crop ---
         (pad 0) sudev_s_fmt(0, 648x496, MBUS_YUYV8_1X16)
           |
           V
         (pad 0) subdev_s_fmt(0, 648x496, MBUS_YUYV_1X16)
        [ov5640]

If your top v4l2 driver can produce RGB from a YUV stream it's
perfectly legit then to s_fmt(video0, 640x480, PIXFMT_RGB565) and
subdev_s_fmt(csi2dc, 1, 640x480, MBUS_YUYV8_1X16).

As you can see it all depends on what your hardware can do.

>
>
> >
> > If that's an MC driver, and that seems the case, it should not bother
> > validating the subdevice formats, but only care about listing what its
> > capabilities are.
>
> if this atmel-isc does not offer format capabilities for the userspace
> via the /dev/video0, then all applications that we use (gstreamer
> v4l2src, ffmpeg ) fail.
> What can we use then, if we cannot use these applications ?
>

I think if you setup the pipeline with media-ctl correctly (ie you
don't get any -EPIPE at s_stream) you should be able to keep using
legacy apps, but it very much depends on how they are implemented.

Usually setting up the pipeline using media-ctl and streaming using
v4l2-ctl or yavta is the first validation test.

> >
> >>
> >> So what to do in this case ? Libcamera will configure this whole
> >> pipeline for me , if the drivers just probe ( and start/stop streaming
> >> by selecting the respective registers) ? or how to do this whole
> >> pipeline configuration ?
> >>
> >
> > Well, libcamera offers a framework to enable specialized code (called
> > "pipeline handler") to operate under an high-level API towards application
> > and implement image tuning algorithms on top of that common API.
> >
> > The code to configure the pipeline is device specific (unless your
> > pipeline is very simple). So it's not that libcamera just magically
> > knows how to operate on every platforms it runs on, it needs platform
> > specific code to do so. What you get in exchange is an high level API
> > to offer to application developers, a framework to implement 3A and
> > tuning algorithms, integration with a growing set of other userspace
> > frameworks (android, gstreamer, pipewire and a legacy v4l2-compat
> > layer)
>
> I tried a buildroot with libcamera and gstreamer libcamerasrc , to see
> how it goes. Libcamera does not recognize the /dev/video0 device that we
> have. The v4l2 compatibility layer should not perform exactly this ?

There's no pipeline handler for your platform (unless you have
developed one)

>
> # gst-launch-1.0 libcamerasrc ! fakesink
> Setting pipeline to PAUSED ...
> [0:00:28.448687200] [216]  WARN IPAManager ipa_manager.cpp:147 No IPA
> found in '/usr/lib/libcamera'
> [0:00:28.448890800] [216]  INFO Camera camera_manager.cpp:287 libcamera
> v0.0.0+54328-2020.11-rc2-dirty (2020-11-17T20:58:37+02:00)
> ERROR: from element
> /GstPipeline:pipeline0/GstLibcameraSrc:libcamerasrc0: Could not find any
> supported camera on this system.
            ^
And this is the expected outcome :)

As said, it's not that libcamera magically knows how to deal with all
devices it is run on. We would not need libcamera at all if that was
the case, any application would be self-configurable and that's it :)

