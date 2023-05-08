Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102996FA1D9
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 10:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbjEHICf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 04:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbjEHICN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 04:02:13 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB17234A8
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 01:01:01 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7665e607d1bso96980239f.3
        for <linux-media@vger.kernel.org>; Mon, 08 May 2023 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683532856; x=1686124856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQTTbN4Bo1EYhmNtLuKHOjlAjakK4GwiiYsJCFpE0Dw=;
        b=RD7h89DdJhN8MbJgBv69yJENd85JXQfaPmXc3zzeNsaH11YCR6s8eJiguY04h7F7V+
         wlCq3MBapA92+HSKnrbQ9LZAzNFCtH7mrURvFzYxjgLvQrMCBjfnAGUxqltmqAs4vLq0
         +i6HtcSOJbChcz+IXf5FRULs4pGaxQT8fLPEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683532856; x=1686124856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQTTbN4Bo1EYhmNtLuKHOjlAjakK4GwiiYsJCFpE0Dw=;
        b=igQJwQbDWNb67fm+vmxyXce0Itz+Ls9EHK5rUbCG1WlSAZ2kK9blVhGXm6gdzer7DQ
         XrDDN1Aeu7FjCY8lwTSxeSo/LI5OcHzGtqJKZQtSvY42ZiJAvrbhj2ypysNqW3NRA0PC
         KMTryaRlt80Dxd2E+U1/UB7LwYV8eo19qMAOvT0BB0rHu15C+YBsvSELKf78r2b85EhI
         //XsCTpsCX2TerlykjwyHJWQgpbHRegBhLkkQO98OGF2yr1L+xBX8mnge6oB6Ejw7mU1
         6kcikJh+7cD5DptsyVjsSJGv5Ej2kEiIWmlice4jm38TpBaFrb05FzWzHBb0MSdeXEwt
         SaiQ==
X-Gm-Message-State: AC+VfDyW3ZUxgEOO3Rn4VDvYC3T+SNSBwE7B6ec4Vo5fQXXOM4Irhf/P
        jcM2F0w42ixBregw1Cb29a5Mp9dgJexCFLZFAJc=
X-Google-Smtp-Source: ACHHUZ7JvaMOt8BV7a9YBBvJfwEF7+/nydmmT/5J1MwP7vqot1xCGcOQRQc5mns8DF0wUhrduJiX6A==
X-Received: by 2002:a5d:9f18:0:b0:76c:32fb:7bcb with SMTP id q24-20020a5d9f18000000b0076c32fb7bcbmr3109507iot.14.1683532856311;
        Mon, 08 May 2023 01:00:56 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id x9-20020a026f09000000b00411930674c4sm1808468jab.162.2023.05.08.01.00.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 01:00:54 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3330afe3d2fso428035ab.1
        for <linux-media@vger.kernel.org>; Mon, 08 May 2023 01:00:54 -0700 (PDT)
X-Received: by 2002:a05:6e02:12ce:b0:331:aabc:c8b7 with SMTP id
 i14-20020a056e0212ce00b00331aabcc8b7mr441399ilm.10.1683532853544; Mon, 08 May
 2023 01:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <11372cda-a766-ef50-45d7-ed637b72a31c@opensynergy.com>
 <CAPBb6MVRPn6dM8ap9uDvX_ZHdHGvooq+LB7UGDaWBEuUtK3x=A@mail.gmail.com>
 <cbed366a-7f12-8642-18ef-350981279241@opensynergy.com> <87a5ylzf34.fsf@redhat.com>
 <87354dtp30.fsf@linaro.org> <87bkj1h0nf.fsf@redhat.com> <a3607ef3-ffd9-345b-0191-5bc946f4be19@opensynergy.com>
 <168329085253.1880445.14002473591422425775@Monstersaurus> <87v8h6dagr.fsf@linaro.org>
 <20230506081229.GA8114@pendragon.ideasonboard.com> <20230506081633.GB8114@pendragon.ideasonboard.com>
In-Reply-To: <20230506081633.GB8114@pendragon.ideasonboard.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 8 May 2023 17:00:41 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW5K79MswL7GKJBqgNYP-e3YP3P8n+wBpFS4AaqGQFbbg@mail.gmail.com>
Message-ID: <CAPBb6MW5K79MswL7GKJBqgNYP-e3YP3P8n+wBpFS4AaqGQFbbg@mail.gmail.com>
Subject: Re: [libcamera-devel] [virtio-dev] Re: [RFC PATCH v6] virtio-video:
 Add virtio video device specification
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        virtio-dev@lists.oasis-open.org,
        Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?Q?Matti_M=C3=B6ll?= <Matti.Moell@opensynergy.com>,
        Andrew Gazizov <andrew.gazizov@opensynergy.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Marcin Wojtas <mwojtas@google.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Alexander Gordeev <alexander.gordeev@opensynergy.com>,
        libcamera-devel@lists.libcamera.org,
        =?UTF-8?Q?Bart=C5=82omiej_Grzesik?= <bag@semihalf.com>,
        Enrico Granata <egranata@google.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        linux-media@vger.kernel.org
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

Just to add some context for linux-media@, as I think it may be
missing from the quoted thread:

The virtio-video specification has been dragging for quite some time,
and the more it progresses the more it starts looking like V4L2 with
different names. So I suggested that we just encapsulate V4L2 syscalls
into virtio descriptors and basically use the V4L2 model for video
device virtualization. The benefits would be a much shorter
virtio-video specification, and support for other kinds of V4L2
devices like cameras.

I tried to write a quick prototype to test the idea and it works well
enough to expose a USB webcam or the vicodec decoder/encoder using the
same guest driver:

https://github.com/Gnurou/linux/blob/virtio-v4l2/drivers/media/virtio-v4l2/=
virtio_v4l2_driver.c

(driver not supposed to be upstreamed as-is ; it was quickly put
together to check whether the idea could fly).

It would be interesting to hear what the V4L2 maintainers and active
contributors think of this idea. IMHO it provides much more bang for
the buck than having to write new specifications for codec and camera
virtualization, but there are arguments that V4L2 would be too complex
for virtualizing video codecs, and is overall not specified as
precisely as virtio-video would be.

On Sat, May 6, 2023 at 5:16=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> I'm also CC'ing the linux-media@vger.kernel.org mailing list for these
> discussions, I'm sure there are folks there who are interested in codec
> and camera virtualization.
>
> On Sat, May 06, 2023 at 11:12:29AM +0300, Laurent Pinchart via libcamera-=
devel wrote:
> > On Fri, May 05, 2023 at 04:55:33PM +0100, Alex Benn=C3=A9e via libcamer=
a-devel wrote:
> > > Kieran Bingham writes:
> > > > Quoting Alexander Gordeev (2023-05-05 10:57:29)
> > > >> On 03.05.23 17:53, Cornelia Huck wrote:
> > > >> > On Wed, May 03 2023, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> > > >> >> Cornelia Huck <cohuck@redhat.com> writes:
> > > >> >>> On Fri, Apr 28 2023, Alexander Gordeev <alexander.gordeev@open=
synergy.com> wrote:
> > > >> >>>> On 27.04.23 15:16, Alexandre Courbot wrote:
> > > >> >>>>> But in any case, that's irrelevant to the guest-host interfa=
ce, and I
> > > >> >>>>> think a big part of the disagreement stems from the misconce=
ption that
> > > >> >>>>> V4L2 absolutely needs to be used on either the guest or the =
host,
> > > >> >>>>> which is absolutely not the case.
> > > >> >>>>
> > > >> >>>> I understand this, of course. I'm arguing, that it is harder =
to
> > > >> >>>> implement it, get it straight and then maintain it over years=
. Also it
> > > >> >>>> brings limitations, that sometimes can be workarounded in the=
 virtio
> > > >> >>>> spec, but this always comes at a cost of decreased readabilit=
y and
> > > >> >>>> increased complexity. Overall it looks clearly as a downgrade=
 compared
> > > >> >>>> to virtio-video for our use-case. And I believe it would be t=
he same for
> > > >> >>>> every developer, that has to actually implement the spec, not=
 just do
> > > >> >>>> the pass through. So if we think of V4L2 UAPI pass through as=
 a
> > > >> >>>> compatibility device (which I believe it is), then it is fine=
 to have
> > > >> >>>> both and keep improving the virtio-video, including taking th=
e best
> > > >> >>>> ideas from the V4L2 and overall using it as a reference to ma=
ke writing
> > > >> >>>> the driver simpler.
> > > >> >>>
> > > >> >>> Let me jump in here and ask another question:
> > > >> >>>
> > > >> >>> Imagine that, some years in the future, somebody wants to add =
a virtio
> > > >> >>> device for handling video encoding/decoding to their hyperviso=
r.
> > > >> >>>
> > > >> >>> Option 1: There are different devices to chose from. How is th=
e person
> > > >> >>> implementing this supposed to pick a device? They might have a=
 narrow
> > > >> >>> use case, where it is clear which of the devices is the one th=
at needs to
> > > >> >>> be supported; but they also might have multiple, diverse use c=
ases, and
> > > >> >>> end up needing to implement all of the devices.
> > > >> >>>
> > > >> >>> Option 2: There is one device with various optional features. =
The person
> > > >> >>> implementing this can start off with a certain subset of featu=
res
> > > >> >>> depending on their expected use cases, and add to it later, if=
 needed;
> > > >> >>> but the upfront complexity might be too high for specialized u=
se cases.
> > > >> >>>
> > > >> >>> Leaving concrete references to V4L2 out of the picture, we're =
currently
> > > >> >>> trying to decide whether our future will be more like Option 1=
 or Option
> > > >> >>> 2, with their respective trade-offs.
> > > >> >>>
> > > >> >>> I'm slightly biased towards Option 2; does it look feasible at=
 all, or
> > > >> >>> am I missing something essential here? (I had the impression t=
hat some
> > > >> >>> previous confusion had been cleared up; apologies in advance i=
f I'm
> > > >> >>> misrepresenting things.)
> > > >> >>>
> > > >> >>> I'd really love to see some kind of consensus for 1.3, if at a=
ll
> > > >> >>> possible :)
> > > >> >>
> > > >> >> I think feature discovery and extensibility is a key part of th=
e VirtIO
> > > >> >> paradigm which is why I find the virtio-v4l approach limiting. =
By
> > > >> >> pegging the device to a Linux API we effectively limit the grow=
th of the
> > > >> >> device specification to as fast as the Linux API changes. I'm n=
ot fully
> > > >> >> immersed in v4l but I don't think it is seeing any additional f=
eatures
> > > >> >> developed for it and its limitations for camera are one of the =
reasons
> > > >> >> stuff is being pushed to userspace in solutions like libcamera:
> > > >> >>
> > > >> >>    How is libcamera different from V4L2?
> > > >> >>
> > > >> >>    We see libcamera as a continuation of V4L2. One that can mor=
e easily
> > > >> >>    handle the recent advances in hardware design. As embedded c=
ameras have
> > > >> >>    developed, all of the complexity has been pushed on to the d=
evelopers.
> > > >> >>    With libcamera, all of that complexity is simplified and a s=
ingle model
> > > >> >>    is presented to application developers.
> > > >> >
> > > >> > Ok, that is interesting; thanks for the information.
> > > >> >
> > > >> >>
> > > >> >> That said its not totally our experience to have virtio devices=
 act as
> > > >> >> simple pipes for some higher level protocol. The virtio-gpu spe=
c says
> > > >> >> very little about the details of how 3D devices work and simply=
 offers
> > > >> >> an opaque pipe to push a (potentially propriety) command stream=
 to the
> > > >> >> back end. As far as I'm aware the proposals for Vulkan and Wayl=
and
> > > >> >> device support doesn't even offer a feature bit but simply chan=
ges the
> > > >> >> graphics stream type in the command packets.
> > > >> >>
> > > >> >> We could just offer a VIRTIO_VIDEO_F_V4L feature bit, document =
it as
> > > >> >> incompatible with other feature bits and make that the baseline
> > > >> >> implementation but it's not really in the spirit of what VirtIO=
 is
> > > >> >> trying to achieve.
> > > >> >
> > > >> > I'd not be in favour of an incompatible feature flag,
> > > >> > either... extensions are good, but conflicting features is somet=
hing
> > > >> > that I'd like to avoid.
> > > >> >
> > > >> > So, given that I'd still prefer to have a single device: How wel=
l does
> > > >> > the proposed virtio-video device map to a Linux driver implement=
ation
> > > >> > that hooks into V4L2?
> > > >>
> > > >> IMO it hooks into V4L2 pretty well. And I'm going to spend next fe=
w
> > > >> months making the existing driver fully V4L2 compliant. If this go=
al
> > > >> requires changing the spec, than we still have time to do that. I =
don't
> > > >> expect a lot of problems on this side. There might be problems wit=
h
> > > >> Android using V4L2 in weird ways. Well, let's see. Anyway, I think=
 all
> > > >> of this can be accomplished over time.
> > > >>
> > > >> > If the general process flow is compatible and it
> > > >> > is mostly a question of wiring the parts together, I think pushi=
ng that
> > > >> > part of the complexity into the Linux driver is a reasonable
> > > >> > trade-off. Being able to use an existing protocol is nice, but i=
f that
> > > >> > protocol is not perceived as flexible enough, it is probably not=
 worth
> > > >> > encoding it into a spec. (Similar considerations apply to hookin=
g up the
> > > >> > device in the hypervisor.)
> > > >>
> > > >> I very much agree with these statements. I think this is how it sh=
ould
> > > >> be: we start with a compact but usable device, then add features a=
nd
> > > >> enable them using feature flags. Eventually we can cover all the
> > > >> use-cases of V4L2 unless we decide to have separate devices for th=
em
> > > >> (virtio-camera, etc). This would be better in the long term I thin=
k.
> > > >
> > > > Camera's definitely have their quirks - mostly because many usecase=
s are
> > > > hard to convey over a single Video device node (with the hardware) =
but I
> > > > think we might expect that complexity to be managed by the host, an=
d
> > > > probably offer a ready made stream to the guest. Of course how to h=
andle
> > > > multiple streams and configuration of the whole pipeline may get mo=
re
> > > > difficult and warrant a specific 'virtio-camera' ... but I would th=
ink
> > > > the basics could be covered generically to start with.
> > > >
> > > > It's not clear who's driving this implementation and spec, so I gue=
ss
> > > > there's more reading to do.
> > > >
> > > > Anyway, I've added Cc libcamera-devel to raise awareness of this to=
pic
> > > > to camera list.
> > > >
> > > > I bet Laurent has some stronger opinions on how he'd see camera's e=
xist
> > > > in a virtio space.
> >
> > You seem to think I have strong opinions about everything. This may not
> > be a complitely unfounded assumption ;-)
> >
> > Overall I agree with you, I think cameras are too complex for a
> > low-level virtualization protocol. I'd rather see a high-level protocol
> > that exposes webcam-like devices, with the low-level complexity handled
> > on the host side (using libcamera of course ;-)). This would support us=
e
> > cases that require sharing hardware blocks between multiple logical
> > cameras, including sharing the same camera streams between multiple
> > guests.
> >
> > If a guest needs low-level access to the camera, including the ability
> > to control the raw camera sensor or ISP, then I'd recommend passing the
> > corresponding hardware blocks to the guest for exclusive access.
> >
> > > Personally I would rather see a separate virtio-camera specification
> > > that properly encapsulates all the various use cases we have for
> > > cameras. In many ways just processing a stream of video is a much
> > > simpler use case.
> > >
> > > During Linaro's Project Stratos we got a lot of feedback from members
> > > who professed interest in a virtio-camera initiative. However we were
> > > unable to get enough engineering resources from the various companies=
 to
> > > collaborate in developing a specification that would meet everyone's
> > > needs. The problem space is wide from having numerous black and white
> > > sensor cameras on cars to the full on computational photography as
> > > exposed by modern camera systems on phones. If you want to read more
> > > words on the topic I wrote a blog post at the time:
> > >
> > >   https://www.linaro.org/blog/the-challenges-of-abstracting-virtio/
> > >
> > > Back to the topic of virtio-video as I understand it the principle
> > > features/configurations are:
> > >
> > >   - All the various CODECs, resolutions and pixel formats
> > >   - Stateful vs Stateless streams
> > >   - If we want support grabbing single frames from a source
> > >
> > > My main concern about the V4L approach is that it pegs updates to the
> > > interface to the continuing evolution of the V4L interface in Linux. =
Now
> > > maybe video is a solved problem and there won't be (m)any new feature=
s
> > > we need to add after the initial revision. However I'm not a domain
> > > expert here so I just don't know.
> >
> > I've briefly discussed "virtio-v4l2" with Alex Courbot a few weeks ago
> > when we got a chance to meet face to face. I think the V4L2 kernel API
> > is a quite good fit in the sense that its level of abstraction, when
> > applied to video codecs and "simple" cameras (defined, more or less, as
> > something ressembling a USB webcam feature-wise). It doesn't mean that
> > the virtio-video or virtio-camera specifications should necessarily
> > reference V4L2 or use the exact same vocabulary, they could simply copy
> > the concepts, and stay loosely-coupled with V4L2 in the sense that both
> > specification should try to evolve in compatible directions.
>
> --
> Regards,
>
> Laurent Pinchart
