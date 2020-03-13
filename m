Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18DF184646
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgCMLxa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:53:30 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43738 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgCMLx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:53:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id r7so10163114ljp.10
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DMm+rE7NhD0xO3EBWPlfOkOO7IQTEHC0M5uK79hlrYQ=;
        b=m9Nd8SZz+fwM2WtFyqhWPDt+nHkRJ6SZG7WIK5X6O4L2JGQpTGtX+6hhKznuRtfBiV
         aU3N81U3Uk+1oipI0L4jtyCGKEA+0EicWzG+S/yGoj/jZS0NcFSSB0aWTdyAQnPNoTyg
         VJ+XrJTJG/ZkVUeZLosjpnn3YiwJ56GVYkzYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DMm+rE7NhD0xO3EBWPlfOkOO7IQTEHC0M5uK79hlrYQ=;
        b=mXWtBUMYnexY4Q0N+hFfwnGkRAYSGXmxD81V44mn2qfTz63g3TrPBiPMqoS8RMYC9c
         Gw6hPgLGC5vba3Lza9taGJUbiBwmxIdDzDWEO1WWhf1y/Toy4WYPXtj/aItUs1iUn5ex
         5AAdblU0/an04Hg4fmLa9CBdxWgIGUxgRUfr0cKJL7LlBGXCjQfYpxsWEAu/ZR/St+rW
         2jMN5NN9gJ0x3/gg7YgEVAW/4M7PC42GjQt0uT0l+MiaK9mZe+OI2/0z3NRzbyQ7K9YK
         +18MK7hB/ZX3ADJ6U0pWZIJIOiQ18t0ekxhwK6pyy/7TNHvFY4CMMUODhUu/9VNi/XPC
         PNYg==
X-Gm-Message-State: ANhLgQ0Ooj9X4kjFey36CuUqlGR8w66xzOoe9UCnbbIkB+sOWbObhJV2
        MRQkv1UnkQw5UkHHNEXmOAzUGVRYXJg6fk3X0XdhQA==
X-Google-Smtp-Source: ADFU+vs1PrpgKq6eKalpN/t4yrPf97Qnqy3Sm3wG0/e0O6cBPvFAoyK02x3BabMd9G0PTl2EKVR5Gdi0xm8/q5HQTEg=
X-Received: by 2002:a2e:9a90:: with SMTP id p16mr8216811lji.277.1584100404511;
 Fri, 13 Mar 2020 04:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
 <75f3a24ac5cd4f656aadf4312bdbcb70a6803a6e.camel@ndufresne.ca>
 <CAD90VcZLD8keTBXKpK4u-E4st+B3_O1xkb7qgVZMc_ekBjwtCg@mail.gmail.com> <35350330.XM6RcZxFsP@os-lin-dmo>
In-Reply-To: <35350330.XM6RcZxFsP@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Fri, 13 Mar 2020 20:53:13 +0900
Message-ID: <CAD90VcbV3f89T5ncH5vje2qzHmseDSkhGWMUEBv8We-A_svoPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 13, 2020 at 7:09 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> w=
rote:
>
> Hi Nicolas, Keiichi,
>
> On Freitag, 13. M=C3=A4rz 2020 08:54:13 CET Keiichi Watanabe wrote:
> > Hi Nicolas,
> >
> > On Fri, Mar 13, 2020 at 11:29 AM Nicolas Dufresne <nicolas@ndufresne.ca=
>
> wrote:
> > > Hi Dimitry,
> > >
> > > Le jeudi 12 mars 2020 =C3=A0 11:29 +0100, Dmitry Sepp a =C3=A9crit :
> > > > Hi Hans,
> > > >
> > > > I'm not sure about crosvm, for us it is probably still feasible to
> > > > implement FWHT in the device (but it is unfortunately not supposed =
to
> > > > be upstreamed yet).
> > > >
> > > > The main question is what would be the proper user-space tool to te=
st
> > > > that? Is v4l2-ctl OK for that? As for gstreamer, AFAIK it does not
> > > > respect the v4l2 Video Decoder Interface Spec and we have seen some
> > > > issues with it.>
> > > GStreamer element has been implemented to support what real drivers d=
o,
> > > not what the spec suggest should be done. AFAIC, not all drivers have
> > > been updated with all the new features required by the spec. And the
> > > new features are not compatible with drivers that are not ported, so =
it
> > > creates a lot of complexity for userspace to stay backward compatible=
.
> > > Though, the spec should allow drivers to stay backward compatible, if
> > > not, we'd be very happy to learn why.
> > >
> > > About the other issues, I'd be very happy to learn what they are, it'=
s
> > > the first feedback I get from your team thus far. Please feel free to
> > > file issues or send me (or gstreamer-devel list) an email.
> > >
> > > In term of userspace, please consider FFMPEG also, as it's support fo=
r
> > > V4L2 Stateful CODECs has gained momentum. It is again implemented to
> > > support real drivers, but started much more recently targetting the
> > > Qualcomm/Venus driver, so it didn't have to suffer all the legacy and
> > > directions changes in the V4L2 API since 2011.
> > >
> > > As for the virtio video driver, it will remain useless to non-
> > > chromeos/chrome users as long as it's not supported by any userspace.
> > > I'd be very happy so see more contribution into FFMPEG and GStreamer =
to
> > > implement the features that, for now, are only implemented in the
> > > spec.
> > >
> > > From your comment, bridging a Linux driver in the host through virtio=
-
> > > video seems like a huge tasks. I believe this is an important issue t=
o
> > > address in the long term. If you could provide more details, I think =
it
> > > would benefit to readers understanding.
> >
> > Just to clarify, Dmitry is not working for ChromeOS but for another
> > hypervisor (, which is not OSS?). So, users are not limited to
> > ChromeOS.
> > But, yeah, I agree that it's important to make it easy to use
> > virtio-video driver without special hardware.
> >
> > Let me explain what is the remaining task.
> > To test virtio-video driver, we need to take care of four parts:
> > Guest user application, guest virtio-video driver (this patch), host
> > virtio-video device, and host video codec device.
> > We have several options for each parts:
> >
> > Guest userspace | Guest kernel | Host userspace hypervisor | Host video
> > device
> > -----------------------------------------------------------------------=
----
> > - * FFMPEG      | virtio-video | virtio-video device in    | * real dri=
ver *
> > GStreamer   |  driver      | * crosvm                  | * vicodec *
> > v4l2-ctl    |              | * Dmitry's hypervisor     | * SW en/decode=
r
> >                 |              | * QEMU?                   |
> >
> > The remaining task I commented is implementation of virtio-video
> > device in a host hypervisor.
>
> Oh, there is no Dmitry's hypervisor unfortunately :) It is the COQOS
> Automotive hypervisor. And of course it does not use SW codecs on the hos=
t
> side. Yes, correct, the hypervisor is not OSS for obvious reasons.

Ah, I meant Dmitry's team's hypervisor:) The name of COQOS slipped my
mind. Sorry!

I added SW codecs in host device column because it's technically
possible to use SW codec as a backend video device for testing
purposes.
But, the word "platform codecs" sounds more general. The updated table
looks better to me.

>
> For us one of the most important guest side users is Android's multimedia
> subsystem, so I'll update the table in this way:
>
> Guest userspace | Guest kernel | Host userspace hypervisor | Host video d=
evice
> -------------------------------------------------------------------------=
---
>   * FFMPEG      | virtio-video | virtio-video device in    | * real drive=
r
>   * GStreamer   |  driver      | * crosvm                  | * vicodec
>   * Codec2 HAL  | virtio-video | * COQOS hypervisor        | * Platform C=
odecs
>                 |              | * QEMU?                   |
>
> > What a virtio-video device does is forwarding guest driver's
> > virtio-video commands to host's video decoder/encoder, and vice versa.
> > If we use vicodec as a backend host video device, this part's task is
> > protocol translation between virtio-video and V4L2 stateful API.
> >
>
> There is some translation anyway, so from my point of view the problem to
> implement this is not that difficult, it just requires some more time. Th=
is
> could be a foundation for some QEMU codec device.

I agree that it's not technically difficult. It's a kind of inversion
of translation that virtio-video driver does.

Best regards,
Keiichi

>
> Best regards,
> Dmitry.
>
> > Though there are two virtio-video device implementation in the world
> > at least (one in crosvm and the other in Dmitry's team's hypervisor),
> > I guess both hypervisor implementations are not easy to use without
> > special devices.
> > So, we might want to have one more virtio-video device implementation
> > in QEMU in the long term.
> > It will be somehow similar to virtio-gpu device that is already
> > implemented in QEMU:
> > https://github.com/qemu/qemu/blob/master/hw/display/virtio-gpu.c
> >
> > Best regards,
> > Keiichi
> >
> > > > Best regards,
> > > > Dmitry.
> > > >
> > > > On Donnerstag, 12. M=C3=A4rz 2020 10:54:35 CET Hans Verkuil wrote:
> > > > > On 3/12/20 10:49 AM, Keiichi Watanabe wrote:
> > > > > > Hi Hans,
> > > > > >
> > > > > > On Wed, Mar 11, 2020 at 10:26 PM Hans Verkuil <hverkuil@xs4all.=
nl>
> wrote:
> > > > > > > Hi Dmitry,
> > > > > > >
> > > > > > > On 2/18/20 9:27 PM, Dmitry Sepp wrote:
> > > > > > > > Hi all,
> > > > > > > >
> > > > > > > > This is a v4l2 virtio video driver for the virtio-video dev=
ice
> > > > > > > > specification v3 [1].
> > > > > > > >
> > > > > > > > The first version of the driver was introduced here [2].
> > > > > > > >
> > > > > > > > Changes v1 -> v2:
> > > > > > > > * support the v3 spec (mostly)
> > > > > > > > * add a module parameter to ask for pages from ZONE_DMA
> > > > > > > >
> > > > > > > > What is not implemented:
> > > > > > > > * Plane layout flags should be used to propagate number of
> > > > > > > > planes to
> > > > > > > >
> > > > > > > >   user-space
> > > > > > > >
> > > > > > > > * There is no real use of stream creation with bitstream fo=
rmat
> > > > > > > > in the
> > > > > > > >
> > > > > > > >   parameter list. The driver just uses the first bitstream
> > > > > > > >   format from
> > > > > > > >   the list.
> > > > > > > >
> > > > > > > > * Setting bitrate is done in a different way compared to th=
e
> > > > > > > > spec. This
> > > > > > > >
> > > > > > > >   is because it has been already agreed on that the way the=
 spec
> > > > > > > >   currently describes it requires changes.
> > > > > > > >
> > > > > > > > Potential improvements:
> > > > > > > > * Do not send stream_create from open. Use corresponding st=
ate
> > > > > > > > machine
> > > > > > > >
> > > > > > > >   condition to do this.
> > > > > > > >
> > > > > > > > * Do not send stream_destroy from close. Do it in reqbufs(0=
).
> > > > > > > > * Cache format and control settings. Reduce calls to the de=
vice.
> > > > > > >
> > > > > > > Some general notes:
> > > > > > >
> > > > > > > Before this can be merged it needs to pass v4l2-compliance.
> > > > > > >
> > > > > > > I also strongly recommend adding support for V4L2_PIX_FMT_FWH=
T to
> > > > > > > allow testing with the vicodec emulation driver. This will al=
so
> > > > > > > allow testing all sorts of corner cases without requiring spe=
cial
> > > > > > > hardware.
> > > > > >
> > > > > > I agree that it's great if we could test virtio-video with vico=
dec,
> > > > > > but I wonder if supporting FWHT is actually needed for the init=
ial
> > > > > > patch.
> > > > > > Though it wouldn't be difficult to support FWHT in the driver, =
we
> > > > > > also
> > > > > > needs to support it in the host's hypervisor to test it. It's n=
ot
> > > > > > easy
> > > > > > for our hypervisor to support FWHT, as it doesn't talk to v4l2
> > > > > > driver
> > > > > > directly.
> > > > > > Without the host-side implementation, it makes no sense to supp=
ort
> > > > > > it.
> > > > > > Also, if we support FWHT, we should have the format in a list o=
f
> > > > > > supported formats in the virtio specification. However, I'm not=
 sure
> > > > > > if FWHT is a general codec enough to be added in the spec, whic=
h
> > > > > > shouldn't be specific to Linux.
> > > > >
> > > > > Good point, I didn't know that.
> > > > >
> > > > > Is it possible to add support for FWHT under a linux debug/test
> > > > > option?
> > > > >
> > > > > It's really the main reason for having this, since you would neve=
r use
> > > > > this in production code. But it is so nice to have for regression
> > > > > testing.
> > > > >
> > > > > Regards,
> > > > >
> > > > >     Hans
> > > > > >
> > > > > > Best regards,
> > > > > > Keiichi
> > > > > >
> > > > > > > Regards,
> > > > > > >
> > > > > > >         Hans
> > > > > > > >
> > > > > > > > Best regards,
> > > > > > > > Dmitry.
> > > > > > > >
> > > > > > > > [1] https://markmail.org/message/dmw3pr4fuajvarth
> > > > > > > > [2] https://markmail.org/message/wnnv6r6myvgb5at6
>
>
