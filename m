Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89CA15B34CB
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 12:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiIIKHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 06:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiIIKHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 06:07:01 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C01F138661
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 03:07:00 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z97so1730028ede.8
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=9jz0d/2gl4CRN9FRB2eVO3QsC3OBDrFo12Q0EqewrJI=;
        b=n290BRZQpnhD2hUA8bBgu1CwhfwcV2CKEZz9RaOjePdlHIJHkAEvToUk4ztUstiey8
         93LAHtztFXhVbSPsj5cCalawIXW8b8q05QFYP6R5xw+8MlFkJTaThbmT+oa40dOHDB9d
         TA051vHM7pvYGI4lk+rUqmnQ4JgLsOjrctKxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9jz0d/2gl4CRN9FRB2eVO3QsC3OBDrFo12Q0EqewrJI=;
        b=ouGt7UKbiyyMy12G+HsZOT+c0WWTZskmQL0Mph79jmPp2dhRJ78m+GFZcnv9vUBFyV
         tHaxLZpzT6cp5tFBL4AH8tykItWUGFm/lYUYAofNdBnBFMPZ2LP8m5/CfeTAp0KG2Hpj
         qTyekmBASl/CMv+lQLwr9TUNcv3TXtzrHujoDNUGlKc9cYkzYtDGeFp+F1Bs8V2cSu9J
         TqC6VOoDnBh09lw/az41XjrS32I6m6LxNhnPaIi5G0wqnKXGN6MSPC0NnIUMAFYCfnQX
         M10gZlRU1qLeHrcccbgLYhkWrEGZK9jcephlIHbLMz/a/z8twFphdYLLvoVLB4EKuWdM
         /Sqg==
X-Gm-Message-State: ACgBeo3E5V5tBPQ7cVgsL1eGLbUZIQr7qTbr6smsmnu8J57LtNOPH3D7
        qsL+1E6PH0m/NGzsrvFmaZBaFjxudLQ5RLh9Efo=
X-Google-Smtp-Source: AA6agR5hKTpE/Dh492t8LRDUtYUtY/RRcBsvIVVK9Ghe/dowiPYWWZb+h6qFNK0+gGnJJdwet/7gDg==
X-Received: by 2002:a05:6402:84c:b0:44d:6274:ab66 with SMTP id b12-20020a056402084c00b0044d6274ab66mr10543746edz.239.1662718018475;
        Fri, 09 Sep 2022 03:06:58 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id b26-20020a170906151a00b007389c5a45f0sm44421ejd.148.2022.09.09.03.06.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 03:06:58 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id u9so2849522ejy.5
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 03:06:58 -0700 (PDT)
X-Received: by 2002:aa7:d883:0:b0:44e:bbbe:d661 with SMTP id
 u3-20020aa7d883000000b0044ebbbed661mr10754307edq.248.1662717646181; Fri, 09
 Sep 2022 03:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com> <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat> <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat> <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat> <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
 <20220909080028.vchiddgtt2kl2ha3@houat> <CANiDSCva_RZpSHMaaHXyzuQD_zTYFOG2CsNYA15_C39a_nSHnQ@mail.gmail.com>
 <20220909090637.pexjm56fdzrjwpfy@houat>
In-Reply-To: <20220909090637.pexjm56fdzrjwpfy@houat>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 9 Sep 2022 12:00:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCvMJVLMzoMQrRF3a3z-_6FFKK3+gdqFkFqemOw-0CNR9g@mail.gmail.com>
Message-ID: <CANiDSCvMJVLMzoMQrRF3a3z-_6FFKK3+gdqFkFqemOw-0CNR9g@mail.gmail.com>
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

On Fri, 9 Sept 2022 at 11:06, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Sep 09, 2022 at 10:39:36AM +0200, Ricardo Ribalda wrote:
> > Hi Maxime
> >
> > On Fri, 9 Sept 2022 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Thu, Sep 08, 2022 at 08:13:17PM +0200, Ricardo Ribalda wrote:
> > > > On Thu, 8 Sept 2022 at 17:34, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > >
> > > > > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> > > > > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > > > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wr=
ote:
> > > > > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wro=
te:
> > > > > > > > > Hi Ricardo,
> > > > > > > > >
> > > > > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda=
 wrote:
> > > > > > > > > > > - Still on slide 16, V4L2 as an API is usable without=
 disclosing vendor
> > > > > > > > > > >   IP. What is not possible is upstreaming a driver. I=
 don't see this as
> > > > > > > > > > >   significantly different between V4L2 and the new AP=
I proposal. I
> > > > > > > > > > >   expect this to be discussed on Monday.
> > > > > > > > > >
> > > > > > > > > > I am only considering upstream drivers. There is not mu=
ch to discuss
> > > > > > > > > > for downstream or closed drivers :)
> > > > > > > > >
> > > > > > > > > Are we really discussing upstream *drivers*? If anything,=
 it looks like
> > > > > > > > > the Kcam proposal moves most of the drivers out of upstre=
am.
> > > > > > > >
> > > > > > > > Given that the API proposal sets at a significant lower lev=
el than V4L2
> > > > > > > > in the stack, the concept of "userspace driver" (I meant it=
 in the sense
> > > > > > > > of GPU support in mesa) plays a bigger role. It would be go=
od to clarify
> > > > > > > > what is meant by "driver" and maybe use the term "kernel dr=
iver" when
> > > > > > > > only the kernel part is covered, to avoid misunderstandings=
.
> > > > > > >
> > > > > > > I think there's a bit of a misunderstanding about what exactl=
y is in a
> > > > > > > DRM driver, and what is in Mesa.
> > > > > > >
> > > > > > > Mesa doesn't program the hardware at all, it's merely a glori=
fied
> > > > > > > compiler. It's not more of a driver than GCC is an OS. Most i=
mportantly
> > > > > > > for our discussion, Mesa doesn't perform any kind of register=
 access (or
> > > > > > > register access request), only the (kernel) driver does that.
> > > > > >
> > > > > > Mesa compiles shaders, but also more generally produces command=
 streams
> > > > > > that are passed as blobs to the DRM driver, which then forwards=
 them to
> > > > > > the device with as little processing and validation as possible=
 (when
> > > > > > the device is designed with multi-clients in mind, that process=
ing and
> > > > > > validation can be reduced a lot).
> > > > >
> > > > > That's true, but at no point in time is the CPU ever touches that
> > > > > command stream blob in the case of DRM...
> > > >
> > > > As Laurent says, the latest hardware is very similar to GPUs, you p=
ass
> > > > a set of commands to a firmware that does the actual R/W to the
> > > > hardware.
> > >
> > > For the latest, most powerful, hardware, maybe. I can show you plenty=
 of
> > > other ISP we'll need to support that aren't programmed that way, and =
in
> > > that case we would end up interpreting whatever is being passed to KC=
am
> > > on the CPU.
> >
> > Kcam is not meant to replace V4L2, if a hardware is better modeled in
> > V4L2, they can use it.
>
> I'm not sure that alone is going to fly. Having to support the same
> device in multiple frameworks based on who is using it exactly is very
> frowned upon: it's a waste of development, review and maintenance time.
>
> If we aim for something, it's to supersede v4l2, or to extend v4l2.

You do not support the same device in multiple frameworks. You pick
the driver that fits your purpose better.

Like Industrial IO vs other subsystems.

>
> > > Which is totally different to what DRM/Mesa is doing on *any* hardwar=
e.
> > >
> > > Another constraint that Mesa has is that there is standards user-spac=
e
> > > API that all the applications target when it comes to graphics (OpenG=
L,
> > > Vulkan, Direct3D, etc.) and you need to support pretty much all of th=
em.
> > > So in that sense, Mesa is a transpiler between that API and the GPU I=
SA.
> > > We're not in this case either with Kcam.
> >
> > We also have APIs for cameras: V4L2, Android HAL, libcamera,
> > one-of-the-many-industrial-APIs
>
> The fact that you mention that there is many industrial APIs kind of
> prove my point: none of them are anywhere near industry standards like
> OpenGL or Vulkan can be. And you never mentioned that you wanted to
> support all of them as a goal for kcam?

The industry is already working for a camera API standard under the
Khronos umbrella:

https://www.khronos.org/camera/#:~:text=3DThe%20Khronos%20Camera%20API%20Wo=
rking,open%20standard%20camera%20system%20API.

We want to support any camera API on top of kcam, to avoid effort
duplication from vendors.

>
> > The userspace stack will transpile between that API and the ISP
> > command buffers.
>
> And if there's no ISA for the ISP, then it's just going to create some
> kind of bytecode that the kernel will execute.

>
> > > > For hardware that is a register set, the vendor should have a good
> > > > idea about what kind of validation should be needed: raw access (de=
ny
> > > > list) or more abstracted (allow list).
> > >
> > > This would be similar to what is going on with regmap caches. And the=
y
> > > are a pain to deal with because that information is far from being
> > > available for all the devices, and then most drivers don't implement =
it
> > > either.
> > >
> > > Also, if we have to have a whitelist in the kernel, then we need to
> > > introduce and upstream some kind of driver for hardware enablement.
> > > Doesn't that completely defeat the purpose of Kcam?
> >
> > The allowlist model that I mention is not about filtering what
> > registers can be written and what not. It is about abstracting them
> > completely if you do not trust the hardware:
> >
> > Lets say that you only have 4 verified modes (like we have on many
> > sensors), then you expose a single register with 4 valid values:
> > 0,1,2,3. The driver will convert that single register write into N
> > writes to registers.
>
> I'm not sure I get how that is different to what we have today with v4l2
> controls? I'm pretty sure that's exactly how we discover and change
> modes today with v4l2.
>
> > > > The most critical part is the DMA, and that will always be abstract=
ed.
> > >
> > > Where do you draw the line then? What will have a driver in the kerne=
l,
> > > and what won't?
> >
> > If there is memory access: abstraction
> > If the hardware is not trusted/documented:abstraction
> > If a specific configuration is know to be invalid and leaves the
> > system in an invalid state:filtering
> > everything else: raw access (+validation)
>
> I mean, the ISP you mentioned at least has to access the command buffer
> somehow, and surely that counts as a memory access?
>
> And so, what happens if the ISP is not entirely documented? You start
> with a kernel driver, and then once it is documented you move it to Kcam
> breaking all users in the process?

I think there is a misunderstanding here, All the hardware needs a
kernel driver.
The functionality of that driver depends on the trust/documentation on
the platform:

- simple validation
- filtering
- "modes"



>
> > > And again, the issue I was telling you about was about a configuratio=
n
> > > mismatch (following a bogus documentation) between the DMA and the
> > > sensor. If the sensor is part of the userspace and the DMA in the
> > > kernel, we very much can still have that issue.
> >
> > With internal operations you can achieve cooperation between the entiti=
es.
>
> Again, looks like what we currenty have with v4l2 to me.

In v4l2, the API is inside the kernel.  Kcam  is API agnostic, there
is no concept of streams, formats, controls...

>
> > > > Also I doubt that we will have new hardware without an IOMMU, so we
> > > > have the same layers of security as today.
> > >
> > > Maybe not for the kind of devices that end up on chromebooks, but
> > > there's definitely hardware being designed today that have an ISP but=
 no
> > > IOMMU.
> >
> > For the non-iommu hardware, you will have the same security as today:
> > driver validation.
>
> I mean, I'm all for it. But the stated goal of Kcam is to reduce the
> driver logic so that most of it is in userspace, but most of your
> answers to challenges so far has been "but we'll have a driver for that"
>
> If a driver is the solution, why do we need the Kcam architecture in the
> first place?

To create a platform where you can build any API.

>
> > > > > > Recent ISPs have a similar architecture, with a set of register=
s used
> > > > > > to communicate with the ISP firmware, and then most of the hard=
ware
> > > > > > registers for the actual image processing blocks being programm=
ed
> > > > > > based from the command stream. "Command stream" may not be a ve=
ry good
> > > > > > term for ISPs as it's not really a stream of commands, but
> > > > > > conceptually, we're dealing with a blob that is computed by use=
rspace.
> > > > >
> > > > > ... while in Kcam, the CPU knows and will interpret that command =
stream.
> > > > > Maybe not in all cases, but it's still a significant difference.
> > > > >
> > > > > If we had to draw a parallel with something else in the kernel, i=
t looks
> > > > > way more like eBPF or the discussion we had on where to parse the
> > > > > bitstreams for stateless codecs.
> > > > >
> > > > > The first one has been severely constrained to avoid the issues w=
e've
> > > > > raised, and we all know how the second one went.
> > > >
> > > > In eBPF, you are moving some user code to the kernel, with an unsta=
ble API.
> > > >
> > > > In KCAM, (and in DRM), you let the user build a set of operations,
> > > > that you pass to the kernel via a stable API, then it is validated =
and
> > > > scheduled by the kernel.
> > >
> > > You won't be able to have a stable API with that design either. If on=
ly
> > > because of that whitelist you were mentioning. Let's say we have a
> > > register that turns out, after the facts, to not be available. If the
> > > userspace ever used to set it at some point, you're screwed. Indeed,
> > > either you move it out of the whitelist, and then you break userspace=
,
> > > or you don't add it to the whitelist and end up allowing an insecure =
or
> > > dangerous situation.
> >
> > See above for our description of allowlist.
> >
> > Also, using the drm model as reference. kernel version, libdrm and
> > mesa (and even llvm) are very coupled. Using a wrong version can lead
> > to unexpected results or even GPU hangs.
>
> Right.
>
> And those are considered regressions:
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-usersp=
ace-requirements
>
> """
> The Linux kernel=E2=80=99s =E2=80=9Cno regression=E2=80=9D policy holds i=
n practice only for
> open-source userspace of the DRM subsystem. DRM developers are perfectly
> fine if closed-source blob drivers in userspace use the same uAPI as the
> open drivers, but they must do so in the exact same way as the open
> drivers. Creative (ab)use of the interfaces will, and in the past
> routinely has, lead to breakage.
> """

There are a lot of hypothetical scenarios: erratas, big documentation
drop from a vendor, drivers obtained via reverse engineering....

There is no one-size-fits-all solution, and every case needs to be
considered individually when they come.

As any other kernel subsystems we need to live under the
never-break-the-userspace. Obey gravity, it is the law ;)


>
> > What to do when we fix bugs that affect functionality is something
> > that we need to decide on case to case cases. The same way we do today
> > when hardware does not support a control value and we discover it 10
> > versions later.
>
> Indeed, but we need to have some idea on what that process is going to
> look like in practice. If we put ourselves is a corner and don't allow
> for some bug resolutions in the first place, then we won't be able to
> fix them when we'll encounter them.

We can definately look into establishing some guidelines once we have
a more clear vision of kcam and its extent.


>
> > > And you can't say you would just ignore a register that isn't part of
> > > the whitelist, because then you would enforce a configuration that is=
n't
> > > the one the user-space asked for, which is even worse.
> > >
> > > > X11 was much more bizarre, the GPIO iomem was remapped into userspa=
ce.
> > >
> > > Yes, but that wasn't the only thing bad with it. I mean, it doesn't
> > > really matter who exactly does the register access eventually. In UMS=
,
> > > X11 was doing it itself through a mapping of its own, in KCam the ker=
nel
> > > will do it on behalf of the userspace. But we still end up in both ca=
ses
> > > with:
> > >
> > >   * The entire logic is in userspace
> >
> > We can argue if this is an issue or not. I think it is not
> >
> > >   * Realistically speaking, that logic can only run as root
> >
> > Do not agree.
>
> How so? Are you going to allow any javascript enabled website to poke
> into Kcam?

Can you access the GPU ISA directly as an external app on the browser?
Same answer here.

The browser will typically speak with a system service to access the
camera: pipewire, gstreamer....

>
> > >   * With a poor configuration, the userspace can completely crash the
> > >     system
> > >   * If the userspace crashes, you can end up with a configuration you
> > >     can't really recover from
> >
> > A Kcam driver can give you broken images, but never crash the system
> > or leave it in an unrecoverable state. That is the main guarantee that
> > we expect from the drivers.
>
> That's wishful thinking. If your application crashes halfway through the
> configuration, you're left in a weird state you know nothing about now.
> That's impossible to recover from.

Today (almost) any kernel driver makes no assumption of the initial
state of the hardware. You might have been interrupted at any state
and rebooting the hardware does not reinit the internal state of the
peripherals.

This is the same, a kcam app needs to init the hardware before it can
make use of it.


>
> Maxime



--=20
Ricardo Ribalda
