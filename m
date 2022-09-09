Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B791D5B36D7
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 13:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiIIL63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 07:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbiIIL62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 07:58:28 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A095136CFE
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 04:58:20 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 1C00F3200437;
        Fri,  9 Sep 2022 07:58:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 09 Sep 2022 07:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1662724696; x=1662811096; bh=bMIOamHyUV
        IyKEqZ+0EkHxh0tbliveKot3zFPf5eKAE=; b=NmTlVY9WrykfXhbGNzzdCIq6Od
        VdTBOLdHSnUrII0YQtR8pBbyF6htNWb1o99uZlaGeb5M3FtbhKqXwHuJD3wCdc9I
        kFUzsR7YurMhDS4qNcM2I51rulkqYkEvKitCO7JkITjmn1EMXdlhWGOWtxP2XYbU
        rUFeEiuuAfTAYSUK5aFM9joYqu5QVwHQZad7s35Kl9aBykBwSHx8sXU4hY0TC2DN
        1th/N3lkb0AIbu/WYjPanERQdNIdHb0y2iUMD/v2wHKlo1+6kbJxxFE+HujiKRtf
        x1Ns8PJNqZsKznp3Ewtws/c+Re0lRYVguOxNOs1uFctsmSa0GidiVzwwuGEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662724696; x=1662811096; bh=bMIOamHyUVIyKEqZ+0EkHxh0tbli
        veKot3zFPf5eKAE=; b=S/gnG3SlPnUmtlEyZvVcSBQdMhVYJd7rCsMcNnElkspC
        wuzDVHE+JU2G2r3r1BI7EelpCqgy/L+oRv4VjkLqfI9mP2XADcNBAIaToo8/ofnW
        5Uq4PN5FgA77tPbzoyg6mREf2iitgbat6RA0EpwHuwH5hlQj0KDF6UPWeG7ZMv32
        jk9j8Kpvb7sN7KSmjLbDRLfCP2KimmCMhYh/a0vX3OGHqIF1hwF5LP3pD6GfsVBb
        rZxVxi1nU8HBejfu8vPAeuIQbatPq3V1Fb3d+FjOXM2odtfW7Cg8zL0k9YjLkjEg
        dibFdeC7fwgPCLqsDp43TllXmN0iZdEFNh0W77yElQ==
X-ME-Sender: <xms:VyobY1Ld_jZYDW9zSvTnq5gqyxGT22nWEfKkWBoy1mzBLEbzwUmkzQ>
    <xme:VyobYxIE6tBhuG-rjR7wPYjxK5Gbhpui_boN1nyV5bVnk04mwEvxx4kRm_8RdxX8x
    lsRW2Kx0SFcZvHnJJ8>
X-ME-Received: <xmr:VyobY9s_RIe81ODTwF7DZGabkWMD9r9uLIanqrs7pulGmoj99dfviowzgLCF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefhjeehgedvfeeggeeiledvheduueefleduhefgudeuffefheejtddvveej
    udehffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
    ohdrthgvtghh
X-ME-Proxy: <xmx:VyobY2ZeNfb3NC3q9eBwoyNDR4-X7Uy7QUSMcOBc1NjzOaCLUgM2mw>
    <xmx:VyobY8aZ1H2Nzq6ZHdGKE-SragzGVapedUjeRXT2wK80t7oorvBQ_A>
    <xmx:VyobY6D5G42gLMz1BohzQ8OV0t2A-tLY0X6ySU-6-GuPZE6EoJjDEA>
    <xmx:WCobY5Q57p8h95lTm3hcNAPZKUxlXFDPH65j6YqLJEE8Hy5JhnQxKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 07:58:15 -0400 (EDT)
Date:   Fri, 9 Sep 2022 13:58:13 +0200
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
Message-ID: <20220909115813.lbcrdla576xhw5ut@houat>
References: <20220908080846.wursajjtc3mbja4u@houat>
 <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat>
 <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat>
 <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
 <20220909080028.vchiddgtt2kl2ha3@houat>
 <CANiDSCva_RZpSHMaaHXyzuQD_zTYFOG2CsNYA15_C39a_nSHnQ@mail.gmail.com>
 <20220909090637.pexjm56fdzrjwpfy@houat>
 <CANiDSCvMJVLMzoMQrRF3a3z-_6FFKK3+gdqFkFqemOw-0CNR9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o4gkkhbejgcpqouz"
Content-Disposition: inline
In-Reply-To: <CANiDSCvMJVLMzoMQrRF3a3z-_6FFKK3+gdqFkFqemOw-0CNR9g@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--o4gkkhbejgcpqouz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 12:00:34PM +0200, Ricardo Ribalda wrote:
> On Fri, 9 Sept 2022 at 11:06, Maxime Ripard <maxime@cerno.tech> wrote:
> > On Fri, Sep 09, 2022 at 10:39:36AM +0200, Ricardo Ribalda wrote:
> > > On Fri, 9 Sept 2022 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > On Thu, Sep 08, 2022 at 08:13:17PM +0200, Ricardo Ribalda wrote:
> > > > > On Thu, 8 Sept 2022 at 17:34, Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > >
> > > > > > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrot=
e:
> > > > > > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > > > > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart =
wrote:
> > > > > > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard w=
rote:
> > > > > > > > > > Hi Ricardo,
> > > > > > > > > >
> > > > > > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribal=
da wrote:
> > > > > > > > > > > > - Still on slide 16, V4L2 as an API is usable witho=
ut disclosing vendor
> > > > > > > > > > > >   IP. What is not possible is upstreaming a driver.=
 I don't see this as
> > > > > > > > > > > >   significantly different between V4L2 and the new =
API proposal. I
> > > > > > > > > > > >   expect this to be discussed on Monday.
> > > > > > > > > > >
> > > > > > > > > > > I am only considering upstream drivers. There is not =
much to discuss
> > > > > > > > > > > for downstream or closed drivers :)
> > > > > > > > > >
> > > > > > > > > > Are we really discussing upstream *drivers*? If anythin=
g, it looks like
> > > > > > > > > > the Kcam proposal moves most of the drivers out of upst=
ream.
> > > > > > > > >
> > > > > > > > > Given that the API proposal sets at a significant lower l=
evel than V4L2
> > > > > > > > > in the stack, the concept of "userspace driver" (I meant =
it in the sense
> > > > > > > > > of GPU support in mesa) plays a bigger role. It would be =
good to clarify
> > > > > > > > > what is meant by "driver" and maybe use the term "kernel =
driver" when
> > > > > > > > > only the kernel part is covered, to avoid misunderstandin=
gs.
> > > > > > > >
> > > > > > > > I think there's a bit of a misunderstanding about what exac=
tly is in a
> > > > > > > > DRM driver, and what is in Mesa.
> > > > > > > >
> > > > > > > > Mesa doesn't program the hardware at all, it's merely a glo=
rified
> > > > > > > > compiler. It's not more of a driver than GCC is an OS. Most=
 importantly
> > > > > > > > for our discussion, Mesa doesn't perform any kind of regist=
er access (or
> > > > > > > > register access request), only the (kernel) driver does tha=
t.
> > > > > > >
> > > > > > > Mesa compiles shaders, but also more generally produces comma=
nd streams
> > > > > > > that are passed as blobs to the DRM driver, which then forwar=
ds them to
> > > > > > > the device with as little processing and validation as possib=
le (when
> > > > > > > the device is designed with multi-clients in mind, that proce=
ssing and
> > > > > > > validation can be reduced a lot).
> > > > > >
> > > > > > That's true, but at no point in time is the CPU ever touches th=
at
> > > > > > command stream blob in the case of DRM...
> > > > >
> > > > > As Laurent says, the latest hardware is very similar to GPUs, you=
 pass
> > > > > a set of commands to a firmware that does the actual R/W to the
> > > > > hardware.
> > > >
> > > > For the latest, most powerful, hardware, maybe. I can show you plen=
ty of
> > > > other ISP we'll need to support that aren't programmed that way, an=
d in
> > > > that case we would end up interpreting whatever is being passed to =
KCam
> > > > on the CPU.
> > >
> > > Kcam is not meant to replace V4L2, if a hardware is better modeled in
> > > V4L2, they can use it.
> >
> > I'm not sure that alone is going to fly. Having to support the same
> > device in multiple frameworks based on who is using it exactly is very
> > frowned upon: it's a waste of development, review and maintenance time.
> >
> > If we aim for something, it's to supersede v4l2, or to extend v4l2.
>=20
> You do not support the same device in multiple frameworks. You pick
> the driver that fits your purpose better.
>=20
> Like Industrial IO vs other subsystems.

Again, it's not clear to me where do we draw the line then. Let's say we
have three different systems, one with a DMA and an ov5640, one with a
DMA, an ISP and an ov5640, and let's be a bit exotic and re-use the
first setup, with an external ISP in the mix.

Which setup is going to use which framework, and where the drivers are
going to be?


> > > > > The most critical part is the DMA, and that will always be abstra=
cted.
> > > >
> > > > Where do you draw the line then? What will have a driver in the ker=
nel,
> > > > and what won't?
> > >
> > > If there is memory access: abstraction
> > > If the hardware is not trusted/documented:abstraction
> > > If a specific configuration is know to be invalid and leaves the
> > > system in an invalid state:filtering
> > > everything else: raw access (+validation)
> >
> > I mean, the ISP you mentioned at least has to access the command buffer
> > somehow, and surely that counts as a memory access?
> >
> > And so, what happens if the ISP is not entirely documented? You start
> > with a kernel driver, and then once it is documented you move it to Kcam
> > breaking all users in the process?
>=20
> I think there is a misunderstanding here, All the hardware needs a
> kernel driver.
> The functionality of that driver depends on the trust/documentation on
> the platform:
>=20
> - simple validation
> - filtering
> - "modes"

I think you really need to show us with a proof of concept what Kcam
exactly is then. Because in your slide 22, you state:


"""
Kcam follows a DRM-like model where the
kernel provides basic functionality:
- Scheduling
- Discovery

Everything else is provided by an userspace library (hopefully libcamera)
"""

What is "everything else" in that case ?

>=20
> >
> > > > And again, the issue I was telling you about was about a configurat=
ion
> > > > mismatch (following a bogus documentation) between the DMA and the
> > > > sensor. If the sensor is part of the userspace and the DMA in the
> > > > kernel, we very much can still have that issue.
> > >
> > > With internal operations you can achieve cooperation between the enti=
ties.
> >
> > Again, looks like what we currenty have with v4l2 to me.
>=20
> In v4l2, the API is inside the kernel.  Kcam  is API agnostic, there
> is no concept of streams, formats, controls...

With the "modes abstraction" you mentioned before, we're getting really
close to a concept of controls and formats.

> > > > > Also I doubt that we will have new hardware without an IOMMU, so =
we
> > > > > have the same layers of security as today.
> > > >
> > > > Maybe not for the kind of devices that end up on chromebooks, but
> > > > there's definitely hardware being designed today that have an ISP b=
ut no
> > > > IOMMU.
> > >
> > > For the non-iommu hardware, you will have the same security as today:
> > > driver validation.
> >
> > I mean, I'm all for it. But the stated goal of Kcam is to reduce the
> > driver logic so that most of it is in userspace, but most of your
> > answers to challenges so far has been "but we'll have a driver for that"
> >
> > If a driver is the solution, why do we need the Kcam architecture in the
> > first place?
>=20
> To create a platform where you can build any API.

This answers what you want to achieve at the user-space level, but not
really why v4l2 doesn't fit the bill. Libcamera already provides support
for multiple API on top of v4l2

> > > > > > > Recent ISPs have a similar architecture, with a set of regist=
ers used
> > > > > > > to communicate with the ISP firmware, and then most of the ha=
rdware
> > > > > > > registers for the actual image processing blocks being progra=
mmed
> > > > > > > based from the command stream. "Command stream" may not be a =
very good
> > > > > > > term for ISPs as it's not really a stream of commands, but
> > > > > > > conceptually, we're dealing with a blob that is computed by u=
serspace.
> > > > > >
> > > > > > ... while in Kcam, the CPU knows and will interpret that comman=
d stream.
> > > > > > Maybe not in all cases, but it's still a significant difference.
> > > > > >
> > > > > > If we had to draw a parallel with something else in the kernel,=
 it looks
> > > > > > way more like eBPF or the discussion we had on where to parse t=
he
> > > > > > bitstreams for stateless codecs.
> > > > > >
> > > > > > The first one has been severely constrained to avoid the issues=
 we've
> > > > > > raised, and we all know how the second one went.
> > > > >
> > > > > In eBPF, you are moving some user code to the kernel, with an uns=
table API.
> > > > >
> > > > > In KCAM, (and in DRM), you let the user build a set of operations,
> > > > > that you pass to the kernel via a stable API, then it is validate=
d and
> > > > > scheduled by the kernel.
> > > >
> > > > You won't be able to have a stable API with that design either. If =
only
> > > > because of that whitelist you were mentioning. Let's say we have a
> > > > register that turns out, after the facts, to not be available. If t=
he
> > > > userspace ever used to set it at some point, you're screwed. Indeed,
> > > > either you move it out of the whitelist, and then you break userspa=
ce,
> > > > or you don't add it to the whitelist and end up allowing an insecur=
e or
> > > > dangerous situation.
> > >
> > > See above for our description of allowlist.
> > >
> > > Also, using the drm model as reference. kernel version, libdrm and
> > > mesa (and even llvm) are very coupled. Using a wrong version can lead
> > > to unexpected results or even GPU hangs.
> >
> > Right.
> >
> > And those are considered regressions:
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-user=
space-requirements
> >
> > """
> > The Linux kernel=E2=80=99s =E2=80=9Cno regression=E2=80=9D policy holds=
 in practice only for
> > open-source userspace of the DRM subsystem. DRM developers are perfectly
> > fine if closed-source blob drivers in userspace use the same uAPI as the
> > open drivers, but they must do so in the exact same way as the open
> > drivers. Creative (ab)use of the interfaces will, and in the past
> > routinely has, lead to breakage.
> > """
>=20
> There are a lot of hypothetical scenarios: erratas, big documentation
> drop from a vendor, drivers obtained via reverse engineering....

Those wouldn't be regressions.

> There is no one-size-fits-all solution, and every case needs to be
> considered individually when they come.
>=20
> As any other kernel subsystems we need to live under the
> never-break-the-userspace. Obey gravity, it is the law ;)
>=20
>=20
> >
> > > What to do when we fix bugs that affect functionality is something
> > > that we need to decide on case to case cases. The same way we do today
> > > when hardware does not support a control value and we discover it 10
> > > versions later.
> >
> > Indeed, but we need to have some idea on what that process is going to
> > look like in practice. If we put ourselves is a corner and don't allow
> > for some bug resolutions in the first place, then we won't be able to
> > fix them when we'll encounter them.
>=20
> We can definately look into establishing some guidelines once we have
> a more clear vision of kcam and its extent.
>=20
>=20
> >
> > > > And you can't say you would just ignore a register that isn't part =
of
> > > > the whitelist, because then you would enforce a configuration that =
isn't
> > > > the one the user-space asked for, which is even worse.
> > > >
> > > > > X11 was much more bizarre, the GPIO iomem was remapped into users=
pace.
> > > >
> > > > Yes, but that wasn't the only thing bad with it. I mean, it doesn't
> > > > really matter who exactly does the register access eventually. In U=
MS,
> > > > X11 was doing it itself through a mapping of its own, in KCam the k=
ernel
> > > > will do it on behalf of the userspace. But we still end up in both =
cases
> > > > with:
> > > >
> > > >   * The entire logic is in userspace
> > >
> > > We can argue if this is an issue or not. I think it is not
> > >
> > > >   * Realistically speaking, that logic can only run as root
> > >
> > > Do not agree.
> >
> > How so? Are you going to allow any javascript enabled website to poke
> > into Kcam?
>=20
> Can you access the GPU ISA directly as an external app on the browser?

I guess?

> Same answer here.

Not really, and I'm sorry but you keep eluding this, and this comes back
in pretty much every mail: the CPU will never interpret the GPU ISA in
kernel space. Kcam might. This is a very big difference.

> The browser will typically speak with a system service to access the
> camera: pipewire, gstreamer....
>=20
> >
> > > >   * With a poor configuration, the userspace can completely crash t=
he
> > > >     system
> > > >   * If the userspace crashes, you can end up with a configuration y=
ou
> > > >     can't really recover from
> > >
> > > A Kcam driver can give you broken images, but never crash the system
> > > or leave it in an unrecoverable state. That is the main guarantee that
> > > we expect from the drivers.
> >
> > That's wishful thinking. If your application crashes halfway through the
> > configuration, you're left in a weird state you know nothing about now.
> > That's impossible to recover from.
>=20
> Today (almost) any kernel driver makes no assumption of the initial
> state of the hardware. You might have been interrupted at any state
> and rebooting the hardware does not reinit the internal state of the
> peripherals.
>=20
> This is the same, a kcam app needs to init the hardware before it can
> make use of it.

I guess it's getting obvious by now that Kcam doesn't seem to be a
solution that is getting a consensus, possibly because it's so early
that we don't really have an idea of how it would look like with a real
device.

I'm not sure this can be easily solved in the time slot we have on
Monday, so maybe we can turn this around in order to have some progress:
could we maybe use that time slot to discuss the problem, and outline
the attributes an ideal solution would have to make sure everyone is
roughly on the same page.

And then, if Kcam can be adapted to change those attributes, awesome :)

Maxime

--o4gkkhbejgcpqouz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxsqVQAKCRDj7w1vZxhR
xRR8AP99LJuu0GDvVLMu93DTMApaLQJ4B92SzV82VyUl7r3YhQD/Xf/hu4LhuyDM
tNYwUNfDW67dcS/wgdnmGLKjlqYqDwE=
=JOrE
-----END PGP SIGNATURE-----

--o4gkkhbejgcpqouz--
