Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CADBCE0C2
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfJGLou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:44:50 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40620 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGLot (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 07:44:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id 7so13270569ljw.7
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 04:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dVZTfrXHwMxcZGj9RBZmvbtTUk8sAivdubZR8zb7sIE=;
        b=orbosEKeq21ep57DtytTECJGDA9g35SWAxwzE5z7F3KTzPjQOx4bJ+EsEtLlWW8qXJ
         aNUJSdxJuvjHiMT470/HupvCLi5mX2BjfizaRyxTOPAT/oF2lTU+uhxWdLhQRJ9l+5TI
         UAuch5aPJKX8Ii2HeSRWM66n5uGsoZlJyfppOg2XQNN+jUrsLpx5IR6vO42wuQW1Ms4O
         yw7Ayy7FZilIHH/E2rRSj0aqirfYl+E2B1SiS4XUvjtoHW5KnCAnuJXwf2p1Un4QB8iE
         LT7wUcxQRkFJ+2wEs/+7OpMz7x6qYdHdufX4OBEfmhmzUdDFzOZjI1VOUJidsIs7a8by
         46QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dVZTfrXHwMxcZGj9RBZmvbtTUk8sAivdubZR8zb7sIE=;
        b=W9mF7fjdBoAPXQdnL2pQ2QdGtGSEG6IOwWGoB9ekWV0MxabqfPJ+HhM+Qc6enIiDC9
         w7P6rlZ4r+IN10QfYd39y1AUN9OBcqXmOhwC3vzVBOIxpk8qcu4ZkPEpCUt8l+eMUdPn
         cpdN647JHGYJhr2AogRlzMolSrtIryTuZ49ihppocv8iIrDdojVLq5h1hDfDJdsnh95e
         +kkXkHvHd4rJuAw5L1RCiFkwgso7gfvSVuCarFtv4fBRVYIZ6ft0+MGsaM22QcWn5D0/
         diNQKGolk6+AJsHQxqSndvb2ZtAM9yiTJbnYfgman1UwNnH1UMAF5LslfgL/ZwxwyqHT
         W+ng==
X-Gm-Message-State: APjAAAVISzbZnhubMKShNE/02FqSuaHJa/PaGEg3/GNZT2x+TbkrBg46
        C8INq4/xTuS+qiytDIJjjwdeeQ/XoxrCn0rUX7k=
X-Google-Smtp-Source: APXvYqwG450wvWDTncEGghzD9oT+RYPI6ezzV/FPQ780mLfRZv/qarVtwmo4ZwQOkJM1XXhnxzbmo91Lv3z4c57V0a0=
X-Received: by 2002:a2e:9185:: with SMTP id f5mr16458871ljg.235.1570448686610;
 Mon, 07 Oct 2019 04:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
 <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com>
 <a827fa679b141849298e7a22da9e0fa5fa70e981.camel@ndufresne.ca>
 <CAPybu_3nuqEa5FcosvQGu48cEpH-H_5OEF6wgucJhFbzTSu4TA@mail.gmail.com> <CAAFQd5D5xWtiPXSFSknuOhvDt27q=x1R=dt7J5WBReATry=-xg@mail.gmail.com>
In-Reply-To: <CAAFQd5D5xWtiPXSFSknuOhvDt27q=x1R=dt7J5WBReATry=-xg@mail.gmail.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Mon, 7 Oct 2019 13:44:30 +0200
Message-ID: <CAPybu_0eS6t8ELdmnfAwJXvp6Mq6wCjo-R8ONrUkLvaa5tiL9w@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
To:     Tomasz Figa <tfiga@chromium.org>
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

HI Tomasz

On Mon, Oct 7, 2019 at 11:43 AM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Ricardo,
>
> On Mon, Oct 7, 2019 at 6:22 PM Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
> >
> > HI Nicolas
> >
> > Sorry to hijack the thread. Do you know if anyone at AMD is working on
> > making a v4l driver for the encoder? Or they want to continue with
> > their mesa approach?
> >
> > Converting a mesa-vappi to v4l is something doable by the mortals?
> > Just changing the API or is a complete rewrite of the code?
>
> Do you know what kind of hardware that is?

AMD VCE

https://en.wikipedia.org/wiki/Video_Coding_Engine


>
> Is it a fully integrated smart encoder that manages everything
> internally or a "simplified" one like Rockchip or Intel, which need a
> lot of assistance from the software, like bitrate control and
> bitstream assembly?

For what I can read from the documentation it looks more like the
intel, with plenty of knobs to play around, and support for  custom
motion estimation and all the other fancy stuff.

>
> Also, is the encoder an integral part of the GPU or a distinct block
> that can operate independently of the GPU driver? While it should be
> possible to chain a V4L2 driver of the AMDGPU DRM driver, the VAAPI
> model is kind of established for encoders that are closely tied with
> the GPU.


My concern about vaapi is the complexity of the stack, to "simply"
encode a video you need mesa and llvm. It would be nicer with a v4l2
m2m driver and gstreamer.... But i can see that it can get complicated
if the vce shares resources with the other parts of the gpu.


Thanks!


>
> Best regards,
> Tomasz
>
> >
> > Best regards!
> >
> > On Mon, Oct 7, 2019 at 2:05 AM Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
> > >
> > > Le jeudi 26 septembre 2019 =C3=A0 19:21 +0900, Tomasz Figa a =C3=A9cr=
it :
> > > > On Mon, Sep 23, 2019 at 11:13 PM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
> > > > > Hi all,
> > > > >
> > > > > Since we have three separate half-day sessions for different topi=
cs I decided
> > > > > to split the announcement for this in three emails as well, so th=
ese things
> > > > > can be discussed in separate threads.
> > > > >
> > > > > All sessions are in room Terreaux VIP Lounge - Level 0.
> > > > > There is a maximum of 15 people.
> > > > >
> > > > > The first session deals with the codec API and is on Tuesday morn=
ing from
> > > > > 8:30 (tentative, might change) to 12:00 (we have to vacate the ro=
om at that
> > > > > time).
> > > > >
> > > > > Confirmed attendees for this session:
> > > > >
> > > > > Boris Brezillon <boris.brezillon@collabora.com>
> > > > > Alexandre Courbot <acourbot@chromium.org>
> > > > > Nicolas Dufresne <nicolas@ndufresne.ca>
> > > > > Tomasz Figa <tfiga@chromium.org>
> > > > > Ezequiel Garcia <ezequiel@collabora.com>
> > > > > Daniel Gomez <daniel@qtec.com>
> > > > > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > > Eugen Hristev <Eugen.Hristev@microchip.com>
> > > > > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > Helen Koike <helen.koike@collabora.com>
> > > > > Michael Tretter <m.tretter@pengutronix.de>
> > > > > Hans Verkuil <hverkuil@xs4all.nl>
> > > > >
> > > > > Tentative:
> > > > >
> > > > > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Jacopo Mondi <jacopo@jmondi.org>
> > > > >
> > > > > Jacopo, please confirm if you want to attend this session. I didn=
't find
> > > > > an email with explicit confirmation, so it was probably done via =
irc. But since
> > > > > this session is getting close to capacity I would prefer to keep =
attendance to
> > > > > those are actually working with codecs (or will work with it in t=
he near future).
> > > > >
> > > > > If I missed someone, or you are on the list but won't attend afte=
r all, then
> > > > > please let me know.
> > > > >
> > > > >
> > > > >
> > > > > Agenda:
> > > > >
> > > > > - Status of any pending patches related to codec support.
> > > > >
> > > > > - Requirements of moving codec drivers out of staging.
> > > > >
> > > > > - Finalize the stateful encoder API. There are two pieces that ne=
ed
> > > > >   to be defined:
> > > > >
> > > > > 1) Setting the frame rate so bitrate control can make sense, sinc=
e
> > > > >    they need to know this information. This is also relevant for =
the
> > > > >    stateless codec (and this may have to change on a per-frame ba=
sis
> > > > >    for stateless codecs!).
> > > > >
> > > > >    This can either be implemented via ENUM_FRAMEINTERVALS for the=
 coded
> > > > >    pixelformats and S_PARM support, or we just add a new control =
for this.
> > > > >    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE=
). If we
> > > > >    go for a control, then we need to consider the unit. We can us=
e a
> > > > >    fraction as well. See this series that puts in the foundation =
for that:
> > > > >    https://patchwork.linuxtv.org/cover/58857/
> > > > >
> > > > >    I am inclined to go with a control, since the semantics don't =
really
> > > > >    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to b=
e supported
> > > > >    for legacy drivers. Open question: some drivers (mediatek, hva=
, coda)
> > > > >    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE=
) and
> > > > >    S_PARM(OUTPUT). I am inclined to allow both since this is not =
a CAPTURE
> > > > >    vs OUTPUT thing, it is global to both queues.
> > > > >
> > > > > 2) Interactions between OUTPUT and CAPTURE formats.
> > > > >
> > > > >    The main problem is what to do if the capture sizeimage is too=
 small
> > > > >    for the OUTPUT resolution when streaming starts.
> > > > >
> > > > >    Proposal: width and height of S_FMT(OUTPUT) are used to
> > > > >    calculate a minimum sizeimage (app may request more). This is
> > > > >    driver-specific. (Is it? Or is this codec-specific?)
> > > > >
> > > > >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> > > > >    for the encoder (i.e. we don't support mid-stream resolution
> > > > >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> > > > >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> > > > >    the patch adding this flag.
> > > > >
> > > > >    Of course, if we start to support mid-stream resolution
> > > > >    changes (or other changes that require a source change event),
> > > > >    then this flag should be dropped by the encoder driver and
> > > > >    documentation on how to handle the source change event should
> > > > >    be documented in the encoder spec. I prefer to postpone this
> > > > >    until we have an encoder than can actually do mid-stream
> > > > >    resolution changes.
> > > > >
> > > > >    If sizeimage of the OUTPUT is too small for the CAPTURE
> > > > >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> > > > >    then the second STREAMON (either CAPTURE or OUTPUT) will
> > > > >    return -ENOMEM since there is not enough memory to do the
> > > > >    encode.
> > > > >
> > > > >    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
> > > > >    be the case for all current encoders), then any bitrate contro=
ls
> > > > >    will be limited in range to what the current state (CAPTURE an=
d
> > > > >    OUTPUT formats and frame rate) supports.
> > > > >
> > > > > - Stateless encoders?
> > > >
> > > > This could indeed be a good topic. The hantro driver currently only
> > > > supports JPEG encoding, but the hardware also supports H.264 and VP=
8
> > > > at least. It, however, handles only the core parts of the encoding,
> > > > i.e. generating the actual encoded frames (slices) without headers.=
 It
> > > > also doesn't do any bitrate control or scene change detection on it=
s
> > > > own and expects quality parameters (QP) or keyframe requests to com=
e
> > > > from the software.
> > > >
> > > > I'm not sure if there is any other hardware with similar constraint=
s
> > > > that could use V4L2, but I believe the Intel video encoder supporte=
d
> > > > by VAAPI has a similar design.
> > >
> > > I'll try to gather some information next week about that to prepare a
> > > little. As of now, we have the Rockchip mpp library and the ChromeOS
> > > version (which is reusing the previous one code). Then the Intel and
> > > AMD VAAPI drivers (which is implemented in FFMPEG and GStreamer).
> > >
> > > Maybe Paul can provide some known information about the CEDRUS (if
> > > any), even though this is probably harder to gather. We can also stud=
y
> > > software encoders like OpenH264, x264, libvpx etc. to see if there is=
 a
> > > trend of parameters between the state manager and the low level
> > > encoders.
> > >
> > > Overall goal are, I believe (draft):
> > >  - Find out if there is a common set of per frame encoding parameter
> > >  - Find out if bitrate control can be reused for multiple HW
> > >  - Decide if we do in-kernel bitrate control or not
> > >  - Decide if we keep bitstream header crafting external (unlike Hantr=
o
> > > JPEG encoder. but like VAAPI)
> > >  - Decide if we provide (and maintain) a libv4l2 plugin like ChromeOS
> > > folks opted for.
> > >
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > > > > - Anything else? (I have a feeling I missed a codec-related topic=
, but
> > > > >   I can't find it in my mailbox)
> > > > >
> > > > > Regards,
> > > > >
> > > > >         Hans
> > >
> >
> >
> > --
> > Ricardo Ribalda



--
Ricardo Ribalda
