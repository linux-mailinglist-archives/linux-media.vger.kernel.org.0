Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997985B312C
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 10:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiIIIBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 04:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiIIIAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 04:00:47 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C720813D75
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 01:00:39 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 7F0CB320092B;
        Fri,  9 Sep 2022 04:00:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 09 Sep 2022 04:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1662710436; x=
        1662796836; bh=RPjSHZFO5M/yoKMYYZVDi3QufbX7oyy9G1I8gSoXMmg=; b=M
        Fto786J9j5KD1QWr9fY68gRsOsuoqqN8bQPkIUS225c4AQ8Ulw/mvU+QkqV1rKlQ
        cNXYzZni0/gp1YfdFMxReks3SlHrPJwjZBgAt09ewZ+DcCtGcAp8mOaMBTQXYzjz
        17cWgqahJL1Wd+1+xNbcFB7h0K/zVx5m8SZLwM6MXeOXaOvaLtp++wQNAALkvajx
        xjpIuQYzHWZcOfkEwoHqBFee7jmpd7OzFji4gKcFJE1DEYsQzoFKFjuQvAFVB6b1
        uB11yy39XyIDfhH1LxURbuRU6Z2aLW3H31vQsUt5hXF3h1DOhdCtNVj16YxAwuuW
        R6xL0ZWZ1Kh4F428vzzng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662710436; x=
        1662796836; bh=RPjSHZFO5M/yoKMYYZVDi3QufbX7oyy9G1I8gSoXMmg=; b=d
        cPXnR41+eIahQDfuWwthjIVYjnNOoBqldIOXmG41dbjUhKGNkyb3tW3ZiYYDV7pQ
        4mseoTPg+vhtSTv0cjYp2sMvbIHwvW6nQ19Iev9rP9LenpN7QuI6/DJ6VWdVdoCj
        c3jlskYu0k/gM8twJ7I5vOrWpsX16qXSTI0pRcYMml1M5X9VHQQcDgtaQ2RUu7Y1
        UPkJk8jBBJvyreo+NS5C3VXvEr3dQVxekwxClsebBZ8i/qrtAKw3iCD39P5Vk0It
        uqgnvLiHC8SymttP8D5NPfM3dA/N2jXLSBly3+pnVOxAsUciIEwk8K3fHFlVQU0z
        seojXvehmv8Q1E3xh7mKA==
X-ME-Sender: <xms:ovIaY_H40-f2_z0PMMk1dumuR1DNQju99cOMrXsz6vYLCkkDHG-XmQ>
    <xme:ovIaY8WgC-sM9RRMMeY3r28otFWRxBs7biRIeZOIhLOVSY5w1KhGjuIFCOpdTufWq
    kSbK6FzE2yAX9NU0Ps>
X-ME-Received: <xmr:ovIaYxLKYIlqEhRenqFWlPdRpTqLCuxqsJ9A14LDwhMYZKyWHngthaRC8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteefteef
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ovIaY9GhPZ0DL631NK8zfe9vccSaO7vwS-xpbnxczmoAP6jZoOkrRA>
    <xmx:ovIaY1Vwj_mD-lME7psK5KgX3q95M1e9mZ38hZa1gaTyqPw3qD82uw>
    <xmx:ovIaY4POQebKHLVIWXhIwyZdhyCFw6wb0dwhiZX24Y4VRKGZX7jxuw>
    <xmx:pPIaY8PsDqDpVWD4eWSUN96QhLWNX4SAZR-0UXiH52nW-7SCQ0oneA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 04:00:33 -0400 (EDT)
Date:   Fri, 9 Sep 2022 10:00:28 +0200
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
Message-ID: <20220909080028.vchiddgtt2kl2ha3@houat>
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
 <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat>
 <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat>
 <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat>
 <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 08, 2022 at 08:13:17PM +0200, Ricardo Ribalda wrote:
> On Thu, 8 Sept 2022 at 17:34, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > > > > Hi Ricardo,
> > > > > >
> > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > > > > > - Still on slide 16, V4L2 as an API is usable without discl=
osing vendor
> > > > > > > >   IP. What is not possible is upstreaming a driver. I don't=
 see this as
> > > > > > > >   significantly different between V4L2 and the new API prop=
osal. I
> > > > > > > >   expect this to be discussed on Monday.
> > > > > > >
> > > > > > > I am only considering upstream drivers. There is not much to =
discuss
> > > > > > > for downstream or closed drivers :)
> > > > > >
> > > > > > Are we really discussing upstream *drivers*? If anything, it lo=
oks like
> > > > > > the Kcam proposal moves most of the drivers out of upstream.
> > > > >
> > > > > Given that the API proposal sets at a significant lower level tha=
n V4L2
> > > > > in the stack, the concept of "userspace driver" (I meant it in th=
e sense
> > > > > of GPU support in mesa) plays a bigger role. It would be good to =
clarify
> > > > > what is meant by "driver" and maybe use the term "kernel driver" =
when
> > > > > only the kernel part is covered, to avoid misunderstandings.
> > > >
> > > > I think there's a bit of a misunderstanding about what exactly is i=
n a
> > > > DRM driver, and what is in Mesa.
> > > >
> > > > Mesa doesn't program the hardware at all, it's merely a glorified
> > > > compiler. It's not more of a driver than GCC is an OS. Most importa=
ntly
> > > > for our discussion, Mesa doesn't perform any kind of register acces=
s (or
> > > > register access request), only the (kernel) driver does that.
> > >
> > > Mesa compiles shaders, but also more generally produces command strea=
ms
> > > that are passed as blobs to the DRM driver, which then forwards them =
to
> > > the device with as little processing and validation as possible (when
> > > the device is designed with multi-clients in mind, that processing and
> > > validation can be reduced a lot).
> >
> > That's true, but at no point in time is the CPU ever touches that
> > command stream blob in the case of DRM...
>=20
> As Laurent says, the latest hardware is very similar to GPUs, you pass
> a set of commands to a firmware that does the actual R/W to the
> hardware.

For the latest, most powerful, hardware, maybe. I can show you plenty of
other ISP we'll need to support that aren't programmed that way, and in
that case we would end up interpreting whatever is being passed to KCam
on the CPU.

Which is totally different to what DRM/Mesa is doing on *any* hardware.

Another constraint that Mesa has is that there is standards user-space
API that all the applications target when it comes to graphics (OpenGL,
Vulkan, Direct3D, etc.) and you need to support pretty much all of them.
So in that sense, Mesa is a transpiler between that API and the GPU ISA.
We're not in this case either with Kcam.

> For hardware that is a register set, the vendor should have a good
> idea about what kind of validation should be needed: raw access (deny
> list) or more abstracted (allow list).

This would be similar to what is going on with regmap caches. And they
are a pain to deal with because that information is far from being
available for all the devices, and then most drivers don't implement it
either.

Also, if we have to have a whitelist in the kernel, then we need to
introduce and upstream some kind of driver for hardware enablement.
Doesn't that completely defeat the purpose of Kcam?

> The most critical part is the DMA, and that will always be abstracted.

Where do you draw the line then? What will have a driver in the kernel,
and what won't?

And again, the issue I was telling you about was about a configuration
mismatch (following a bogus documentation) between the DMA and the
sensor. If the sensor is part of the userspace and the DMA in the
kernel, we very much can still have that issue.

> Also I doubt that we will have new hardware without an IOMMU, so we
> have the same layers of security as today.

Maybe not for the kind of devices that end up on chromebooks, but
there's definitely hardware being designed today that have an ISP but no
IOMMU.

> > > Recent ISPs have a similar architecture, with a set of registers used
> > > to communicate with the ISP firmware, and then most of the hardware
> > > registers for the actual image processing blocks being programmed
> > > based from the command stream. "Command stream" may not be a very good
> > > term for ISPs as it's not really a stream of commands, but
> > > conceptually, we're dealing with a blob that is computed by userspace.
> >
> > ... while in Kcam, the CPU knows and will interpret that command stream.
> > Maybe not in all cases, but it's still a significant difference.
> >
> > If we had to draw a parallel with something else in the kernel, it looks
> > way more like eBPF or the discussion we had on where to parse the
> > bitstreams for stateless codecs.
> >
> > The first one has been severely constrained to avoid the issues we've
> > raised, and we all know how the second one went.
>=20
> In eBPF, you are moving some user code to the kernel, with an unstable AP=
I.
>
> In KCAM, (and in DRM), you let the user build a set of operations,
> that you pass to the kernel via a stable API, then it is validated and
> scheduled by the kernel.

You won't be able to have a stable API with that design either. If only
because of that whitelist you were mentioning. Let's say we have a
register that turns out, after the facts, to not be available. If the
userspace ever used to set it at some point, you're screwed. Indeed,
either you move it out of the whitelist, and then you break userspace,
or you don't add it to the whitelist and end up allowing an insecure or
dangerous situation.

And you can't say you would just ignore a register that isn't part of
the whitelist, because then you would enforce a configuration that isn't
the one the user-space asked for, which is even worse.

> X11 was much more bizarre, the GPIO iomem was remapped into userspace.

Yes, but that wasn't the only thing bad with it. I mean, it doesn't
really matter who exactly does the register access eventually. In UMS,
X11 was doing it itself through a mapping of its own, in KCam the kernel
will do it on behalf of the userspace. But we still end up in both cases
with:

  * The entire logic is in userspace
  * Realistically speaking, that logic can only run as root
  * With a poor configuration, the userspace can completely crash the
    system
  * If the userspace crashes, you can end up with a configuration you
    can't really recover from

*All* of those issues are still there with Kcam, even though the actual
 memory mapping isn't in userspace.

Maxime
