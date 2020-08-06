Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD0A23DBAF
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgHFQ34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:29:56 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:34926 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728276AbgHFQ2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:28:41 -0400
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 7450F3A36B4
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 16:13:39 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 935C940002;
        Thu,  6 Aug 2020 16:08:16 +0000 (UTC)
Date:   Thu, 6 Aug 2020 18:11:56 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 2/4] media: docs: Describe targets for sensor properties
Message-ID: <20200806161156.umcsxduyta3vfnvg@uno.localdomain>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-3-jacopo@jmondi.org>
 <1896673c-ae91-84c3-9573-5da91fb00f41@xs4all.nl>
 <20200806100822.kvlzivbtnqzni3xw@uno.localdomain>
 <851192ea-6498-4f9e-a6b4-bf5164f3c5a7@xs4all.nl>
 <20200806124523.llccxvcz65ohqqwq@uno.localdomain>
 <db04abc6-c9a7-7170-05f3-0238e84c4445@xs4all.nl>
 <20200806133617.q2g5a63a3qzvzkaa@uno.localdomain>
 <6a349665-8342-4f3b-d9b4-8d49a1da7d95@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a349665-8342-4f3b-d9b4-8d49a1da7d95@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Aug 06, 2020 at 05:32:50PM +0200, Hans Verkuil wrote:
> On 06/08/2020 15:36, Jacopo Mondi wrote:
> > Hi Hans,
> >    I'm sorry, I don't want to insist but..
> >
> > On Thu, Aug 06, 2020 at 03:15:54PM +0200, Hans Verkuil wrote:
> >> On 06/08/2020 14:45, Jacopo Mondi wrote:
> >>> Hi Hans,
> >>>
> >>> On Thu, Aug 06, 2020 at 12:15:49PM +0200, Hans Verkuil wrote:
> >>>> On 06/08/2020 12:08, Jacopo Mondi wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On Thu, Aug 06, 2020 at 10:45:17AM +0200, Hans Verkuil wrote:
> >>>>>> On 05/08/2020 12:57, Jacopo Mondi wrote:
> >>>>>>> Provide a table to describe how the V4L2 selection targets can be used
> >>>>>>> to access an image sensor pixel array properties.
> >>>>>>>
> >>>>>>> Reference the table in the sub-device documentation.
> >>>>>>>
> >>>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>>>> ---
> >>>>>>>  .../userspace-api/media/v4l/dev-subdev.rst    |  4 ++
> >>>>>>>  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++++++++++
> >>>>>>>  2 files changed, 53 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>>>>>> index c47861dff9b9b..2f7da3832f458 100644
> >>>>>>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>>>>>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>>>>>> @@ -467,6 +467,10 @@ desired image resolution. If the sub-device driver supports that, userspace
> >>>>>>>  can set the analog crop rectangle to select which portion of the pixel array
> >>>>>>>  to read out.
> >>>>>>>
> >>>>>>> +A description of each of the above mentioned targets when used to access the
> >>>>>>> +image sensor pixel array properties is provided by
> >>>>>>> +:ref:`v4l2-selection-targets-image-sensor-table`
> >>>>>>> +
> >>>>>>>
> >>>>>>>  Types of selection targets
> >>>>>>>  --------------------------
> >>>>>>> diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> >>>>>>> index 69f500093aa2a..632e6448b784e 100644
> >>>>>>> --- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> >>>>>>> +++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
> >>>>>>> @@ -76,3 +76,52 @@ of the two interfaces they are used.
> >>>>>>>  	modified by hardware.
> >>>>>>>        - Yes
> >>>>>>>        - No
> >>>>>>> +
> >>>>>>> +
> >>>>>>> +.. _v4l2-selection-targets-image-sensor-table:
> >>>>>>> +
> >>>>>>> +********************************************
> >>>>>>> +Selection Targets For Pixel Array Properties
> >>>>>>> +********************************************
> >>>>>>> +
> >>>>>>> +The V4L2 selection API can be used to retrieve the size and disposition of the
> >>>>>>> +pixel units that compose and image sensor pixel matrix when applied to a video
> >>>>>>> +sub-device that represents an image sensor.
> >>>>>>> +
> >>>>>>> +A description of the properties associated with each of the sensor pixel array
> >>>>>>> +areas is provided by the :ref:`v4l2-subdev-pixel-array-properties` section.
> >>>>>>> +
> >>>>>>> +.. tabularcolumns:: |p{6.0cm}|p{1.4cm}|p{7.4cm}|p(1.4cm)|
> >>>>>>> +
> >>>>>>> +.. flat-table:: Selection target definitions
> >>>>>>> +    :header-rows:  1
> >>>>>>> +    :stub-columns: 0
> >>>>>>> +
> >>>>>>> +    * - Target name
> >>>>>>> +      - id
> >>>>>>> +      - Definition
> >>>>>>> +      - Read/Write
> >>>>>>> +    * - ``V4L2_SEL_TGT_CROP``
> >>>>>>> +      - 0x0000
> >>>>>>> +      - The analog crop rectangle. Represents the portion of the active pixel
> >>>>>>> +        array which is processed to produce images.
> >>>>>>> +      - RW
> >>>>>>> +    * - ``V4L2_SEL_TGT_CROP_DEFAULT``
> >>>>>>> +      - 0x0001
> >>>>>>> +      - The active pixel array rectangle. It includes only active pixels and
> >>>>>>> +        excludes other ones such as optical black pixels. Its width and height
> >>>>>>> +        represent the maximum image resolution an image sensor can produce.
> >>>>>>> +      - RO
> >>>>>>> +    * - ``V4L2_SEL_TGT_CROP_BOUNDS``
> >>>>>>> +      - 0x0002
> >>>>>>> +      - The readable portion of the physical pixel array matrix. It includes
> >>>>>>> +        pixels that contains valid image data and calibration pixels such as the
> >>>>>>> +        optical black ones.
> >>>>>>> +      - RO
> >>>>>>> +    * - ``V4L2_SEL_TGT_NATIVE_SIZE``
> >>>>>>> +      - 0x0003
> >>>>>>> +      - The physical pixel array size, including readable and not readable
> >>>>>>> +        pixels. As pixels that cannot be read from application processor are not
> >>>>>>> +        relevant for calibration purposes, this rectangle is useful to calculate
> >>>>>>> +        the physical properties of the image sensor.
> >>>>>>> +      - RO
> >>>>>>>
> >>>>>>
> >>>>>> Hmm, this basically just duplicates the previous patch.
> >>>>>>
> >>>>>> I think you are documenting things at the wrong place. What you documented in the
> >>>>>> previous patch really belongs here since it is shared between the subdev API and the
> >>>>>> regular V4L2 API. And in dev-subdev.rst you then refer to here.
> >>>>>
> >>>>> I originally had it here, but then I moved to dev-subdev as an image
> >>>>> sensor will always be represented as a video sub-device, doen't it ?
> >>>>
> >>>> No. Some camera drivers are V4L2 only, most notably uvc. Also there are several simple
> >>>> platform drivers that don't use the subdev API.
> >>>
> >>> Do we expect to be able to retrieve sensor array properties from video
> >>> device nodes which represents, in my understanding a DMA engine that
> >>> writes data to memory ? As I see it, not subdev for the image sensor,
> >>> no pixel array properties. How can these be exposed by a video device
> >>> which abstracts the full capture pipeline ?
> >>
> >> They will typically ask the subdev driver. The vidioc_g_selection op
> >> implementation will in turn call the get_selection op of the sensor subdev
> >> driver and pass that information back to userspace.
> >
> > How do we know that the any target reports the actual sensor
> > properties and not some other limitation introduced by processing
> > components down the pipeline, as everything sits behind a single video
> > device node ? In example, the default crop rectangle might very well depend
> > on the receiver's side decision to crop the frames received from the
> > sensor to maximize the FOV or whatnot. How do we know which 'cropping
> > point' is reported ?
>
> Why would you care? Would you do anything different in userspace if a driver
> would modify these rectangles before passing it on to userspace?
>

Yes it indeed makes a difference, particularly for application dealing
with RAW sensors and for IPS tuning algorithms that need to access the
sensor pixel matrix sizes to calculate, in example, the FOV ratio, or
might want to access black pixels for calibration purposes.

Now, I'm not an expert on that part, but in example I see the
RaspberryPi 3A algorthms in libcamera using the ratio between the
active pixel array size and what I referred to as 'analogCrop' to
calculate the lens shading correction maps
https://git.linuxtv.org/libcamera.git/tree/src/ipa/raspberrypi/controller/rpi/alsc.cpp#n185

I can imagine there are other relevant image tuning algorithms that
needs to access the sensor characteristics precisely. Knowing that
what I'm getting describes the sensor properties is relevant. That's
why I hardly see this happening going through a single device node.

> > I hardly see a vidio_g_selection() being ideal to report properties of
> > the camera sensor such as the pixel array ones. I still feel we're
> > hijacking that API for that purpose and I would be glad to have
> > dedicated targets for image sensors. This would promote 'image
> > sensors' as first class citizens of the API like devices and
> > sub-devices, and I'm not sure this is desirable.
>
> Sorry, but the selection API (and its CROP predecessor) has been in use
> for sensors and webcam drivers since pretty much the beginning of V4L1.
>
> I'm not sure what it is that you think is problematical with the current
> API.
>

I'm not proposing to kill that API, I just think the existing targets
fall short or are under-specified when applied to RAW image sensor,
that's it :)

Thanks
  j

> Regards,
>
> 	Hans
>
> >
> >>
> >> There is nothing subdev specific to this API.
> >>
> >> Regards,
> >>
> >> 	Hans
>
