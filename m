Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594ED5B3322
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 11:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiIIJLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 05:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiIIJLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 05:11:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0FE134607
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 02:11:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41DC8415;
        Fri,  9 Sep 2022 11:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662714707;
        bh=FUjmMOYtrH3y6QxTeH6hxB3U53+VT8gnsnmqDVXyXFI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FjV1k3E5ug2YsbSgAJVWQtIEgwswq9ulElKi05MYJ+Ev6QClqfjfMZ3pmqOGpBxA8
         rCfROj1Uf/LHalcbwuz1SBT872aZxCOCBf9272eulhZ3SUrcPdAW3Q+psjkLrQLsTw
         6gAmagzTBJOM+atYW1YEgg+85qQagh8UFdwwk2aQ=
Date:   Fri, 9 Sep 2022 12:11:30 +0300
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
Message-ID: <YxsDQiEZzLtzVhdW@pendragon.ideasonboard.com>
References: <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
 <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat>
 <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat>
 <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat>
 <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
 <20220909080028.vchiddgtt2kl2ha3@houat>
 <CANiDSCva_RZpSHMaaHXyzuQD_zTYFOG2CsNYA15_C39a_nSHnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCva_RZpSHMaaHXyzuQD_zTYFOG2CsNYA15_C39a_nSHnQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Fri, Sep 09, 2022 at 10:39:36AM +0200, Ricardo Ribalda wrote:
> On Fri, 9 Sept 2022 at 10:00, Maxime Ripard wrote:
> > On Thu, Sep 08, 2022 at 08:13:17PM +0200, Ricardo Ribalda wrote:
> > > On Thu, 8 Sept 2022 at 17:34, Maxime Ripard wrote:
> > > > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> > > > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > > > > > > Hi Ricardo,
> > > > > > > >
> > > > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > > > > > > > - Still on slide 16, V4L2 as an API is usable without disclosing vendor
> > > > > > > > > >   IP. What is not possible is upstreaming a driver. I don't see this as
> > > > > > > > > >   significantly different between V4L2 and the new API proposal. I
> > > > > > > > > >   expect this to be discussed on Monday.
> > > > > > > > >
> > > > > > > > > I am only considering upstream drivers. There is not much to discuss
> > > > > > > > > for downstream or closed drivers :)
> > > > > > > >
> > > > > > > > Are we really discussing upstream *drivers*? If anything, it looks like
> > > > > > > > the Kcam proposal moves most of the drivers out of upstream.
> > > > > > >
> > > > > > > Given that the API proposal sets at a significant lower level than V4L2
> > > > > > > in the stack, the concept of "userspace driver" (I meant it in the sense
> > > > > > > of GPU support in mesa) plays a bigger role. It would be good to clarify
> > > > > > > what is meant by "driver" and maybe use the term "kernel driver" when
> > > > > > > only the kernel part is covered, to avoid misunderstandings.
> > > > > >
> > > > > > I think there's a bit of a misunderstanding about what exactly is in a
> > > > > > DRM driver, and what is in Mesa.
> > > > > >
> > > > > > Mesa doesn't program the hardware at all, it's merely a glorified
> > > > > > compiler. It's not more of a driver than GCC is an OS. Most importantly
> > > > > > for our discussion, Mesa doesn't perform any kind of register access (or
> > > > > > register access request), only the (kernel) driver does that.
> > > > >
> > > > > Mesa compiles shaders, but also more generally produces command streams
> > > > > that are passed as blobs to the DRM driver, which then forwards them to
> > > > > the device with as little processing and validation as possible (when
> > > > > the device is designed with multi-clients in mind, that processing and
> > > > > validation can be reduced a lot).
> > > >
> > > > That's true, but at no point in time is the CPU ever touches that
> > > > command stream blob in the case of DRM...
> > >
> > > As Laurent says, the latest hardware is very similar to GPUs, you pass
> > > a set of commands to a firmware that does the actual R/W to the
> > > hardware.
> >
> > For the latest, most powerful, hardware, maybe. I can show you plenty of
> > other ISP we'll need to support that aren't programmed that way, and in
> > that case we would end up interpreting whatever is being passed to KCam
> > on the CPU.
> 
> Kcam is not meant to replace V4L2, if a hardware is better modeled in
> V4L2, they can use it.
> 
> > Which is totally different to what DRM/Mesa is doing on *any* hardware.
> >
> > Another constraint that Mesa has is that there is standards user-space
> > API that all the applications target when it comes to graphics (OpenGL,
> > Vulkan, Direct3D, etc.) and you need to support pretty much all of them.
> > So in that sense, Mesa is a transpiler between that API and the GPU ISA.
> > We're not in this case either with Kcam.
> 
> We also have APIs for cameras: V4L2, Android HAL, libcamera,
> one-of-the-many-industrial-APIs
> 
> The userspace stack will transpile between that API and the ISP command buffers.
> 
> > > For hardware that is a register set, the vendor should have a good
> > > idea about what kind of validation should be needed: raw access (deny
> > > list) or more abstracted (allow list).
> >
> > This would be similar to what is going on with regmap caches. And they
> > are a pain to deal with because that information is far from being
> > available for all the devices, and then most drivers don't implement it
> > either.
> >
> > Also, if we have to have a whitelist in the kernel, then we need to
> > introduce and upstream some kind of driver for hardware enablement.
> > Doesn't that completely defeat the purpose of Kcam?
> 
> The allowlist model that I mention is not about filtering what
> registers can be written and what not. It is about abstracting them
> completely if you do not trust the hardware:
> 
> Lets say that you only have 4 verified modes (like we have on many
> sensors), then you expose a single register with 4 valid values:
> 0,1,2,3. The driver will convert that single register write into N
> writes to registers.

Continuing my quest to try to get everybody to understand the proposal
the same way: "register" is a very bad term for this. It's widely
understood to mean hardware registers by the target audience of the API,
so we should use a different term for the abstract/synthetic parameters
that the API exposes to userspace.

> > > The most critical part is the DMA, and that will always be abstracted.
> >
> > Where do you draw the line then? What will have a driver in the kernel,
> > and what won't?
> 
> If there is memory access: abstraction
> If the hardware is not trusted/documented:abstraction
> If a specific configuration is know to be invalid and leaves the
> system in an invalid state:filtering
> everything else: raw access (+validation)
> 
> > And again, the issue I was telling you about was about a configuration
> > mismatch (following a bogus documentation) between the DMA and the
> > sensor. If the sensor is part of the userspace and the DMA in the
> > kernel, we very much can still have that issue.
> 
> With internal operations you can achieve cooperation between the entities.
> 
> > > Also I doubt that we will have new hardware without an IOMMU, so we
> > > have the same layers of security as today.
> >
> > Maybe not for the kind of devices that end up on chromebooks, but
> > there's definitely hardware being designed today that have an ISP but no
> > IOMMU.
> 
> For the non-iommu hardware, you will have the same security as today:
> driver validation.
> 
> > > > > Recent ISPs have a similar architecture, with a set of registers used
> > > > > to communicate with the ISP firmware, and then most of the hardware
> > > > > registers for the actual image processing blocks being programmed
> > > > > based from the command stream. "Command stream" may not be a very good
> > > > > term for ISPs as it's not really a stream of commands, but
> > > > > conceptually, we're dealing with a blob that is computed by userspace.
> > > >
> > > > ... while in Kcam, the CPU knows and will interpret that command stream.
> > > > Maybe not in all cases, but it's still a significant difference.
> > > >
> > > > If we had to draw a parallel with something else in the kernel, it looks
> > > > way more like eBPF or the discussion we had on where to parse the
> > > > bitstreams for stateless codecs.
> > > >
> > > > The first one has been severely constrained to avoid the issues we've
> > > > raised, and we all know how the second one went.
> > >
> > > In eBPF, you are moving some user code to the kernel, with an unstable API.
> > >
> > > In KCAM, (and in DRM), you let the user build a set of operations,
> > > that you pass to the kernel via a stable API, then it is validated and
> > > scheduled by the kernel.
> >
> > You won't be able to have a stable API with that design either. If only
> > because of that whitelist you were mentioning. Let's say we have a
> > register that turns out, after the facts, to not be available. If the
> > userspace ever used to set it at some point, you're screwed. Indeed,
> > either you move it out of the whitelist, and then you break userspace,
> > or you don't add it to the whitelist and end up allowing an insecure or
> > dangerous situation.
> 
> See above for our description of allowlist.
> 
> Also, using the drm model as reference. kernel version, libdrm and
> mesa (and even llvm) are very coupled. Using a wrong version can lead
> to unexpected results or even GPU hangs.
> 
> What to do when we fix bugs that affect functionality is something
> that we need to decide on case to case cases. The same way we do today
> when hardware does not support a control value and we discover it 10
> versions later.
> 
> > And you can't say you would just ignore a register that isn't part of
> > the whitelist, because then you would enforce a configuration that isn't
> > the one the user-space asked for, which is even worse.
> >
> > > X11 was much more bizarre, the GPIO iomem was remapped into userspace.
> >
> > Yes, but that wasn't the only thing bad with it. I mean, it doesn't
> > really matter who exactly does the register access eventually. In UMS,
> > X11 was doing it itself through a mapping of its own, in KCam the kernel
> > will do it on behalf of the userspace. But we still end up in both cases
> > with:
> >
> >   * The entire logic is in userspace
> 
> We can argue if this is an issue or not. I think it is not
> 
> >   * Realistically speaking, that logic can only run as root
> 
> Do not agree.
> 
> >   * With a poor configuration, the userspace can completely crash the
> >     system
> >   * If the userspace crashes, you can end up with a configuration you
> >     can't really recover from
> 
> A Kcam driver can give you broken images, but never crash the system
> or leave it in an unrecoverable state. That is the main guarantee that
> we expect from the drivers.
> 
> > *All* of those issues are still there with Kcam, even though the actual
> >  memory mapping isn't in userspace

-- 
Regards,

Laurent Pinchart
