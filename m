Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD2E626F9E
	for <lists+linux-media@lfdr.de>; Sun, 13 Nov 2022 14:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbiKMNGx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Nov 2022 08:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233794AbiKMNGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Nov 2022 08:06:53 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0954226EB
        for <linux-media@vger.kernel.org>; Sun, 13 Nov 2022 05:06:50 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 02B33C0003;
        Sun, 13 Nov 2022 13:06:45 +0000 (UTC)
Date:   Sun, 13 Nov 2022 14:06:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/3] Documentation: media: camera-sensor: Correct frame
 interval
Message-ID: <20221113130643.ibktofj6wqgoks4r@uno.localdomain>
References: <20221107204959.37691-1-jacopo@jmondi.org>
 <20221107204959.37691-2-jacopo@jmondi.org>
 <CAPY8ntDJVJftyxRsRg+cdbPfLpFXP4Mijy8F5ZOWLTtPqUt-LA@mail.gmail.com>
 <20221108120243.smg54xeqv5dmyect@uno.localdomain>
 <CAPY8ntCqHGTRFiGOP1BbYE7VDCGAvm9aQSWYZD7Ky2S8WGVdXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCqHGTRFiGOP1BbYE7VDCGAvm9aQSWYZD7Ky2S8WGVdXQ@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Thu, Nov 10, 2022 at 07:38:29AM +0000, Dave Stevenson wrote:
> Hi Jacopo
>
> On Tue, 8 Nov 2022 at 12:02, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hi Dave
> >    thanks for the reply
> >
> > On Tue, Nov 08, 2022 at 11:41:58AM +0000, Dave Stevenson wrote:
> > > Hi Jacopo.
> > >
> > > On Mon, 7 Nov 2022 at 20:50, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > > >
> > > > The formula to compute the frame interval uses the analogue crop
> > > > rectangle dimensions to compute the total frame size in conjunction with
> > > > blankings.
> > > >
> > > > Horizontal and vertical blankings are realized by extending the time
> > > > interval during which no valid pixels are sent on the bus between
> > > > visible lines and between consecutive frames, whose size is smaller than
> > > > the analogue crop rectangle if any additional cropping or pixel
> > > > subsampling is applied on the sensor processing pipeline.
> > > >
> > > > Correct the documentation to use the visible line length and frame
> > > > height instead of the analogue crop dimensions.
> > >
> > > I'll defer to Sakari on this, but I think the original text is correct.
> > >
> > > Consider something like CCS where you have a separate array with
> > > analogue crop, and then binning and scaling steps. AIUI the pixel rate
> > > and [HV]BLANK will be defined for the array, not on the binned and
> > > scaled values which finally give the visible frame. See [1].
> > >
> > > For the majority of sensors where analogue cropping, binning, and
> > > scaling are not broken out separately, then it may well have been
> > > incorrectly implemented as they do often look at the output
> > > width/height. Should they be using the w/h values returned by
> > > V4L2_SEL_TGT_CROP on V4L2_SUBDEV_FORMAT_ACTIVE for the sensor modes
> > > instead? Quite probably, but that also makes the userspace more
> > > complex (and probably needs fixing).
> >
> > More or less this was my reasoning, please see the cover letter.
>
>  A thought came to me on this one.
> If defined as the output width/height of the subdev implementing the
> blanking controls, then both CCS and the majority are correct as they
> are.

I presume so as well..

>
> Doing so also avoids a load of mess in drivers where H & V binning
> each double the pixel rate if VBLANK/HBLANK are with regard the
> analogue cropped area, which results in more controls to update in the
> driver, and more to reread in userspace.
>

So do you think I should continue using the "analogue crop rectangle"
in the documentation as the reference for blankings calculations even
if most drivers do not actually use it ? IOW drop the first patch and
use a more generic

"The new maximum limit for the controls should be re-calculated using the
newly applied s/visibile width and heigh/dimensions/"

in 2/3 ?

Thanks for the review ;)

> Cheers.
>   Dave
>
> > >
> > >   Dave
> > >
> > > [1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ccs/ccs-core.c#L734
> > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > >  Documentation/driver-api/media/camera-sensor.rst | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > index c7d4891bd24e..bb7d62db4cd1 100644
> > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > @@ -87,12 +87,11 @@ less all modern raw camera sensors.
> > > >
> > > >  The frame interval is calculated using the following equation::
> > > >
> > > > -       frame interval = (analogue crop width + horizontal blanking) *
> > > > -                        (analogue crop height + vertical blanking) / pixel rate
> > > > +       frame interval = (visible width + horizontal blanking) *
> > > > +                        (visibile height + vertical blanking) / pixel rate
> > > >
> > > >  The formula is bus independent and is applicable for raw timing parameters on
> > > > -large variety of devices beyond camera sensors. Devices that have no analogue
> > > > -crop, use the full source image size, i.e. pixel array size.
> > > > +large variety of devices beyond camera sensors.
> > > >
> > > >  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > > >  ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> > > > --
> > > > 2.38.1
> > > >
