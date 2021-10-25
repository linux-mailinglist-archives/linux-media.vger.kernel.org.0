Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBE14394A1
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 13:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbhJYLUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 07:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhJYLUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 07:20:01 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0ACC061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 04:17:39 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id d3so8005175wrh.8
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RcfAYp5IIElF7w3McEB+Dbnj+yuADRZsTUdoj6M5UhM=;
        b=LCHocTuc0PuSU5MCqW7kBZSwv6B4wtUIXqttCYG9Fw6hqYaH6MRI0A11YwxrM1a79I
         VM96JO82XPIBcGohNDdB8MAouQfZ3WpMqO2kx546w6mnm9FOWU1GunMrmmKAXB2FiOSS
         qlbVKD+CkaIgon8nNxUD5xigIRX5d/4Pl8OTAzbKY/oYp8FotB88JYsFG6e4Hk/ruDYR
         M6Zf0eVAQc+7OjAuGMipPqzZpgcGJkO/Y5TmjdT7ZjILReazFmfgbwgAuVkKsN3NJ37q
         d2C3gU3ZBO+yuPTwctgJCGnspbtfp3dG7Udev+GNc2+bN41en/fLtssREGvN9pH8c/6t
         k96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RcfAYp5IIElF7w3McEB+Dbnj+yuADRZsTUdoj6M5UhM=;
        b=LM8ldBe5pKLRAjsy1EvEi3dVNjUSqhwaYhvwwWzMKgTrHVrpR2eRcdtokoi8p+YcFp
         rvBnEteT3FaY0pDwBhk7/y5E9hQXnizTojjsnWFRelA41IQ+t111IrfkVi1JOGJI1R2Q
         nQPxi+7qC0/fBtvKFEN2zBzOdgsuEOBBcPJwljNY7Qx4e064LC8deCufsnBZZOlAj/ra
         pXvoQiqkLseIEbtJx0apt+ewZzuHl72mIKKgbw1SxMfMt/vC5pyEChPHujCZF6OVojKh
         rRzehGIN6cDJLHqsv3lrZhFWaGp9l3FO+EJ9AWZpEeXY2bwM3UCQ/9Ca/6lcqYpyOW3G
         dmNQ==
X-Gm-Message-State: AOAM533hjihE1o6RfDRHxVuW0aUXerJzGXmU8HNg0726h3eumzBk1XVy
        j01/hL5sei/7Ea/04YlT/TQF4NvUaDzg5X25o8yOJw==
X-Google-Smtp-Source: ABdhPJwSj0rwhBKb9LAV3IEanrT7+fpLSjk8NYuCuGxmkChFxVgmuuNd5S9TVhLKxcGkCUeMF5DOz5RO1E+B9kFS+Cs=
X-Received: by 2002:adf:fe45:: with SMTP id m5mr22993964wrs.197.1635160657562;
 Mon, 25 Oct 2021 04:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
 <YXaHMd3czQy0NKJn@pendragon.ideasonboard.com> <30ad631c-6c6e-6c1a-7b0a-d50d70a169d2@xs4all.nl>
 <CAPY8ntBveayxaJGXSXp3bDs4gxz1io2hqHBBEc=JjWTy20pnww@mail.gmail.com> <db53d337-7271-3950-1309-f97f1b468646@xs4all.nl>
In-Reply-To: <db53d337-7271-3950-1309-f97f1b468646@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 25 Oct 2021 12:17:22 +0100
Message-ID: <CAPY8ntBXz6+OvNabuSweQf=NKWH_xCvXwLwArEZuD9RnU73XBA@mail.gmail.com>
Subject: Re: [libcamera-devel] Userspace API for controlling the focus of the
 Surface Go [2] main/back-camera
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Mon, 25 Oct 2021 at 12:10, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 25/10/2021 13:03, Dave Stevenson wrote:
> > Hi All.
> >
> > On Mon, 25 Oct 2021 at 11:47, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 25/10/2021 12:30, Laurent Pinchart wrote:
> >>> Hi Hans,
> >>>
> >>> On Mon, Oct 25, 2021 at 12:06:30PM +0200, Hans de Goede wrote:
> >>>> Hi All,
> >>>>
> >>>> With my (and Dan's) kernel patch-series to enable the back camera on
> >>>> the Surface Go shaping up (and hopefully going upstream soon),
> >>>> the next step is to enable control of the focus lens for the back
> >>>> camera.
> >>>>
> >>>> The focus is controlled through a separate i2c-client which is
> >>>> described by a 2nd I2cSerialBusV2 resource entry in the ACPI
> >>>> device for the ov8865 sensor. By default the kernel only instantiates
> >>>> an i2c-client for the first I2cSerialBusV2 resource entry for an
> >>>> ACPI device, getting an i2c-client for the 2nd one is easy and
> >>>> out of scope for this discussion.
> >>>>
> >>>> The question which I have is, assuming we have the 2nd i2c-client
> >>>> instantiated and we have a i2c-driver binding to it, how do we
> >>>> represent the focus control to userspace.
> >>>>
> >>>> I see 2 possible directions we can go here:
> >>>>
> >>>> 1. Somehow inject an extra v4l2ctrl for this into the v4l2ctrl
> >>>> list of the sensor. AFAIK we don't have infra for this atm, but
> >>>> we could add some generic mechanism to do this to the v4l2-ctrls
> >>>> core. IMHO from a userspace pov this is the cleanest, but at the
> >>>> cost of some extra work / possible ugliness on the kernel side.
> >>>>
> >>>> 2. Register a separate v4l2_subdev for the focus-ctrl and in
> >>>> some way provide information to userspace to which sensor this
> >>>> belongs.
> >>>
> >>> The second approach is what V4L2 does already. We have a set of drivers
> >>> for VCMs already (search for V4L2_CID_FOCUS_ABSOLUTE in
> >>> drivers/media/i2c/).
> >>>
> >>>> I believe that both are valid approaches. So before diving into
> >>>> this I wonder what others are thinking about this.
> >>>>
> >>>> Specific questions:
> >>>>
> >>>> 1. Hans Verkuil, what do you think about adding
> >>>> support for another driver to inject ctrls into the ctrl
> >>>> list of another v4l2(sub)dev ? Maybe something like this
> >>>> already exists ? If not do you think this is feasible
> >>>> and desirable to add ?
> >>>>
> >>>> 2. If we go with a separate v4l2_subdev, how do we communicate
> >>>> to which sensor the focus-control belongs to userspace ?
> >>>
> >>> The information was initially envisioned to be conveyed to userspace
> >>> through the media controller API, using the entity group ID to group the
> >>> camera sensor, lens controller and flash controller, but the
> >>> media_entity_desc.group_id field is now obsolete. No other mechanism
> >>> exist to replace that as far as I know, so we'll have to create
> >>> something. There have been some talks about using a special kind of link
> >>> to expose the relationship between the camera sensor and other
> >>> components.
> >>>
> >>
> >> I thought this was implemented: there should be an interface link from the
> >> sensor entity to the subdev for the flash or focus control.
> >>
> >> To my knowledge, this is all available.
> >
> > We've been looking at focus and AF over the last few weeks, although
> > under device tree instead of ACPI.
> >
> > With DT we have a lens driver bound to the sensor driver by giving the
> > sensor a lens-focus = <&vcm>; entry.
> > Media controller then reports it all under one entity, but it may be
> > true that we don't have a linking between the lens subdev and sensor.
> >
> > pi@raspberrypi:~ $ media-ctl -p -d /dev/media2
> > Media controller API version 5.10.74
> >
> > Media device information
> > ------------------------
> > driver          unicam
> > model           unicam
> > serial
> > bus info        platform:fe801000.csi
> > hw revision     0x0
> > driver version  5.10.74
> >
> > Device topology
> > - entity 1: imx477 10-001a (2 pads, 2 links)
> >             type V4L2 subdev subtype Sensor flags 0
> >             device node name /dev/v4l-subdev0
> >     pad0: Source
> >         [fmt:SRGGB12_1X12/4056x3040 field:none colorspace:unknown
> > xfer:none ycbcr:601 quantization:full-range
> >          crop.bounds:(8,16)/4056x3040
> >          crop:(8,16)/4056x3040]
> >         -> "unicam-image":0 [ENABLED,IMMUTABLE]
> >     pad1: Source
> >         [fmt:unknown/16384x1 field:none
> >          crop.bounds:(8,16)/4056x3040
> >          crop:(8,16)/4056x3040]
> >         -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> >
> > - entity 4: ad5398 focus (0 pad, 0 link)
> >             type V4L2 subdev subtype Lens flags 0
> >             device node name /dev/v4l-subdev1
> >
> > - entity 5: unicam-image (1 pad, 1 link)
> >             type Node subtype V4L flags 1
> >             device node name /dev/video0
> >     pad0: Sink
> >         <- "imx477 10-001a":0 [ENABLED,IMMUTABLE]
> >
> > - entity 11: unicam-embedded (1 pad, 1 link)
> >              type Node subtype V4L flags 0
> >              device node name /dev/video1
> >     pad0: Sink
> >         <- "imx477 10-001a":1 [ENABLED,IMMUTABLE]
> >
> > The Pi may be slightly different from other platforms in that if you
> > enable the second CSI2 interface then it'll be a totally separate
> > /dev/media node, so we can view it as one overall entity even if not
> > identified as such.
> >
> > The above was grabbed with an IMX477 with AF module. I haven't pushed
> > that configuration anywhere, but IMX135 with lens driver is at
> > https://github.com/raspberrypi/linux/pull/4612/
> >
>
> What is the output of:
>
> v4l2-compliance -M /dev/media2 --verbose
>
> That will also report any interface links.

pi@raspberrypi:~/nfs/v4l-utils/utils/v4l2-compliance $
./v4l2-compliance  -M /dev/media2 --verbose
v4l2-compliance 1.21.0-4859, 32 bits, 32-bit time_t
v4l2-compliance SHA: 493af03f3c57 2021-10-08 17:23:11

Compliance test for unicam device /dev/media2:

Media Driver Info:
    Driver name      : unicam
    Model            : unicam
    Serial           :
    Bus info         : platform:fe801000.csi
    Media version    : 5.10.74
    Hardware revision: 0x00000000 (0)
    Driver version   : 5.10.74

Required ioctls:
    test MEDIA_IOC_DEVICE_INFO: OK
    test invalid ioctls: OK

Allow for multiple opens:
    test second /dev/media2 open: OK
    test MEDIA_IOC_DEVICE_INFO: OK
    test for unlimited opens: OK

Media Controller ioctls:
        Entity: 0x00000001 (Name: 'imx477 10-001a', Function: Camera Sensor)
        Entity: 0x00000004 (Name: 'ad5398 focus', Function: Lens Controller)
        Entity: 0x00000005 (Name: 'unicam-image', Function: V4L2 I/O,
Flags: default)
        Entity: 0x0000000b (Name: 'unicam-embedded', Function: V4L2 I/O)
        Interface: 0x03000007 (Type: V4L Video, DevPath: /dev/video0)
        Interface: 0x0300000d (Type: V4L Video, DevPath: /dev/video1)
        Interface: 0x03000011 (Type: V4L Sub-Device, DevPath: /dev/v4l-subdev0)
        Interface: 0x03000013 (Type: V4L Sub-Device, DevPath: /dev/v4l-subdev1)
        Pad: 0x01000002 (0, imx477 10-001a, Source)
        Pad: 0x01000003 (1, imx477 10-001a, Source)
        Pad: 0x01000006 (0, unicam-image, Sink)
        Pad: 0x0100000c (0, unicam-embedded, Sink)
        Link: 0x02000008 (unicam-image to interface /dev/video0)
        Link: 0x02000009 (imx477 10-001a:0 -> unicam-image:0, Data,
Enabled, Immutable)
        Link: 0x0200000e (unicam-embedded to interface /dev/video1)
        Link: 0x0200000f (imx477 10-001a:1 -> unicam-embedded:0, Data,
Enabled, Immutable)
        Link: 0x02000012 (imx477 10-001a to interface /dev/v4l-subdev0)
        Link: 0x02000014 (ad5398 focus to interface /dev/v4l-subdev1)
    test MEDIA_IOC_G_TOPOLOGY: OK
    Entities: 4 Interfaces: 4 Pads: 4 Links: 6
        Entity: 0x00000001 (Name: 'imx477 10-001a', Type: Camera
Sensor, DevPath: /dev/v4l-subdev0)
        Entity: 0x00000004 (Name: 'ad5398 focus', Type: Lens
Controller, DevPath: /dev/v4l-subdev1)
        Entity: 0x00000005 (Name: 'unicam-image', Type: V4L2 I/O,
Flags: default, DevPath: /dev/video0)
        Entity: 0x0000000b (Name: 'unicam-embedded', Type: V4L2 I/O,
DevPath: /dev/video1)
    test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
    test MEDIA_IOC_SETUP_LINK: OK

Total for unicam device /dev/media2: 8, Succeeded: 8, Failed: 0, Warnings: 0

  Dave
