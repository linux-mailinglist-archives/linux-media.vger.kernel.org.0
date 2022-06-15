Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA60B54C8B1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 14:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346566AbiFOMiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 08:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243952AbiFOMiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 08:38:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBB231928
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 05:38:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CE6BE41;
        Wed, 15 Jun 2022 14:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655296678;
        bh=/pCm9lh1AKwXFVohxw2ivJ/zdczsKR+uqxQrmpWynMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kxuPcF0bwWEAmsTK4r4PTkLmp3d/PFP1LRxfM5ZFnM1tuPrk5ugyqe47DY98NI+YC
         TeGch3vdGnaX42XUrpRolUdfyFdln3L3QieMBl6ASeWjLWb3leg5P1rdxb6mSrELWx
         cnF+WEbUR5R41cTofl42EbAUHyobzDclcptp4Tso=
Date:   Wed, 15 Jun 2022 15:37:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
Message-ID: <YqnSnDksAYfrQVKw@pendragon.ideasonboard.com>
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
 <20220520082248.o6gzekapndo4lhgb@uno.localdomain>
 <CAPY8ntCwoLys1uwpoy3AW=wbBZod5cxj==z0XjUrBxK=0cwr8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCwoLys1uwpoy3AW=wbBZod5cxj==z0XjUrBxK=0cwr8g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, May 24, 2022 at 11:51:04AM +0100, Dave Stevenson wrote:
> On Fri, 20 May 2022 at 09:22, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > On Fri, May 06, 2022 at 03:20:09PM +0200, Hans Verkuil wrote:
> > > Hi all,
> > >
> > > Since countries are opening up again and travel is (at least for now!) a lot easier,
> > > I am considering a media summit during the ELCE in Dublin (Sep 13-16).
> > >
> > > See here for more details about the conference:
> > >
> > > https://events.linuxfoundation.org/open-source-summit-europe/
> > >
> > > Of course, this only makes sense if there is something to talk about. So please reply
> > > with any suggestions for topics!
> > >
> > > Also please let me know if you would expect to be at such a media summit in person.
> > > If only a few people would be there, then there isn't much point to this.
> > >
> > >
> > > I have two topics:
> > >
> > > 1) Discussion of the media subsystem development process: any bottlenecks, any ideas
> > >    for improvements?
> > >
> > > 2) I can give a presentation on the work I've done in the CTA-861 standard (used by
> > >    HDMI) and the edid-decode utility.
> > >
> > > I'd like to make a decision on whether or not it is worthwhile to do this in a week
> > > or two. If we wait too long it might be difficult to get a room for the summit.
> >
> > There are a few topics around image sensor support, especially
> > relevant for RAW sensor drivers
> >
> > - Recently Dave posted an question about how to represent additional
> >   processing stages that happens on the sensor side, mostly
> >   additional subsampling/cropping that happen between the analogue cropping
> >   on the full pixel array and the final image sent on the wire.
> >
> >   https://lore.kernel.org/linux-media/CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com/
> >
> >   Dave made a good introduction of the issue his email which got
> >   largely unanswered.
> >
> >   The issue is particularly relevant for RAW sensors, where applying
> >   subsampling has an impact on the sensor's sensitivity and requires
> >   to adjust the gains and exposure accordingly.
> >
> >   The V4L2 selection API falls short on this and the only other
> >   solution I am aware of is registering additional subdevices as the
> >   CCS driver does.
> 
> If you want to throw in some more image sensor related issues, I can
> think of a couple more areas that could do with some consensus on how
> to implement:
> 
> On-sensor temperature reporting. Thread started by Benjamin at
> https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.mugnier@foss.st.com/
> , but no resolution over using hwmon API or V4L2 control. If hwmon
> then we need Media Controller framework to tie the sensor and thermal
> device together.
> It's recently been queried for IMX477 with the Pi
> (https://github.com/raspberrypi/libcamera/issues/19), but it will
> apply to many sensors.

I'd favour V4L2 for simplicity, but that's a pretty self-centric view as
I care about imaging sensor temperature for the purpose of tuning
imaging algorithms. If someone wants to use an imaging sensor as a
general-purpose temperature sensor (a pretty expensive one, but why
not...), then hwmon could be considered simpler.

> Synchronising sensors for stereoscopic operation (trying to avoid the
> master / slave terminonlogy). How should that be configured? Allowing
> configuration from userspace would allow sensors to be operated
> independently which can be useful for test purposes, or should it be
> enforced from DT / ACPI? Do we set a default configuration for each
> sensor from DT/ACPI and then allow userspace to override should it
> wish?

I think the firmware should describe the connections between the sensors
(or actually between the sensors and possibly the trigger source, as we
could have two sensors configured in external trigger mode), and
userspace should then be allowed to configure the operation mode within
the possibilities the hardware offers.

> Controlling sensor GPIO outputs for things such as flash triggers,
> vsync, frame start/end, exposure start/end, etc.
> There is a huge range of features available so do we have any hope of
> standardising some of it, or do we end up hiding these away in the
> drivers with custom DT bindings to configure them? If we accept that
> there will be variation, can we vaguely standardise what those
> bindings look like? Or should these be V4L2 controls as things like
> pulse widths may want to be adjusted by userspace?

Good question. I wonder if pinctrl could help there (for part of the
problem space), or if it would be too complex. A list of (real) sample
use cases could help the discussion.

> Lens drivers. Each driver will have a "useful" range which is

I'll start nitpicking here. I've seen the terms "lens driver", "VCM",
"lens", "VCM driver", "lens controller", ... all used interchangeably,
and that's a big source of confusion. I'd like to reserve the word
"driver" to refer to the kernel software driver, as opposed to the
hardware chip that drives the actuator, and "controller" to refer to the
chip. This would then become "lens controller driver" (one may argue
that the controller drives the actuator attached to the lens, but "lens
actuator controller driver" is getting quite long, and doesn't really
improve understanding in my opinion).

> effectively dictated by the overall module. Should that be defined via
> DT as it is a feature of the platform, or leave the driver totally
> generic and expect userspace to do something sensible?
> In the case of simple systems without libcamera (this is Video 4 Linux
> 2, not Video 4 Libcamera 2), do we set default for

We'd be back to V4L in that case, there's no "libcamera 2" ;-)

> V4L2_CID_FOCUS_ABSOLUTE to a sensible hyperfocal distance, and can
> that again be defined in DT as it is defining the hardware?

Before answering this question, we need to think about how to come up
with those three values (min, max and hyperfocal distance). They need to
be measured somehow, and if we don't consider that, we'll end up with
device trees that will encode incorrect values, and we'll be none the
wiser.

> > - Probably less relevant for a media summit, but we recently got a few
> >   series trying to reconcile handling of regulators, gpios and clocks
> >   on OF and ACPI platforms all of them doing the usual "similar but
> >   slightly different" thing:
> >
> >   https://lore.kernel.org/linux-media/20220425061022.1569480-1-paul.elder@ideasonboard.com/
> >   https://lore.kernel.org/linux-media/20220329090133.338073-1-jacopo@jmondi.org/
> >   https://lore.kernel.org/linux-media/20220509143226.531117-1-foss+kernel@0leil.net/
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2c7a1e0d69221b9d489bfd8cf53262d6f82446
> >
> >   ACPI and OF handles clocks slightly differently, and it is not clear
> >   to me if ACPI based platform need explicit handling of
> >   clocks/regulator or ACPI does "the right thing" by itself (I'm
> >   afraid the answer is actually "it depends"). I'm ACPI illiterate
> >   so I cannot propose anything meaningful but if anyone is interested
> >   in discussing this further this might be a good time to do so ?
> >
> > Let me know if those points might be of any interest and I can try to
> > prepare something about them.

-- 
Regards,

Laurent Pinchart
