Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196F8CC8C9
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 10:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfJEI20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 04:28:26 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45912 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbfJEI20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 04:28:26 -0400
Received: by mail-ed1-f66.google.com with SMTP id h33so8032716edh.12
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NMxQHmRap5+g76j1WsqWd3/fCyxALEYBikJ0LpNBPAo=;
        b=fvHlyJmbFoZ0jS/Kdb5oRmkFtsjA+ddQcG+02NjzUPI0EoTUfpoRgex1AfuKZLvpFv
         z2Kp5JeWzRqyYfx6/+qJPSs8ZZNeJW2JUcnqyHJebrCGXDc8IaZsmrlhzA4rL4RQowbX
         uomNv4Js7A7eueP9m/HdhBn9L7dxiE/0QaoWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NMxQHmRap5+g76j1WsqWd3/fCyxALEYBikJ0LpNBPAo=;
        b=OxTmigC30R+yEUvatGSATdc6n8U15wDvY0wXlEPVt5sf7z8cIS0uEKdSEM+4iayMGb
         GnqLFwv6jBlL/JpjcBuK03OB1p21P0yS82TOWwXF8UrIVRXVbD5BLboYrtrfSJvJzwqO
         yD93OBezciM9WNnemf7U9X7L0X2xjAVCQKB3V2XrSFf5s/3+jBlADMirquoJS1EwLrXO
         /qLhBkwN9GDPn8ujW8z193ZxayTKnDTngKbzLAkvR3T0R5oiw3JXB2eQOavpxwY6zGfC
         mV34LtUrZ85S9mNsZ28ucVYvSFvQVnN6jbu3QTwKQ9R2k7Dz9PpIJa/LMX0Ecuyl4j0m
         uvng==
X-Gm-Message-State: APjAAAVSXgYr9bFdysgpb94O0RfjVVJkq883LEWGnkM4+RgSzm21psgo
        1ZTzr9yBfppwyia2wSPp0HBGmdjqgJ8pnA==
X-Google-Smtp-Source: APXvYqzZQXq1uWRBlbCpkxHCXs/Wha2fDOePODASMeUOfCoTIDy5mjdDgu2VyqXD+MuNInODmg2NXg==
X-Received: by 2002:a05:6402:2cb:: with SMTP id b11mr19713285edx.285.1570264103878;
        Sat, 05 Oct 2019 01:28:23 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id ch11sm904309ejb.48.2019.10.05.01.28.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 01:28:22 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id r3so9717063wrj.6
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2019 01:28:22 -0700 (PDT)
X-Received: by 2002:adf:f684:: with SMTP id v4mr12450818wrp.155.1570264101606;
 Sat, 05 Oct 2019 01:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
 <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com> <e1defecccd596ed7dfc76d4085fce1a2863e784f.camel@ndufresne.ca>
In-Reply-To: <e1defecccd596ed7dfc76d4085fce1a2863e784f.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 5 Oct 2019 17:28:10 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DdwNEXEeX-c0wPzH_NTNU=yTwdpZ0cPCuWsEgxncn6SA@mail.gmail.com>
Message-ID: <CAAFQd5DdwNEXEeX-c0wPzH_NTNU=yTwdpZ0cPCuWsEgxncn6SA@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 12:28 AM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le jeudi 26 septembre 2019 =C3=A0 19:21 +0900, Tomasz Figa a =C3=A9crit :
> > On Mon, Sep 23, 2019 at 11:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrot=
e:
> > > Hi all,
> > >
> > > Since we have three separate half-day sessions for different topics I=
 decided
> > > to split the announcement for this in three emails as well, so these =
things
> > > can be discussed in separate threads.
> > >
> > > All sessions are in room Terreaux VIP Lounge - Level 0.
> > > There is a maximum of 15 people.
> > >
> > > The first session deals with the codec API and is on Tuesday morning =
from
> > > 8:30 (tentative, might change) to 12:00 (we have to vacate the room a=
t that
> > > time).
> > >
> > > Confirmed attendees for this session:
> > >
> > > Boris Brezillon <boris.brezillon@collabora.com>
> > > Alexandre Courbot <acourbot@chromium.org>
> > > Nicolas Dufresne <nicolas@ndufresne.ca>
> > > Tomasz Figa <tfiga@chromium.org>
> > > Ezequiel Garcia <ezequiel@collabora.com>
> > > Daniel Gomez <daniel@qtec.com>
> > > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > Eugen Hristev <Eugen.Hristev@microchip.com>
> > > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > Helen Koike <helen.koike@collabora.com>
> > > Michael Tretter <m.tretter@pengutronix.de>
> > > Hans Verkuil <hverkuil@xs4all.nl>
> > >
> > > Tentative:
> > >
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Jacopo Mondi <jacopo@jmondi.org>
> > >
> > > Jacopo, please confirm if you want to attend this session. I didn't f=
ind
> > > an email with explicit confirmation, so it was probably done via irc.=
 But since
> > > this session is getting close to capacity I would prefer to keep atte=
ndance to
> > > those are actually working with codecs (or will work with it in the n=
ear future).
> > >
> > > If I missed someone, or you are on the list but won't attend after al=
l, then
> > > please let me know.
> > >
> > >
> > >
> > > Agenda:
> > >
> > > - Status of any pending patches related to codec support.
> > >
> > > - Requirements of moving codec drivers out of staging.
> > >
> > > - Finalize the stateful encoder API. There are two pieces that need
> > >   to be defined:
> > >
> > > 1) Setting the frame rate so bitrate control can make sense, since
> > >    they need to know this information. This is also relevant for the
> > >    stateless codec (and this may have to change on a per-frame basis
> > >    for stateless codecs!).
> > >
> > >    This can either be implemented via ENUM_FRAMEINTERVALS for the cod=
ed
> > >    pixelformats and S_PARM support, or we just add a new control for =
this.
> > >    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE). I=
f we
> > >    go for a control, then we need to consider the unit. We can use a
> > >    fraction as well. See this series that puts in the foundation for =
that:
> > >    https://patchwork.linuxtv.org/cover/58857/
> > >
> > >    I am inclined to go with a control, since the semantics don't real=
ly
> > >    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be su=
pported
> > >    for legacy drivers. Open question: some drivers (mediatek, hva, co=
da)
> > >    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) an=
d
> > >    S_PARM(OUTPUT). I am inclined to allow both since this is not a CA=
PTURE
> > >    vs OUTPUT thing, it is global to both queues.
> > >
> > > 2) Interactions between OUTPUT and CAPTURE formats.
> > >
> > >    The main problem is what to do if the capture sizeimage is too sma=
ll
> > >    for the OUTPUT resolution when streaming starts.
> > >
> > >    Proposal: width and height of S_FMT(OUTPUT) are used to
> > >    calculate a minimum sizeimage (app may request more). This is
> > >    driver-specific. (Is it? Or is this codec-specific?)
> > >
> > >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> > >    for the encoder (i.e. we don't support mid-stream resolution
> > >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> > >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> > >    the patch adding this flag.
> > >
> > >    Of course, if we start to support mid-stream resolution
> > >    changes (or other changes that require a source change event),
> > >    then this flag should be dropped by the encoder driver and
> > >    documentation on how to handle the source change event should
> > >    be documented in the encoder spec. I prefer to postpone this
> > >    until we have an encoder than can actually do mid-stream
> > >    resolution changes.
> > >
> > >    If sizeimage of the OUTPUT is too small for the CAPTURE
> > >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> > >    then the second STREAMON (either CAPTURE or OUTPUT) will
> > >    return -ENOMEM since there is not enough memory to do the
> > >    encode.
> > >
> > >    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
> > >    be the case for all current encoders), then any bitrate controls
> > >    will be limited in range to what the current state (CAPTURE and
> > >    OUTPUT formats and frame rate) supports.
> > >
> > > - Stateless encoders?
> >
> > This could indeed be a good topic. The hantro driver currently only
> > supports JPEG encoding, but the hardware also supports H.264 and VP8
> > at least. It, however, handles only the core parts of the encoding,
> > i.e. generating the actual encoded frames (slices) without headers. It
> > also doesn't do any bitrate control or scene change detection on its
> > own and expects quality parameters (QP) or keyframe requests to come
> > from the software.
> >
> > I'm not sure if there is any other hardware with similar constraints
> > that could use V4L2, but I believe the Intel video encoder supported
> > by VAAPI has a similar design.
>
> The bitrate adaption is mostly done inside the VAAPI driver on Intel
> side, software of shaders (could also be in HW for other drivers, not
> sure if it's different with VDBox, which is real HW, also advertised as
> the Iris Low Power CODCE). Users of VAAPI will setup certain parameter
> in a structure called VAEncMiscParameterRateControl, but there is no
> per-frame or per-slice work from what I can see.
>
> Though, the encoded bits are similar, they come pretty raw, no
> sps/pps/sei or anything, and no slice headers at all. This all being
> generated in gstreamer-vaapi, and I suppose it's the same in FFMPEG or
> Chromium ?
>

I don't know about VAAPI, but for the Rockchip encoder, we have a
libv4l2 plugin [1] that generates various low level parameters for the
encoder (like QP for bitrate control), generates sps/pps/sei/slice
headers and formats the bitstream, so it looks like a regular stateful
encoder for Chromium. The API between the encoder driver and the
plugin is like a stateful encoder + a number of private controls.

[1] https://chromium.googlesource.com/chromiumos/third_party/libv4lplugins/=
+/master/libv4l-rockchip_v2

>
> >
> > Best regards,
> > Tomasz
> >
> > > - Anything else? (I have a feeling I missed a codec-related topic, bu=
t
> > >   I can't find it in my mailbox)
> > >
> > > Regards,
> > >
> > >         Hans
