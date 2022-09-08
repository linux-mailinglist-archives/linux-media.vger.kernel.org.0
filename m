Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82D935B21D0
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 17:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiIHPRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 11:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiIHPRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 11:17:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D09D743B
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 08:16:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C979888;
        Thu,  8 Sep 2022 17:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662650217;
        bh=QOmSsmaGk/i/nPtuelduPGLD7onCey69lySZGau1Emg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y3fOMj/Ksj/Dhv72w8T8bZ6RnyHaGpRldL04ZaB2Wdf43VgHM82/t/SG4cmWeTtWl
         4iu7iDVSWpM1R/3yrGxyCl6GGsrHSqj8Bz+EaLMWXQYv1Uqk0Rd2eZ1+Q3lzqKOVxO
         DqFH/2wGkqNNoN9TTxKQdSP1P4NsIZu7wXM7ZhWw=
Date:   Thu, 8 Sep 2022 18:16:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [Media Summit] ChromeOS Kernel CAM
Message-ID: <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
 <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat>
 <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908145905.avq73a3hmt266o4a@houat>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > Hi Ricardo,
> > > 
> > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > > - Still on slide 16, V4L2 as an API is usable without disclosing vendor
> > > > >   IP. What is not possible is upstreaming a driver. I don't see this as
> > > > >   significantly different between V4L2 and the new API proposal. I
> > > > >   expect this to be discussed on Monday.
> > > > 
> > > > I am only considering upstream drivers. There is not much to discuss
> > > > for downstream or closed drivers :)
> > > 
> > > Are we really discussing upstream *drivers*? If anything, it looks like
> > > the Kcam proposal moves most of the drivers out of upstream.
> > 
> > Given that the API proposal sets at a significant lower level than V4L2
> > in the stack, the concept of "userspace driver" (I meant it in the sense
> > of GPU support in mesa) plays a bigger role. It would be good to clarify
> > what is meant by "driver" and maybe use the term "kernel driver" when
> > only the kernel part is covered, to avoid misunderstandings.
> 
> I think there's a bit of a misunderstanding about what exactly is in a
> DRM driver, and what is in Mesa.
> 
> Mesa doesn't program the hardware at all, it's merely a glorified
> compiler. It's not more of a driver than GCC is an OS. Most importantly
> for our discussion, Mesa doesn't perform any kind of register access (or
> register access request), only the (kernel) driver does that.

Mesa compiles shaders, but also more generally produces command streams
that are passed as blobs to the DRM driver, which then forwards them to
the device with as little processing and validation as possible (when
the device is designed with multi-clients in mind, that processing and
validation can be reduced a lot). Recent ISPs have a similar
architecture, with a set of registers used to communicate with the ISP
firmware, and then most of the hardware registers for the actual image
processing blocks being programmed based from the command stream.
"Command stream" may not be a very good term for ISPs as it's not really
a stream of commands, but conceptually, we're dealing with a blob that
is computed by userspace.

> What would be relevant to the discussion though was the userspace mode
> setting, where X11 would have most of the logic to drive the hardware
> directly.
> 
> That ended up being a mistake, and got superseded by KMS more than a
> decade ago because it wasn't working.

You're absolutely right. I focussed my analysis of the API proposal on
the ISP parameters, but there's more than that, the plan (as I
understand it) is also to handle the programming of the registers not
related to the image processing as such from userspace. I've used the
DRM <-> KMS analogy before, to point out that the graphics world has an
abstract model on the KMS side for pipeline configuration and uses the
lower-level DRM API only to pass command streams, but forgot to mention
X11 UMS. It's certainly a very good point.

> > > > > - Slide 31 mentions that entities can send operations internally and
> > > > >   listen to each other events. I'd like to better understand how that
> > > > >   will work without any abstraction in the API (as that is one of the
> > > > >   main design decision behind this new API) when those entities are from
> > > > >   different vendors, and handled by different drivers that are developed
> > > > >   independently (for instance, the camera sensor and the CSI-2 receiver,
> > > > >   or even the CSI-2 receiver and the ISP).
> > > > 
> > > > It is still under work.
> > > > 
> > > > Hardware, specially for standard buses,  should be resilient (not
> > > > crash) to format mismatches. Otherwise a mal-functionling sensor or
> > > > too much noise could crash the system (with or without kcam).
> > > > 
> > > > Drivers developed together should know about the rest of the system,
> > > > so that is not the issue here.
> > > > 
> > > > For drivers developed by different vendors for a standard bus, on
> > > > hardware that is not resilient (that was a mouthful), then we need to
> > > > prepare a set of read-only standard registers.
> > > 
> > > I'm not even sure that read-only registers would be enough. I've
> > > experienced first-hand DMA controllers that, when the camera has its
> > > timings completely off, end up completely confused and write way outside
> > > of its assigned buffer creating big chunks of corrupted memory in the
> > > system.
> > > 
> > > And that was by writing fairly legit values to registers that were meant
> > > for that, so we wouldn't be able to defend against it even with the
> > > smartest whitelist.
> > > 
> > > And we were in a "good faith" situation. Giving an attacker basically
> > > programmable access to DMA engines that might not be sitting behind an
> > > IOMMU seems like a very dangerous idea to me.
> > 
> > Do we need to preassign a range of CVE numbers ? :-)
> 
> We can do that, but I'd rather have some way to defend against that.

-- 
Regards,

Laurent Pinchart
