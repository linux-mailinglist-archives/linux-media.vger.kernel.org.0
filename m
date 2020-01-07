Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDD9132387
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 11:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgAGK0K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 05:26:10 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41020 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbgAGK0K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 05:26:10 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so38475681lfp.8
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 02:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xd8fa9SPUbV549yE1f/26W4MiJd3NRvcxsgdrP9AAig=;
        b=h2LwyyrncrsKin6b07Ir2k0hkaxv16zpsxHzULjlIkS5bOaoLo9lvxnJ8YLkiL2ZSl
         lHfoXtaGq/MmNZoNAz9Af1+qtcH6fuW32o0+xpA9fEfT9qNZ1X/YOR2BXJJKSvPFB+yY
         CongndD2vtdPe9983Ltb3bcGXjtusgw7fBCMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xd8fa9SPUbV549yE1f/26W4MiJd3NRvcxsgdrP9AAig=;
        b=hJLatUuTw25C4VAQHm63pQnRlHPtugVd/FMvFdhQR9X+H4M/4A7U6ioTEkJYp3YWrE
         YushgKmQOgetng38qsRXcty5wR7y1X/jSPAQB46kICkuKszW3wgI780LQgpWtjrXUJSO
         UTZ6Im+IactHptvj58QPzTkAm2ySdKGEREcgASdHdvr8BHusendeb7pA7q+8RH5gU4ir
         Exl+TqNgvYJOMDRF8ZNOUCxhWR5F+PQvRhxVUOXn6pra/QYOVNiI+OXdildOedUKzwlt
         qd3hnG703VvKM3njRvv1Fwp8xp8cxJh8y5JkNlEG3OkK8oEVObfVJS6qV3pJ3IAhEj5+
         jz5g==
X-Gm-Message-State: APjAAAVeytq4aD0QI+m37r/uIxUNcmvTThPOICYtzDhCwxC0mMJXWLEG
        8FUJGIBsQoK7EuIfO1iSadhdrIGDpMJRkW4j2xLY3w==
X-Google-Smtp-Source: APXvYqzazncdhHk64X4LNsP6C0KzMbTRDlZbsPuHD4IAZmhkjrdiAanD5j7r4+kIQag1gtm/rncvUo7McqSqUWHvSLI=
X-Received: by 2002:a19:a408:: with SMTP id q8mr57650934lfc.174.1578392767884;
 Tue, 07 Jan 2020 02:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <3016670.ToaXtcqt80@os-lin-dmo> <CAD90VcYtS1ZRdikyHGZPcXQMVC7MuNsAhBGAWwiVpGgO3Yittg@mail.gmail.com>
 <2751629.YRu87Tu1Bo@os-lin-dmo>
In-Reply-To: <2751629.YRu87Tu1Bo@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 7 Jan 2020 19:25:56 +0900
Message-ID: <CAD90VcaQCSFTv-JyxZ7cO+Qnc0U2NRGikcYmmy=zitJby9NfXg@mail.gmail.com>
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

Hi Dmitry,

On Mon, Jan 6, 2020 at 8:28 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi,
>
> On Montag, 6. Januar 2020 11:30:22 CET Keiichi Watanabe wrote:
> > Hi Dmitry, Tomasz,
> >
> > On Fri, Jan 3, 2020 at 10:05 PM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> wrote:
> > > Hi Tomasz, Keiichi,
> > >
> > > On Samstag, 21. Dezember 2019 07:19:23 CET Tomasz Figa wrote:
> > > > On Sat, Dec 21, 2019 at 3:18 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > > > On Sat, Dec 21, 2019 at 1:36 PM Keiichi Watanabe
> > > > > <keiichiw@chromium.org>
> > >
> > > wrote:
> > > > > > Hi Dmitry,
> > > > > >
> > > > > > On Sat, Dec 21, 2019 at 12:59 AM Dmitry Sepp
> > > > > >
> > > > > > <dmitry.sepp@opensynergy.com> wrote:
> > > > > > > Hi Keiichi,
> > > > > > >
> > > > > > > On Mittwoch, 18. Dezember 2019 14:02:13 CET Keiichi Watanabe
> wrote:
> > > > > > > > Hi,
> > > > > > > > This is the 2nd version of virtio-video patch. The PDF is
> > > > > > > > available
> > > > > > > > in [1].
> > > > > > > > The first version was sent at [2].
> > > > > > > >
> > > > > > > > Any feedback would be appreciated. Thank you.
> > > > > > > >
> > > > > > > > Best,
> > > > > > > > Keiichi
> > > > > > > >
> > > > > > > > [1]:
> > > > > > > > https://drive.google.com/drive/folders/1eT5fEckBoor2iHZR4f4GLxYz
> > > > > > > > FMVa
> > > > > > > > pOFx?us
> > > > > > > > p=sharing [2]: https://markmail.org/message/gc6h25acct22niut
> > > > > > > >
> > > > > > > > Change log:
> > > > > > > >
> > > > > > > > v2:
> > > > > > > > * Removed functionalities except encoding and decoding.
> > > > > > > > * Splited encoder and decoder into different devices that use
> > > > > > > > the
> > > > > > > > same
> > > > > > > > protocol. * Replaced GET_FUNCS with GET_CAPABILITY.
> > > > > > > > * Updated structs for capabilities.
> > > > > > > >
> > > > > > > >   - Defined new structs and enums such as image formats,
> > > > > > > >   profiles,
> > > > > > > >   range
> > > > > > > >
> > > > > > > > (min, max, step), etc
> > > > > > > >
> > > > > > > >     * For virtio_video_pixel_format, chose a naming convention
> > > > > > > >     that
> > > > > > > >     is used
> > > > > > > >
> > > > > > > >       in DRM. We removed XBGR, NV21 and I422, as they are not
> > > > > > > >       used
> > > > > > > >       in the
> > > > > > > >       current draft implementation.
> > > > > > > >       https://lwn.net/Articles/806416/
> > > > > > > >
> > > > > > > >   - Removed virtio_video_control, whose usage was not documented
> > > > > > > >   yet
> > > > > > > >   and
> > > > > > > >
> > > > > > > > which is not necessary for the simplest decoding scenario.
> > > > > > > >
> > > > > > > >   - Removed virtio_video_desc, as it is no longer needed.
> > > > > > > >
> > > > > > > > * Updated struct virtio_video_config for changes around
> > > > > > > > capabilities.
> > > > > > > > * Added a way to represent supported combinations of formats.
> > > > > > > >
> > > > > > > >   - A field "mask" in virtio_video_format_desc plays this role.
> > > > > > > >
> > > > > > > > * Removed VIRTIO_VIDEO_T_STREAM_{START,STOP} because they don't
> > > > > > > > play
> > > > > > > > any
> > > > > > > > meaningful roles. * Removed VIRTIO_VIDEO_T_STREAM_{ATTACH,
> > > > > > > > DETACH}_BACKING
> > > > > > > > and merged them into RESOURCE_{CREATE, DESTROY}. * Added a way
> > > > > > > > to
> > > > > > > > notify/specify resource creation method.
> > > > > > > >
> > > > > > > >   - Added a feature flag.
> > > > > > > >   - Defined enum virtio_video_mem_type.
> > > > > > > >   - Added new fields in video_stream_create.
> > > > > > > >
> > > > > > > > * Modified fields in virtio_video_params.
> > > > > > > >
> > > > > > > >   - Added crop information.
> > > > > > > >
> > > > > > > > * Removed enum virtio_video_channel_type because we can get this
> > > > > > > > information by image format.
> > > > > > >
> > > > > > > Could you please explain this? How do you get the information?
> > > > > >
> > > > > > It means that if image formats are well-defined, channel information
> > > > > > (e.g. the order of channels) is uniquely determined.
> > > > > >
> > > > > > > Suppose you have some piece of HW on the host side that wants I420
> > > > > > > as
> > > > > > > one
> > > > > > > contig buffer w/ some offsets. But on the driver side, say,
> > > > > > > gralloc
> > > > > > > gives you three separate buffers, one per channel. How do we pass
> > > > > > > those to the device then?
> > > > > >
> > > > > > You're talking about CrOS use case where buffers are allocated by
> > > > > > virtio-gpu, right?
> > > > > > In this case, virtio-gpu allocates one contiguous host-side buffer
> > > > > > and
> > > > > > the client regards a pair of (buffer FD, offset) as one channel.
> > > > > > And, we can register this pair to the device when the buffer is
> > > > > > imported.
> > > > > > In the virtio-vdec spec draft, this pair corresponds to struct
> > > > > > virtio_vdec_plane in struct virtio_vdec_plane.
> > > > > >
> > > > > > So, I suppose we will need similar structs when we add a control to
> > > > > > import buffers. However, I don't think it's necessary when guest
> > > > > > pages
> > > > > > are used.
> > > > >
> > > > > I think we need some way for the guest to know whether it can allocate
> > > > > the planes in separate buffers, even when guest pages are used. This
> > > > > would be equivalent to V4L2 M and non-M formats, but mixing this into
> > > > > FourCC in V4L2 is an acknowledged mistake, so we should add a query or
> > > > > something.
> > >
> > > Yes, this is what I mean. In fact, we already do face the situation when
> > > the device side is not happy with the sgt and wants contig. I think we'll
> > > add a module parameter for now.
> >
> > Okay. So, I suppose we'll be able to update structs:
> > * Add a flag in virtio_video_format_desc that indicates whether planes
> > can be in separate buffers, and
> > * Add a flag in virtio_video_format_desc that indicates that the
> > device requires contiguous buffers for this format.
> >
> > Does it make sense?
> >
> Sorry, I don't understand the difference between the two above: isn't the first
> case is just when the flag is not set?

Ah, I was confused and wrote something strange. Yeah,  these two are the same.
Sorry for that.

So, the suggestion is to add a field "planes_layout" in
virtio_video_format_desc, which is one of the following enums:

enum virtio_video_planes_layout {
    VIRTIO_VIDEO_PLANES_LAYOUT_UNSPEC = 0,  /* no special requirement */
    VIRTIO_VIDEO_PLANES_LAYOUT_CONTIGUOUS,
};

If we have a better idea or naming, please let me know.

Best regards,
Keiichi

>
> Regards,
> Dmitry.
>
> > Best regards,
> > Keiichi
> >
> > > Regards,
> > > Dmitry.
> > >
> > > > > For future V4L2 development we came up with the idea of a format flag
> > > > > which could mean that the hardware allows putting planes in separate
> > > > > buffers. We could have a similar per-format flag in the capabilities,
> > > > > as we already have a list of all the supported formats there.
> > > >
> > > > Sorry, forgot to paste the link from future V4L2 work notes from this
> > > > year
> > > > ELCE: https://www.spinics.net/lists/linux-media/msg159789.html
> > > >
> > > > > Best regards,
> > > > > Tomasz
> > > > >
> > > > > > Best regards,
> > > > > > Keiichi
> > > > > >
> > > > > > > Best regards,
> > > > > > > Dmitry.
> > > > > > >
> > > > > > > > * Renamed virtio_video_pin to virtio_video_buf_type.
> > > > > > > >
> > > > > > > >   - It's similar to V4L2_BUF_TYPE_VIDEO_{OUTPUT, CAPTURE}.
> > > > > > > >
> > > > > > > > * Added an error event.
> > > > > > > > * Reordered some subsections.
> > > > > > > > * Changed styles to make it consistent with other devices.
> > > > > > > >
> > > > > > > > Dmitry Sepp (1):
> > > > > > > >   virtio-video: Add virtio video device specification
> > > > > > > >
> > > > > > > >  content.tex      |   1 +
> > > > > > > >  virtio-video.tex | 579
> > > > > > > >  +++++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > >  2 files changed, 580 insertions(+)
> > > > > > > >  create mode 100644 virtio-video.tex
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.24.1.735.g03f4e72817-goog
>
>
