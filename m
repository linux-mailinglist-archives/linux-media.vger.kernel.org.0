Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D4324033B
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 10:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgHJILP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 04:11:15 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:49171 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJILN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 04:11:13 -0400
Received: from uno.localdomain (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id CDCF9240004;
        Mon, 10 Aug 2020 08:11:03 +0000 (UTC)
Date:   Mon, 10 Aug 2020 10:14:37 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
Message-ID: <20200810081437.nymrroxmrskapbqg@uno.localdomain>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
 <184f8787-ebf1-90e3-82b3-44fa66e65a84@xs4all.nl>
 <20200806095038.tc6mmwknqdinaeth@uno.localdomain>
 <f4e50cbb-8b25-1269-d8b9-9c81fa73b7e1@xs4all.nl>
 <20200809171757.GC5981@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200809171757.GC5981@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Laurent
    tanks for comments.


On Sun, Aug 09, 2020 at 08:17:57PM +0300, Laurent Pinchart wrote:
> Hi Jacopo, Hans,
>
> On Thu, Aug 06, 2020 at 11:58:31AM +0200, Hans Verkuil wrote:
> > On 06/08/2020 11:50, Jacopo Mondi wrote:
> > > On Thu, Aug 06, 2020 at 10:05:37AM +0200, Hans Verkuil wrote:
> > >> On 05/08/2020 12:57, Jacopo Mondi wrote:
> > >>> The V4L2 selection API are also used to access the pixel array
> > >>
> > >> are -> is
> > >>
> > >>> properties of an image sensor, such as the size and position of active
> > >>> pixels and the cropped area of the pixel matrix used to produce images.
> > >>>
> > >>> Currently no clear definition of the different areas that compose an
> > >>> image sensor pixel array matrix is provided in the specification, and
> > >>> the actual meaning of each selection target when applied to an image
> > >>> sensor was not provided.
> > >>>
> > >>> Provide in the sub-device documentation the definition of the pixel
> > >>> matrix properties and the selection target associated to each of them.
> > >>>
> > >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > >>> ---
> > >>>  .../userspace-api/media/v4l/dev-subdev.rst    | 81 +++++++++++++++++++
> > >>>  1 file changed, 81 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > >>> index 134d2fb909fa4..c47861dff9b9b 100644
> > >>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > >>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > >>> @@ -386,6 +386,87 @@ requests on all selection targets, unless specifically told otherwise.
> > >>>  ``V4L2_SEL_FLAG_GE`` and ``V4L2_SEL_FLAG_LE`` flags may be used to round
> > >>>  the image size either up or down. :ref:`v4l2-selection-flags`
> > >>>
> > >>> +.. _v4l2-subdev-pixel-array-properties:
> > >>> +
> > >>> +Selection targets for image sensors properties
>
> Maybe "Selection targets for image sensors", and renaming the reference
> to v4l2-subdev-selections-image-sensors ? This section is about how
> selection rectangles are used for sensors, right ?
>
> > >>> +----------------------------------------------
>
> I'd move this further down, after "Types of selection targets", as that
> section contains generic information that applies to sensors too.

Ack on both points.

>
> > >>> +
> > >>> +The V4L2 selection API can be used on sub-devices that represent an image
> > >>> +sensor to retrieve the sensor's pixel array matrix properties by using the
> > >>> +:ref:`selection <VIDIOC_SUBDEV_G_SELECTION>` ioctls.
> > >>> +
> > >>> +Sub-device drivers for image sensor usually register a single source pad, but in
> > >>> +the case they expose more, the pixel array properties can be accessed from
> > >>> +any of them.
>
> Is this right ? I don't think the V4L2_SEL_TGT_CROP rectangle, for
> instance, can be accessed from any source pad indifferently. Do we have
> sensor drivers that create multiple source pads in a subdev today ? If
> not I'd suggest dropping this, and adding it later if needed (when we'll
> have a better idea of how that would work).

Yes, this was meant to cover cases which I still have not a clear idea
about but I suspect people might have question about looking at their
drivers. I'm totally fine adding it later when required.

>
> I think what should be explained here, as also mentioned by Sakari, is
> that camera sensors can be exposed as multiple subdevs. The text below
> is related to the pixel array, which is always the first subdev, with
> one source pad and no sink pad. The other subdevs, modelling additional
> processing blocks in the sensor, may use the selection API, but that's
> out of scope for this patch.
>
> As we'll also need to document how other subdevs use the selection API,
> as well as how sensors are usually handled, would it make sense to move
> this to a separate file ? Sakari has proposed in [1] to create a new
> Documentation/driver-api/media/camera-sensor.rst file. It would make
> sense to centralize all sensor information there. This doesn't mean this
> series should depend on Sakari's patch, we can handle merge conflicts
> depending on what gets merged first.

I totally missed that one but I equally totally welcome that change. I
would be happy to rebase this work on top of Sakari's patch which I
will soon give a read to.

>
> [1] https://lore.kernel.org/linux-media/20200730162040.15560-1-sakari.ailus@linux.intel.com/
>
> > >>> +
> > >>> +The ``V4L2_SEL_TGT_NATIVE``, ``V4L2_SEL_TGT_CROP_BOUNDS``,
> > >>
> > >> V4L2_SEL_TGT_NATIVE -> V4L2_SEL_TGT_NATIVE_SIZE
> > >>
> > >> (same mistake is made elsewhere).
> > >
> > > Ah ups, I used TGT_NATIVE consistently, seems like I thought that was
> > > the right name
> > >
> > >>> +``V4L2_SEL_TGT_CROP_DEFAULT`` and ``V4L2_TGT_CROP`` targets are used to retrieve
> > >>> +the immutable properties of the several different areas that compose the sensor
> > >>> +pixel array matrix. Each area describes a rectangle of logically adjacent pixel
>
> V4L2_TGT_CROP isn't immutable, is it ?
>

Right, I noticed that, but didn't want to be too heavy with createing
a special section for CROP. But you're right, it's not immutable so it
should not be mentioned here.

> > >>> +units. The logical disposition of pixels is defined by the sensor read-out
> > >>> +starting point and direction, and may differ from the physical disposition of
> > >>> +the pixel units in the pixel array matrix.
> > >>> +
> > >>> +Each pixel matrix portion is contained in a larger rectangle, with the most
> > >>> +largest being the one that describes the pixel matrix physical size. This
> > >>> +defines a hierarchical positional system, where each rectangle is defined
> > >>> +relatively to the largest available one among the ones exposed by the
> > >>> +sub-device driver. Each selection target and the associated pixel array portion
> > >>> +it represents are below presented in order from the largest to the smallest one.
>
> I find this quite confusing. As Hans suggested, I think each target
> should define its boundaries. I'd drop this paragraph completely, as you
> already explain below that all rectangles are defined relatively to
> V4L2_SEL_TGT_NATIVE_SIZE.
>

Ack.

> > >>> +
> > >>> +Pixel array physical size
> > >>> +^^^^^^^^^^^^^^^^^^^^^^^^^
> > >>> +
> > >>> +The image sensor chip is composed by a number of physical pixels, not all of
> > >>> +them readable by the application processor. Invalid or unreadable lines might
> > >>> +not be transmitted on the data bus at all, or in case on CSI-2 capable sensors
> > >>> +they might be tagged with an invalid data type (DT) so that the receiver
> > >>> +automatically discard them.
>
> "might" is a bit weak for unreadable lines, there's no way they can be
> transmitted if they can't be read :-)

This paragraph reflects my confusion on the subject. My interpretation
is that for CSI-2 sensors, you cannot crop a black pixels area and
capture just them. At the contrary, the black pixels are sent on the
bus (maybe that can be optionally enabled/disabled) tagged with a
special DT and interleaved with image data and you have to instruct
your receiver to discard or accept that DT, and have black pixels
captured to a separate memory area, or at buffer end (that depends on
the receiver's architecture I guess). At the same time, I won't be
surprised if some sensor's allow you to explicitly crop on black
pixels areas and only put them on the bus. Knowing how the SMIA++
standard handles that part might help establishing an expected
behaviour (I really, really, wish we had as a community any leverage
to influence sensor manufacturer towards a standardized behaviour, it
would be time for the industry to do so. </wishful thinking>).

If that's correct, I wonder how would that possibly work with parallel
sensors, where you cannot tag data on the bus. I there assume you have
to explicitly select the black region to capture.

I there tried to, confusingly, express that different behaviour and
stay as much as possible generic not to rule out any existing case.

>
> One way to generalize this a bit would be to explain, after the first
> sentence, that not all pixels may be read by the sensor, that among the
> pixels that are read invalid ones may not be transmitted on the bus, and
> that among transmitted pixels not all of them may be possible to capture
> on the receiver side. For instance, invalid lines may be transmitted as
> part of the vertical blanking on parallel buses, or tagged as blanking
> data or null data on CSI-2 buses. Most receivers are not able to capture
> either.
>
> (On a side note, strictly speaking, a CSI-2 receiver that would be able
> to capture null or blanking packets wouldn't be compliant with the CSI-2
> spec.)
>
> > >>> The size of the whole pixel matrix area is
> > >>> +retrieved using the V4L2_SEL_TGT_NATIVE target, which has its top-left corner
> > >>> +defined as position (0, 0). All the other selection targets are defined
> > >>> +relatively to this, larger, rectangle. The rectangle returned by
>
> s/, larger,/
>
> > >>> +V4L2_SEL_TGT_NATIVE describes an immutable property of the image sensor, it
> > >>> +does not change at run-time and cannot be modified from userspace.
> > >>
> > >> It is a good idea to mention that if there are no invalid or unreadable pixels/lines,
> > >> then V4L2_SEL_TGT_NATIVE_SIZE == V4L2_SEL_TGT_CROP_BOUNDS.
> > >
> > > Yes it is! I'll add it here
>
> Should it be added below instead, where you define
> V4L2_SEL_TGT_CROP_BOUNDS ? It's best to avoid mentioning something that
> isn't defined yet when possible.
>

I have a question for Sakari on this target, but I'll deflect it to
the reply to your comment  on patch 1/4.

> > >>> +
> > >>> +Pixel array readable area
> > >>> +^^^^^^^^^^^^^^^^^^^^^^^^^
> > >>> +
> > >>> +The V4L2_SEL_TGT_CROP_BOUNDS targets returns size and position of the readable
> > >>> +area of the pixel array matrix, including pixels with valid image data and pixel
> > >>> +used for calibration purposes, such as optical black pixels. It is not unlikely
>
> s/not unlikely/likely ? Or just "common".
>
> > >>> +that valid pixels and optical black pixels are surrounded by non-readable rows
> > >>> +and columns of pixels. Those does not concur in the definition of the
>
> s/does/do/
>
> I'm not sure "concur" is the right word. Did you mean "those are not
> part of the V4L2_SEL_TGT_CROP_BOUNDS rectangle" ?

Yes, I meant they should not be counted in the definition of the BOUND
rectangle sizes.

>
> > >>> +V4L2_SEL_TGT_CROP_BOUNDS rectangle. The rectangle returned by
> > >>> +V4L2_SEL_TGT_CROP_BOUNDS describes an immutable property of the image sensor, it
> > >>> +does not change at run-time and cannot be modified from userspace.
> > >>
> > >> Mention that BOUNDS is enclosed by NATIVE_SIZE.
> > >
> > > I tried to express that in the intro section with
> > >
> > > "Each pixel matrix portion is contained in a larger rectangle, with the most
> > > largest being the one that describes the pixel matrix physical size."
> > >
> > > But I guess it's worth to express that for each target!
> > >
> > >>> +
> > >>> +Pixel array active area
> > >>> +^^^^^^^^^^^^^^^^^^^^^^^
> > >>> +
> > >>> +The portion of the pixel array which contains valid image data is defined as the
> > >>> +active area of the pixel matrix. The active pixel array is is accessed by mean
> > >>
>
> s/is is/is/
>
> > >> mean -> means
> > >>
> > >>> +of the V4L2_SEL_TGT_CROP_DEFAULT target, and is contained in the larger
> > >>> +V4L2_SEL_TGT_CROP_BOUNDS rectangle. It represents the largest possible frame
> > >>> +resolution the sensor can produce and defines the dimension of the full
> > >>> +field-of-view. The rectangle returned by V4L2_SEL_TGT_CROP_BOUNDS describes an
> > >>
> > >> BOUNDS -> DEFAULT
> > >
> > > ups
> > >
> > >>> +immutable property of the image sensor, it does not change at run-time and
> > >>> +cannot be modified from userspace.
> > >>
> > >> Mention that CROP_DEFAULT is enclosed by CROP_BOUNDS
> > >>
> > >>> +
> > >>> +Analog crop rectangle
> > >>
> > >> Why analog? It's just the crop rectangle, nothing analog about it.
> > >
> > > We used the 'analogCrop' term in libcamera to differentiate the
> > > cropping which happens on the sensor pixel array matrix to select the
> > > region to process and produce image from. Sensor with an on-board
> > > scaler can perform other cropping steps to implement, in example digital
> > > zoom, so we expect to have a 'digital crop' phase as well. RAW
> > > sensors, in example, will only have an analogCrop rectangle.
> > >
> > > Quoting the libcamera definition of analog crop:
> > >
> > >  * horizontal and vertical sizes define the portion of the pixel array which
> > >  * is read-out and provided to the sensor's internal processing pipeline, before
> > >  * any pixel sub-sampling method, such as pixel binning, skipping and averaging
> > >  * take place.
> > >
> > > should I keep it or remove it ?
> >
> > It's a very confusing term. Especially since this API can also be used with analog
> > video capture devices (Composite/S-Video) where the video signal actually is analog.
> >
> > In the V4L2 API there is no such thing as 'analog crop', so please remove it.
>
> Jacopo is right, sensors usually perform cropping in the analog domain
> (by not reading out all pixels from the pixel array), and also support
> cropping in later stages, after binning/skipping, and after further
> scaling. Note that all of these crop operations are optional. Although
> not common, it's also not unconceivable that a sensor wouldn't support
> cropping at all.
>
> This being said, it only makes sense to talk about analog crop when
> multiple crop operations are performed, and thus in the context of the
> whole sensor, with multiple subdevs. If we explain this, as proposed
> above, and make it clear that the usage of the selection rectangles
> defined here applies to the pixel array only, we can drop the "analog"
> term, and just talk about cropping in the pixel array.
>

It's fine as long as it removes any ambiguity.

> > >>> +^^^^^^^^^^^^^^^^^^^^^
> > >>> +
> > >>> +The sensor driver might decide, in order to adjust the image resolution to best
> > >>> +match the one requested by applications, to only process a part of the active
> > >>> +pixel array matrix.
>
> I don't think that's the right approach. With MC-based devices, the
> philosophy is to expose all configuration parameters to userspace. It's
> not about sensor drivers making decisions, but about userspace deciding
> to crop at the pixel array level.
>
> This being said, I'm aware the decision is made by drivers when they're
> mode-based. Please see below for that.

Correct, and I should now be used enough to the 'userspace drives'
approach to remember about documenting it :)

>
> > >>> The selected area is read-out and processed by the image
> > >>> +sensor on-board ISP in order to produce images of the desired size and
> > >>> +resolution while possible maintaing the largest possible field-of-view. The
> > >>
> > >> maintaing -> maintaining
> > >>
> > >> Actually, I'd drop 'while possible maintaing the largest possible field-of-view'
> > >> entirely. It doesn't make much sense.
> > >
> > > Ack
>
> In general, in this section, as we're documenting the pixel array, let's
> not talk about the ISP.
>
> > >>> +cropped portion of the pixel array which is used to produce images is returned
> > >>> +by the V4L2_SEL_TGT_CROP target and represent the only information that can
> > >>
> > >> represent -> represents
> > >>
> > >>> +change at runtime as it depends on the currently configured sensor mode and
> > >>> +desired image resolution. If the sub-device driver supports that, userspace
> > >>> +can set the analog crop rectangle to select which portion of the pixel array
> > >>
> > >> s/analog//
> > >>
> > >>> +to read out.
>
> I think it's better to focus on the best case, and document usage of
> crop rectangles in general first, for drivers that expose full
> configurability of the sensor. A separate section should then then make
> a note of how mode-based drivers differ, which is mostly in the
> V4L2_SEL_TGT_CROP target being read-only, and on the single subdev
> hiding all the processing steps, with the crop target thus being the
> result of all cropping operations, analog and digital.
>
> Sakari's patch has a bit of information about this, it may be useful to
> reuse it or integrate with it somehow.
>

I'll try to see how the two parts can be piled one on top of the
other.

Thanks
  j


> > >> Mention that CROP is enclosed by CROP_BOUNDS and defaults to CROP_DEFAULT.
> > >>
> > >> Make a note that CROP can also be used to obtain optical black pixels.
> > >
> > > What about:
> > >
> > > +desired image resolution. If the sub-device driver supports that, userspace
> > > +can set the analog crop rectangle to select which portion of the pixel array
> > > +to read out including, if supported, optical black pixels.
> >
> > Hmm, that's a bit awkward. How about:
> >
> > +desired image resolution. If supported by the sub-device driver, userspace
> > +can set the crop rectangle to select which portion of the pixel array
> > +to read out. This may include optical black pixels if those are part of
> > +V4L2_SEL_TGT_CROP_BOUNDS.
> >
> > >>> +
> > >>>
> > >>>  Types of selection targets
> > >>>  --------------------------
>
> --
> Regards,
>
> Laurent Pinchart
