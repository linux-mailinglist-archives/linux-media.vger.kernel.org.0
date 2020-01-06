Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 905E5131094
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 11:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgAFKah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 05:30:37 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39496 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAFKag (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 05:30:36 -0500
Received: by mail-lj1-f193.google.com with SMTP id l2so50407915lja.6
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 02:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xRwHkpnYCU80CqiFriSq26/Ueft4nTQ1j9puNzPJVzc=;
        b=iy3acYcXY84jtCWQ6YvJtd8ju46EL9DaFUwbhkqPEHuujsbB7k9MHqjzfKoi4T53A8
         ZZiDDDrbwo5HUj+cmTQhawaZmfZzneIyimcMbQ4jrOSNpcc6FLiOskevof/BmaNtd5Tp
         a6T3s/sXM0iwgIBIElx6vfRGgbKFMPxs/BUu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xRwHkpnYCU80CqiFriSq26/Ueft4nTQ1j9puNzPJVzc=;
        b=iHIARM+TCBjokwAWMpYLTzngtUkun/Fww7Jm+YdJGQwm3fKu2invlUZCI70pLLhCKG
         63c+/+HlJlUd8usu4/ezQmos5PgZ6RRhiM2vk1ZplZ5CNjE8KJgFYO5kjakyMafmD25F
         A9o46RVoC0LFEYPwCzvQBNMHfgLfFB4UKhKi5KvR899l2GLjkQR9udZdAd8aEVVwsO8u
         GQwoGaHPkF8N/xFCasfu+r2cOuFkdRUJehBzQELpoLr8Ah8RrHX5B+/m59FZcpdXUNzX
         fZm9i6oqlGco9rHxRoyGm4YUY/7JV44pl7pXV3N0zjOpL2cJzAevp094ERBnH3R+g8oB
         Jpvw==
X-Gm-Message-State: APjAAAXSUnS7VEb5enP0kYac1HwMvQBo/kIERNa+0c7uYtLhapny4k4E
        Jh1vRf+wXxu08gThSvYby9HIpt01eAkjYF0poA83bQ==
X-Google-Smtp-Source: APXvYqym4TugE7eYBCSm5iKyuwnULB5X20dwN7X0c9gpX6iyBuwSVp8/2FKQmr7WrPdc1N7hZW9TPPycokTodv56BEc=
X-Received: by 2002:a2e:9cd8:: with SMTP id g24mr59248816ljj.243.1578306633543;
 Mon, 06 Jan 2020 02:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <CAAFQd5DbYC1P-nOCUxEtZfy5jGDoUb467nciHC9_A_H_6TwvoA@mail.gmail.com>
 <CAAFQd5BxpOjAXV2TtF3GZfuZUJb65bECUn3VGtOxBOMz=bmnFg@mail.gmail.com> <3016670.ToaXtcqt80@os-lin-dmo>
In-Reply-To: <3016670.ToaXtcqt80@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 6 Jan 2020 19:30:22 +0900
Message-ID: <CAD90VcYtS1ZRdikyHGZPcXQMVC7MuNsAhBGAWwiVpGgO3Yittg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] VirtIO video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, virtio-dev@lists.oasis-open.org,
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

Hi Dmitry, Tomasz,


On Fri, Jan 3, 2020 at 10:05 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Tomasz, Keiichi,
>
> On Samstag, 21. Dezember 2019 07:19:23 CET Tomasz Figa wrote:
> > On Sat, Dec 21, 2019 at 3:18 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > On Sat, Dec 21, 2019 at 1:36 PM Keiichi Watanabe <keiichiw@chromium.org>
> wrote:
> > > > Hi Dmitry,
> > > >
> > > > On Sat, Dec 21, 2019 at 12:59 AM Dmitry Sepp
> > > >
> > > > <dmitry.sepp@opensynergy.com> wrote:
> > > > > Hi Keiichi,
> > > > >
> > > > > On Mittwoch, 18. Dezember 2019 14:02:13 CET Keiichi Watanabe wrote:
> > > > > > Hi,
> > > > > > This is the 2nd version of virtio-video patch. The PDF is available
> > > > > > in [1].
> > > > > > The first version was sent at [2].
> > > > > >
> > > > > > Any feedback would be appreciated. Thank you.
> > > > > >
> > > > > > Best,
> > > > > > Keiichi
> > > > > >
> > > > > > [1]:
> > > > > > https://drive.google.com/drive/folders/1eT5fEckBoor2iHZR4f4GLxYzFMVa
> > > > > > pOFx?us
> > > > > > p=sharing [2]: https://markmail.org/message/gc6h25acct22niut
> > > > > >
> > > > > > Change log:
> > > > > >
> > > > > > v2:
> > > > > > * Removed functionalities except encoding and decoding.
> > > > > > * Splited encoder and decoder into different devices that use the
> > > > > > same
> > > > > > protocol. * Replaced GET_FUNCS with GET_CAPABILITY.
> > > > > > * Updated structs for capabilities.
> > > > > >
> > > > > >   - Defined new structs and enums such as image formats, profiles,
> > > > > >   range
> > > > > >
> > > > > > (min, max, step), etc
> > > > > >
> > > > > >     * For virtio_video_pixel_format, chose a naming convention that
> > > > > >     is used
> > > > > >
> > > > > >       in DRM. We removed XBGR, NV21 and I422, as they are not used
> > > > > >       in the
> > > > > >       current draft implementation. https://lwn.net/Articles/806416/
> > > > > >
> > > > > >   - Removed virtio_video_control, whose usage was not documented yet
> > > > > >   and
> > > > > >
> > > > > > which is not necessary for the simplest decoding scenario.
> > > > > >
> > > > > >   - Removed virtio_video_desc, as it is no longer needed.
> > > > > >
> > > > > > * Updated struct virtio_video_config for changes around
> > > > > > capabilities.
> > > > > > * Added a way to represent supported combinations of formats.
> > > > > >
> > > > > >   - A field "mask" in virtio_video_format_desc plays this role.
> > > > > >
> > > > > > * Removed VIRTIO_VIDEO_T_STREAM_{START,STOP} because they don't play
> > > > > > any
> > > > > > meaningful roles. * Removed VIRTIO_VIDEO_T_STREAM_{ATTACH,
> > > > > > DETACH}_BACKING
> > > > > > and merged them into RESOURCE_{CREATE, DESTROY}. * Added a way to
> > > > > > notify/specify resource creation method.
> > > > > >
> > > > > >   - Added a feature flag.
> > > > > >   - Defined enum virtio_video_mem_type.
> > > > > >   - Added new fields in video_stream_create.
> > > > > >
> > > > > > * Modified fields in virtio_video_params.
> > > > > >
> > > > > >   - Added crop information.
> > > > > >
> > > > > > * Removed enum virtio_video_channel_type because we can get this
> > > > > > information by image format.
> > > > >
> > > > > Could you please explain this? How do you get the information?
> > > >
> > > > It means that if image formats are well-defined, channel information
> > > > (e.g. the order of channels) is uniquely determined.
> > > >
> > > > > Suppose you have some piece of HW on the host side that wants I420 as
> > > > > one
> > > > > contig buffer w/ some offsets. But on the driver side, say, gralloc
> > > > > gives you three separate buffers, one per channel. How do we pass
> > > > > those to the device then?
> > > >
> > > > You're talking about CrOS use case where buffers are allocated by
> > > > virtio-gpu, right?
> > > > In this case, virtio-gpu allocates one contiguous host-side buffer and
> > > > the client regards a pair of (buffer FD, offset) as one channel.
> > > > And, we can register this pair to the device when the buffer is
> > > > imported.
> > > > In the virtio-vdec spec draft, this pair corresponds to struct
> > > > virtio_vdec_plane in struct virtio_vdec_plane.
> > > >
> > > > So, I suppose we will need similar structs when we add a control to
> > > > import buffers. However, I don't think it's necessary when guest pages
> > > > are used.
> > >
> > > I think we need some way for the guest to know whether it can allocate
> > > the planes in separate buffers, even when guest pages are used. This
> > > would be equivalent to V4L2 M and non-M formats, but mixing this into
> > > FourCC in V4L2 is an acknowledged mistake, so we should add a query or
> > > something.
> > >
>
> Yes, this is what I mean. In fact, we already do face the situation when the
> device side is not happy with the sgt and wants contig. I think we'll add a
> module parameter for now.

Okay. So, I suppose we'll be able to update structs:
* Add a flag in virtio_video_format_desc that indicates whether planes
can be in separate buffers, and
* Add a flag in virtio_video_format_desc that indicates that the
device requires contiguous buffers for this format.

Does it make sense?

Best regards,
Keiichi

>
> Regards,
> Dmitry.
>
> > > For future V4L2 development we came up with the idea of a format flag
> > > which could mean that the hardware allows putting planes in separate
> > > buffers. We could have a similar per-format flag in the capabilities,
> > > as we already have a list of all the supported formats there.
> >
> > Sorry, forgot to paste the link from future V4L2 work notes from this year
> > ELCE: https://www.spinics.net/lists/linux-media/msg159789.html
> >
> > > Best regards,
> > > Tomasz
> > >
> > > > Best regards,
> > > > Keiichi
> > > >
> > > > > Best regards,
> > > > > Dmitry.
> > > > >
> > > > > > * Renamed virtio_video_pin to virtio_video_buf_type.
> > > > > >
> > > > > >   - It's similar to V4L2_BUF_TYPE_VIDEO_{OUTPUT, CAPTURE}.
> > > > > >
> > > > > > * Added an error event.
> > > > > > * Reordered some subsections.
> > > > > > * Changed styles to make it consistent with other devices.
> > > > > >
> > > > > > Dmitry Sepp (1):
> > > > > >   virtio-video: Add virtio video device specification
> > > > > >
> > > > > >  content.tex      |   1 +
> > > > > >  virtio-video.tex | 579
> > > > > >  +++++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  2 files changed, 580 insertions(+)
> > > > > >  create mode 100644 virtio-video.tex
> > > > > >
> > > > > > --
> > > > > > 2.24.1.735.g03f4e72817-goog
>
>
