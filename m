Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E25D439484
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 13:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbhJYLMk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 07:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhJYLMj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 07:12:39 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA1CC061348
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 04:10:17 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id exrqmMNg7Uo2HexrrmIMhK; Mon, 25 Oct 2021 13:10:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635160215; bh=+WzdvDDoBpkmxgGlzlyDx2UqGthf5WhP8M2eKQnMVCc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bsoxruvvdDJ8g7LEGJz0KRDVqaQt9tsL83rovxNaXM+I1Dg47Nm4ZbrNmAYLyGJR/
         2eXNwZgrJxbYdpROnuZdFroTIveBnevMKCj1wZEiUCK5ogVwqhGg6TJ2dKYiKsZJWA
         /bZivC8eTIE34WNG061ZGPG/x1RaE266erp1ju6WRJlIbakinvzIwWjWuBFHQlg7ll
         MJBm67ZLf0tmo7owP/xiTgxVuZUtoZotpC2oMWUzTrLXdGASqTWu9v/QKHJq0K7b39
         QaUi3fuQI8MmWUm6pXknNBh/rXt4RpqlSDZ/cMFOHc36cLwhuSVqK8JaqQU7uojShb
         pQW9V1lx19+UQ==
Subject: Re: [libcamera-devel] Userspace API for controlling the focus of the
 Surface Go [2] main/back-camera
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
 <YXaHMd3czQy0NKJn@pendragon.ideasonboard.com>
 <30ad631c-6c6e-6c1a-7b0a-d50d70a169d2@xs4all.nl>
 <CAPY8ntBveayxaJGXSXp3bDs4gxz1io2hqHBBEc=JjWTy20pnww@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <db53d337-7271-3950-1309-f97f1b468646@xs4all.nl>
Date:   Mon, 25 Oct 2021 13:10:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBveayxaJGXSXp3bDs4gxz1io2hqHBBEc=JjWTy20pnww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJTckQNI0cZUfFqG7aNryGgeugdxDxjBl2g9Kg46a9snfUz32PuCrhdcHJhKAuoYG7vNSFLrSqfCF5b7HjlH+vc4sNhYYGembc3fDtyVcOSP5lbZUQMv
 G+S/xT6u92NhOk9Oiff09WYZ4lAlJAMuoN3wD6E1c9HQLsREn7Sv9MNDDVLA0Yeyl9mnl6ia4aK8yeAIG7wRAfPtfSRUp+sGVxrkWDMyhbEKRqFTJlaNsG/d
 4Bh0I5dlmHXohKL9gExIh3sxUnO9u3IRNG2RWxIiSDdKq8PPUcS4RVuDJdWquWPQCK0x1Y4NEhJW4y5K2VjIM39U0StgvPue9ffApO9btR9vDOcslXTU4n7s
 qocjhoaN1FkVuOfy3Ha0CWFblEuNW6V3fWKiuGO95txB0Epe/iN29p32HuA4ib+MOnrxqL3GpSR9c2Qm5jAubc35azgmzOc4LA0GWPGt5FU5jJe41I8hPCZ2
 YrDxA21hOKNPx+U+8a6d1f0sBJJdCbv52LQuuQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 13:03, Dave Stevenson wrote:
> Hi All.
> 
> On Mon, 25 Oct 2021 at 11:47, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 25/10/2021 12:30, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> On Mon, Oct 25, 2021 at 12:06:30PM +0200, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> With my (and Dan's) kernel patch-series to enable the back camera on
>>>> the Surface Go shaping up (and hopefully going upstream soon),
>>>> the next step is to enable control of the focus lens for the back
>>>> camera.
>>>>
>>>> The focus is controlled through a separate i2c-client which is
>>>> described by a 2nd I2cSerialBusV2 resource entry in the ACPI
>>>> device for the ov8865 sensor. By default the kernel only instantiates
>>>> an i2c-client for the first I2cSerialBusV2 resource entry for an
>>>> ACPI device, getting an i2c-client for the 2nd one is easy and
>>>> out of scope for this discussion.
>>>>
>>>> The question which I have is, assuming we have the 2nd i2c-client
>>>> instantiated and we have a i2c-driver binding to it, how do we
>>>> represent the focus control to userspace.
>>>>
>>>> I see 2 possible directions we can go here:
>>>>
>>>> 1. Somehow inject an extra v4l2ctrl for this into the v4l2ctrl
>>>> list of the sensor. AFAIK we don't have infra for this atm, but
>>>> we could add some generic mechanism to do this to the v4l2-ctrls
>>>> core. IMHO from a userspace pov this is the cleanest, but at the
>>>> cost of some extra work / possible ugliness on the kernel side.
>>>>
>>>> 2. Register a separate v4l2_subdev for the focus-ctrl and in
>>>> some way provide information to userspace to which sensor this
>>>> belongs.
>>>
>>> The second approach is what V4L2 does already. We have a set of drivers
>>> for VCMs already (search for V4L2_CID_FOCUS_ABSOLUTE in
>>> drivers/media/i2c/).
>>>
>>>> I believe that both are valid approaches. So before diving into
>>>> this I wonder what others are thinking about this.
>>>>
>>>> Specific questions:
>>>>
>>>> 1. Hans Verkuil, what do you think about adding
>>>> support for another driver to inject ctrls into the ctrl
>>>> list of another v4l2(sub)dev ? Maybe something like this
>>>> already exists ? If not do you think this is feasible
>>>> and desirable to add ?
>>>>
>>>> 2. If we go with a separate v4l2_subdev, how do we communicate
>>>> to which sensor the focus-control belongs to userspace ?
>>>
>>> The information was initially envisioned to be conveyed to userspace
>>> through the media controller API, using the entity group ID to group the
>>> camera sensor, lens controller and flash controller, but the
>>> media_entity_desc.group_id field is now obsolete. No other mechanism
>>> exist to replace that as far as I know, so we'll have to create
>>> something. There have been some talks about using a special kind of link
>>> to expose the relationship between the camera sensor and other
>>> components.
>>>
>>
>> I thought this was implemented: there should be an interface link from the
>> sensor entity to the subdev for the flash or focus control.
>>
>> To my knowledge, this is all available.
> 
> We've been looking at focus and AF over the last few weeks, although
> under device tree instead of ACPI.
> 
> With DT we have a lens driver bound to the sensor driver by giving the
> sensor a lens-focus = <&vcm>; entry.
> Media controller then reports it all under one entity, but it may be
> true that we don't have a linking between the lens subdev and sensor.
> 
> pi@raspberrypi:~ $ media-ctl -p -d /dev/media2
> Media controller API version 5.10.74
> 
> Media device information
> ------------------------
> driver          unicam
> model           unicam
> serial
> bus info        platform:fe801000.csi
> hw revision     0x0
> driver version  5.10.74
> 
> Device topology
> - entity 1: imx477 10-001a (2 pads, 2 links)
>             type V4L2 subdev subtype Sensor flags 0
>             device node name /dev/v4l-subdev0
>     pad0: Source
>         [fmt:SRGGB12_1X12/4056x3040 field:none colorspace:unknown
> xfer:none ycbcr:601 quantization:full-range
>          crop.bounds:(8,16)/4056x3040
>          crop:(8,16)/4056x3040]
>         -> "unicam-image":0 [ENABLED,IMMUTABLE]
>     pad1: Source
>         [fmt:unknown/16384x1 field:none
>          crop.bounds:(8,16)/4056x3040
>          crop:(8,16)/4056x3040]
>         -> "unicam-embedded":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: ad5398 focus (0 pad, 0 link)
>             type V4L2 subdev subtype Lens flags 0
>             device node name /dev/v4l-subdev1
> 
> - entity 5: unicam-image (1 pad, 1 link)
>             type Node subtype V4L flags 1
>             device node name /dev/video0
>     pad0: Sink
>         <- "imx477 10-001a":0 [ENABLED,IMMUTABLE]
> 
> - entity 11: unicam-embedded (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video1
>     pad0: Sink
>         <- "imx477 10-001a":1 [ENABLED,IMMUTABLE]
> 
> The Pi may be slightly different from other platforms in that if you
> enable the second CSI2 interface then it'll be a totally separate
> /dev/media node, so we can view it as one overall entity even if not
> identified as such.
> 
> The above was grabbed with an IMX477 with AF module. I haven't pushed
> that configuration anywhere, but IMX135 with lens driver is at
> https://github.com/raspberrypi/linux/pull/4612/
> 

What is the output of:

v4l2-compliance -M /dev/media2 --verbose

That will also report any interface links.

Regards,

	Hans
