Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C7E5B3307
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 11:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbiIIJHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 05:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiIIJG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 05:06:58 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F4D17E23
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 02:06:47 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 53D85320029B;
        Fri,  9 Sep 2022 05:06:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 09 Sep 2022 05:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1662714402; x=
        1662800802; bh=0Mg7RK3Qi53hpl1untOXQTD2Mc6WcRtgVUvCnnZE3VY=; b=C
        Dqbkw2Jmu3G3vWNhRJkcz0DNz4CW4cf8y06aJaSVrw2BbRvskXVcGA7UyVtiBgyW
        ombbq1uqwTNfMTizAq/QOZ+A3nSQ8pnjLGF2jTpMxfpzAVnwqLEjHVEDZk1ABG+O
        JN1+vY/Ri26x9Qt8r1F2ne4KBd+dpkMy6CqqxTH/kIOGlfSY7zHEdgdBBiEzxgXN
        ENpP48RmbRrKwuOPvFD1Ha9Ke+nST8N5fCOxXhwU6uUPD1/vx4ZM3CmMn5PCeYZJ
        E2MTEwIaAK1NBahv4Lj7Vn1Uf8O6coKUkOqov/k+zFF3DHDCnUQCHesbmIXeb5TS
        dthKcoxbi4J+y0YF+yYoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662714402; x=
        1662800802; bh=0Mg7RK3Qi53hpl1untOXQTD2Mc6WcRtgVUvCnnZE3VY=; b=W
        hgKeMlo/eBOKGvOBVlrcmcF/fdsaZxAjUOl6iYPxlqkCeQTOxy6LTQfbvNrhJ1Mj
        CH6dxWmScTa+couD/lOBL6+ziOKDrs5dCt+VNc9v7YnqLX2XXSnffwVtbhMKIdNr
        mty7qppW7GYmzjg5wOTaVnNBvqrGrfUlrsRFz5jp3h38Uc5CtzOQi9HCmmdYHI0T
        fgUrDnMcn2WVcgXZrnD0kAy14eVWybZCwK1RRlN32Lz0NHGhveo6IrDRceE6rqeu
        r4gXfw1Vssso7vDIV2pETJAHAPPo1fnUhP18WxuoI50sC4tkZwmnJcEhLB5d5LUY
        X7yxOK3A1bJkX9BjC4xUg==
X-ME-Sender: <xms:IQIbY9y1-HmhC_mzX60_q1MY_RE0SAfHq_SQho_7H0cPfrJESMtbLQ>
    <xme:IQIbY9QyDxlbpIGmF5Fi2IloRmkifdhuLQGsNaxdJDUIQvOns_Qg4AXQdP2FE9uaB
    MSqDG27AbdAUXSZAtw>
X-ME-Received: <xmr:IQIbY3V08_15xnUyIvGcPIqbUG_pmMzrmVrSE_awqvd4T7w5SjMztOVgZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepuedthfekgedtfeekfeeijeelleetgfdujedtvdejkeeitdeitdeggeei
    teehffelnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghr
    nhhordhtvggthh
X-ME-Proxy: <xmx:IQIbY_gfCfJbBAS-lrlsBCWAxWf-nbgE4VUcpa0XS9pFH0dUoZpbcQ>
    <xmx:IQIbY_AwfwUs3AdsSgwjXcOLDNwfs4p8BeDwtfo-FzU_Iox9Gq6FkA>
    <xmx:IQIbY4ISRlvTEfYAaRgFdrWQCGKADLu1ljhJib08nJFfxm0DvAJvSw>
    <xmx:IgIbY346svlAyp3YWoo_ALGcjDZ_mZ1J_4z4VPFcS1P2SsMP_pHeTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 05:06:40 -0400 (EDT)
Date:   Fri, 9 Sep 2022 11:06:37 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <20220909090637.pexjm56fdzrjwpfy@houat>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANiDSCva_RZpSHMaaHXyzuQD_zTYFOG2CsNYA15_C39a_nSHnQ@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 09, 2022 at 10:39:36AM +0200, Ricardo Ribalda wrote:
> Hi Maxime
>=20
> On Fri, 9 Sept 2022 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Thu, Sep 08, 2022 at 08:13:17PM +0200, Ricardo Ribalda wrote:
> > > On Thu, 8 Sept 2022 at 17:34, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrot=
e:
> > > > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > > > > > > Hi Ricardo,
> > > > > > > >
> > > > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda w=
rote:
> > > > > > > > > > - Still on slide 16, V4L2 as an API is usable without d=
isclosing vendor
> > > > > > > > > >   IP. What is not possible is upstreaming a driver. I d=
on't see this as
> > > > > > > > > >   significantly different between V4L2 and the new API =
proposal. I
> > > > > > > > > >   expect this to be discussed on Monday.
> > > > > > > > >
> > > > > > > > > I am only considering upstream drivers. There is not much=
 to discuss
> > > > > > > > > for downstream or closed drivers :)
> > > > > > > >
> > > > > > > > Are we really discussing upstream *drivers*? If anything, i=
t looks like
> > > > > > > > the Kcam proposal moves most of the drivers out of upstream.
> > > > > > >
> > > > > > > Given that the API proposal sets at a significant lower level=
 than V4L2
> > > > > > > in the stack, the concept of "userspace driver" (I meant it i=
n the sense
> > > > > > > of GPU support in mesa) plays a bigger role. It would be good=
 to clarify
> > > > > > > what is meant by "driver" and maybe use the term "kernel driv=
er" when
> > > > > > > only the kernel part is covered, to avoid misunderstandings.
> > > > > >
> > > > > > I think there's a bit of a misunderstanding about what exactly =
is in a
> > > > > > DRM driver, and what is in Mesa.
> > > > > >
> > > > > > Mesa doesn't program the hardware at all, it's merely a glorifi=
ed
> > > > > > compiler. It's not more of a driver than GCC is an OS. Most imp=
ortantly
> > > > > > for our discussion, Mesa doesn't perform any kind of register a=
ccess (or
> > > > > > register access request), only the (kernel) driver does that.
> > > > >
> > > > > Mesa compiles shaders, but also more generally produces command s=
treams
> > > > > that are passed as blobs to the DRM driver, which then forwards t=
hem to
> > > > > the device with as little processing and validation as possible (=
when
> > > > > the device is designed with multi-clients in mind, that processin=
g and
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
>=20
> Kcam is not meant to replace V4L2, if a hardware is better modeled in
> V4L2, they can use it.

I'm not sure that alone is going to fly. Having to support the same
device in multiple frameworks based on who is using it exactly is very
frowned upon: it's a waste of development, review and maintenance time.

If we aim for something, it's to supersede v4l2, or to extend v4l2.

> > Which is totally different to what DRM/Mesa is doing on *any* hardware.
> >
> > Another constraint that Mesa has is that there is standards user-space
> > API that all the applications target when it comes to graphics (OpenGL,
> > Vulkan, Direct3D, etc.) and you need to support pretty much all of them.
> > So in that sense, Mesa is a transpiler between that API and the GPU ISA.
> > We're not in this case either with Kcam.
>=20
> We also have APIs for cameras: V4L2, Android HAL, libcamera,
> one-of-the-many-industrial-APIs

The fact that you mention that there is many industrial APIs kind of
prove my point: none of them are anywhere near industry standards like
OpenGL or Vulkan can be. And you never mentioned that you wanted to
support all of them as a goal for kcam?

> The userspace stack will transpile between that API and the ISP
> command buffers.

And if there's no ISA for the ISP, then it's just going to create some
kind of bytecode that the kernel will execute.

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
>=20
> The allowlist model that I mention is not about filtering what
> registers can be written and what not. It is about abstracting them
> completely if you do not trust the hardware:
>=20
> Lets say that you only have 4 verified modes (like we have on many
> sensors), then you expose a single register with 4 valid values:
> 0,1,2,3. The driver will convert that single register write into N
> writes to registers.

I'm not sure I get how that is different to what we have today with v4l2
controls? I'm pretty sure that's exactly how we discover and change
modes today with v4l2.

> > > The most critical part is the DMA, and that will always be abstracted.
> >
> > Where do you draw the line then? What will have a driver in the kernel,
> > and what won't?
>=20
> If there is memory access: abstraction
> If the hardware is not trusted/documented:abstraction
> If a specific configuration is know to be invalid and leaves the
> system in an invalid state:filtering
> everything else: raw access (+validation)

I mean, the ISP you mentioned at least has to access the command buffer
somehow, and surely that counts as a memory access?

And so, what happens if the ISP is not entirely documented? You start
with a kernel driver, and then once it is documented you move it to Kcam
breaking all users in the process?

> > And again, the issue I was telling you about was about a configuration
> > mismatch (following a bogus documentation) between the DMA and the
> > sensor. If the sensor is part of the userspace and the DMA in the
> > kernel, we very much can still have that issue.
>=20
> With internal operations you can achieve cooperation between the entities.

Again, looks like what we currenty have with v4l2 to me.

> > > Also I doubt that we will have new hardware without an IOMMU, so we
> > > have the same layers of security as today.
> >
> > Maybe not for the kind of devices that end up on chromebooks, but
> > there's definitely hardware being designed today that have an ISP but no
> > IOMMU.
>=20
> For the non-iommu hardware, you will have the same security as today:
> driver validation.

I mean, I'm all for it. But the stated goal of Kcam is to reduce the
driver logic so that most of it is in userspace, but most of your
answers to challenges so far has been "but we'll have a driver for that"

If a driver is the solution, why do we need the Kcam architecture in the
first place?

> > > > > Recent ISPs have a similar architecture, with a set of registers =
used
> > > > > to communicate with the ISP firmware, and then most of the hardwa=
re
> > > > > registers for the actual image processing blocks being programmed
> > > > > based from the command stream. "Command stream" may not be a very=
 good
> > > > > term for ISPs as it's not really a stream of commands, but
> > > > > conceptually, we're dealing with a blob that is computed by users=
pace.
> > > >
> > > > ... while in Kcam, the CPU knows and will interpret that command st=
ream.
> > > > Maybe not in all cases, but it's still a significant difference.
> > > >
> > > > If we had to draw a parallel with something else in the kernel, it =
looks
> > > > way more like eBPF or the discussion we had on where to parse the
> > > > bitstreams for stateless codecs.
> > > >
> > > > The first one has been severely constrained to avoid the issues we'=
ve
> > > > raised, and we all know how the second one went.
> > >
> > > In eBPF, you are moving some user code to the kernel, with an unstabl=
e API.
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
>=20
> See above for our description of allowlist.
>=20
> Also, using the drm model as reference. kernel version, libdrm and
> mesa (and even llvm) are very coupled. Using a wrong version can lead
> to unexpected results or even GPU hangs.

Right.

And those are considered regressions:
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspac=
e-requirements

"""
The Linux kernel=E2=80=99s =E2=80=9Cno regression=E2=80=9D policy holds in =
practice only for
open-source userspace of the DRM subsystem. DRM developers are perfectly
fine if closed-source blob drivers in userspace use the same uAPI as the
open drivers, but they must do so in the exact same way as the open
drivers. Creative (ab)use of the interfaces will, and in the past
routinely has, lead to breakage.
"""

> What to do when we fix bugs that affect functionality is something
> that we need to decide on case to case cases. The same way we do today
> when hardware does not support a control value and we discover it 10
> versions later.

Indeed, but we need to have some idea on what that process is going to
look like in practice. If we put ourselves is a corner and don't allow
for some bug resolutions in the first place, then we won't be able to
fix them when we'll encounter them.

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
>=20
> We can argue if this is an issue or not. I think it is not
>=20
> >   * Realistically speaking, that logic can only run as root
>=20
> Do not agree.

How so? Are you going to allow any javascript enabled website to poke
into Kcam?

> >   * With a poor configuration, the userspace can completely crash the
> >     system
> >   * If the userspace crashes, you can end up with a configuration you
> >     can't really recover from
>=20
> A Kcam driver can give you broken images, but never crash the system
> or leave it in an unrecoverable state. That is the main guarantee that
> we expect from the drivers.

That's wishful thinking. If your application crashes halfway through the
configuration, you're left in a weird state you know nothing about now.
That's impossible to recover from.

Maxime
