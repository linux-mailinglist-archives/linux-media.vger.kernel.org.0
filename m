Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366205B31E9
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 10:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiIIIj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 04:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiIIIj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 04:39:57 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D2530F46
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 01:39:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id nc14so2376099ejc.4
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JZKggmz50MY3MkPaI5AP33JbBTWLd7RFN22YTSm3CbY=;
        b=dBWjtE6vHfYzAcLG+ldQ+sfmVEBsmcROQmgIZX8tyBnhn9NE3eVP8NTdyr5mvsQrYk
         9wq4phQR02Gzgfq9re2+Ff+Lfp662VYFoWQmgylTzS4ESO2Eadc0HJ0TKXaEsXYej0qO
         +aSjuUZIz6sjo7vQJLMz2O494COoR/09lObcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JZKggmz50MY3MkPaI5AP33JbBTWLd7RFN22YTSm3CbY=;
        b=lq/luERT01nMN+mXWi4dd8Wb8VGI6z7mIqnOV5eINDyUqojLwHHC4AZcYFOqyBQnVk
         qwvQqtzZa6kKaAJWtySk/Uetr8QmgNjQUTcbPaD+dX3ZFjsRnGcA9Rulyt/5qob6dJxm
         dE5IcTQX3eTQmo6td0g5sITo6z8M8TbGL12ARfzuRqPI5xtd7Lhx1QTU5eS9sYAGZ0RG
         NKmXGUgWgZfwje4IDnhDGfUtDBc9u9XmbLU9jJMdMiLLAnFM6DgjUAohTRV0tmbECRnN
         /C9KNZ0cBSWSo1WnTARGXn70/rBI/ZzmfWLSl8ubQN5aesgxbmZH5mRukK/+6YJyUTCD
         e7+g==
X-Gm-Message-State: ACgBeo0sMJOVeVCtW0UkGEcjw20Mjl+GwyPuM0KYK5+y3eXr3y2zToCk
        kXN4TbGqe2WLoOmHuKV31Uzi/9VkLnKOHGnJ5Ec=
X-Google-Smtp-Source: AA6agR4yrnVOlht8DKRQ7ZPzQehR7iOLeS5YNeM5LAEM7a5ZPYi8t2t1KwffnHUzm2N4jp4oV8eLZQ==
X-Received: by 2002:a17:907:7215:b0:76f:8cce:7a5b with SMTP id dr21-20020a170907721500b0076f8cce7a5bmr9589597ejc.25.1662712790976;
        Fri, 09 Sep 2022 01:39:50 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id i15-20020a05640200cf00b004511957d075sm297833edu.80.2022.09.09.01.39.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:39:49 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id lz22so2386825ejb.3
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 01:39:48 -0700 (PDT)
X-Received: by 2002:a17:907:a079:b0:770:78cb:6650 with SMTP id
 ia25-20020a170907a07900b0077078cb6650mr8881325ejc.515.1662712788473; Fri, 09
 Sep 2022 01:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com> <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat> <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat> <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
 <20220908153430.fctitaofbj6hqot3@houat> <CANiDSCs=Jga0NgnhPPiJ_EZA5=3cNFfztmrVxzPO32TO_pKnXg@mail.gmail.com>
 <20220909080028.vchiddgtt2kl2ha3@houat>
In-Reply-To: <20220909080028.vchiddgtt2kl2ha3@houat>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 9 Sep 2022 10:39:36 +0200
X-Gmail-Original-Message-ID: <CANiDSCva_RZpSHMaaHXyzuQD_zTYFOG2CsNYA15_C39a_nSHnQ@mail.gmail.com>
Message-ID: <CANiDSCva_RZpSHMaaHXyzuQD_zTYFOG2CsNYA15_C39a_nSHnQ@mail.gmail.com>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime

On Fri, 9 Sept 2022 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Sep 08, 2022 at 08:13:17PM +0200, Ricardo Ribalda wrote:
> > On Thu, 8 Sept 2022 at 17:34, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > > > > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> > > > > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > > > > > Hi Ricardo,
> > > > > > >
> > > > > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > > > > > > - Still on slide 16, V4L2 as an API is usable without disclosing vendor
> > > > > > > > >   IP. What is not possible is upstreaming a driver. I don't see this as
> > > > > > > > >   significantly different between V4L2 and the new API proposal. I
> > > > > > > > >   expect this to be discussed on Monday.
> > > > > > > >
> > > > > > > > I am only considering upstream drivers. There is not much to discuss
> > > > > > > > for downstream or closed drivers :)
> > > > > > >
> > > > > > > Are we really discussing upstream *drivers*? If anything, it looks like
> > > > > > > the Kcam proposal moves most of the drivers out of upstream.
> > > > > >
> > > > > > Given that the API proposal sets at a significant lower level than V4L2
> > > > > > in the stack, the concept of "userspace driver" (I meant it in the sense
> > > > > > of GPU support in mesa) plays a bigger role. It would be good to clarify
> > > > > > what is meant by "driver" and maybe use the term "kernel driver" when
> > > > > > only the kernel part is covered, to avoid misunderstandings.
> > > > >
> > > > > I think there's a bit of a misunderstanding about what exactly is in a
> > > > > DRM driver, and what is in Mesa.
> > > > >
> > > > > Mesa doesn't program the hardware at all, it's merely a glorified
> > > > > compiler. It's not more of a driver than GCC is an OS. Most importantly
> > > > > for our discussion, Mesa doesn't perform any kind of register access (or
> > > > > register access request), only the (kernel) driver does that.
> > > >
> > > > Mesa compiles shaders, but also more generally produces command streams
> > > > that are passed as blobs to the DRM driver, which then forwards them to
> > > > the device with as little processing and validation as possible (when
> > > > the device is designed with multi-clients in mind, that processing and
> > > > validation can be reduced a lot).
> > >
> > > That's true, but at no point in time is the CPU ever touches that
> > > command stream blob in the case of DRM...
> >
> > As Laurent says, the latest hardware is very similar to GPUs, you pass
> > a set of commands to a firmware that does the actual R/W to the
> > hardware.
>
> For the latest, most powerful, hardware, maybe. I can show you plenty of
> other ISP we'll need to support that aren't programmed that way, and in
> that case we would end up interpreting whatever is being passed to KCam
> on the CPU.

Kcam is not meant to replace V4L2, if a hardware is better modeled in
V4L2, they can use it.

>
> Which is totally different to what DRM/Mesa is doing on *any* hardware.
>
> Another constraint that Mesa has is that there is standards user-space
> API that all the applications target when it comes to graphics (OpenGL,
> Vulkan, Direct3D, etc.) and you need to support pretty much all of them.
> So in that sense, Mesa is a transpiler between that API and the GPU ISA.
> We're not in this case either with Kcam.

We also have APIs for cameras: V4L2, Android HAL, libcamera,
one-of-the-many-industrial-APIs

The userspace stack will transpile between that API and the ISP command buffers.


>
> > For hardware that is a register set, the vendor should have a good
> > idea about what kind of validation should be needed: raw access (deny
> > list) or more abstracted (allow list).
>
> This would be similar to what is going on with regmap caches. And they
> are a pain to deal with because that information is far from being
> available for all the devices, and then most drivers don't implement it
> either.
>
> Also, if we have to have a whitelist in the kernel, then we need to
> introduce and upstream some kind of driver for hardware enablement.
> Doesn't that completely defeat the purpose of Kcam?

The allowlist model that I mention is not about filtering what
registers can be written and what not. It is about abstracting them
completely if you do not trust the hardware:

Lets say that you only have 4 verified modes (like we have on many
sensors), then you expose a single register with 4 valid values:
0,1,2,3. The driver will convert that single register write into N
writes to registers.



>
> > The most critical part is the DMA, and that will always be abstracted.
>
> Where do you draw the line then? What will have a driver in the kernel,
> and what won't?

If there is memory access: abstraction
If the hardware is not trusted/documented:abstraction
If a specific configuration is know to be invalid and leaves the
system in an invalid state:filtering
everything else: raw access (+validation)


>
> And again, the issue I was telling you about was about a configuration
> mismatch (following a bogus documentation) between the DMA and the
> sensor. If the sensor is part of the userspace and the DMA in the
> kernel, we very much can still have that issue.

With internal operations you can achieve cooperation between the entities.

>
> > Also I doubt that we will have new hardware without an IOMMU, so we
> > have the same layers of security as today.
>
> Maybe not for the kind of devices that end up on chromebooks, but
> there's definitely hardware being designed today that have an ISP but no
> IOMMU.

For the non-iommu hardware, you will have the same security as today:
driver validation.

>
> > > > Recent ISPs have a similar architecture, with a set of registers used
> > > > to communicate with the ISP firmware, and then most of the hardware
> > > > registers for the actual image processing blocks being programmed
> > > > based from the command stream. "Command stream" may not be a very good
> > > > term for ISPs as it's not really a stream of commands, but
> > > > conceptually, we're dealing with a blob that is computed by userspace.
> > >
> > > ... while in Kcam, the CPU knows and will interpret that command stream.
> > > Maybe not in all cases, but it's still a significant difference.
> > >
> > > If we had to draw a parallel with something else in the kernel, it looks
> > > way more like eBPF or the discussion we had on where to parse the
> > > bitstreams for stateless codecs.
> > >
> > > The first one has been severely constrained to avoid the issues we've
> > > raised, and we all know how the second one went.
> >
> > In eBPF, you are moving some user code to the kernel, with an unstable API.
> >
> > In KCAM, (and in DRM), you let the user build a set of operations,
> > that you pass to the kernel via a stable API, then it is validated and
> > scheduled by the kernel.
>
> You won't be able to have a stable API with that design either. If only
> because of that whitelist you were mentioning. Let's say we have a
> register that turns out, after the facts, to not be available. If the
> userspace ever used to set it at some point, you're screwed. Indeed,
> either you move it out of the whitelist, and then you break userspace,
> or you don't add it to the whitelist and end up allowing an insecure or
> dangerous situation.

See above for our description of allowlist.

Also, using the drm model as reference. kernel version, libdrm and
mesa (and even llvm) are very coupled. Using a wrong version can lead
to unexpected results or even GPU hangs.

What to do when we fix bugs that affect functionality is something
that we need to decide on case to case cases. The same way we do today
when hardware does not support a control value and we discover it 10
versions later.

>
> And you can't say you would just ignore a register that isn't part of
> the whitelist, because then you would enforce a configuration that isn't
> the one the user-space asked for, which is even worse.
>
> > X11 was much more bizarre, the GPIO iomem was remapped into userspace.
>
> Yes, but that wasn't the only thing bad with it. I mean, it doesn't
> really matter who exactly does the register access eventually. In UMS,
> X11 was doing it itself through a mapping of its own, in KCam the kernel
> will do it on behalf of the userspace. But we still end up in both cases
> with:
>
>   * The entire logic is in userspace

We can argue if this is an issue or not. I think it is not

>   * Realistically speaking, that logic can only run as root

Do not agree.

>   * With a poor configuration, the userspace can completely crash the
>     system
>   * If the userspace crashes, you can end up with a configuration you
>     can't really recover from

A Kcam driver can give you broken images, but never crash the system
or leave it in an unrecoverable state. That is the main guarantee that
we expect from the drivers.

>
> *All* of those issues are still there with Kcam, even though the actual
>  memory mapping isn't in userspace


.
>
> Maxime



-- 
Ricardo Ribalda
