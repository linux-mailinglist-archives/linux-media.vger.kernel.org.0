Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3226CB00
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 10:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfGRIjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 04:39:19 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45442 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfGRIjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 04:39:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so27668182wre.12
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 01:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VI6zbqshE7YIwzb8pijkEdmKe3OXMlQdJNQym4wfXL8=;
        b=OLJAlKAm72glM99/OzAMp3PsszgyODQAemGKTQfQajEpdDactkcyCrwfzwQ0imau7h
         rzCRpFgDVsBXp6WB/k+pvmZbkbv9/I7KJlL/Eb1weOMPGERrVjag83C778EEJYRHtu3W
         t2Qo1E3Tr/93S8/w34o68ET1tp3bmQupG+DBnz4Vp5ZNcRMsj1tZZmqPshAjoMD28J+8
         Tv6xv43zwkJrQE8KqNxmfAjz/DW1lGQEv3G2MqQIuq6ROMLoE2VXcd0Kbbu3Pc4antDx
         1rpchpIa0Km14wlTK7M3Cel1oZjk8XDuHq83l5ksENhjnvJkB4X2JAUIFUXm1H++SQDs
         y5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VI6zbqshE7YIwzb8pijkEdmKe3OXMlQdJNQym4wfXL8=;
        b=O5XIb+ZdLTb7f/j5iP+nvaFnW/AzIxCBLsMkbUBhXOj9OqrCZiwgK6mTumbyTIWUBv
         SDHvzBzQPusaONoLu4eHd6quvSRwTZHEJ7xfqM5ILqmZGmI1Mk0r3No0ZSOrrzHz/iG7
         JqFsIoGrZNh62B8caKkyuyYk6WR0p4UU3rk/15LUoHrDcBqOfBBbsmtRP7VQk83gCi0s
         MPVT7foc0fWcUJuP28U1gUOXhY/kgpatqJ3iTr/93mNC5qOBjyMALcTMDE8J9oexkJaI
         ToIedk03Jg5WBWIMSNBWG9gVrxflVmldydFip99KKyiI89gRfxHPk+A+nJLqzgK33hWN
         xZgg==
X-Gm-Message-State: APjAAAVSz8bQpm7p1qO/xqfTkKDTkft7LzTC/MmhS4SF6cfNtr9KRVeC
        /6x0jK1JWezt4yamThmnl5upaISvuq6IiaYunFCJMg==
X-Google-Smtp-Source: APXvYqwaZAlruB32oDa9JnT2jKDJSom5y1u8eIUjfUY0f6A3bFyFXvWCk6uKAqtBu15JNn4xvG4aVFy1diIhfXVhE4w=
X-Received: by 2002:a5d:528d:: with SMTP id c13mr47488133wrv.247.1563439157199;
 Thu, 18 Jul 2019 01:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190609143820.4662-1-mjourdan@baylibre.com> <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
 <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl>
In-Reply-To: <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Thu, 18 Jul 2019 10:39:06 +0200
Message-ID: <CAMO6nawAyxV=kK5PWOM2658DQqyoPZGYaSGbwfn6ReiDbOW1DQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 15, 2019 at 2:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 6/11/19 10:13 AM, Hans Verkuil wrote:
> > On 6/9/19 4:38 PM, Maxime Jourdan wrote:
> >> Hello,
> >>
> >> This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
> >> to tag coded formats for which the device supports dynamic resolution
> >> switching, via V4L2_EVENT_SOURCE_CHANGE.
> >> This includes the initial "source change" where the device is able to
> >> tell userspace about the coded resolution and the DPB size (which
> >> sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
> >
> > Shouldn't the initial source change still be there? The amlogic decoder
> > is capable of determining the resolution of the stream, right? It just
> > can't handle mid-stream changes.
>
> I've been thinking about this a bit more: there are three different HW capabilities:
>
> 1) The hardware cannot parse the resolution at all and userspace has to tell it
> via S_FMT.
>
> 2) The hardware can parse the initial resolution, but is not able to handle
> mid-stream resolution changes.
>
> 3) The hardware can parse the initial resolution and all following mid-stream
> resolution changes.
>
> We can consider 2 the default situation.
>
> In case of 1 the SOURCE_CHANGE event is absent and userspace cannot subscribe
> to it. Question: do we want to flag this with the format as well? I.e. with a
> V4L2_FMT_FLAG_MANUAL_RESOLUTION? I think just not implementing the SOURCE_CHANGE
> event (and documenting this) is sufficient.
>

I think that not implementing SOURCE_CHANGE is sufficient as well. The
issue (in my case), is that the amlogic decoder _does_ support the
event (case 3) for anything recent (H264, HEVC, VP9), but not for e.g
MPEG 1/2 (case 1).

A possible solution would be to create 2 separate devices, one
implementing the event, the other not. Do you think this is reasonable
? This would discard the need for all the proposed flags, unless there
are other decoder drivers that fall in case 2.

> In case of 3 the format sets the V4L2_FMT_FLAG_DYN_RESOLUTION flag.
>
> What do you think?
>
> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> >> This flag is mainly aimed at stateful decoder drivers.
> >>
> >> This RFC is motivated by my development on the amlogic video decoder
> >> driver, which does not support dynamic resolution switching for older
> >> coded formats (MPEG 1/2, MPEG 4 part II, H263). It does however support
> >> it for the newer formats (H264, HEVC, VP9).
> >>
> >> The specification regarding stateful video decoders should be amended
> >> to include that, in the absence of this flag for a certain format,
> >> userspace is expected to extract the coded resolution and allocate
> >> a sufficient amount of capture buffers on its own.
> >> I understand that this point may be tricky, since older kernels with
> >> close-to-spec drivers would not have this flag available, yet would
> >> fully support dynamic resolution switching.
> >> However, with the spec not merged in yet, I wanted to have your opinion
> >> on this late addition.
> >>
> >> The RFC patches also adds support for this flag for the 4 following
> >> stateful decoder drivers:
> >>  - venus
> >>  - s5p-mfc
> >>  - mtk-vcodec
> >>  - vicodec
> >>
> >> Maxime Jourdan (5):
> >>   media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
> >>   media: venus: vdec: flag OUTPUT formats with
> >>     V4L2_FMT_FLAG_DYN_RESOLUTION
> >>   media: s5p_mfc_dec: flag OUTPUT formats with
> >>     V4L2_FMT_FLAG_DYN_RESOLUTION
> >>   media: mtk-vcodec: flag OUTPUT formats with
> >>     V4L2_FMT_FLAG_DYN_RESOLUTION
> >>   media: vicodec: flag vdec/stateful OUTPUT formats with
> >>     V4L2_FMT_FLAG_DYN_RESOLUTION
> >>
> >>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst   |  7 +++++++
> >>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  4 ++++
> >>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
> >>  drivers/media/platform/qcom/venus/core.h           |  1 +
> >>  drivers/media/platform/qcom/venus/vdec.c           | 11 +++++++++++
> >>  drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
> >>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 13 +++++++++++++
> >>  drivers/media/platform/vicodec/vicodec-core.c      |  2 ++
> >>  include/uapi/linux/videodev2.h                     |  5 +++--
> >>  9 files changed, 43 insertions(+), 2 deletions(-)
> >>
> >
>
