Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E46BEF77
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 12:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfIZKVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 06:21:37 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44552 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfIZKVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 06:21:37 -0400
Received: by mail-ed1-f65.google.com with SMTP id r16so1441635edq.11
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 03:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIiFjyfSNschAfrUuY9hocFAdeGRGLzMovtgVAiTR+4=;
        b=jouUVVuj+Sk9355aRNsE7Uy4NwOXYBt3Cren2RZRm+husMCBjRDFSiqxdXmUt6b/VB
         HZ2zj3JcMgUWNE9yAMHlA0toX4x4//zVAtzFjShWmR7vxK5FhM3d/ao+oHWPni+EXBHV
         2NvvklXzN6RFggl9To+YYzu01QQBbn5+A+PmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIiFjyfSNschAfrUuY9hocFAdeGRGLzMovtgVAiTR+4=;
        b=nvdNvALyDfurCk8bcCxyZGyGJT/jKIWm7T8Kkj2z1ehNqa+itJ2ICwx+TSpyUHkdJz
         xUFoM7e2hXUgXwHvGZoxvnlFD64og/cT5I/5oYLslSzfCcwLG5Mq1F6Cr+tcmYMFjfmO
         oCJnjmjT9NUVQPfk9VJBNvCKHcM82I1bYWHE/71HF/nR36ffAgrjJukna410vAMrQtx3
         UMkTQ4MbFVD6JrgB8x6PubgVymldAbXQKOdeYU1v+KD4SNiyCSgf31K9x0039DFnvlpU
         f2gODgW/EKtewQzHTJcdbH99wUmL3NzTPlcaxhMcygAubFst+v6bL1TeGI8H1n8+g0wC
         KJRw==
X-Gm-Message-State: APjAAAUxm7MVdMo/qs6GBIPGKU/MEYWq6w21xwqRXXc+foqOtdxoBiGd
        ovzyXRudcNkCepET1MRqNBtPXeMANf9SsA==
X-Google-Smtp-Source: APXvYqzuhvmRPBuDOK5hUTUUsUGM0oaxJSem8TctiFFQI5vbHFd/5Ig2j4YGiHLGgf8rmubF1NFBmg==
X-Received: by 2002:a50:e791:: with SMTP id b17mr2611932edn.11.1569493295073;
        Thu, 26 Sep 2019 03:21:35 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id l1sm384262edc.11.2019.09.26.03.21.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2019 03:21:32 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id y21so1991844wmi.0
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 03:21:31 -0700 (PDT)
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr2522213wmc.113.1569493291403;
 Thu, 26 Sep 2019 03:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
In-Reply-To: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 26 Sep 2019 19:21:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com>
Message-ID: <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 23, 2019 at 11:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> Since we have three separate half-day sessions for different topics I decided
> to split the announcement for this in three emails as well, so these things
> can be discussed in separate threads.
>
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
>
> The first session deals with the codec API and is on Tuesday morning from
> 8:30 (tentative, might change) to 12:00 (we have to vacate the room at that
> time).
>
> Confirmed attendees for this session:
>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Helen Koike <helen.koike@collabora.com>
> Michael Tretter <m.tretter@pengutronix.de>
> Hans Verkuil <hverkuil@xs4all.nl>
>
> Tentative:
>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Jacopo Mondi <jacopo@jmondi.org>
>
> Jacopo, please confirm if you want to attend this session. I didn't find
> an email with explicit confirmation, so it was probably done via irc. But since
> this session is getting close to capacity I would prefer to keep attendance to
> those are actually working with codecs (or will work with it in the near future).
>
> If I missed someone, or you are on the list but won't attend after all, then
> please let me know.
>
>
>
> Agenda:
>
> - Status of any pending patches related to codec support.
>
> - Requirements of moving codec drivers out of staging.
>
> - Finalize the stateful encoder API. There are two pieces that need
>   to be defined:
>
> 1) Setting the frame rate so bitrate control can make sense, since
>    they need to know this information. This is also relevant for the
>    stateless codec (and this may have to change on a per-frame basis
>    for stateless codecs!).
>
>    This can either be implemented via ENUM_FRAMEINTERVALS for the coded
>    pixelformats and S_PARM support, or we just add a new control for this.
>    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE). If we
>    go for a control, then we need to consider the unit. We can use a
>    fraction as well. See this series that puts in the foundation for that:
>    https://patchwork.linuxtv.org/cover/58857/
>
>    I am inclined to go with a control, since the semantics don't really
>    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supported
>    for legacy drivers. Open question: some drivers (mediatek, hva, coda)
>    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
>    S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPTURE
>    vs OUTPUT thing, it is global to both queues.
>
> 2) Interactions between OUTPUT and CAPTURE formats.
>
>    The main problem is what to do if the capture sizeimage is too small
>    for the OUTPUT resolution when streaming starts.
>
>    Proposal: width and height of S_FMT(OUTPUT) are used to
>    calculate a minimum sizeimage (app may request more). This is
>    driver-specific. (Is it? Or is this codec-specific?)
>
>    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
>    for the encoder (i.e. we don't support mid-stream resolution
>    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
>    supported. See https://patchwork.linuxtv.org/patch/56478/ for
>    the patch adding this flag.
>
>    Of course, if we start to support mid-stream resolution
>    changes (or other changes that require a source change event),
>    then this flag should be dropped by the encoder driver and
>    documentation on how to handle the source change event should
>    be documented in the encoder spec. I prefer to postpone this
>    until we have an encoder than can actually do mid-stream
>    resolution changes.
>
>    If sizeimage of the OUTPUT is too small for the CAPTURE
>    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
>    then the second STREAMON (either CAPTURE or OUTPUT) will
>    return -ENOMEM since there is not enough memory to do the
>    encode.
>
>    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
>    be the case for all current encoders), then any bitrate controls
>    will be limited in range to what the current state (CAPTURE and
>    OUTPUT formats and frame rate) supports.
>
> - Stateless encoders?

This could indeed be a good topic. The hantro driver currently only
supports JPEG encoding, but the hardware also supports H.264 and VP8
at least. It, however, handles only the core parts of the encoding,
i.e. generating the actual encoded frames (slices) without headers. It
also doesn't do any bitrate control or scene change detection on its
own and expects quality parameters (QP) or keyframe requests to come
from the software.

I'm not sure if there is any other hardware with similar constraints
that could use V4L2, but I believe the Intel video encoder supported
by VAAPI has a similar design.

Best regards,
Tomasz

>
> - Anything else? (I have a feeling I missed a codec-related topic, but
>   I can't find it in my mailbox)
>
> Regards,
>
>         Hans
