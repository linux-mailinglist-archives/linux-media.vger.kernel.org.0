Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892C4CD9CC
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 02:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfJGADF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Oct 2019 20:03:05 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41218 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfJGADF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Oct 2019 20:03:05 -0400
Received: by mail-qt1-f195.google.com with SMTP id d16so16774996qtq.8
        for <linux-media@vger.kernel.org>; Sun, 06 Oct 2019 17:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=r1Y0im9kPB6jtOuXx2Yvbt5hHOE1IOHIZLkcgU0z3rk=;
        b=ve4kSjuzqGXn/sF9PReoOgjizMo3xTKNp/tCJp/MXta+hkSTbMDDpVyQHDYy6kPn4y
         5rVOQ6nB7bVh+t2JkKcQrUYjCEGWHbcvH2lnjDF242uXebYnque60ehDwmo3UdUGKcgE
         165lP13rF3kjckGYYShixtBIGrk69p63GJAr5/LAsLbw1ApRcQ8JTlavScf8pWyN1VmA
         jHb9RrF3DjoBrCp3ZUjCJSPEaCe4OkyiAWXtUrCYYu5Gcm+DHIk3I7k5V1cewKQYrY5o
         hBYzJOhN4yAfOPc3Y/gdB/XCU00vHI0E1fS7GnSguqfGtDsSf3Ja6rX6qW71pFeu0jTD
         XSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r1Y0im9kPB6jtOuXx2Yvbt5hHOE1IOHIZLkcgU0z3rk=;
        b=lyX4R+AN4EAjvjLYoWcPKD3vhGTsY/GRMUC2FHARDXJBk254hhbGc5tqcsk28AM8ss
         raNLXe1H+CEupktRBWssZUF2yXaCZmqFMUd+OTp7xzqjusAtm/emm+MqZLSYgrf+8+qg
         1QsZXBQSq5Nh2uorSsl3Nc5xv6q/j7MTB6NBG/NgDGHxVVsb8CtdktYf1SQJInnmYbhP
         nwvykWguJ/ARnUUTceOMevsYr/mMoywzKW8Kb2/sipZ6aW5uBi3eMlX7nc3W3Y2VUoAx
         5K9SlfixP/hBQWK1A/Zf/h7a3gg4Jpe9DnNGfkwHsuh+fPM4B/FXcyxqE69m7XcB1QE4
         ctsQ==
X-Gm-Message-State: APjAAAU9Q0DsnQrIEdxqansN2Wqv+SWIR0/ftWtwIXjGwgS5U8d555ZH
        b6HUwikUIpFfEYzKW6lYaTv3zg==
X-Google-Smtp-Source: APXvYqwe/gRJylOEDfXOEUrLv8q0TnbqZjO9jzMoVo5uFF5Jc21NU584buYQUfWd22iisJIwQk84qg==
X-Received: by 2002:ac8:47d6:: with SMTP id d22mr26704373qtr.54.1570406583693;
        Sun, 06 Oct 2019 17:03:03 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id w11sm8529911qtj.10.2019.10.06.17.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 17:03:02 -0700 (PDT)
Message-ID: <a827fa679b141849298e7a22da9e0fa5fa70e981.camel@ndufresne.ca>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
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
Date:   Sun, 06 Oct 2019 20:03:00 -0400
In-Reply-To: <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com>
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
         <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 26 septembre 2019 à 19:21 +0900, Tomasz Figa a écrit :
> On Mon, Sep 23, 2019 at 11:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > Hi all,
> > 
> > Since we have three separate half-day sessions for different topics I decided
> > to split the announcement for this in three emails as well, so these things
> > can be discussed in separate threads.
> > 
> > All sessions are in room Terreaux VIP Lounge - Level 0.
> > There is a maximum of 15 people.
> > 
> > The first session deals with the codec API and is on Tuesday morning from
> > 8:30 (tentative, might change) to 12:00 (we have to vacate the room at that
> > time).
> > 
> > Confirmed attendees for this session:
> > 
> > Boris Brezillon <boris.brezillon@collabora.com>
> > Alexandre Courbot <acourbot@chromium.org>
> > Nicolas Dufresne <nicolas@ndufresne.ca>
> > Tomasz Figa <tfiga@chromium.org>
> > Ezequiel Garcia <ezequiel@collabora.com>
> > Daniel Gomez <daniel@qtec.com>
> > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Eugen Hristev <Eugen.Hristev@microchip.com>
> > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Helen Koike <helen.koike@collabora.com>
> > Michael Tretter <m.tretter@pengutronix.de>
> > Hans Verkuil <hverkuil@xs4all.nl>
> > 
> > Tentative:
> > 
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Jacopo Mondi <jacopo@jmondi.org>
> > 
> > Jacopo, please confirm if you want to attend this session. I didn't find
> > an email with explicit confirmation, so it was probably done via irc. But since
> > this session is getting close to capacity I would prefer to keep attendance to
> > those are actually working with codecs (or will work with it in the near future).
> > 
> > If I missed someone, or you are on the list but won't attend after all, then
> > please let me know.
> > 
> > 
> > 
> > Agenda:
> > 
> > - Status of any pending patches related to codec support.
> > 
> > - Requirements of moving codec drivers out of staging.
> > 
> > - Finalize the stateful encoder API. There are two pieces that need
> >   to be defined:
> > 
> > 1) Setting the frame rate so bitrate control can make sense, since
> >    they need to know this information. This is also relevant for the
> >    stateless codec (and this may have to change on a per-frame basis
> >    for stateless codecs!).
> > 
> >    This can either be implemented via ENUM_FRAMEINTERVALS for the coded
> >    pixelformats and S_PARM support, or we just add a new control for this.
> >    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE). If we
> >    go for a control, then we need to consider the unit. We can use a
> >    fraction as well. See this series that puts in the foundation for that:
> >    https://patchwork.linuxtv.org/cover/58857/
> > 
> >    I am inclined to go with a control, since the semantics don't really
> >    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supported
> >    for legacy drivers. Open question: some drivers (mediatek, hva, coda)
> >    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
> >    S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPTURE
> >    vs OUTPUT thing, it is global to both queues.
> > 
> > 2) Interactions between OUTPUT and CAPTURE formats.
> > 
> >    The main problem is what to do if the capture sizeimage is too small
> >    for the OUTPUT resolution when streaming starts.
> > 
> >    Proposal: width and height of S_FMT(OUTPUT) are used to
> >    calculate a minimum sizeimage (app may request more). This is
> >    driver-specific. (Is it? Or is this codec-specific?)
> > 
> >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> >    for the encoder (i.e. we don't support mid-stream resolution
> >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> >    the patch adding this flag.
> > 
> >    Of course, if we start to support mid-stream resolution
> >    changes (or other changes that require a source change event),
> >    then this flag should be dropped by the encoder driver and
> >    documentation on how to handle the source change event should
> >    be documented in the encoder spec. I prefer to postpone this
> >    until we have an encoder than can actually do mid-stream
> >    resolution changes.
> > 
> >    If sizeimage of the OUTPUT is too small for the CAPTURE
> >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> >    then the second STREAMON (either CAPTURE or OUTPUT) will
> >    return -ENOMEM since there is not enough memory to do the
> >    encode.
> > 
> >    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
> >    be the case for all current encoders), then any bitrate controls
> >    will be limited in range to what the current state (CAPTURE and
> >    OUTPUT formats and frame rate) supports.
> > 
> > - Stateless encoders?
> 
> This could indeed be a good topic. The hantro driver currently only
> supports JPEG encoding, but the hardware also supports H.264 and VP8
> at least. It, however, handles only the core parts of the encoding,
> i.e. generating the actual encoded frames (slices) without headers. It
> also doesn't do any bitrate control or scene change detection on its
> own and expects quality parameters (QP) or keyframe requests to come
> from the software.
> 
> I'm not sure if there is any other hardware with similar constraints
> that could use V4L2, but I believe the Intel video encoder supported
> by VAAPI has a similar design.

I'll try to gather some information next week about that to prepare a
little. As of now, we have the Rockchip mpp library and the ChromeOS
version (which is reusing the previous one code). Then the Intel and
AMD VAAPI drivers (which is implemented in FFMPEG and GStreamer).

Maybe Paul can provide some known information about the CEDRUS (if
any), even though this is probably harder to gather. We can also study
software encoders like OpenH264, x264, libvpx etc. to see if there is a
trend of parameters between the state manager and the low level
encoders.

Overall goal are, I believe (draft):
 - Find out if there is a common set of per frame encoding parameter
 - Find out if bitrate control can be reused for multiple HW
 - Decide if we do in-kernel bitrate control or not
 - Decide if we keep bitstream header crafting external (unlike Hantro
JPEG encoder. but like VAAPI)
 - Decide if we provide (and maintain) a libv4l2 plugin like ChromeOS
folks opted for.

> 
> Best regards,
> Tomasz
> 
> > - Anything else? (I have a feeling I missed a codec-related topic, but
> >   I can't find it in my mailbox)
> > 
> > Regards,
> > 
> >         Hans

