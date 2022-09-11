Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449575B4F9E
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 17:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiIKPWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 11:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIKPWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 11:22:38 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22E019015
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 08:22:34 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E5311200002;
        Sun, 11 Sep 2022 15:22:28 +0000 (UTC)
Date:   Sun, 11 Sep 2022 17:22:21 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Subject: Re: [Media Summit] Using the selection API to control image sensor
 subsampling
Message-ID: <20220911152142.rgjbsgysa63oox2w@uno.localdomain>
References: <20220829071528.6fxm4kdvpjzkr3yw@uno.localdomain>
 <8a745b89-e63d-ac8f-d4fa-c985d830cb41@xs4all.nl>
 <Yxy4AHldADNS2+i2@pendragon.ideasonboard.com>
 <7f850467-e482-1d8f-637c-8a2d6ffebe6e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f850467-e482-1d8f-637c-8a2d6ffebe6e@xs4all.nl>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent,

On Sun, Sep 11, 2022 at 09:16:29AM +0200, Hans Verkuil wrote:
> On 10/09/2022 18:14, Laurent Pinchart wrote:
> > On Sat, Sep 10, 2022 at 02:21:10PM +0200, Hans Verkuil wrote:
> >> On 29/08/2022 09:15, Jacopo Mondi wrote:
> >>> Hello
> >>>
> >>>    I have prepared a slide deck to brief on the discussion for
> >>> the topic specified in the subject. Slides are available at
> >>> https://nc.nibble.pw/s/oib8jzNjjtgB9c6 as an attachment of ~5MB would
> >>> probably be caught by the mailing list filter
> >>>
> >>> I'll here copy a brief summary as presented in Hans' agenda:
> >>>
> >>> -------------------------------------------------------------------------------
> >>> 11:45 Jacopo: Representing addition sensor processing stages.
> >>>
> >>>   How to represent additional processing stages that happens
> >>>   on the sensor side, mostly additional subsampling/cropping that happen
> >>>   between the analogue cropping on the full pixel array and the final
> >>>   image sent on the wire.
> >>>
> >>>   https://lore.kernel.org/linux-media/CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com/
> >>>
> >>>   Dave made a good introduction of the issue his email which got
> >>>   largely unanswered.
> >>>
> >>>   The issue is particularly relevant for RAW sensors, where applying
> >>>   subsampling has an impact on the sensor's sensitivity and requires
> >>>   to adjust the gains and exposure accordingly.
> >>> -------------------------------------------------------------------------------
> >>>
> >>> The slide deck:
> >>>
> >>> - Introduces the topic in slides [1-10]
> >>>
> >>> - Presents Dave's proposed use case and how it is currently handled in
> >>>   mainline drivers in slides [11-31] using as example the imx274,
> >>>   mt9p031 and CCS drivers.
> >>>
> >>> - Proposes a best-effort solution for imx219 in slides [32-37]
> >>>
> >>> - The last two slides presents two discussion topics which I will copy
> >>>   here
> >>>
> >>>   ------------------------------------------------------------------------
> >>>   Do we need new abstractions ?
> >>>
> >>>   - An image sensor abstraction built on top of multiple subdevices
> >>>     - Would it really make userspace any simpler ?
> >>>
> >>>   - Image sensor specific SELECTION_TARGETS
> >>>     - Conflicts with format selection are bound to happen with a single
> >>>       source pad
> >>>       - Can a “special” sink pad that represents the raw pixel array help ?
> >>>     - Does not scale to represent complex sensors with multiple scalers
> >>>   ------------------------------------------------------------------------
> >>>
> >>> The imx219 proposal can be discussed by email or in person, while the
> >>> questions in the last two slides might be worth being discussed during
> >>> the meeting.
> >>
> >> I've always wondered why binning and skipping wasn't implemented as controls.
> >> You set them in userspace based on your needs, and they change the formats
> >> and selection rectangles accordingly.
> >>
> >> Trying to model it with selection rectangles is basically impossible.
> >
> > I think it was done this way because binning and skipping are a form of
> > scaling, and scaling is modelled through selection rectangles. However,
> > scaling is supposed to be controlled by the crop and compose rectangles
> > on the sink pad, and most camera sensor drivers expose a single subdev,
> > with a source pad only. We have sensor drivers in mainline that control
> > binning/skipping using the source pad crop rectangle and the source pad
> > format, which isn't compliant with the specification.
> >
> >> For the discussion it would be good to know what kind of binning and skipping
> >> schemes there are. Would it be fairly straightforward to translate it to a
> >> control? Or are there many variations between vendors?

In my limited knowledge there might of course be various ways in how
binning/subsampling is performed, but I don't expect hundreds of
different schemes, and not that many differences between vendors ?

I know in example of a sensor that can perform binning with 4
different schemes, all of them selectable by the user. Regardless of
the fancy names the vendor gave them, the underlying schemes
themselves were pretty standard stuff.

Also, this shouldn't be a huge problem. We just add a new control option
as soon as a new scheme is used by a driver (I'm more concerned about
documenting them than implementing them to be honest).

> >
> > Controls may be an option, but I don't think they would solve the full
> > problem. A raw camera sensor typically has
> >
> > - A pixel array (obviously) with a (usually) rectangular shape, made of
> >   "active" pixels (known to be good), "margin" pixels (too close to the
> >   edges to be guaranteed to offer good quality) and "optical black"
> >   pixels (under an opaque layer, used to measure the black level).
> >   Depending on the sensor, the "margin" pixels may or may not be
> >   readable.
> >
> > - An analog crop rectangle that restricts the pixels being read out, and
> >   this affects timings. Reducing analog crop increases frame rate (but
> >   reduces the field of view). Many sensors allow full control of the
> >   analog crop rectangle, some restrict it to a set of sizes horizontally
> >   (and possibly vertically). This is a hardware restriction, not a
> >   driver restriction.
> >
> > - Binning and/or skipping, which allow subsampling by different factors
> >   (commonly 1/2 and 1/4, possibly other power of two, or maybe other
> >   factors). Skipping will just subsample, binning will average. The
> >   exact way this is implemented depends on the colour filter array
> >   pattern (Bayer, quad Bayer, ...).
> >
> > - A digital crop rectangle. It is usually freely configuration, and it
> >   doesn't affect timings (conceptually it just turns valid pixels into
> >   blanking pixels by chaning the length of the horizontal and vertical
> >   blanking).
> >
> > - A scaler that can scale the image down, more advanced than just
> >   subsampling. This is less common than the above features. If a scaler
> >   is present, there can also be another crop rectangle at the output of
> >   the scaler.
> >
> > - The may also be a FIFO in the middle of the pipeline that can re-time
> >   signals, to have an output pixel clock with a different frequency than
> >   the pixel array read clock.
> >
> > I'm probably missing something, Sakari may be able to fill the gaps.
> >
> > The way we model all this in the V4L2 subdev API is complex, both for
> > camera sensor drivers and for userspace. I'd like a different model
> > inside the kernel, I think we need a v4l2_raw_sensor (name to be
> > bike-shedded) object that driver will implement, with an in-kernel
> > interface towards driver that will match the above model much more
> > closely. This would then be translated to subdev ops for userspace in a
> > shared layer to avoid the boiler plate code and complexity in all
> > drivers. Whether or not we want a different interface towards userspace
> > is also a question I'd like to discuss, but I don't want to couple it
> > with the in-kernel interface discussion.
> >
>
> The various analog/digital crop operations and scaling are all good fits
> for a rectangle-based API. But not binning/skipping IMHO: those will
> change the size by specific factors (dividing by some integer value).

I personally don't see that much difference in using a control or a
rectangle to model any additional scaling steps, as both would
anyway require to model the sensor with multiple subdevs as soon as we
get past the single "analog crop + subsampling" case.

A control for binning/skipping can be a neat trick that allows to
represent the additional scaling step (binning/skipping) on subdevs
with a single source pad, something we all agree today is not possible
and wrongly implemented in mainline drivers, but as soon as we have a
digital scaler after the binning stage, or any other point in the
processing pipeline that changes the image resolution, the solution
won't scale.

To be clear: I think having multiple subdevs is the best
option when it comes to drivers, and the worse when it comes to
userspace.

If I put my userspace developer hat on, what I would like
would be to have a discoverable list of (possibly ordered) targets
to apply sizes on through a parameters list.

        {
                .analog_crop = Wa x Ya
                .digital_scaler = Wa / 2 x Ya / 2
                .digital_crop = ...

         }

* We can of course discuss the naming scheme of the targets, how sub-sampling
  has to be specified etc

An helper layer might translate the parameters list to the correct
"subdev[pad]/target" registered by the sensor driver.

But yes, a parameters list, or any other API we might propose, have to
assume a rather precise knowledge of how the sensor has to be
configured to reside in userspace. Unfortunately I don't see any way
around that if we aim to extend the set of configurable features
available to applications and I would like to get consensus on this as
well, as it was listed in one of Dave's pain points.

Thanks

> It's not a good fit for a rectangle-based API IMHO.
>
> Controls, however, will fit nicely.
>
> Regards,
>
> 	Hans
