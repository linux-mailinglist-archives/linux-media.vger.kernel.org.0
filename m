Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA2142D55C
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 10:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhJNIsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 04:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhJNIst (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 04:48:49 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C234C061570
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 01:46:44 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y12so21683985eda.4
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7w2iMxFe61jN1rv6dN3yP4oCTOaGLGThPgxPVtx1pTk=;
        b=7or4NdH+O7yAtsklrYS3zkReLbGJR+Q0kbSxNVYs+Xkr81NnnEcpo/x+q7lk2OHlWs
         jIg9COjRUdT0Og0dYS4CTAMsf7/a7qGw7D8I4LNA/SdUdgufpG3aObBjUT5E6lN+wL8Q
         1SChuxMc8FnpuexyslnBYQm+x77NDY9v+oW0XxjU8ycPQayiYcobELPqZkB+weFDuFGc
         yqv7qoIXrCWPoLeDpzqYHeJbUAOgGpNYnG2XWEuRKJ+o8d3Us9dsXpuVUqRLhKrxZFOx
         mSIoMKva4ngeTj5KR3a/m/yPWH17cD4FGpnUv1N+nyLLmr6t2l8YezD1v1AiHVTemzbT
         2Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7w2iMxFe61jN1rv6dN3yP4oCTOaGLGThPgxPVtx1pTk=;
        b=Vq9z0n2wlP4afmB8Gp7OOmfknpDmB8eFlNytSoVrwCkaJbU5zqAfS89vcDvEiHpEnP
         If50T/YPiHznKcVRpymtZhm5ZKoowo09qeho5c+zb/Vku4X3xn68uu1YW2gyAz+unbnw
         vs1dt9wuOJgd5rrdKHUPVcyabWpd4B4TDPiVZ+jN03iziUznAktaKd8f/itQsAICd5VW
         98NdYnqEoki1qVaa0e0nC7+HzJL9/zc57e3DBRGOv5S609k1nd0Fj4+c4dtEZQzlZVyG
         Sm8IygFVsD1zYZ9iUegL75o0guKI1IyXt7iFdRpIfY+dkSdlvK6hwUqBMn9k8qTN6F3f
         YzLA==
X-Gm-Message-State: AOAM531utH7OgzvB3Qap71lYMxYI6+qJ0j1RwEJd0urrzCRTypsiEqv8
        19+2O9OPTlQTQXp/Nz7fwPrdLiDlfswj9qCs2TkbVQ==
X-Google-Smtp-Source: ABdhPJxXEYRMejmM3Dv1g6yLHgMuEd/iyRmUiGS8LsqJ6QJsLSp1H9IQu0mLeB65DlX/OHTUCCdEsvZErD5AX220svU=
X-Received: by 2002:a17:906:b782:: with SMTP id dt2mr2345631ejb.310.1634201202554;
 Thu, 14 Oct 2021 01:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211008100423.739462-1-wenst@chromium.org> <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
 <CAGXv+5FnFq1mN79sqUp-o6pHirYvp55gurnsUCgqYvEAX2=4oQ@mail.gmail.com>
 <ff0769efee51e15451d48e23860f8b1710593cd7.camel@ndufresne.ca> <CAGXv+5GJCaxnPPkXRp5xrTBuq-5=ggfjPbRhyS4vdm3meM_4eg@mail.gmail.com>
In-Reply-To: <CAGXv+5GJCaxnPPkXRp5xrTBuq-5=ggfjPbRhyS4vdm3meM_4eg@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 14 Oct 2021 05:46:30 -0300
Message-ID: <CAAEAJfAratFPK0iU8QWMr36ZFCL5cgBneKkzymy+gCgJV=goOg@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro and Cedrus
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 14 Oct 2021 at 04:31, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Wed, Oct 13, 2021 at 9:40 PM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> >
> > Le mercredi 13 octobre 2021 =C3=A0 15:05 +0800, Chen-Yu Tsai a =C3=A9cr=
it :
> > > Hi,
> > >
> > > On Fri, Oct 8, 2021 at 11:42 PM Nicolas Dufresne <nicolas@ndufresne.c=
a> wrote:
> > > >
> > > > Hi Chen-Yu,
> > > >
> > > > thanks for looking into this.
> > > >
> > > > Le vendredi 08 octobre 2021 =C3=A0 18:04 +0800, Chen-Yu Tsai a =C3=
=A9crit :
> > > > > Hi everyone,
> > > > >
> > > > > While working on the rkvdec H.264 decoder for ChromeOS, I noticed=
 some
> > > > > behavioral differences compared to Hantro and Cedrus:
> > > > >
> > > > > 1. The driver always overrides the sizeimage setting given by use=
rspace
> > > > >    for the output format. This results in insufficient buffer spa=
ce when
> > > > >    running the ChromeOS video_decode_accelerator_tests test progr=
am,
> > > > >    likely due to a small initial resolution followed by dynamic
> > > > >    resolution change.
> > > > >
> > > > > 2. Doesn't support dynamic resolution change.
> > > > >
> > > > > This small series fixes both and aligns the behavior with the oth=
er two
> > > > > stateless decoder drivers. This was tested on the downstream Chro=
meOS
> > > > > 5.10 kernel with ChromeOS. Also compiled tested on mainline but I=
 don't
> > > > > have any other RK3399 devices set up to test video stuff, so test=
ing
> > > > > would be very much appreciated.
> > > > >
> > > > > Also, I'm not sure if user applications are required to check the=
 value
> > > > > of sizeimage upon S_FMT return. If the value is different or too =
small,
> > > > > what can the application do besides fail? AFAICT it can't split t=
he
> > > > > data of one frame (or slice) between different buffers.
> > > >
> > > > While most software out there just assumes that driver will do it r=
ight and
> > > > crash when it's not the case, application that do map the buffer to=
 CPU must
> > > > read back the fmt structure as the drivers are all fail-safe and wi=
ll modify
> > > > that structure to a set of valid value s for the context.
> > >
> > > I believe what is happening in Chromium is that the decoder is opened=
 with
> > > some default settings, including the smallest viable resolution for t=
he
> > > output side, and the buffers allocated accordingly. When dynamic reso=
lution
> > > change happens, the decoder does not check if the current buffers are
> > > sufficiently sized; it just assumes that they are. And when it starts
> > > pushing data into the buffers, it realizes they are too small and fai=
ls.
> > >
> > > The spec also says:
> > >
> > >     Clients are allowed to set the sizeimage field for variable lengt=
h
> > >     compressed data flagged with V4L2_FMT_FLAG_COMPRESSED at ioctl
> > >     VIDIOC_ENUM_FMT, but the driver may ignore it and set the value i=
tself,
> > >     or it may modify the provided value based on alignment requiremen=
ts or
> > >     minimum/maximum size requirements.
> > >
> > > The spec only guarantees that the buffers are of sufficient size for =
the
> > > resolution configured at the time they were allocated/requested.
> > >
> > > So I think my first patch is a workaround for a somewhat broken users=
pace.
> > > But it seems the other stateless drivers are providing similar behavi=
or,
> > > as I previously mentioned.
> >
> > That's what I mean, this is not a driver bug strictly speaking (assumin=
g it does
> > guaranty the buffer size is sufficient) but it is without your change
> > inconvenient, as userspace may be aware of the largest resolution it wi=
ll
> > decode, and may want to allocate larger buffer upfront.
>
> Thinking about this more, I think a few follow up fixes for each driver
> are in order. The spec implies that the driver should override the value
> should userspace give some unrealistic value, such as asking for a 256 by=
te
> buffer for a 4K frame size.
>

Where is the spec implying that?

This is encoded content, so I'm really inclined to avoid this path.
Having the driver decide what is "unrealistic" would mean some
heuristics in the drivers for something that should really come from usersp=
ace.

Thanks,
Ezequiel

> Cedrus (CCing Jernej) comes close, but a 1K buffer might not be enough fo=
r
> really large frames, even though it's slice based?
>
> ChenYu
>
>
> > As per Chromium bug, this is being addressed already. Thanks for this d=
river
> > improvement.
> >
> > >
> > > > As for opposite direction (output vs capture) format being changed,=
 this should
> > > > be documented in the spec, if you find it too unclear or missing fo=
r sateless
> > > > codec (I know it's there for stateful but can't remember, would hav=
e to re-read,
> > > > for stateless) let us know.
> > >
> > > AFAICT the capture side is working OK and to spec.
> > >
> > >
> > > Regards
> > > ChenYu
> > >
> > > > regards,
> > > > Nicolas
> > > >
> > > > >
> > > > > Andrzej, I believe the second patch would conflict with your VP9 =
series.
> > > > >
> > > > >
> > > > > Regards
> > > > > ChenYu
> > > > >
> > > > > Chen-Yu Tsai (2):
> > > > >   media: rkvdec: Do not override sizeimage for output format
> > > > >   media: rkvdec: Support dynamic resolution changes
> > > > >
> > > > >  drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
> > > > >  drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-----=
------
> > > > >  2 files changed, 23 insertions(+), 22 deletions(-)
> > > > >
> > > >
> > > >
> >
> >
