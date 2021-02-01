Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FCA30AE88
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 18:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhBARzJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 12:55:09 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:54211 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbhBARzB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 12:55:01 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8D8B51C0004;
        Mon,  1 Feb 2021 17:54:04 +0000 (UTC)
Date:   Mon, 1 Feb 2021 18:54:26 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        tfiga@chromium.org, Robert Foss <robert.foss@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        mchehab@kernel.org, hverkuil@xs4all.nl
Subject: Re: [RFC] Repurpose V4L2_CID_PIXEL_RATE for the sampling rate in the
 pixel array
Message-ID: <20210201175426.anq5pjajwyri5v7w@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey, Sakari,

On Mon, Dec 21, 2020 at 01:45:38PM +0200, Sakari Ailus wrote:
> Hi Andrey,
>
> Thanks for your e-mail.
>
> Could you wrap the lines before 80 characters? It's a bit hard to read...
>
> On Tue, Dec 08, 2020 at 03:09:25PM +0300, Andrey Konovalov wrote:
> > Greetings,
> >
> > I was checking how V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ controls
> > are documented and used in recent media_tree kernel, and found that the
> > current usage of V4L2_CID_PIXEL_RATE is not consistent.
> >
> > This topic seems to be a bit wider, but I'll focus on camera sensors and
> > the corresponding receivers.
> >
> > Not only the receiver drivers often use V4L2_CID_PIXEL_RATE to calculate
> > the link frequency from (this is much more common than using
> > V4L2_CID_LINK_FREQ alone, or with fallback to V4L2_CID_PIXEL_RATE if
> > V4L2_CID_LINK_FREQ is not implemented). The bigger issue is that
> > V4L2_CID_PIXEL_RATE was intended to give the rate at which pixels are
> > transmitted (e.g. over CSI-2 link), while it is also seems to be used for
> > the sampling rate in the pixel array. The problem is that these two rates
> > are different things, and may have different values.
>
> The PIXEL_RATE control indeed has signified, well, the pixel rate, and
> pixel rate may be different things depending on where it is found.
>
> The original use has been both on pixel matrix as well as on the
> CSI-2 transmitter but of course this is a problem if the two are the same
> sub-device.
>
> >
> > The proposal is to repurpose V4L2_CID_PIXEL_RATE to report the sampling
> > rate in the pixel array, and to calculate the symbol rate at which pixels
> > are transmitted over the link from V4L2_CID_LINK_FREQ value. The receiver
> > drivers currently using V4L2_CID_PIXEL_RATE to get the link frequency can
> > be switched to use the existing v4l2_get_link_rate() helper. We also need
> > to push the sensor drivers to implement V4L2_CID_LINK_FREQ, as quite a
> > few of them do V4L2_CID_PIXEL_RATE only.
>
> Indeed. That has been the idea for some time actually, but first all the
> receiver drivers need to be converted to use LINK_FREQ. This is easiest
> done by using the wrapper the ipu3-cio2 driver already uses as it still
> works even if the sensor driver only implemented PIXEL_RATE.
>
> >
> > I am not sure about the userspace cases, but guess that the userspace is
> > much more interested in frames per second and exposure values than in
> > link details. So it would rather use V4L2_CID_PIXEL_RATE for the sampling
> > rate in the pixel array anyway.
>
> That's the case if the sensor driver exposes the rest of the configuration
> as the device's native parameters (such as analogue crop rectangle and
> horizontal and vertical blanking). The majority of drivers do not do that,
> at least currently, but instead use SUBDEV_[GS]_FRAME_INTERVAL. This is not
> a native interface for camera sensors, and it is not well suited for
> conveying what other frame intervals are available.
>
> >
> > More details below.
> >
> > 1. V4L2_CID_PIXEL_RATE vs V4L2_CID_LINK_FREQ.
> > ---------------------------------------------
> >
> > According to [1]: - V4L2_CID_LINK_FREQ control can be used to get or to
> > set the frequency of the bus between transmitter
> >   (e.g. sensor) and receiver (e.g. RX phy on an SOC), This control is r/w
> >   by default, but is often made read-only by the sensor drivers,
> > - V4L2_CID_PIXEL_RATE control can be used to get pixel rate in the source pads of the subdev. This control
> >   is read-only by default.
> >
> > [2] is even more explicit: - V4L2_CID_LINK_FREQ control tells the
> > receiver driver the frequency (and not the symbol rate) of the link, -
> > V4L2_CID_PIXEL_RATE control may be used by the receiver to obtain the
> > pixel rate the transmitter uses.
> >   If the link is the MIPI CSI-2 D-PHY one, the value of the
> >   V4L2_CID_PIXEL_RATE is calculated as follows:
> >     pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
> > (*)
> >
> > [2] also requires the sensor driver connected through CSI-2 or parallel
> > (BT.601 or BT.656) bus to implement V4L2_CID_LINK_FREQ control, and for
> > raw sensors V4L2_CID_PIXEL_RATE is also said to be mandatory. Still only
> > half of sensor drivers under driver/media/i2c in the current media tree
> > have V4L2_CID_PIXEL_RATE support and even less implement
> > V4L2_CID_LINK_FREQ control.
> >
> > (*) is valid for MIPI CSI-2 D-PHY only, but it is widely used by the
>
> Correct. The only driver just got support for CSI-2 C-PHY, so the
> documentation needs to be adjusted, too. I actually recently sent a patch
> to address that.

OT: not to deviate the conversation, but isn't the usage of
v4l2_get_link_rate() in ipu3 ([8]) missing a / 2 to account for the
CSI-2 DDR ? Anyway, back to the topic..

>
> > receiver drivers to get CSI-2 link frequency from V4L2_CID_PIXEL_RATE
> > [3], [4], [5], [6]. For other bus types link frequency can also be
> > calculated from the pixel rate and some other parameters. There exists a
> > helper function in drivers/media/v4l2-core/v4l2-common.c for that already
> > [7]:
> >   s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int
> > mul, unsigned int div) which tries to get the link rate value using
> > V4L2_CID_LINK_FREQ, and if it not supported by the sub-device, it tries
> > V4L2_CID_PIXEL_RATE and calculates the link frequency from the pixel rate
> > using the multiplier and the divider provided by the caller.
> > Unfortunately only one driver [8] uses v4l2_get_link_rate(). [9]
> > implements a similar approach (error handling is different) but on its
> > own.
> >
> > [10] and [11] use V4L2_CID_LINK_FREQ directly.
> >
> > Only two drivers use V4L2_CID_PIXEL_RATE for something else than getting
> > the link frequency [12], [13].
> >
> > So in most of the cases the receiver drivers need to know the link
> > frequency. Often this link frequency is calculated from the pixel rate,
> > but changing the drivers to use V4L2_CID_LINK_FREQ directly looks fairly
> > easy.

I don't have much to add to what you and Sakari said here, and I can't
not agree that the usage of the PIXEL_RATE to calculate LINK_FREQUENCY
might be misleading. I would add the I never really got why
LINK_FREQUENCY has to be menu control. It might make sense for
mode-based sensor drivers, where for each known mode the link
frequency can be pre-calculated, but for freely configurable sensors I
don't actually see the point. Also, if I were to re-design this I
would not use a control but rather add link frequency to the
get_mbus_config() kAPI to be used during the transmitter/receiver
subdevices setup phase.

> >
> >
> > 2. V4L2_CID_PIXEL_RATE: the rate at which pixels are transmitted, or the
> > sampling rate in the pixel array?
> > ----------------------------------------------------------------------------------------------------------
> >
> > Let's start from the example: "imx219 8-bit raw modes are broken for
> > camss, the 8MP@15fps one included".
> >
> > The imx219 driver supports only 2 data lanes. The link frequency is fixed
> > at 456MHz. At 8MP the fps is 15, which the driver refers to as 8MP@15fps
> > mode.
> >
> > Originally the driver supported 10-bit raw format only, so the pixel rate
> > was:
> >
> >   IMX219_pixel_rate = IMX219_link_freq * 2 * nr_of_lanes /
> >                       bits_per_sample = 456 * 2 * 2 / 10 = 182.4 Mpix/sec
> >
> > The line length (IMX219_PPL_DEFAULT) is set to 3448 (h blanking
> > included), the frame length in this mode (IMX219_VTS_15FPS) is 3526 (v
> > blanking included). Then
> >
> >   IMX219_frame_rate_8MP = IMX219_pixel_rate / IMX219_PPL_DEFAULT /
> >                           IMX219_VTS_15FPS = 182400000 / 3448 / 3526 =
> >                           15.003 Hz - OK, as
> > expected.
> >
> > The value for read-only V4L2_CID_HBLANK control is calculated as: hblank
> >         = IMX219_PPL_DEFAULT - mode->width; - and can only change
> > as the result of switching the modes.
> >
> > Then 8-bit raw format was added. And it was done such that switching
> > between 10 and 8 bits affects the output data domain only - the pixel
> > read domain continues to work just as before:
> >   - the number of bits per sample to read from the FIFO is set to 8 or 10
> >     (there is a FIFO between the "pixel read" and the "MIPI data output"
> >   halves of the sensor) - the divider for the "read from the FIFO" clock
> >   is set to 8 or 10 - this clock is 91.2 MHz for 10 bits
> >     and 114 MHz for 8 bits. So that the link frequency remains the same.
> >
> > The important thing to note is that the clock at which the samples are
> > written to the FIFO remains at 91.2 MHz for both 10 and 8 bits.
> >
> > V4L2_CID_PIXEL_RATE control handling was not changed - its value is
> > always reported as 182.4 Mpix/sec. This immediately broke the receivers
> > which use V4L2_CID_PIXEL_RATE to configure their phy - e.g. capturing in
> > 8 bit modes doesn't work on Qualcomm boards using camss driver.
> >
> > So my first impression was that this is a bug in the imx219 driver. But
> > in fact this is a more generic API problem: if we update
> > V4L2_CID_PIXEL_RATE to fix the issue with the drivers calculating the
> > link frequency from it, from the equation below [14]:
> >
> >   frame interval = (analogue crop width + horizontal blanking) *
> >                  (analogue crop height + vertical blanking) / pixel_rate
> > (**)
> >
> > - we would see (if we treat the h blanking as it is treated in imx219
> > driver) that the fps changed from 15 to 18.75 after switching from 10-bit
> > to 8-bit raw format. While in fact the fps is 15 in the both cases. If we
> > changed camss to use V4L2_CID_LINK_FREQ (not changed between 8 and 10
> > bits in this case), and repurposed V4L2_CID_PIXEL_RATE to report the
> > sampling rate in the pixel array (not changed between 8 and 10 bits in
> > this case), then (**) would give the correct frame interval and 8-bit
> > modes would work with camss driver just fine.
> >
> > As a summary, this issue happened because the equation (*) assumes that
> > pixel_rate is the rate at which pixels are transmitted (belongs to the
> > "MIPI data output" domain), while the imx219 driver and equation (**)
> > assume that the pixel_rate is the sampling rate in the pixel array. And
> > while in case of the imx219 driver these two (different by nature) rates
> > are the same for 10-bit raw formats, for 8-bit raw formats the sampling
> > rate in the pixel array is lower than the rate at which pixels are
> > transmitted. Because switching from 10 to 8 bits reconfigures the "MIPI
> > data output" domain *only*. And this implementation does make sense: this
> > is quite natural for a user to see no change in fps and exposure (in
> > absolute units, not in lines) when he/she decides to use more or less
> > bits per pixel.
> >
> > (As a side note - different clocks for reading the pixels from the image
> > array and for sending them out to MIPI transmitter is a documented
> > feature of IMX219 sensor.)
> >
> > If we return to (**) again, as I see it, this equation makes sense in the
> > "pixel sampling" domain only. And this is how it seems to be used in the
> > camera sensor drivers. Also [15] does say "The unit of horizontal
> > blanking is pixels" about V4L2_CID_HBLANK - this is way easier to work
> > with in the "pixel sampling" domain. Even though h/v blanking is rather
> > the notion of "MIPI data output" domain imho. So if we look at what is
> > happening on the CSI link when imx219 driver switches from 10-bit row to
> > 8-bit row, we will see the same link frequency, the increased symbol rate
> > and hence the shorter time between packet header and packet footer
> > followed by increased line blanking interval for the lines with pixel
> > data. While V4L2_CID_PIXEL_RATE and V4L2_CID_HBLANK would report no
> > changes at all (as current imx219 driver uses them as though they both
> > belong to the "pixel sampling" domain).

Isn't this expected ?

The pixel rate being accessible to userspace is mostly useful to
transform parameters expressed in abstract 'lines' (or 'pixels') such
as the exposure time (or the horizontal blankings) to a wall clock
time in some second sub-unit. Shouldn't they be expressed in the
'pixel sampling' domain then and let the CSI-2 transmitter adjust them
to respect the frame rate/link frequency ratio ? (in my mental picture
I'm missing where that adjustement happens though, and I assume it's
encoded in some part of the mode registers list)

> >
> > And again, if the rate at which pixels are transmitted and the sampling
> > rate in the pixel array are the same, the "pixel sampling" domain and the
> > "data out" domain are no difference.
>
> Over the past 15 years, a lot of different camera sensor drivers have been
> merged. The capabilities and interfaces exposed by the drivers have changed
> a little over time and also sensor's capabilities and the driver writer's
> use cases have had an effect on the interfaces the drivers implement. The
> APIs have remained the same, while at the same time they haven't been
> exactly a perfect match for the capabilities of the register list based
> drivers.
>
> So with that background, it's perhaps not surprising that in some areas
> there's variation in how the subdev API is being used by the drivers.
>
> If there's a desire to improve this, it means changing the user space
> interface of a number of drivers. I don't know how they are being used
> currently. Removing a control from a driver or changing its semantics does
> have some potential for breaking user space.
>
> If changes in the interface end up being done, they should be compatible
> the goal of providing all the necessary information on sensor configuration
> to the user space, not just the pixel rate in the pixel array. This
> includes analogue crop rectangle, binning (and subsampling), scaling and
> digital crop configurations. Selecting the actual configuration would still
> be based on the source pad of the sub-device representing the sensor's
> transmitter. This means often implementing more sub-devices, in many cases
> the same way the CCS driver does already.

libcamera is actually struggling with the same questions. So far we
got away using the selection API to retrieve the analogue crop size
and other information on the pixel array, but when it's about how to
convey other parameters, such as the subsampling mode in use, the
current API fall shorts. One use case for sub-sampling is to estimate
the FOV and make it possible to identify 'modes' that have the same
FOV but might be faster to transmit (higher frame rate).

Digital scalers could be instead worked around by using multiple
subdevs and make the scaling step explicit between pads of different
entities, that's my understanding at least.

Ideally, with multiple subdevices in place, and an opportune usage of
selection targets those information might be made available with the
current API probably, by mapping the analogue crop rectangle and the
sub-sampling to the TGT_CROP and TGT_COMPOSE target of a dedicated
sub-devices. Digital scalers would require yet another sudbdev..

>
> I'm also not sure it's worth changing drivers that already use
> SUBDEV_[GS]_FRAME_INTERVAL; they're so far from the target and are most
> likely for older hardware. The more obvious target are drivers that already
> expose the blanking controls.
>
> This is what I could think of to remedy the problems:
>
> 1. Make all receiver drivers use LINK_FREQ instead of PIXEL_RATE.

could using a kAPI to convey the link frequency make the transition
less painful? so that if there's any userspace component that relies
on the LINK_FREQUENCY control we don't break it ?

>
> 2. Remove PIXEL_RATE from sensor drivers in places where it is used to
> convey the pixel rate on the data bus. Steps from this onward may be
> implemented one driver at a time.
>
> 3. Add back the pixel rate control that represents the pixel rate in the
> pixel array. The blanking controls need to be aligned with the analogue
> crop size.
>
> 4. Implement more sub-devices to convey the sensor's current configuration
> to the user, including analogue crop, binning, scaling and digital crop.
>
> There's a chance of breaking something in the user space from 2. onwards.
>
> If you skip the 4. step, the frame rate configuration could work but the
> rest of the sensor configuration (cropping, binning, scaling etc.) would
> remain unknown to the user space.
>
> The above does not address selection of modes in register list based
> drivers. It would be nice to have a solution for that, too, but the general
> issue is that it does not fit to the model V4L2 has --- considering all the
> configurations independent. They are that on hardware level but register
> list based drivers do not configure them like that.
>
> Any thoughts, opinions, comments etc. on this are very welcome.
>

Let me point you to the libcamera component that
handles camera sensors and which is currently limited to use a few
selection targets and a few controls. Ideally, if we grow the
two side together to support more complex use cases, it provides a
place where to test any new/repurposed API.

https://git.linuxtv.org/libcamera.git/tree/src/libcamera/camera_sensor.cpp#n666
https://git.linuxtv.org/libcamera.git/tree/Documentation/sensor_driver_requirements.rst

Thanks
   j

> Cc also Hans and Mauro.
>
> --
> Kind regards,
>
> Sakari Ailus
>
