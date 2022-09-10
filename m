Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E015B4770
	for <lists+linux-media@lfdr.de>; Sat, 10 Sep 2022 18:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiIJQPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Sep 2022 12:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiIJQPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Sep 2022 12:15:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686962496B
        for <linux-media@vger.kernel.org>; Sat, 10 Sep 2022 09:15:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3EA2440;
        Sat, 10 Sep 2022 18:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662826512;
        bh=rGiLeMR8Njb8olPVdrRk9x5Cg+lIncnc5nW1bQaRZ2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nl5FyMzQsRNF9O31BdqVhFVGC/Tvk87GH/WCMXhc18ZWRNVTcmqp5c0o1cKA7hJCY
         tGCQOmf5uK1xxE3vA5sus+Ff6AIArg4qg8ECVleKOZDafQJxrIlTAQpCtCtmZse2EL
         EHaM8cNXSqjhYg48yZ0Br+adsy+x77u+4ZAtH/64=
Date:   Sat, 10 Sep 2022 19:14:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
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
Message-ID: <Yxy4AHldADNS2+i2@pendragon.ideasonboard.com>
References: <20220829071528.6fxm4kdvpjzkr3yw@uno.localdomain>
 <8a745b89-e63d-ac8f-d4fa-c985d830cb41@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a745b89-e63d-ac8f-d4fa-c985d830cb41@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Sep 10, 2022 at 02:21:10PM +0200, Hans Verkuil wrote:
> On 29/08/2022 09:15, Jacopo Mondi wrote:
> > Hello
> > 
> >    I have prepared a slide deck to brief on the discussion for
> > the topic specified in the subject. Slides are available at
> > https://nc.nibble.pw/s/oib8jzNjjtgB9c6 as an attachment of ~5MB would
> > probably be caught by the mailing list filter
> > 
> > I'll here copy a brief summary as presented in Hans' agenda:
> > 
> > -------------------------------------------------------------------------------
> > 11:45 Jacopo: Representing addition sensor processing stages.
> > 
> >   How to represent additional processing stages that happens
> >   on the sensor side, mostly additional subsampling/cropping that happen
> >   between the analogue cropping on the full pixel array and the final
> >   image sent on the wire.
> > 
> >   https://lore.kernel.org/linux-media/CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com/
> > 
> >   Dave made a good introduction of the issue his email which got
> >   largely unanswered.
> > 
> >   The issue is particularly relevant for RAW sensors, where applying
> >   subsampling has an impact on the sensor's sensitivity and requires
> >   to adjust the gains and exposure accordingly.
> > -------------------------------------------------------------------------------
> > 
> > The slide deck:
> > 
> > - Introduces the topic in slides [1-10]
> > 
> > - Presents Dave's proposed use case and how it is currently handled in
> >   mainline drivers in slides [11-31] using as example the imx274,
> >   mt9p031 and CCS drivers.
> > 
> > - Proposes a best-effort solution for imx219 in slides [32-37]
> > 
> > - The last two slides presents two discussion topics which I will copy
> >   here
> > 
> >   ------------------------------------------------------------------------
> >   Do we need new abstractions ?
> > 
> >   - An image sensor abstraction built on top of multiple subdevices
> >     - Would it really make userspace any simpler ?
> > 
> >   - Image sensor specific SELECTION_TARGETS
> >     - Conflicts with format selection are bound to happen with a single
> >       source pad
> >       - Can a “special” sink pad that represents the raw pixel array help ?
> >     - Does not scale to represent complex sensors with multiple scalers
> >   ------------------------------------------------------------------------
> > 
> > The imx219 proposal can be discussed by email or in person, while the
> > questions in the last two slides might be worth being discussed during
> > the meeting.
> 
> I've always wondered why binning and skipping wasn't implemented as controls.
> You set them in userspace based on your needs, and they change the formats
> and selection rectangles accordingly.
> 
> Trying to model it with selection rectangles is basically impossible.

I think it was done this way because binning and skipping are a form of
scaling, and scaling is modelled through selection rectangles. However,
scaling is supposed to be controlled by the crop and compose rectangles
on the sink pad, and most camera sensor drivers expose a single subdev,
with a source pad only. We have sensor drivers in mainline that control
binning/skipping using the source pad crop rectangle and the source pad
format, which isn't compliant with the specification.

> For the discussion it would be good to know what kind of binning and skipping
> schemes there are. Would it be fairly straightforward to translate it to a
> control? Or are there many variations between vendors?

Controls may be an option, but I don't think they would solve the full
problem. A raw camera sensor typically has

- A pixel array (obviously) with a (usually) rectangular shape, made of
  "active" pixels (known to be good), "margin" pixels (too close to the
  edges to be guaranteed to offer good quality) and "optical black"
  pixels (under an opaque layer, used to measure the black level).
  Depending on the sensor, the "margin" pixels may or may not be
  readable.

- An analog crop rectangle that restricts the pixels being read out, and
  this affects timings. Reducing analog crop increases frame rate (but
  reduces the field of view). Many sensors allow full control of the
  analog crop rectangle, some restrict it to a set of sizes horizontally
  (and possibly vertically). This is a hardware restriction, not a
  driver restriction.

- Binning and/or skipping, which allow subsampling by different factors
  (commonly 1/2 and 1/4, possibly other power of two, or maybe other
  factors). Skipping will just subsample, binning will average. The
  exact way this is implemented depends on the colour filter array
  pattern (Bayer, quad Bayer, ...).

- A digital crop rectangle. It is usually freely configuration, and it
  doesn't affect timings (conceptually it just turns valid pixels into
  blanking pixels by chaning the length of the horizontal and vertical
  blanking).

- A scaler that can scale the image down, more advanced than just
  subsampling. This is less common than the above features. If a scaler
  is present, there can also be another crop rectangle at the output of
  the scaler.

- The may also be a FIFO in the middle of the pipeline that can re-time
  signals, to have an output pixel clock with a different frequency than
  the pixel array read clock.

I'm probably missing something, Sakari may be able to fill the gaps.

The way we model all this in the V4L2 subdev API is complex, both for
camera sensor drivers and for userspace. I'd like a different model
inside the kernel, I think we need a v4l2_raw_sensor (name to be
bike-shedded) object that driver will implement, with an in-kernel
interface towards driver that will match the above model much more
closely. This would then be translated to subdev ops for userspace in a
shared layer to avoid the boiler plate code and complexity in all
drivers. Whether or not we want a different interface towards userspace
is also a question I'd like to discuss, but I don't want to couple it
with the in-kernel interface discussion.

-- 
Regards,

Laurent Pinchart
