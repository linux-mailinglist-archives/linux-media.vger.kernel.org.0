Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B63B43941A
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 12:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhJYKzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 06:55:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44468 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhJYKzq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 06:55:46 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14D6CE0A;
        Mon, 25 Oct 2021 12:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635159203;
        bh=fBNWlbFXq2yIlHCFVWE9soygQx9CgZEkq8YPWaLdos4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j5pGmm+4OOkmngavgpUb8RT9MTUk1ttvD4H8+3fZfTvO2vxAvtvRR33jq6H8+o9Px
         mH8jt22BkmaNC28/nthcMvcUzMTZS+fWP+OMB4X2PYyR9OS6ij+qxERs84ER6zCg1C
         U0qvXKkISWMRz97ycX0U1xul3RyQwf+7gBFjVWSs=
Date:   Mon, 25 Oct 2021 13:53:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Subject: Re: Userspace API for controlling the focus of the Surface Go [2]
 main/back-camera
Message-ID: <YXaMjRhZZYmcplZP@pendragon.ideasonboard.com>
References: <c7c94544-8af4-ad29-04ef-6131774e68b8@redhat.com>
 <e6a098ad-5155-b51c-74dd-f467c574efe0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e6a098ad-5155-b51c-74dd-f467c574efe0@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Oct 25, 2021 at 12:25:26PM +0200, Hans Verkuil wrote:
> On 25/10/2021 12:06, Hans de Goede wrote:
> > Hi All,
> > 
> > With my (and Dan's) kernel patch-series to enable the back camera on
> > the Surface Go shaping up (and hopefully going upstream soon),
> > the next step is to enable control of the focus lens for the back
> > camera.
> > 
> > The focus is controlled through a separate i2c-client which is
> > described by a 2nd I2cSerialBusV2 resource entry in the ACPI
> > device for the ov8865 sensor. By default the kernel only instantiates
> > an i2c-client for the first I2cSerialBusV2 resource entry for an
> > ACPI device, getting an i2c-client for the 2nd one is easy and
> > out of scope for this discussion.
> > 
> > The question which I have is, assuming we have the 2nd i2c-client
> > instantiated and we have a i2c-driver binding to it, how do we
> > represent the focus control to userspace.
> > 
> > I see 2 possible directions we can go here:
> > 
> > 1. Somehow inject an extra v4l2ctrl for this into the v4l2ctrl
> > list of the sensor. AFAIK we don't have infra for this atm, but
> > we could add some generic mechanism to do this to the v4l2-ctrls
> > core. IMHO from a userspace pov this is the cleanest, but at the
> > cost of some extra work / possible ugliness on the kernel side.
> > 
> > 2. Register a separate v4l2_subdev for the focus-ctrl and in
> > some way provide information to userspace to which sensor this
> > belongs.
> > 
> > I believe that both are valid approaches. So before diving into
> > this I wonder what others are thinking about this.
> > 
> > Specific questions:
> > 
> > 1. Hans Verkuil, what do you think about adding
> > support for another driver to inject ctrls into the ctrl
> > list of another v4l2(sub)dev ? Maybe something like this
> > already exists ? If not do you think this is feasible
> > and desirable to add ?
> > 
> > 2. If we go with a separate v4l2_subdev, how do we communicate
> > to which sensor the focus-control belongs to userspace ?
> 
> What is the bridge driver that controls the sensor? I would need to
> know a bit more about the architecture.

Intel CIO2 (on a Windows-based machine with brain-dead ACPI design,
unfortunately).

> Is it MC-centric? Or is everything controlled through a video device?

MC-centric.

> In the latter case you want the video device to inherit the controls of
> the sensor and the focus sub-devices, that's supported by the control
> framework.
> 
> In the MC-centric case you probably want to have libcamera support that
> can tie the focus subdev and the sensor subdev together.

libcamera needs to associate the subdevs for the camera sensor and the
lens controller, so we need that information to be passed by the kernel
to userspace (there are two camera sensors in that machine).

> v4l2_async_nf_parse_fwnode_sensor() supports linking LEDs or lens-focus
> devices together with the sensor, so that's how a focus device can be
> associated with a sensor at the ACPI/DT level. So support for 2) is
> already available. A separate subdev is in my view certainly the correct
> approach.

That functions add subdev async notifier entries for the lens controller
and the flash controller, but as far as I know, we don't convey the
information to userspace.

-- 
Regards,

Laurent Pinchart
