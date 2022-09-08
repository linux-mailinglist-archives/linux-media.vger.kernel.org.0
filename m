Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7148C5B2808
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 23:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiIHU76 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 16:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiIHU74 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 16:59:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0F052827
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 13:59:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10A378F1;
        Thu,  8 Sep 2022 22:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662670792;
        bh=Hcciv1gDugin1hmb3MfrlrlkcwH41jF/64R/vdhAr2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BFlaUiSCfIGaPLtJzu+OlWT7gXPxTImaGKa5TVeBUxUtNIIrgOHnXOe4JMz+KlRY1
         habIw3yIHHw0KGJH3yM+OxIHbTE0Z0kdY3Yk3CUC/ALr4+zGUFs2PpEQ89U5dBd+/H
         WngcG43xPp1sZ5JYKGLKVeJZBvbuOBnBkcZAxm5Y=
Date:   Thu, 8 Sep 2022 23:59:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
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
Message-ID: <YxpXtzqPluRM4JIp@pendragon.ideasonboard.com>
References: <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat>
 <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat>
 <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat>
 <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
 <CANiDSCuVj6kU9i24wVXqF5Kwr=Dbq56exKEJn9JyeEFUYe9xuw@mail.gmail.com>
 <YxpC80eZzusR3doI@pendragon.ideasonboard.com>
 <CANiDSCtt-K29r+CSdM9vio9wJCp1iTnbVnHECadmwiZdHKcE7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtt-K29r+CSdM9vio9wJCp1iTnbVnHECadmwiZdHKcE7g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 08, 2022 at 10:04:54PM +0200, Ricardo Ribalda wrote:
> On Thu, 8 Sept 2022 at 21:31, Laurent Pinchart wrote:
> > On Thu, Sep 08, 2022 at 08:13:57PM +0200, Ricardo Ribalda wrote:
> > > On Thu, 8 Sept 2022 at 20:13, Ricardo Ribalda wrote:
> > > > On Thu, 8 Sept 2022 at 17:34, Maxime Ripard wrote:
> > > > > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> > > > > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > > > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> > > > > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > > > > > > > Hi Ricardo,
> > > > > > > > >
> > > > > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > > > > > > > > - Still on slide 16, V4L2 as an API is usable without disclosing vendor
> > > > > > > > > > >   IP. What is not possible is upstreaming a driver. I don't see this as
> > > > > > > > > > >   significantly different between V4L2 and the new API proposal. I
> > > > > > > > > > >   expect this to be discussed on Monday.
> > > > > > > > > >
> > > > > > > > > > I am only considering upstream drivers. There is not much to discuss
> > > > > > > > > > for downstream or closed drivers :)
> > > > > > > > >
> > > > > > > > > Are we really discussing upstream *drivers*? If anything, it looks like
> > > > > > > > > the Kcam proposal moves most of the drivers out of upstream.
> > > > > > > >
> > > > > > > > Given that the API proposal sets at a significant lower level than V4L2
> > > > > > > > in the stack, the concept of "userspace driver" (I meant it in the sense
> > > > > > > > of GPU support in mesa) plays a bigger role. It would be good to clarify
> > > > > > > > what is meant by "driver" and maybe use the term "kernel driver" when
> > > > > > > > only the kernel part is covered, to avoid misunderstandings.
> > > > > > >
> > > > > > > I think there's a bit of a misunderstanding about what exactly is in a
> > > > > > > DRM driver, and what is in Mesa.
> > > > > > >
> > > > > > > Mesa doesn't program the hardware at all, it's merely a glorified
> > > > > > > compiler. It's not more of a driver than GCC is an OS. Most importantly
> > > > > > > for our discussion, Mesa doesn't perform any kind of register access (or
> > > > > > > register access request), only the (kernel) driver does that.
> > > > > >
> > > > > > Mesa compiles shaders, but also more generally produces command streams
> > > > > > that are passed as blobs to the DRM driver, which then forwards them to
> > > > > > the device with as little processing and validation as possible (when
> > > > > > the device is designed with multi-clients in mind, that processing and
> > > > > > validation can be reduced a lot).
> > > > >
> > > > > That's true, but at no point in time is the CPU ever touches that
> > > > > command stream blob in the case of DRM...
> > > >
> > > > As Laurent says, the latest hardware is very similar to GPUs, you pass
> > > > a set of commands to a firmware that does the actual R/W to the
> > > > hardware.
> >
> > *Some* of the latest hardware. There are new SoCs getting to the market
> > today with GPUs that are fully programmed from the kernel, and even more
> > that are fully programmable from the kernel even if the stack provided
> > by the SoC vendor has a firmware that takes care of programming the ISP.
> >
> > One thing that isn't clear in your proposal is where the line is drawn.
> > Passing a blob to the ISP firmware involves some kind of communication
> > mechanism, which ultimately deals with hardware registers somewhere.
> > It's not clear if those registers are part of the blob that userspace
> > passes to the kernel. I'd assume not, but clarifying where the line is
> > would be useful.
> >
> > > > For hardware that is a register set, the vendor should have a good
> > > > idea about what kind of validation should be needed: raw access (deny
> > > > list) or more abstracted (allow list).
> > > >
> > > > The most critical part is the DMA, and that will always be abstracted.
> > > > Also I doubt that we will have new hardware without an IOMMU, so we
> > > > have the same layers of security as today.
> >
> > I know of SoCs in the making that have ISPs and no IOMMU.
> 
> I guess this is why you meant with reserving CVE ranges :)

I recall very vividly a painful debugging session a long time ago, on an
old SoC that had an IOMMU. Under certain circumstances, the DMA engine,
when crossing a page boundary, would write the next two bytes to the
next physical page instead of the next virtual page. That was clearly a
hardware bug, and hardware bugs happen all the time, on both old and new
hardware. The kernel driver made sure that the particular circumstances
in which this could happen would never occur. It was fairly easy as it
only involved validating the combination of image width and pixel
format. Validating hardware registers would have been more complex.

TL;DR, even with an IOMMU, validation is will be needed. Let's also not
forget that we also need to ensure multiple clients will not have access
to each other's memory on recent SoCs where ISPs are meant to be used by
multiple clients (but without support for per-client address spaces at
the ISP hardware level, such as what could be provided by ASID and
similar mechanisms).

> > > > > > Recent ISPs have a similar architecture, with a set of registers used
> > > > > > to communicate with the ISP firmware, and then most of the hardware
> > > > > > registers for the actual image processing blocks being programmed
> > > > > > based from the command stream. "Command stream" may not be a very good
> > > > > > term for ISPs as it's not really a stream of commands, but
> > > > > > conceptually, we're dealing with a blob that is computed by userspace.
> > > > >
> > > > > ... while in Kcam, the CPU knows and will interpret that command stream.
> > > > > Maybe not in all cases, but it's still a significant difference.
> > > > >
> > > > > If we had to draw a parallel with something else in the kernel, it looks
> > > > > way more like eBPF or the discussion we had on where to parse the
> > > > > bitstreams for stateless codecs.
> > > > >
> > > > > The first one has been severely constrained to avoid the issues we've
> > > > > raised, and we all know how the second one went.
> > > >
> > > > In eBPF, you are moving some user code to the kernel, with an unstable API.
> > > >
> > > > In KCAM, (and in DRM), you let the user build a set of operations,
> > > > that you pass to the kernel via a stable API, then it is validated and
> > > > scheduled by the kernel.
> > > >
> > > > X11 was much more bizarre, the GPIO iomem was remapped into userspace.
> > >
> > > s/GPIO/GPU/ ;)
> 
> Looking forward to Monday :)

-- 
Regards,

Laurent Pinchart
