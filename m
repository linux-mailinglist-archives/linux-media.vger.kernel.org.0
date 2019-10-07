Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E510CDE28
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 11:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfJGJWt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 05:22:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34526 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfJGJWt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 05:22:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id j19so12822761lja.1
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 02:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kZ0bmEDbDmS/dHonhL6jGE+xz5Pv3vuVp6kfwm6IIn4=;
        b=jLCP3bycAR9XIHSXQBt9PkCo/BnzpOLUrxLtZpoehwoMuNz82tVeIVwxnhtAjjgHVE
         bO2xhTneVc9qO1ixtTcZQwB9qGshjwAR0ZqUvnCi6Y0kiTSTP4hHxaFV5eMihHI6tgFR
         P1qS4pcgChAjE1Z9kJ884GQRcgzuxlyFMvJUBlnJQTgMp6CY5ADUzxIqKCHIGbL5rbFn
         iyflBhMJ/DVdLDHP6iFhZGgn/LCPxtu3l1Rd0K3iT4lMMBqbdTTL/UkH/nr9tNmzOLFs
         70zfWA9RvMbkn/ywMX3w06LzrxWZibMzWq0phDzSaVyrfvnYcytA16gOQTtvBoZDqUKt
         odBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kZ0bmEDbDmS/dHonhL6jGE+xz5Pv3vuVp6kfwm6IIn4=;
        b=GGgQfTiePl8Z0mknl95hLasftXKnQ67zRWdGOqyzl5mhr+nSfpkwXmnuag/LwYMCxm
         sHXzO+bti9hgWDxOV5b5wpj2gI5+radNbfItJ+cmStB2Va7TCvxzXWJlsBF9m6wt9W5O
         oWtmybaTYnKDrQqwE6LMRIzpXP/uOWGr3s7NnZ39YYpnQ0FREpH3G3ILpRI2etyxbfdY
         E7E+OgvdjZXysY8lUvPEocrAWyLPANUUpedMIQXYaK9tErBif+4b7Zqcq26CDRPg88uc
         aCdKUxlM2PHtEk07al9u5JPIncafFYMO7YpglFJuGAYT+kDCWM65rg8AnbWVdonWqCv0
         +PCQ==
X-Gm-Message-State: APjAAAX0jF+NCsck65LYYBz9+7gJniV7+/wWP3rahtEQn7tjtFbisyNT
        a1gKf22djOlD7eCEFqJFW4gq9B51LulmAhU6ZEO89Bg1
X-Google-Smtp-Source: APXvYqxDeHDgrCJWZmFZVO2ThJXmvvONdQdZpDW/1KNSlPE4I9iqu+5njCgAPHimUEjr3sQAJaqYFx6pVLS9tnm4txY=
X-Received: by 2002:a2e:9241:: with SMTP id v1mr17826390ljg.148.1570440166684;
 Mon, 07 Oct 2019 02:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
 <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com> <a827fa679b141849298e7a22da9e0fa5fa70e981.camel@ndufresne.ca>
In-Reply-To: <a827fa679b141849298e7a22da9e0fa5fa70e981.camel@ndufresne.ca>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Mon, 7 Oct 2019 11:22:30 +0200
Message-ID: <CAPybu_3nuqEa5FcosvQGu48cEpH-H_5OEF6wgucJhFbzTSu4TA@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Tomasz Figa <tfiga@chromium.org>,
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

HI Nicolas

Sorry to hijack the thread. Do you know if anyone at AMD is working on
making a v4l driver for the encoder? Or they want to continue with
their mesa approach?

Converting a mesa-vappi to v4l is something doable by the mortals?
Just changing the API or is a complete rewrite of the code?

Best regards!

On Mon, Oct 7, 2019 at 2:05 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
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
> I'll try to gather some information next week about that to prepare a
> little. As of now, we have the Rockchip mpp library and the ChromeOS
> version (which is reusing the previous one code). Then the Intel and
> AMD VAAPI drivers (which is implemented in FFMPEG and GStreamer).
>
> Maybe Paul can provide some known information about the CEDRUS (if
> any), even though this is probably harder to gather. We can also study
> software encoders like OpenH264, x264, libvpx etc. to see if there is a
> trend of parameters between the state manager and the low level
> encoders.
>
> Overall goal are, I believe (draft):
>  - Find out if there is a common set of per frame encoding parameter
>  - Find out if bitrate control can be reused for multiple HW
>  - Decide if we do in-kernel bitrate control or not
>  - Decide if we keep bitstream header crafting external (unlike Hantro
> JPEG encoder. but like VAAPI)
>  - Decide if we provide (and maintain) a libv4l2 plugin like ChromeOS
> folks opted for.
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
>


--=20
Ricardo Ribalda
