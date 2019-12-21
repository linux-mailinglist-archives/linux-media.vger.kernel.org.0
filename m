Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3ABF1286DE
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2019 05:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfLUEgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 23:36:53 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44765 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfLUEgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 23:36:53 -0500
Received: by mail-lj1-f194.google.com with SMTP id u71so12024225lje.11
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2019 20:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2RM1mATex4NlSeuS9M8BHu+vGDmRX82LwRvkNHu2Uv0=;
        b=Y/5finXHetlnzxxDI7A1zqOhKsAmoCjFTv0mk+JZ4m/F6E3NtvjL+GOxbUBo4yE8Fy
         XS9Fjfh3OGCte9BHhRweE1ILsWL2AxEEqZ4EnDpEN2QJSJRdijcjoHtIekFnf6c0eRE3
         YuR22jy6eF2TSNsPziSpfcnb6LRJcz0qrK79A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2RM1mATex4NlSeuS9M8BHu+vGDmRX82LwRvkNHu2Uv0=;
        b=EeCBT8grsZN0qIaCO2dsGX09nrALQO9KfQDaPp78ysPX/thnnEgvJUUdOBW18dTgSd
         lqRXxAuU0FD4XMP+HEyBivnztcPTViPKgvog0SFtBXlE2jqUfGNUdwtc0pfN55mvGw4z
         I0OHX4Lg/BU/9EWpplhdIa6AEvK4WT6dE6a41u4fUIDsYHCm6cT7bprynU3hpyZYlEhn
         PtCceAlPwveUYepslg+c1k9uuIyr9vNTBzahk/SLG8NvTXfj9KSPLXOMVivDMNsUlyA1
         voI5nuu12u3Qm49wDfu+iEaI8kRG8VDLRIFkZpWQ7z3shBD7fiGR6wQnb7Vm9cBgLdmy
         wVrg==
X-Gm-Message-State: APjAAAWWFEzLzSVy1HPjnhJvKcXClIJNn2bi3oHCtj1EG+wkflEFhrPO
        iTbKiXyhzDsyI0QelTXpkPJGmwxvz/p5O6ypPi2QmQ==
X-Google-Smtp-Source: APXvYqz/k26d4wgQZMqTsMGZECQ5NqbYWXOIfJQ54BdGJrBwXoJjvNOUz5s4zSDzSUXBKznXETpl/y6O9cMJzSHtyOM=
X-Received: by 2002:a05:651c:232:: with SMTP id z18mr10410896ljn.85.1576903010394;
 Fri, 20 Dec 2019 20:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org> <2730251.jGmEEvB50I@os-lin-dmo>
In-Reply-To: <2730251.jGmEEvB50I@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Sat, 21 Dec 2019 13:36:40 +0900
Message-ID: <CAD90Vcb=38fXTbsWy6dH9FuE0xU-GAVAHWMFFtju0txPg+e1FA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] VirtIO video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     virtio-dev@lists.oasis-open.org,
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
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On Sat, Dec 21, 2019 at 12:59 AM Dmitry Sepp
<dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> On Mittwoch, 18. Dezember 2019 14:02:13 CET Keiichi Watanabe wrote:
> > Hi,
> > This is the 2nd version of virtio-video patch. The PDF is available in [1].
> > The first version was sent at [2].
> >
> > Any feedback would be appreciated. Thank you.
> >
> > Best,
> > Keiichi
> >
> > [1]:
> > https://drive.google.com/drive/folders/1eT5fEckBoor2iHZR4f4GLxYzFMVapOFx?us
> > p=sharing [2]: https://markmail.org/message/gc6h25acct22niut
> >
> > Change log:
> >
> > v2:
> > * Removed functionalities except encoding and decoding.
> > * Splited encoder and decoder into different devices that use the same
> > protocol. * Replaced GET_FUNCS with GET_CAPABILITY.
> > * Updated structs for capabilities.
> >   - Defined new structs and enums such as image formats, profiles, range
> > (min, max, step), etc
> >     * For virtio_video_pixel_format, chose a naming convention that is used
> >       in DRM. We removed XBGR, NV21 and I422, as they are not used in the
> >       current draft implementation. https://lwn.net/Articles/806416/
> >   - Removed virtio_video_control, whose usage was not documented yet and
> > which is not necessary for the simplest decoding scenario.
> >   - Removed virtio_video_desc, as it is no longer needed.
> > * Updated struct virtio_video_config for changes around capabilities.
> > * Added a way to represent supported combinations of formats.
> >   - A field "mask" in virtio_video_format_desc plays this role.
> > * Removed VIRTIO_VIDEO_T_STREAM_{START,STOP} because they don't play any
> > meaningful roles. * Removed VIRTIO_VIDEO_T_STREAM_{ATTACH, DETACH}_BACKING
> > and merged them into RESOURCE_{CREATE, DESTROY}. * Added a way to
> > notify/specify resource creation method.
> >   - Added a feature flag.
> >   - Defined enum virtio_video_mem_type.
> >   - Added new fields in video_stream_create.
> > * Modified fields in virtio_video_params.
> >   - Added crop information.
> > * Removed enum virtio_video_channel_type because we can get this information
> > by image format.
> Could you please explain this? How do you get the information?

It means that if image formats are well-defined, channel information
(e.g. the order of channels) is uniquely determined.

>
> Suppose you have some piece of HW on the host side that wants I420 as one
> contig buffer w/ some offsets. But on the driver side, say, gralloc gives you
> three separate buffers, one per channel. How do we pass those to the device
> then?

You're talking about CrOS use case where buffers are allocated by
virtio-gpu, right?
In this case, virtio-gpu allocates one contiguous host-side buffer and
the client regards a pair of (buffer FD, offset) as one channel.
And, we can register this pair to the device when the buffer is imported.
In the virtio-vdec spec draft, this pair corresponds to struct
virtio_vdec_plane in struct virtio_vdec_plane.

So, I suppose we will need similar structs when we add a control to
import buffers. However, I don't think it's necessary when guest pages
are used.

Best regards,
Keiichi


>
> Best regards,
> Dmitry.
>
> > * Renamed virtio_video_pin to virtio_video_buf_type.
> >   - It's similar to V4L2_BUF_TYPE_VIDEO_{OUTPUT, CAPTURE}.
> > * Added an error event.
> > * Reordered some subsections.
> > * Changed styles to make it consistent with other devices.
> >
> > Dmitry Sepp (1):
> >   virtio-video: Add virtio video device specification
> >
> >  content.tex      |   1 +
> >  virtio-video.tex | 579 +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 580 insertions(+)
> >  create mode 100644 virtio-video.tex
> >
> > --
> > 2.24.1.735.g03f4e72817-goog
>
>
