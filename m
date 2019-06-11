Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE923D337
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 19:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405056AbfFKRCR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 13:02:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46459 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404282AbfFKRCR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 13:02:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so13825027wrw.13
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 10:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gZcB9qw8op4Jz0TbUT1p5eRnL6iSCanP1o6PIY+IyI8=;
        b=kA3Ce84eXvHcydWa2/++fDUVnhalqTSbMNBwQpNOdRTJVjZDkY0FEDjHi9cdqntkQd
         e0VD5UsTCC+xa7yMfoQ5cPbwAb6zClsogRSW03YLuKfeODW5cx3kwLyVjGWIPXxhYbLi
         5WAqelggPGKpIngJyvbCxnuTbLDr4KBNvXCiVnMv2kazp/seLtnfB7vnUZxGHknT2q3o
         sPiLb1ay7XsLLAUw8PrOjmYfRrw+XupO9Dk/GzyKNOxrSxoWcdoqxWO7Lxw2LU8+zQFD
         eKj9Q0JVHOtfzc/JHI8zp3L7ZmFi23dvS9cvwfvVObdtSvD3huwwFeIGiCLaJiGSCCXr
         JkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gZcB9qw8op4Jz0TbUT1p5eRnL6iSCanP1o6PIY+IyI8=;
        b=NcdNtOkUT4bMKA8717FAKl1TGwuT6X8Tt0/4P5H8lI2729llmZP2xKg11WdS6GrSLQ
         n2YlGT91cYxwNIRIfdNT70d+T5Bs+gOoMCSBrXu6D2pVJwPZ2Uoo4aDwzRlrcqb71hQ7
         0R0NJmNvNacTJK4WxOlnWJ0ZzAX7/wgcnqxRgj3Gwfmo54hDCgPdAIHH20vy9Lptvxi8
         t/LXWmRMr9xdfVOBQecGUtHkugaL7vjXAIXNNrNyHdvgY1qU1ZCqN6HbbqesewGmnGlq
         8pyx9frTpPm5E/7yrtcrgz5xiAshgV0gqvpBEE72hr+nW5MYOdTT1BG4/6r4h5BCcZZp
         FZAA==
X-Gm-Message-State: APjAAAWYmgu7cOeAgPfUHnEoJVDePDWVMvE9SFsFVDJx4abI85lUHptm
        Asz9/kfK17+0k/bH1HR7j74VncztqHrdWS6d7BR6CQ==
X-Google-Smtp-Source: APXvYqxm7vqqOyPCPtgXksOKWlyMITEkFI6j4zO76I6Qo9vKRjrAQc+n8Oyo+jIpJy4yeImU4w5OrxcmjqFBqFyBLJc=
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr4460173wrq.91.1560272534550;
 Tue, 11 Jun 2019 10:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190609143820.4662-1-mjourdan@baylibre.com> <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
In-Reply-To: <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Tue, 11 Jun 2019 19:02:03 +0200
Message-ID: <CAMO6naxt-t64fzO__b__0gtJ6FzxvcXCqy3ygvi6bvtMPy9kTA@mail.gmail.com>
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

On Tue, Jun 11, 2019 at 10:13 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 6/9/19 4:38 PM, Maxime Jourdan wrote:
> > Hello,
> >
> > This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
> > to tag coded formats for which the device supports dynamic resolution
> > switching, via V4L2_EVENT_SOURCE_CHANGE.
> > This includes the initial "source change" where the device is able to
> > tell userspace about the coded resolution and the DPB size (which
> > sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
>
> Shouldn't the initial source change still be there? The amlogic decoder
> is capable of determining the resolution of the stream, right? It just
> can't handle mid-stream changes.
>

Well, no, not for older compressed formats like MPEG2. Sorry that this
wasn't clear all along. If it did, then the meson vdec wouldn't fail
current v4l2 compliance on the dqevent(V4L2_EVENT_SOURCE_CHANGE).
Userspace is expected to S_FMT the coded resolution before starting up
the capture. If the bitstream has a different resolution than the
format set, then you end up with cropped images. There's no risk for
dma overflow since those are configured to write at most up to buffer
capacity.

To be more precise: the firmware does report back the coded
resolution, but by that time it's too late as it has already begun
consuming the bitstream and decoding to buffers regardless.

For newer compressed formats (H264, HEVC, VP9), the firmware will
pause and notify a source change only, but with the older formats it's
more like "Hey, I decoded frames, by the way here is the coded
resolution".

Regards,
Maxime

> Regards,
>
>         Hans
>
> > This flag is mainly aimed at stateful decoder drivers.
> >
> > This RFC is motivated by my development on the amlogic video decoder
> > driver, which does not support dynamic resolution switching for older
> > coded formats (MPEG 1/2, MPEG 4 part II, H263). It does however support
> > it for the newer formats (H264, HEVC, VP9).
> >
> > The specification regarding stateful video decoders should be amended
> > to include that, in the absence of this flag for a certain format,
> > userspace is expected to extract the coded resolution and allocate
> > a sufficient amount of capture buffers on its own.
> > I understand that this point may be tricky, since older kernels with
> > close-to-spec drivers would not have this flag available, yet would
> > fully support dynamic resolution switching.
> > However, with the spec not merged in yet, I wanted to have your opinion
> > on this late addition.
> >
> > The RFC patches also adds support for this flag for the 4 following
> > stateful decoder drivers:
> >  - venus
> >  - s5p-mfc
> >  - mtk-vcodec
> >  - vicodec
> >
> > Maxime Jourdan (5):
> >   media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
> >   media: venus: vdec: flag OUTPUT formats with
> >     V4L2_FMT_FLAG_DYN_RESOLUTION
> >   media: s5p_mfc_dec: flag OUTPUT formats with
> >     V4L2_FMT_FLAG_DYN_RESOLUTION
> >   media: mtk-vcodec: flag OUTPUT formats with
> >     V4L2_FMT_FLAG_DYN_RESOLUTION
> >   media: vicodec: flag vdec/stateful OUTPUT formats with
> >     V4L2_FMT_FLAG_DYN_RESOLUTION
> >
> >  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst   |  7 +++++++
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  4 ++++
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
> >  drivers/media/platform/qcom/venus/core.h           |  1 +
> >  drivers/media/platform/qcom/venus/vdec.c           | 11 +++++++++++
> >  drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
> >  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 13 +++++++++++++
> >  drivers/media/platform/vicodec/vicodec-core.c      |  2 ++
> >  include/uapi/linux/videodev2.h                     |  5 +++--
> >  9 files changed, 43 insertions(+), 2 deletions(-)
> >
>
