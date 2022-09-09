Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 996335B3803
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 14:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiIIMlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 08:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiIIMlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 08:41:02 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A62D344F
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 05:40:59 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so4356810wmk.3
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=HVzL5kIlV68Dm7FMMOe2QmJOxHfnwlO71R0LcIRYdPc=;
        b=iBvxNOZT0mgubHvvWCpqyIjCO1d7GW0qO1VO85GleRsvGrJYBNMrwcWXJQJB/aKNJA
         nVJ0IrbO5ikMFMyLJRiUryiXdoX98d+ZjGT1ydw/Ep9vJt3sunkksmEAZv9ZmIa0BMT7
         ttesmLcM8AKfYGlh7h1QHbVQQXWHegL4HZn5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HVzL5kIlV68Dm7FMMOe2QmJOxHfnwlO71R0LcIRYdPc=;
        b=2A87NZwgDmgIWxULBPDo2oHl/QEgPztFcHocY1BWo34H3JP9r3kdfwJs2Jnf8eEvkg
         r0ZEsupk55R80OqzkmlXqEkYnjCLRozDit4yx0uq0TH+n+JeJK8WaPMqpgaUxWbkT/rS
         iF0goMS96xlFdnBPjGO6GV7MpJlAmeo0eC4I/daSW2nO4dmAHVqTp+BYLxsrCSK8IGM3
         KovnYxXo5TQ25TSNVYV76Q90C9OLwjYzmKjafdh5wCP8ojChQNV758L4Pe28l8rI6Ibl
         u0qlP1PLPcDuPElbU3VYFRmQH/7R/59YzvbqsN49S7NiWS3JwsY2ouUlIa3a3UVPEQyQ
         YYaA==
X-Gm-Message-State: ACgBeo3DTuO3jI1E9NwOrZ5i09fG+o5OuJHPtXnE2VemgbUiQVxLcuXF
        CHMO0FVnMyYq1a4ZGE3lV9xmRv7lyEidvuTuiGQ+pWQqFpvpPCR8
X-Google-Smtp-Source: AA6agR5WgLqu4x9R6joe890stu+Cz8Uza/8iKLPnLvNLWXuK72gvIjRlX2An1ZJylMdx7DOas78JZKCxPGdES252+zA=
X-Received: by 2002:a05:600c:4152:b0:3a6:48c0:509c with SMTP id
 h18-20020a05600c415200b003a648c0509cmr5408168wmm.24.1662727257751; Fri, 09
 Sep 2022 05:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220908080846.wursajjtc3mbja4u@houat> <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat> <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat> <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
 <20220909080028.vchiddgtt2kl2ha3@houat> <CANiDSCva_RZpSHMaaHXyzuQD_zTYFOG2CsNYA15_C39a_nSHnQ@mail.gmail.com>
 <20220909090637.pexjm56fdzrjwpfy@houat> <CANiDSCvMJVLMzoMQrRF3a3z-_6FFKK3+gdqFkFqemOw-0CNR9g@mail.gmail.com>
 <20220909115813.lbcrdla576xhw5ut@houat>
In-Reply-To: <20220909115813.lbcrdla576xhw5ut@houat>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 9 Sep 2022 14:40:46 +0200
Message-ID: <CAMrC3HsueJNnG97JUyaoBFo-nNBX5weYdY-y1yDvOMWVrtXszg@mail.gmail.com>
Subject: Re: [Media Summit] ChromeOS Kernel CAM
To:     Maxime Ripard <maxime@cerno.tech>
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
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Fri, Sep 9, 2022 at 1:58 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Sep 09, 2022 at 12:00:34PM +0200, Ricardo Ribalda wrote:
> > On Fri, 9 Sept 2022 at 11:06, Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Fri, Sep 09, 2022 at 10:39:36AM +0200, Ricardo Ribalda wrote:
> > > > On Fri, 9 Sept 2022 at 10:00, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > >
> > > > > On Thu, Sep 08, 2022 at 08:13:17PM +0200, Ricardo Ribalda wrote:
> > > > > > On Thu, 8 Sept 2022 at 17:34, Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > >
> > > > > > > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wr=
ote:
> > > > > > > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wro=
te:
> > > > > > > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchar=
t wrote:
> > > > > > > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard=
 wrote:
> > > > > > > > > > > Hi Ricardo,
> > > > > > > > > > >
> > > > > > > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Rib=
alda wrote:
> > > > > > > > > > > > > - Still on slide 16, V4L2 as an API is usable wit=
hout disclosing vendor
> > > > > > > > > > > > >   IP. What is not possible is upstreaming a drive=
r. I don't see this as
> > > > > > > > > > > > >   significantly different between V4L2 and the ne=
w API proposal. I
> > > > > > > > > > > > >   expect this to be discussed on Monday.
> > > > > > > > > > > >
> > > > > > > > > > > > I am only considering upstream drivers. There is no=
t much to discuss
> > > > > > > > > > > > for downstream or closed drivers :)
> > > > > > > > > > >
> > > > > > > > > > > Are we really discussing upstream *drivers*? If anyth=
ing, it looks like
> > > > > > > > > > > the Kcam proposal moves most of the drivers out of up=
stream.
> > > > > > > > > >
> > > > > > > > > > Given that the API proposal sets at a significant lower=
 level than V4L2
> > > > > > > > > > in the stack, the concept of "userspace driver" (I mean=
t it in the sense
> > > > > > > > > > of GPU support in mesa) plays a bigger role. It would b=
e good to clarify
> > > > > > > > > > what is meant by "driver" and maybe use the term "kerne=
l driver" when
> > > > > > > > > > only the kernel part is covered, to avoid misunderstand=
ings.
> > > > > > > > >
> > > > > > > > > I think there's a bit of a misunderstanding about what ex=
actly is in a
> > > > > > > > > DRM driver, and what is in Mesa.
> > > > > > > > >
> > > > > > > > > Mesa doesn't program the hardware at all, it's merely a g=
lorified
> > > > > > > > > compiler. It's not more of a driver than GCC is an OS. Mo=
st importantly
> > > > > > > > > for our discussion, Mesa doesn't perform any kind of regi=
ster access (or
> > > > > > > > > register access request), only the (kernel) driver does t=
hat.
> > > > > > > >
> > > > > > > > Mesa compiles shaders, but also more generally produces com=
mand streams
> > > > > > > > that are passed as blobs to the DRM driver, which then forw=
ards them to
> > > > > > > > the device with as little processing and validation as poss=
ible (when
> > > > > > > > the device is designed with multi-clients in mind, that pro=
cessing and
> > > > > > > > validation can be reduced a lot).
> > > > > > >
> > > > > > > That's true, but at no point in time is the CPU ever touches =
that
> > > > > > > command stream blob in the case of DRM...
> > > > > >
> > > > > > As Laurent says, the latest hardware is very similar to GPUs, y=
ou pass
> > > > > > a set of commands to a firmware that does the actual R/W to the
> > > > > > hardware.
> > > > >
> > > > > For the latest, most powerful, hardware, maybe. I can show you pl=
enty of
> > > > > other ISP we'll need to support that aren't programmed that way, =
and in
> > > > > that case we would end up interpreting whatever is being passed t=
o KCam
> > > > > on the CPU.
> > > >
> > > > Kcam is not meant to replace V4L2, if a hardware is better modeled =
in
> > > > V4L2, they can use it.
> > >
> > > I'm not sure that alone is going to fly. Having to support the same
> > > device in multiple frameworks based on who is using it exactly is ver=
y
> > > frowned upon: it's a waste of development, review and maintenance tim=
e.
> > >
> > > If we aim for something, it's to supersede v4l2, or to extend v4l2.
> >
> > You do not support the same device in multiple frameworks. You pick
> > the driver that fits your purpose better.
> >
> > Like Industrial IO vs other subsystems.
>
> Again, it's not clear to me where do we draw the line then. Let's say we
> have three different systems, one with a DMA and an ov5640, one with a
> DMA, an ISP and an ov5640, and let's be a bit exotic and re-use the
> first setup, with an external ISP in the mix.
>
> Which setup is going to use which framework, and where the drivers are
> going to be?
>
>
> > > > > > The most critical part is the DMA, and that will always be abst=
racted.
> > > > >
> > > > > Where do you draw the line then? What will have a driver in the k=
ernel,
> > > > > and what won't?
> > > >
> > > > If there is memory access: abstraction
> > > > If the hardware is not trusted/documented:abstraction
> > > > If a specific configuration is know to be invalid and leaves the
> > > > system in an invalid state:filtering
> > > > everything else: raw access (+validation)
> > >
> > > I mean, the ISP you mentioned at least has to access the command buff=
er
> > > somehow, and surely that counts as a memory access?
> > >
> > > And so, what happens if the ISP is not entirely documented? You start
> > > with a kernel driver, and then once it is documented you move it to K=
cam
> > > breaking all users in the process?
> >
> > I think there is a misunderstanding here, All the hardware needs a
> > kernel driver.
> > The functionality of that driver depends on the trust/documentation on
> > the platform:
> >
> > - simple validation
> > - filtering
> > - "modes"
>
> I think you really need to show us with a proof of concept what Kcam
> exactly is then. Because in your slide 22, you state:
>
>
> """
> Kcam follows a DRM-like model where the
> kernel provides basic functionality:
> - Scheduling
> - Discovery
>
> Everything else is provided by an userspace library (hopefully libcamera)
> """
>
> What is "everything else" in that case ?

One thing is the kcam framework and the other is the kcam drivers

kcam framework:
  - Scheduling and discovery

Kcam drivers:
  - Access to hardware via whatever abstraction level, power management,



>
> >
> > >
> > > > > And again, the issue I was telling you about was about a configur=
ation
> > > > > mismatch (following a bogus documentation) between the DMA and th=
e
> > > > > sensor. If the sensor is part of the userspace and the DMA in the
> > > > > kernel, we very much can still have that issue.
> > > >
> > > > With internal operations you can achieve cooperation between the en=
tities.
> > >
> > > Again, looks like what we currenty have with v4l2 to me.
> >
> > In v4l2, the API is inside the kernel.  Kcam  is API agnostic, there
> > is no concept of streams, formats, controls...
>
> With the "modes abstraction" you mentioned before, we're getting really
> close to a concept of controls and formats.
>
> > > > > > Also I doubt that we will have new hardware without an IOMMU, s=
o we
> > > > > > have the same layers of security as today.
> > > > >
> > > > > Maybe not for the kind of devices that end up on chromebooks, but
> > > > > there's definitely hardware being designed today that have an ISP=
 but no
> > > > > IOMMU.
> > > >
> > > > For the non-iommu hardware, you will have the same security as toda=
y:
> > > > driver validation.
> > >
> > > I mean, I'm all for it. But the stated goal of Kcam is to reduce the
> > > driver logic so that most of it is in userspace, but most of your
> > > answers to challenges so far has been "but we'll have a driver for th=
at"
> > >
> > > If a driver is the solution, why do we need the Kcam architecture in =
the
> > > first place?
> >
> > To create a platform where you can build any API.
>
> This answers what you want to achieve at the user-space level, but not
> really why v4l2 doesn't fit the bill. Libcamera already provides support
> for multiple API on top of v4l2

Of course you can try to build an API on top of another API, but that
comes at a cost, and requires retrofitting extra functionality.
Two examples; Look at the request API and how many drivers out of
staging are using it. Look at the number of android devices that are
using v4l2 to implement HAL3.


>
> > > > > > > > Recent ISPs have a similar architecture, with a set of regi=
sters used
> > > > > > > > to communicate with the ISP firmware, and then most of the =
hardware
> > > > > > > > registers for the actual image processing blocks being prog=
rammed
> > > > > > > > based from the command stream. "Command stream" may not be =
a very good
> > > > > > > > term for ISPs as it's not really a stream of commands, but
> > > > > > > > conceptually, we're dealing with a blob that is computed by=
 userspace.
> > > > > > >
> > > > > > > ... while in Kcam, the CPU knows and will interpret that comm=
and stream.
> > > > > > > Maybe not in all cases, but it's still a significant differen=
ce.
> > > > > > >
> > > > > > > If we had to draw a parallel with something else in the kerne=
l, it looks
> > > > > > > way more like eBPF or the discussion we had on where to parse=
 the
> > > > > > > bitstreams for stateless codecs.
> > > > > > >
> > > > > > > The first one has been severely constrained to avoid the issu=
es we've
> > > > > > > raised, and we all know how the second one went.
> > > > > >
> > > > > > In eBPF, you are moving some user code to the kernel, with an u=
nstable API.
> > > > > >
> > > > > > In KCAM, (and in DRM), you let the user build a set of operatio=
ns,
> > > > > > that you pass to the kernel via a stable API, then it is valida=
ted and
> > > > > > scheduled by the kernel.
> > > > >
> > > > > You won't be able to have a stable API with that design either. I=
f only
> > > > > because of that whitelist you were mentioning. Let's say we have =
a
> > > > > register that turns out, after the facts, to not be available. If=
 the
> > > > > userspace ever used to set it at some point, you're screwed. Inde=
ed,
> > > > > either you move it out of the whitelist, and then you break users=
pace,
> > > > > or you don't add it to the whitelist and end up allowing an insec=
ure or
> > > > > dangerous situation.
> > > >
> > > > See above for our description of allowlist.
> > > >
> > > > Also, using the drm model as reference. kernel version, libdrm and
> > > > mesa (and even llvm) are very coupled. Using a wrong version can le=
ad
> > > > to unexpected results or even GPU hangs.
> > >
> > > Right.
> > >
> > > And those are considered regressions:
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-us=
erspace-requirements
> > >
> > > """
> > > The Linux kernel=E2=80=99s =E2=80=9Cno regression=E2=80=9D policy hol=
ds in practice only for
> > > open-source userspace of the DRM subsystem. DRM developers are perfec=
tly
> > > fine if closed-source blob drivers in userspace use the same uAPI as =
the
> > > open drivers, but they must do so in the exact same way as the open
> > > drivers. Creative (ab)use of the interfaces will, and in the past
> > > routinely has, lead to breakage.
> > > """
> >
> > There are a lot of hypothetical scenarios: erratas, big documentation
> > drop from a vendor, drivers obtained via reverse engineering....
>
> Those wouldn't be regressions.
>
> > There is no one-size-fits-all solution, and every case needs to be
> > considered individually when they come.
> >
> > As any other kernel subsystems we need to live under the
> > never-break-the-userspace. Obey gravity, it is the law ;)
> >
> >
> > >
> > > > What to do when we fix bugs that affect functionality is something
> > > > that we need to decide on case to case cases. The same way we do to=
day
> > > > when hardware does not support a control value and we discover it 1=
0
> > > > versions later.
> > >
> > > Indeed, but we need to have some idea on what that process is going t=
o
> > > look like in practice. If we put ourselves is a corner and don't allo=
w
> > > for some bug resolutions in the first place, then we won't be able to
> > > fix them when we'll encounter them.
> >
> > We can definately look into establishing some guidelines once we have
> > a more clear vision of kcam and its extent.
> >
> >
> > >
> > > > > And you can't say you would just ignore a register that isn't par=
t of
> > > > > the whitelist, because then you would enforce a configuration tha=
t isn't
> > > > > the one the user-space asked for, which is even worse.
> > > > >
> > > > > > X11 was much more bizarre, the GPIO iomem was remapped into use=
rspace.
> > > > >
> > > > > Yes, but that wasn't the only thing bad with it. I mean, it doesn=
't
> > > > > really matter who exactly does the register access eventually. In=
 UMS,
> > > > > X11 was doing it itself through a mapping of its own, in KCam the=
 kernel
> > > > > will do it on behalf of the userspace. But we still end up in bot=
h cases
> > > > > with:
> > > > >
> > > > >   * The entire logic is in userspace
> > > >
> > > > We can argue if this is an issue or not. I think it is not
> > > >
> > > > >   * Realistically speaking, that logic can only run as root
> > > >
> > > > Do not agree.
> > >
> > > How so? Are you going to allow any javascript enabled website to poke
> > > into Kcam?
> >
> > Can you access the GPU ISA directly as an external app on the browser?
>
> I guess?

Please change browser if yours has a javascript engine with access to
/dev/dri :)

>
> > Same answer here.
>
> Not really, and I'm sorry but you keep eluding this, and this comes back
> in pretty much every mail: the CPU will never interpret the GPU ISA in
> kernel space. Kcam might. This is a very big difference.
>
> > The browser will typically speak with a system service to access the
> > camera: pipewire, gstreamer....
> >
> > >
> > > > >   * With a poor configuration, the userspace can completely crash=
 the
> > > > >     system
> > > > >   * If the userspace crashes, you can end up with a configuration=
 you
> > > > >     can't really recover from
> > > >
> > > > A Kcam driver can give you broken images, but never crash the syste=
m
> > > > or leave it in an unrecoverable state. That is the main guarantee t=
hat
> > > > we expect from the drivers.
> > >
> > > That's wishful thinking. If your application crashes halfway through =
the
> > > configuration, you're left in a weird state you know nothing about no=
w.
> > > That's impossible to recover from.
> >
> > Today (almost) any kernel driver makes no assumption of the initial
> > state of the hardware. You might have been interrupted at any state
> > and rebooting the hardware does not reinit the internal state of the
> > peripherals.
> >
> > This is the same, a kcam app needs to init the hardware before it can
> > make use of it.
>
> I guess it's getting obvious by now that Kcam doesn't seem to be a
> solution that is getting a consensus, possibly because it's so early
> that we don't really have an idea of how it would look like with a real
> device.

Difficult to get a consensus before the summit has even taken place :),

>
> I'm not sure this can be easily solved in the time slot we have on
> Monday, so maybe we can turn this around in order to have some progress:
> could we maybe use that time slot to discuss the problem, and outline
> the attributes an ideal solution would have to make sure everyone is
> roughly on the same page.

This is why the presentation only has 5 slides around the kcam
"internals" and the rest is explaining the problem that ChromeOS (and
the rest of the industry) is facing. :)

We can always fix the code and send 10000 revisions, what we have to
agree on are the principals, openness etc. And that is what we expect
to get out of Monday.

>
> And then, if Kcam can be adapted to change those attributes, awesome :)
>
> Maxime
