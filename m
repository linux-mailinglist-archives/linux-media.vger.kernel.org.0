Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACAC23FF9D
	for <lists+linux-media@lfdr.de>; Sun,  9 Aug 2020 19:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgHIRzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Aug 2020 13:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHIRzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Aug 2020 13:55:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38485C061756
        for <linux-media@vger.kernel.org>; Sun,  9 Aug 2020 10:55:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3887FF9;
        Sun,  9 Aug 2020 19:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596995698;
        bh=5CSZllsvdkxoYj4Cydv0rPSP7KQv8tLYjWYW/RJ0uXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qeFCU+n0IclVo1MhvuyLvlZKyyyqywVRX8geH4YFw7f5MUHWCsPLC4IRL5NQ/fjcw
         TqH+nm94lDArnfrVgfN9F2aBzDDyfG3jVsifzXscYk1hYDfdbYN1ZuVmCcTVQbrpov
         ab7fFEtV+zkOLCZhi82MH8HbEEnbm6C0h9K0ORvc=
Date:   Sun, 9 Aug 2020 20:54:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 2/4] media: docs: Describe targets for sensor properties
Message-ID: <20200809175444.GE5981@pendragon.ideasonboard.com>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-3-jacopo@jmondi.org>
 <1896673c-ae91-84c3-9573-5da91fb00f41@xs4all.nl>
 <20200806100822.kvlzivbtnqzni3xw@uno.localdomain>
 <851192ea-6498-4f9e-a6b4-bf5164f3c5a7@xs4all.nl>
 <20200806124523.llccxvcz65ohqqwq@uno.localdomain>
 <db04abc6-c9a7-7170-05f3-0238e84c4445@xs4all.nl>
 <20200806133617.q2g5a63a3qzvzkaa@uno.localdomain>
 <6a349665-8342-4f3b-d9b4-8d49a1da7d95@xs4all.nl>
 <20200806161156.umcsxduyta3vfnvg@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200806161156.umcsxduyta3vfnvg@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo and Hans,

On Thu, Aug 06, 2020 at 06:11:56PM +0200, Jacopo Mondi wrote:
> On Thu, Aug 06, 2020 at 05:32:50PM +0200, Hans Verkuil wrote:
> > On 06/08/2020 15:36, Jacopo Mondi wrote:
> >> On Thu, Aug 06, 2020 at 03:15:54PM +0200, Hans Verkuil wrote:
> >>> On 06/08/2020 14:45, Jacopo Mondi wrote:
> >>>> On Thu, Aug 06, 2020 at 12:15:49PM +0200, Hans Verkuil wrote:
> >>>>> On 06/08/2020 12:08, Jacopo Mondi wrote:
> >>>>>> On Thu, Aug 06, 2020 at 10:45:17AM +0200, Hans Verkuil wrote:
> >>>>>>> On 05/08/2020 12:57, Jacopo Mondi wrote:
> >>>>>>>> Provide a table to describe how the V4L2 selection targets can be used
> >>>>>>>> to access an image sensor pixel array properties.
> >>>>>>>>
> >>>>>>>> Reference the table in the sub-device documentation.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>>>>> ---
> >>>>>>>>  .../userspace-api/media/v4l/dev-subdev.rst    |  4 ++
> >>>>>>>>  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++++++++++
> >>>>>>>>  2 files changed, 53 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>>>>>>> index c47861dff9b9b..2f7da3832f458 100644
> >>>>>>>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>>>>>>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>>>>>>> @@ -467,6 +467,10 @@ desired image resolution. If the sub-device driver supports that, userspace
> >>>>>>>>  can set the analog crop rectangle to select which portion of the pixel array
> >>>>>>>>  to read out.
> >>>>>>>>
> >>>>>>>> +A description of each of the above mentioned targets when used to access the
> >>>>>>>> +image sensor pixel array properties is provided by
> >>>>>>>> +:ref:`v4l2-selection-targets-image-sensor-table`
> >>>>>>>> +
> >>>>>>>>
> >>>>>>>>  Types of selection targets
> >>>>>>>>  --------------------------
> >>>>>>>> diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> >>>>>>>> index 69f500093aa2a..632e6448b784e 100644
> >>>>>>>> --- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> >>>>>>>> +++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> >>>>>>>> @@ -76,3 +76,52 @@ of the two interfaces they are used.
> >>>>>>>>  	modified by hardware.
> >>>>>>>>        - Yes
> >>>>>>>>        - No
> >>>>>>>> +
> >>>>>>>> +
> >>>>>>>> +.. _v4l2-selection-targets-image-sensor-table:
> >>>>>>>> +
> >>>>>>>> +********************************************
> >>>>>>>> +Selection Targets For Pixel Array Properties
> >>>>>>>> +********************************************
> >>>>>>>> +
> >>>>>>>> +The V4L2 selection API can be used to retrieve the size and disposition of the
> >>>>>>>> +pixel units that compose and image sensor pixel matrix when applied to a video
> >>>>>>>> +sub-device that represents an image sensor.
> >>>>>>>> +
> >>>>>>>> +A description of the properties associated with each of the sensor pixel array
> >>>>>>>> +areas is provided by the :ref:`v4l2-subdev-pixel-array-properties` section.
> >>>>>>>> +
> >>>>>>>> +.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p(1.4cm)|
> >>>>>>>> +
> >>>>>>>> +.. flat-table:: Selection target definitions
> >>>>>>>> +    :header-rows:  1
> >>>>>>>> +    :stub-columns: 0
> >>>>>>>> +
> >>>>>>>> +    * - Target name
> >>>>>>>> +      - id
> >>>>>>>> +      - Definition
> >>>>>>>> +      - Read/Write
> >>>>>>>> +    * - ``V4L2_SEL_TGT_CROP``
> >>>>>>>> +      - 0x0000
> >>>>>>>> +      - The analog crop rectangle. Represents the portion of the active pixel
> >>>>>>>> +        array which is processed to produce images.
> >>>>>>>> +      - RW
> >>>>>>>> +    * - ``V4L2_SEL_TGT_CROP_DEFAULT``
> >>>>>>>> +      - 0x0001
> >>>>>>>> +      - The active pixel array rectangle. It includes only active pixels and
> >>>>>>>> +        excludes other ones such as optical black pixels. Its width and height
> >>>>>>>> +        represent the maximum image resolution an image sensor can produce.
> >>>>>>>> +      - RO
> >>>>>>>> +    * - ``V4L2_SEL_TGT_CROP_BOUNDS``
> >>>>>>>> +      - 0x0002
> >>>>>>>> +      - The readable portion of the physical pixel array matrix. It includes
> >>>>>>>> +        pixels that contains valid image data and calibration pixels such as the
> >>>>>>>> +        optical black ones.
> >>>>>>>> +      - RO
> >>>>>>>> +    * - ``V4L2_SEL_TGT_NATIVE_SIZE``
> >>>>>>>> +      - 0x0003
> >>>>>>>> +      - The physical pixel array size, including readable and not readable
> >>>>>>>> +        pixels. As pixels that cannot be read from application processor are not
> >>>>>>>> +        relevant for calibration purposes, this rectangle is useful to calculate
> >>>>>>>> +        the physical properties of the image sensor.
> >>>>>>>> +      - RO
> >>>>>>>>
> >>>>>>>
> >>>>>>> Hmm, this basically just duplicates the previous patch.
> >>>>>>>
> >>>>>>> I think you are documenting things at the wrong place. What you documented in the
> >>>>>>> previous patch really belongs here since it is shared between the subdev API and the
> >>>>>>> regular V4L2 API. And in dev-subdev.rst you then refer to here.
> >>>>>>
> >>>>>> I originally had it here, but then I moved to dev-subdev as an image
> >>>>>> sensor will always be represented as a video sub-device, doen't it ?
> >>>>>
> >>>>> No. Some camera drivers are V4L2 only, most notably uvc. Also there are several simple
> >>>>> platform drivers that don't use the subdev API.
> >>>>
> >>>> Do we expect to be able to retrieve sensor array properties from video
> >>>> device nodes which represents, in my understanding a DMA engine that
> >>>> writes data to memory ? As I see it, not subdev for the image sensor,
> >>>> no pixel array properties. How can these be exposed by a video device
> >>>> which abstracts the full capture pipeline ?
> >>>
> >>> They will typically ask the subdev driver. The vidioc_g_selection op
> >>> implementation will in turn call the get_selection op of the sensor subdev
> >>> driver and pass that information back to userspace.
> >>
> >> How do we know that the any target reports the actual sensor
> >> properties and not some other limitation introduced by processing
> >> components down the pipeline, as everything sits behind a single video
> >> device node ? In example, the default crop rectangle might very well depend
> >> on the receiver's side decision to crop the frames received from the
> >> sensor to maximize the FOV or whatnot. How do we know which 'cropping
> >> point' is reported ?
> >
> > Why would you care? Would you do anything different in userspace if a driver
> > would modify these rectangles before passing it on to userspace?
>
> Yes it indeed makes a difference, particularly for application dealing
> with RAW sensors and for IPS tuning algorithms that need to access the
> sensor pixel matrix sizes to calculate, in example, the FOV ratio, or
> might want to access black pixels for calibration purposes.
> 
> Now, I'm not an expert on that part, but in example I see the
> RaspberryPi 3A algorthms in libcamera using the ratio between the
> active pixel array size and what I referred to as 'analogCrop' to
> calculate the lens shading correction maps
> https://git.linuxtv.org/libcamera.git/tree/src/ipa/raspberrypi/controller/rpi/alsc.cpp#n185
> 
> I can imagine there are other relevant image tuning algorithms that
> needs to access the sensor characteristics precisely. Knowing that
> what I'm getting describes the sensor properties is relevant. That's
> why I hardly see this happening going through a single device node.
> 
> >> I hardly see a vidio_g_selection() being ideal to report properties of
> >> the camera sensor such as the pixel array ones. I still feel we're
> >> hijacking that API for that purpose and I would be glad to have
> >> dedicated targets for image sensors. This would promote 'image
> >> sensors' as first class citizens of the API like devices and
> >> sub-devices, and I'm not sure this is desirable.
> >
> > Sorry, but the selection API (and its CROP predecessor) has been in use
> > for sensors and webcam drivers since pretty much the beginning of V4L1.
> >
> > I'm not sure what it is that you think is problematical with the current
> > API.
> 
> I'm not proposing to kill that API, I just think the existing targets
> fall short or are under-specified when applied to RAW image sensor,
> that's it :)

There's a bit difference between what is exposed by a V4L2 video capture
device in video-node-centric designs, and by a camera sensor subdev in
MC-centric designs.

In the first case, the video node exposes a logical view of the device,
with the ability to scale and crop if supported, but without any control
on how and where those operations are performed.  When userspace wants
to crop the image, a USB webcam, an embedded system camera (for lack of
a better term, I mean here a camera sensor and a receiver, both being
controllable by Linux) or an analog capture device are exposed
similarly, without applications having to care much about the device
type (there are of course device-specific details exposed, such as the
analog or digital TV standards, but that's separate).

Note that in the USB case, it's common for UVC webcams to expose a set
of resolutions, and use a combination of scaling and cropping to achieve
them, without reporting to the host how much cropping is applied. The
UVC standard allows webcams to crop internally, and doesn't expose any
cropping control, so the UVC driver doesn't implement control of the
crop rectangle. This is an extreme case that shows how userspace has
little control of the internal configuration of the device. Reading
optical black pixels is clearly out of the picture with this API, the
video-node-centric device is really a simple, high-level view of a
logical device. It's good enough for many devices.

In the MC-centric case, applications need full control of all processing
steps, and that's where getting detailed information about the crop
rectangles, and the ability to control them all (including up to 3
different stages of cropping in SMIA++ devices for instance) is
important. As Jacopo explained above, the lens shading correction map is
calculated based on how much cropping has been applied. Here we're
talking about specialized userspace, with the main user being
libcamera. libcamera abstracts all this, and exposes a simpler, logical
view of the device to applications. In effect, it turns an MC-centric
kernel device into a simpler logical device (but with extra features
compared to video-node-centric devices, such as a request-based API, and
the ability to have some more control over the ISP).

For this kind of userspace, the V4L2 video API was not enough, and we
have introduced the MC API and the V4L2 subdev API. The lack of a
userspace stack on top of that, a long term issue that we're fixing now,
has prevented us to see the still numerous shortcomings of our kernel
APIs. Vendors who have been using MC-centric drivers to implement
proprietary camera stacks have thus resorted to either out-of-tree
API extentions or abuses of the existing interfaces. For instance, I've
seen out-of-tree drivers using the v4l2_streamparm.capture.capturemode
field returned by VIDIOC_G_PARM to retrieve the resolution and crop
configuration of the camera sensor by indexing in a table of modes in
userspace. There are lots of examples of horrible code, which shows the
need not only for API extensions, but for standardizing through
documentation how the existing APIS are used.

This is what Jacopo is trying to address with this series. I however
don't think we need to define extra selection targets (but I'm open to
considering that if there are good reasons I'm not aware of), but we
very much need to describe in details how the selection targets apply to
camera sensor subdevs. This is separate from the V4L2 video API, we may
also need better descriptions there, but that should be handled
separately. The base concepts and the targets are shared between the two
cases, but that's where it stops.

> >>> There is nothing subdev specific to this API.

-- 
Regards,

Laurent Pinchart
