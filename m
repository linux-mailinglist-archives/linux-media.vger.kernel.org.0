Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6F4B1287BA
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2019 07:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfLUGSu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Dec 2019 01:18:50 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34417 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfLUGSu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Dec 2019 01:18:50 -0500
Received: by mail-ed1-f65.google.com with SMTP id l8so10629267edw.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 22:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AEFIbQSSHz3y4Rl8s/35Oa22lroC9OlD7WOREMEc25A=;
        b=V+bmygyMbnMNcV3ImyalmC9L7TUjVW/Klm0s9b8I4hnz4baW652nxw2f7SURUOht0V
         PrddHZhngdZ3TuibynOpD3S91SZuOHwMy/FkW4+0CRYRc9UF2Z7Sr5n/w9OuZbqOgiRg
         4Gt8QgW39qh6LwMNJtMm+2AjLFo8dKm1PtiT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AEFIbQSSHz3y4Rl8s/35Oa22lroC9OlD7WOREMEc25A=;
        b=UmSRw/FWsqxAUpIGnmCy534hIj+iadkbzFvIf8w4Am2fvRUUg1klUekuCkg/NJ/3nS
         r2okcVTtuiEDREbKp7pOQkce4uTXQlBQSmrFFWsPmqycVtyZ1O62HbO150A3DWUNOyqo
         Wzdbj6pN37y3zUpCY7hSRJptzUqV42aVqdh74A5DJeXdTA6G/QdzDv2sqv5Q84ccpBiU
         dQYOvugmxChjZ9B+YQP8reCBbTaAQqx3WQZwr5W8w9zkfhrAxh5CMc6qoShJePKdndoY
         wWWtMbjuN0rLrzhFgAEmBNjO+2ZCp7QL3ivi+PNvEGu6UxoWMSZrhspwIB76YlioGKUx
         9QTw==
X-Gm-Message-State: APjAAAWptPGNzKbxyzzVzAPX/VYjNv//Hm8Ghc2EGMX6mjdRilAc0yMy
        wXQu5GhpszKwuXZDz/IewQglCp20jjYR9A==
X-Google-Smtp-Source: APXvYqxPU5YLmG2teRzt8ZSOcPTHYQy+kdBPokogR2ZqNKoAn6+7zmwGwwCJ7fo944ExVKXf8UZHJQ==
X-Received: by 2002:a17:906:e083:: with SMTP id gh3mr14153367ejb.231.1576909127794;
        Fri, 20 Dec 2019 22:18:47 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id br7sm1374885ejb.13.2019.12.20.22.18.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 22:18:46 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id u2so11264397wmc.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 22:18:45 -0800 (PST)
X-Received: by 2002:a05:600c:145:: with SMTP id w5mr21703351wmm.157.1576909125349;
 Fri, 20 Dec 2019 22:18:45 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <2730251.jGmEEvB50I@os-lin-dmo> <CAD90Vcb=38fXTbsWy6dH9FuE0xU-GAVAHWMFFtju0txPg+e1FA@mail.gmail.com>
In-Reply-To: <CAD90Vcb=38fXTbsWy6dH9FuE0xU-GAVAHWMFFtju0txPg+e1FA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 21 Dec 2019 15:18:33 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DbYC1P-nOCUxEtZfy5jGDoUb467nciHC9_A_H_6TwvoA@mail.gmail.com>
Message-ID: <CAAFQd5DbYC1P-nOCUxEtZfy5jGDoUb467nciHC9_A_H_6TwvoA@mail.gmail.com>
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

On Sat, Dec 21, 2019 at 1:36 PM Keiichi Watanabe <keiichiw@chromium.org> wrote:
>
> Hi Dmitry,
>
> On Sat, Dec 21, 2019 at 12:59 AM Dmitry Sepp
> <dmitry.sepp@opensynergy.com> wrote:
> >
> > Hi Keiichi,
> >
> > On Mittwoch, 18. Dezember 2019 14:02:13 CET Keiichi Watanabe wrote:
> > > Hi,
> > > This is the 2nd version of virtio-video patch. The PDF is available in [1].
> > > The first version was sent at [2].
> > >
> > > Any feedback would be appreciated. Thank you.
> > >
> > > Best,
> > > Keiichi
> > >
> > > [1]:
> > > https://drive.google.com/drive/folders/1eT5fEckBoor2iHZR4f4GLxYzFMVapOFx?us
> > > p=sharing [2]: https://markmail.org/message/gc6h25acct22niut
> > >
> > > Change log:
> > >
> > > v2:
> > > * Removed functionalities except encoding and decoding.
> > > * Splited encoder and decoder into different devices that use the same
> > > protocol. * Replaced GET_FUNCS with GET_CAPABILITY.
> > > * Updated structs for capabilities.
> > >   - Defined new structs and enums such as image formats, profiles, range
> > > (min, max, step), etc
> > >     * For virtio_video_pixel_format, chose a naming convention that is used
> > >       in DRM. We removed XBGR, NV21 and I422, as they are not used in the
> > >       current draft implementation. https://lwn.net/Articles/806416/
> > >   - Removed virtio_video_control, whose usage was not documented yet and
> > > which is not necessary for the simplest decoding scenario.
> > >   - Removed virtio_video_desc, as it is no longer needed.
> > > * Updated struct virtio_video_config for changes around capabilities.
> > > * Added a way to represent supported combinations of formats.
> > >   - A field "mask" in virtio_video_format_desc plays this role.
> > > * Removed VIRTIO_VIDEO_T_STREAM_{START,STOP} because they don't play any
> > > meaningful roles. * Removed VIRTIO_VIDEO_T_STREAM_{ATTACH, DETACH}_BACKING
> > > and merged them into RESOURCE_{CREATE, DESTROY}. * Added a way to
> > > notify/specify resource creation method.
> > >   - Added a feature flag.
> > >   - Defined enum virtio_video_mem_type.
> > >   - Added new fields in video_stream_create.
> > > * Modified fields in virtio_video_params.
> > >   - Added crop information.
> > > * Removed enum virtio_video_channel_type because we can get this information
> > > by image format.
> > Could you please explain this? How do you get the information?
>
> It means that if image formats are well-defined, channel information
> (e.g. the order of channels) is uniquely determined.
>
> >
> > Suppose you have some piece of HW on the host side that wants I420 as one
> > contig buffer w/ some offsets. But on the driver side, say, gralloc gives you
> > three separate buffers, one per channel. How do we pass those to the device
> > then?
>
> You're talking about CrOS use case where buffers are allocated by
> virtio-gpu, right?
> In this case, virtio-gpu allocates one contiguous host-side buffer and
> the client regards a pair of (buffer FD, offset) as one channel.
> And, we can register this pair to the device when the buffer is imported.
> In the virtio-vdec spec draft, this pair corresponds to struct
> virtio_vdec_plane in struct virtio_vdec_plane.
>
> So, I suppose we will need similar structs when we add a control to
> import buffers. However, I don't think it's necessary when guest pages
> are used.

I think we need some way for the guest to know whether it can allocate
the planes in separate buffers, even when guest pages are used. This
would be equivalent to V4L2 M and non-M formats, but mixing this into
FourCC in V4L2 is an acknowledged mistake, so we should add a query or
something.

For future V4L2 development we came up with the idea of a format flag
which could mean that the hardware allows putting planes in separate
buffers. We could have a similar per-format flag in the capabilities,
as we already have a list of all the supported formats there.

Best regards,
Tomasz

>
> Best regards,
> Keiichi
>
>
> >
> > Best regards,
> > Dmitry.
> >
> > > * Renamed virtio_video_pin to virtio_video_buf_type.
> > >   - It's similar to V4L2_BUF_TYPE_VIDEO_{OUTPUT, CAPTURE}.
> > > * Added an error event.
> > > * Reordered some subsections.
> > > * Changed styles to make it consistent with other devices.
> > >
> > > Dmitry Sepp (1):
> > >   virtio-video: Add virtio video device specification
> > >
> > >  content.tex      |   1 +
> > >  virtio-video.tex | 579 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 580 insertions(+)
> > >  create mode 100644 virtio-video.tex
> > >
> > > --
> > > 2.24.1.735.g03f4e72817-goog
> >
> >
