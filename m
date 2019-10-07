Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE720CDE66
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 11:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfJGJoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 05:44:01 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41152 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfJGJoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 05:44:01 -0400
Received: by mail-ed1-f68.google.com with SMTP id f20so11747048edv.8
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 02:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gf6gyB8Z6MfHtfqBuxtFMXf6xMOUnQoo4DJYvIVY9VU=;
        b=lu4fr6QVbe0mvRgQ8in845FtjdL1FbmGFXpl2IfF3idwYaUysXcLdzccq2mmMLp6/+
         MsTn22d+XuHG24T5PR//DmwLgAdFYU5US87UcTdA7cAsBjZYpXgHb6SUEMj21Cib7H5F
         j03RGfr07PdoaukrQ2+BA60jiKX1loV2frNLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gf6gyB8Z6MfHtfqBuxtFMXf6xMOUnQoo4DJYvIVY9VU=;
        b=LRIBhnVHBazzBH17+GT9gDepNyT7Td2tcFQSbH+/AlZST3zkmAffaaEu98JdAP553R
         7ON+vm8CyxlLoKm1VJZmm9tJcTDdxizeEUi9Y6N5y8EuYTuFHmWw00/XWDw953ABMHCe
         E4MU7U5Hyha6Sq5DIgZpvH63AWK/Sz09fWXOR/5W51Q2lvoYlHDJasmpFR60w7KMRp7h
         6BznxXGxasH6y6U6ZsXW3aeTk5iIoX9C17B3efZ8ck+rfWSfKCSmmRpWk7ePKh87IUyK
         AGd2nLLMN1lI6lgZWvcRxUU5WozBRmtzqh4RfQf00UGxvy6xBR8345ZXDopegb6T0RSY
         rE3A==
X-Gm-Message-State: APjAAAXYQA/XKT2yh9dwWYp4lG4KqGWB4LL/NMJH1rryQSbN7j6VGu7L
        vVBPakjoFrKpEsG5KaxKwfS6MT83FGKunQ==
X-Google-Smtp-Source: APXvYqwcBCEE6usR/BH7y3Sj8D1L8N9gNCxVDm9ES/C+kRIctGN/AVTnSxqy7swardKfUZVDZAnv7A==
X-Received: by 2002:a17:906:8043:: with SMTP id x3mr22833164ejw.221.1570441436368;
        Mon, 07 Oct 2019 02:43:56 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id a26sm3275768edm.45.2019.10.07.02.43.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 02:43:53 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id p14so13485326wro.4
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 02:43:53 -0700 (PDT)
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr23148742wrt.100.1570441432795;
 Mon, 07 Oct 2019 02:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
 <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com>
 <a827fa679b141849298e7a22da9e0fa5fa70e981.camel@ndufresne.ca> <CAPybu_3nuqEa5FcosvQGu48cEpH-H_5OEF6wgucJhFbzTSu4TA@mail.gmail.com>
In-Reply-To: <CAPybu_3nuqEa5FcosvQGu48cEpH-H_5OEF6wgucJhFbzTSu4TA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 7 Oct 2019 18:43:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D5xWtiPXSFSknuOhvDt27q=x1R=dt7J5WBReATry=-xg@mail.gmail.com>
Message-ID: <CAAFQd5D5xWtiPXSFSknuOhvDt27q=x1R=dt7J5WBReATry=-xg@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
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

Hi Ricardo,

On Mon, Oct 7, 2019 at 6:22 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> HI Nicolas
>
> Sorry to hijack the thread. Do you know if anyone at AMD is working on
> making a v4l driver for the encoder? Or they want to continue with
> their mesa approach?
>
> Converting a mesa-vappi to v4l is something doable by the mortals?
> Just changing the API or is a complete rewrite of the code?

Do you know what kind of hardware that is?

Is it a fully integrated smart encoder that manages everything
internally or a "simplified" one like Rockchip or Intel, which need a
lot of assistance from the software, like bitrate control and
bitstream assembly?

Also, is the encoder an integral part of the GPU or a distinct block
that can operate independently of the GPU driver? While it should be
possible to chain a V4L2 driver of the AMDGPU DRM driver, the VAAPI
model is kind of established for encoders that are closely tied with
the GPU.

Best regards,
Tomasz

>
> Best regards!
>
> On Mon, Oct 7, 2019 at 2:05 AM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
> >
> > Le jeudi 26 septembre 2019 =C3=A0 19:21 +0900, Tomasz Figa a =C3=A9crit=
 :
> > > On Mon, Sep 23, 2019 at 11:13 PM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
> > > > Hi all,
> > > >
> > > > Since we have three separate half-day sessions for different topics=
 I decided
> > > > to split the announcement for this in three emails as well, so thes=
e things
> > > > can be discussed in separate threads.
> > > >
> > > > All sessions are in room Terreaux VIP Lounge - Level 0.
> > > > There is a maximum of 15 people.
> > > >
> > > > The first session deals with the codec API and is on Tuesday mornin=
g from
> > > > 8:30 (tentative, might change) to 12:00 (we have to vacate the room=
 at that
> > > > time).
> > > >
> > > > Confirmed attendees for this session:
> > > >
> > > > Boris Brezillon <boris.brezillon@collabora.com>
> > > > Alexandre Courbot <acourbot@chromium.org>
> > > > Nicolas Dufresne <nicolas@ndufresne.ca>
> > > > Tomasz Figa <tfiga@chromium.org>
> > > > Ezequiel Garcia <ezequiel@collabora.com>
> > > > Daniel Gomez <daniel@qtec.com>
> > > > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > Eugen Hristev <Eugen.Hristev@microchip.com>
> > > > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > Helen Koike <helen.koike@collabora.com>
> > > > Michael Tretter <m.tretter@pengutronix.de>
> > > > Hans Verkuil <hverkuil@xs4all.nl>
> > > >
> > > > Tentative:
> > > >
> > > > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Jacopo Mondi <jacopo@jmondi.org>
> > > >
> > > > Jacopo, please confirm if you want to attend this session. I didn't=
 find
> > > > an email with explicit confirmation, so it was probably done via ir=
c. But since
> > > > this session is getting close to capacity I would prefer to keep at=
tendance to
> > > > those are actually working with codecs (or will work with it in the=
 near future).
> > > >
> > > > If I missed someone, or you are on the list but won't attend after =
all, then
> > > > please let me know.
> > > >
> > > >
> > > >
> > > > Agenda:
> > > >
> > > > - Status of any pending patches related to codec support.
> > > >
> > > > - Requirements of moving codec drivers out of staging.
> > > >
> > > > - Finalize the stateful encoder API. There are two pieces that need
> > > >   to be defined:
> > > >
> > > > 1) Setting the frame rate so bitrate control can make sense, since
> > > >    they need to know this information. This is also relevant for th=
e
> > > >    stateless codec (and this may have to change on a per-frame basi=
s
> > > >    for stateless codecs!).
> > > >
> > > >    This can either be implemented via ENUM_FRAMEINTERVALS for the c=
oded
> > > >    pixelformats and S_PARM support, or we just add a new control fo=
r this.
> > > >    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE).=
 If we
> > > >    go for a control, then we need to consider the unit. We can use =
a
> > > >    fraction as well. See this series that puts in the foundation fo=
r that:
> > > >    https://patchwork.linuxtv.org/cover/58857/
> > > >
> > > >    I am inclined to go with a control, since the semantics don't re=
ally
> > > >    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be =
supported
> > > >    for legacy drivers. Open question: some drivers (mediatek, hva, =
coda)
> > > >    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) =
and
> > > >    S_PARM(OUTPUT). I am inclined to allow both since this is not a =
CAPTURE
> > > >    vs OUTPUT thing, it is global to both queues.
> > > >
> > > > 2) Interactions between OUTPUT and CAPTURE formats.
> > > >
> > > >    The main problem is what to do if the capture sizeimage is too s=
mall
> > > >    for the OUTPUT resolution when streaming starts.
> > > >
> > > >    Proposal: width and height of S_FMT(OUTPUT) are used to
> > > >    calculate a minimum sizeimage (app may request more). This is
> > > >    driver-specific. (Is it? Or is this codec-specific?)
> > > >
> > > >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> > > >    for the encoder (i.e. we don't support mid-stream resolution
> > > >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> > > >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> > > >    the patch adding this flag.
> > > >
> > > >    Of course, if we start to support mid-stream resolution
> > > >    changes (or other changes that require a source change event),
> > > >    then this flag should be dropped by the encoder driver and
> > > >    documentation on how to handle the source change event should
> > > >    be documented in the encoder spec. I prefer to postpone this
> > > >    until we have an encoder than can actually do mid-stream
> > > >    resolution changes.
> > > >
> > > >    If sizeimage of the OUTPUT is too small for the CAPTURE
> > > >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> > > >    then the second STREAMON (either CAPTURE or OUTPUT) will
> > > >    return -ENOMEM since there is not enough memory to do the
> > > >    encode.
> > > >
> > > >    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
> > > >    be the case for all current encoders), then any bitrate controls
> > > >    will be limited in range to what the current state (CAPTURE and
> > > >    OUTPUT formats and frame rate) supports.
> > > >
> > > > - Stateless encoders?
> > >
> > > This could indeed be a good topic. The hantro driver currently only
> > > supports JPEG encoding, but the hardware also supports H.264 and VP8
> > > at least. It, however, handles only the core parts of the encoding,
> > > i.e. generating the actual encoded frames (slices) without headers. I=
t
> > > also doesn't do any bitrate control or scene change detection on its
> > > own and expects quality parameters (QP) or keyframe requests to come
> > > from the software.
> > >
> > > I'm not sure if there is any other hardware with similar constraints
> > > that could use V4L2, but I believe the Intel video encoder supported
> > > by VAAPI has a similar design.
> >
> > I'll try to gather some information next week about that to prepare a
> > little. As of now, we have the Rockchip mpp library and the ChromeOS
> > version (which is reusing the previous one code). Then the Intel and
> > AMD VAAPI drivers (which is implemented in FFMPEG and GStreamer).
> >
> > Maybe Paul can provide some known information about the CEDRUS (if
> > any), even though this is probably harder to gather. We can also study
> > software encoders like OpenH264, x264, libvpx etc. to see if there is a
> > trend of parameters between the state manager and the low level
> > encoders.
> >
> > Overall goal are, I believe (draft):
> >  - Find out if there is a common set of per frame encoding parameter
> >  - Find out if bitrate control can be reused for multiple HW
> >  - Decide if we do in-kernel bitrate control or not
> >  - Decide if we keep bitstream header crafting external (unlike Hantro
> > JPEG encoder. but like VAAPI)
> >  - Decide if we provide (and maintain) a libv4l2 plugin like ChromeOS
> > folks opted for.
> >
> > >
> > > Best regards,
> > > Tomasz
> > >
> > > > - Anything else? (I have a feeling I missed a codec-related topic, =
but
> > > >   I can't find it in my mailbox)
> > > >
> > > > Regards,
> > > >
> > > >         Hans
> >
>
>
> --
> Ricardo Ribalda
