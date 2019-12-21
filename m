Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19D01287BB
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2019 07:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfLUGTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Dec 2019 01:19:39 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41513 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfLUGTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Dec 2019 01:19:39 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so10613260eds.8
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 22:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/X4Ym1U85HJ91rGwxFE/y1GE5D50EQx7s81Fpm3Ahw=;
        b=Nrx2A/Ymq4RG7BHHoBG3BsmoknfJc5W6snQqWkDd4PseWRthT9KcYDA0uO9QW+GvwR
         e2agZUmozQPCiPEbE5F7wBA5p1G+6fJ7/AVI4kCGg69U/lNwzR/ykFWVyyW3twl0MRT7
         BIj6X7M3eOtV38cDswZ1QzbMEYjnGx7tglqJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/X4Ym1U85HJ91rGwxFE/y1GE5D50EQx7s81Fpm3Ahw=;
        b=qkBfukiwWmv23T47o+ZGDHooe5o4PSr2/dAW2vxpFVdodAEjolWFaZm1eB2+baTGl6
         wEbUtzDCpQXZJNsNgM7+zzKzx4o4zb8ElkesaV/P+hKuHZWkmHHT7MAuptXXNZGgDvNq
         MHmy65jW2FFDnRq3ieI6gCyMV3iSwO0f+9KxcetdnQWiWXKPmoNNERpbVOi1iJuQKFc1
         YLAqqvrPtigbsibs+k0PRwiLtiz+IZ3aMdTAcqHvmVezWMBlRDie1GZf2Aq5Gk1zctpC
         teq8pn+KdZgPm8cPGPVKd4jNoLt7OFZ+Yc0sljt+apiXJeScmJPpQ4I+njTlmd2hMKGQ
         WcbA==
X-Gm-Message-State: APjAAAV7qMpov3fQfyCFCzxesQy7AZ7iugZbYvoK1Sv98IhmXmNTmSlX
        LkJehuFOdnnubrg11uOw5c065mdT8a42yA==
X-Google-Smtp-Source: APXvYqyhpTZAyU0+PngvCkvt3e2hpsFos/rRnG/ClIaJRikplx1flIOjHqddyePennYskW7Nvrhxfg==
X-Received: by 2002:a17:906:ae8f:: with SMTP id md15mr20674815ejb.35.1576909176381;
        Fri, 20 Dec 2019 22:19:36 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id e1sm1251800edn.86.2019.12.20.22.19.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 22:19:36 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id c14so11389838wrn.7
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 22:19:35 -0800 (PST)
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr19021438wrs.113.1576909174987;
 Fri, 20 Dec 2019 22:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <2730251.jGmEEvB50I@os-lin-dmo> <CAD90Vcb=38fXTbsWy6dH9FuE0xU-GAVAHWMFFtju0txPg+e1FA@mail.gmail.com>
 <CAAFQd5DbYC1P-nOCUxEtZfy5jGDoUb467nciHC9_A_H_6TwvoA@mail.gmail.com>
In-Reply-To: <CAAFQd5DbYC1P-nOCUxEtZfy5jGDoUb467nciHC9_A_H_6TwvoA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 21 Dec 2019 15:19:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BxpOjAXV2TtF3GZfuZUJb65bECUn3VGtOxBOMz=bmnFg@mail.gmail.com>
Message-ID: <CAAFQd5BxpOjAXV2TtF3GZfuZUJb65bECUn3VGtOxBOMz=bmnFg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] VirtIO video device specification
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Dec 21, 2019 at 3:18 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Sat, Dec 21, 2019 at 1:36 PM Keiichi Watanabe <keiichiw@chromium.org> wrote:
> >
> > Hi Dmitry,
> >
> > On Sat, Dec 21, 2019 at 12:59 AM Dmitry Sepp
> > <dmitry.sepp@opensynergy.com> wrote:
> > >
> > > Hi Keiichi,
> > >
> > > On Mittwoch, 18. Dezember 2019 14:02:13 CET Keiichi Watanabe wrote:
> > > > Hi,
> > > > This is the 2nd version of virtio-video patch. The PDF is available in [1].
> > > > The first version was sent at [2].
> > > >
> > > > Any feedback would be appreciated. Thank you.
> > > >
> > > > Best,
> > > > Keiichi
> > > >
> > > > [1]:
> > > > https://drive.google.com/drive/folders/1eT5fEckBoor2iHZR4f4GLxYzFMVapOFx?us
> > > > p=sharing [2]: https://markmail.org/message/gc6h25acct22niut
> > > >
> > > > Change log:
> > > >
> > > > v2:
> > > > * Removed functionalities except encoding and decoding.
> > > > * Splited encoder and decoder into different devices that use the same
> > > > protocol. * Replaced GET_FUNCS with GET_CAPABILITY.
> > > > * Updated structs for capabilities.
> > > >   - Defined new structs and enums such as image formats, profiles, range
> > > > (min, max, step), etc
> > > >     * For virtio_video_pixel_format, chose a naming convention that is used
> > > >       in DRM. We removed XBGR, NV21 and I422, as they are not used in the
> > > >       current draft implementation. https://lwn.net/Articles/806416/
> > > >   - Removed virtio_video_control, whose usage was not documented yet and
> > > > which is not necessary for the simplest decoding scenario.
> > > >   - Removed virtio_video_desc, as it is no longer needed.
> > > > * Updated struct virtio_video_config for changes around capabilities.
> > > > * Added a way to represent supported combinations of formats.
> > > >   - A field "mask" in virtio_video_format_desc plays this role.
> > > > * Removed VIRTIO_VIDEO_T_STREAM_{START,STOP} because they don't play any
> > > > meaningful roles. * Removed VIRTIO_VIDEO_T_STREAM_{ATTACH, DETACH}_BACKING
> > > > and merged them into RESOURCE_{CREATE, DESTROY}. * Added a way to
> > > > notify/specify resource creation method.
> > > >   - Added a feature flag.
> > > >   - Defined enum virtio_video_mem_type.
> > > >   - Added new fields in video_stream_create.
> > > > * Modified fields in virtio_video_params.
> > > >   - Added crop information.
> > > > * Removed enum virtio_video_channel_type because we can get this information
> > > > by image format.
> > > Could you please explain this? How do you get the information?
> >
> > It means that if image formats are well-defined, channel information
> > (e.g. the order of channels) is uniquely determined.
> >
> > >
> > > Suppose you have some piece of HW on the host side that wants I420 as one
> > > contig buffer w/ some offsets. But on the driver side, say, gralloc gives you
> > > three separate buffers, one per channel. How do we pass those to the device
> > > then?
> >
> > You're talking about CrOS use case where buffers are allocated by
> > virtio-gpu, right?
> > In this case, virtio-gpu allocates one contiguous host-side buffer and
> > the client regards a pair of (buffer FD, offset) as one channel.
> > And, we can register this pair to the device when the buffer is imported.
> > In the virtio-vdec spec draft, this pair corresponds to struct
> > virtio_vdec_plane in struct virtio_vdec_plane.
> >
> > So, I suppose we will need similar structs when we add a control to
> > import buffers. However, I don't think it's necessary when guest pages
> > are used.
>
> I think we need some way for the guest to know whether it can allocate
> the planes in separate buffers, even when guest pages are used. This
> would be equivalent to V4L2 M and non-M formats, but mixing this into
> FourCC in V4L2 is an acknowledged mistake, so we should add a query or
> something.
>
> For future V4L2 development we came up with the idea of a format flag
> which could mean that the hardware allows putting planes in separate
> buffers. We could have a similar per-format flag in the capabilities,
> as we already have a list of all the supported formats there.

Sorry, forgot to paste the link from future V4L2 work notes from this year ELCE:
https://www.spinics.net/lists/linux-media/msg159789.html

>
> Best regards,
> Tomasz
>
> >
> > Best regards,
> > Keiichi
> >
> >
> > >
> > > Best regards,
> > > Dmitry.
> > >
> > > > * Renamed virtio_video_pin to virtio_video_buf_type.
> > > >   - It's similar to V4L2_BUF_TYPE_VIDEO_{OUTPUT, CAPTURE}.
> > > > * Added an error event.
> > > > * Reordered some subsections.
> > > > * Changed styles to make it consistent with other devices.
> > > >
> > > > Dmitry Sepp (1):
> > > >   virtio-video: Add virtio video device specification
> > > >
> > > >  content.tex      |   1 +
> > > >  virtio-video.tex | 579 +++++++++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 580 insertions(+)
> > > >  create mode 100644 virtio-video.tex
> > > >
> > > > --
> > > > 2.24.1.735.g03f4e72817-goog
> > >
> > >
