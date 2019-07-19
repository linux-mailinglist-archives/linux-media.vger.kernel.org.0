Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87DE96D92A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 04:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfGSCpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 22:45:38 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44704 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbfGSCph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 22:45:37 -0400
Received: by mail-ed1-f67.google.com with SMTP id k8so33078474edr.11
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 19:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xjgJsDEiQnrobLcOk9fnLZ06d/z1cXiVNZQKwlcvxAk=;
        b=ZRTebfmazvWidUlNUrfSdpVBcRRYCBGexnk/MbMaGo9cSVNjivpqBCGGjwQDJR6c5y
         yqOjQfUMKJXHuBB0A94iZ8T/RccMLgt4jiGPRkPcFz/J+2TdnIk7FHpQFI9Gz7xxOOMp
         a3aWQ9j+kJAIDbjJV4DE27qqc6zcGPTd8iaTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xjgJsDEiQnrobLcOk9fnLZ06d/z1cXiVNZQKwlcvxAk=;
        b=ZycJPfnvdHTvLMwqz4yyRLiP9hc141UfuV6dFGRFjcPJ70BVdu6NgykXQP/z5RcSGq
         pFvMkhft18Q3zq7dK0EoJVjFBc8WdxX0YzFDT6Bv1BmDNIrSzOfCs8N/wM9d/ajRN/5c
         HcGZ00PFp/euUuEhatmmgLPKnEW6WW7BuPanWj+ucq/sw2cjW8EzpZQLn4AvM6NRu8dt
         t70BljCpowPFQG7CSAyUIfc0uWI0KqRSvS+bFL4R8ZUxeJKvt94eHTGuAcDbnZzYgwBN
         6wxIaoExP4ITC8Z7GUwIpLaKgSiObF+7dcXtcZAV5DMXKHPzy6mBe+4jDfVL0KLuXfvk
         0W4Q==
X-Gm-Message-State: APjAAAXIe7TsljwnelQmyyz5gQJJE345o7ctJ3R8ynzzj9knfS69WPvD
        NssxCk+uMRtTyDdFZjJH2cNQjg1mrR4=
X-Google-Smtp-Source: APXvYqzYp5EpjXdldc4ZRjCaQfG0bedWPrzzQN40q1Rr5+8lVFPHkTj4bXMaX636CfGaryd0pldxug==
X-Received: by 2002:a50:b64a:: with SMTP id c10mr43631113ede.256.1563504335319;
        Thu, 18 Jul 2019 19:45:35 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id x12sm8054219edr.60.2019.07.18.19.45.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 19:45:33 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id p74so27289486wme.4
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 19:45:33 -0700 (PDT)
X-Received: by 2002:a1c:343:: with SMTP id 64mr40547855wmd.116.1563504333185;
 Thu, 18 Jul 2019 19:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190609143820.4662-1-mjourdan@baylibre.com> <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
 <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl>
In-Reply-To: <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 19 Jul 2019 11:45:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BekdTTXjO8tS3aVK3=pg_YZYCQieTxcUWByuMqhWL=dg@mail.gmail.com>
Message-ID: <CAAFQd5BekdTTXjO8tS3aVK3=pg_YZYCQieTxcUWByuMqhWL=dg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Mon, Jul 15, 2019 at 9:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
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

Any particular reason for 2 being the default? I'm especially
wondering about that as most of the drivers actually provide 3.

>
> In case of 1 the SOURCE_CHANGE event is absent and userspace cannot subscribe
> to it. Question: do we want to flag this with the format as well? I.e. with a
> V4L2_FMT_FLAG_MANUAL_RESOLUTION? I think just not implementing the SOURCE_CHANGE
> event (and documenting this) is sufficient.
>
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
