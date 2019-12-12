Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4670411C587
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 06:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfLLFj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 00:39:26 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38069 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfLLFj0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 00:39:26 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so692826lfm.5
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2019 21:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oX50o/StQ9y48fX/32nY2sfOCpi/TYNqbnrvs+M+vNE=;
        b=KhFg+8c+frwJbbNH+qch63MqGXo8VwiVHCFHVqRxw59mTIzs2z6NmRZOOAxgnYixU/
         HrET/MEKJRkmQgpGxeK9I9GCpC3f3GtX9AuGbkkTolIHy1dpPUAkWM3A5rgmz56JFmx7
         ugOn3x1uNmfW35a+5md8LQg74NolwlX67mWL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oX50o/StQ9y48fX/32nY2sfOCpi/TYNqbnrvs+M+vNE=;
        b=V3DU9g9f8l1AZyV3Q5DJjYcLoCqVfSqjiYIa/OWAXM0ZO6QosE5DqX24XRIfNW0MwZ
         ECWhLLdKJqOvaYdblBtZIpjg+s2mKVd7Zfd6HVM4ZAA5dNXmG9nvXcWCyd9OJ6c3covo
         2KdC5r9cYFBz0DmP2jztwbddvzzvtE5NDYiBgnqjb3R5DbfIAC0XehSZUDQBoQctZTf0
         fEiH4sgkvyqhlSVDHa+D5cA0aiGePzgU68mvh06vKG9D7l9G6n64EL51rbU3Amk+eZ4c
         f77pWml2whMhLlo7O7TgUSxsevRI83kD1uBjD0pBGr3UaQXB1vP3RAw3scgEdTj4Tu/p
         MFfA==
X-Gm-Message-State: APjAAAVwqVlsu4oprWgIpzls2iFFioDFjgX8b3eZOU2ccKUTcqmXEqAP
        T/a+RXTJV/6pfxzhXsZLHlw0LZJ1eB+OeyBAbtIJow==
X-Google-Smtp-Source: APXvYqwhksv1yN3qMPyapxTVtu9YS4pyIJ7LZaTskr9GvVS0EPNzPY+1Q+5UYYOaTqpvcORTsdgD6w8QYqbMrnOOt7w=
X-Received: by 2002:a19:ae18:: with SMTP id f24mr4625402lfc.155.1576129163350;
 Wed, 11 Dec 2019 21:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <9280087.Px4QY1m31c@os-lin-dmo> <CAPR809t2X3eEZj14Y-0CdnmzGZFhWKt2vwFSZBrEZbChQpmU_w@mail.gmail.com>
 <2278645.2VI2HTiyL8@os-lin-dmo>
In-Reply-To: <2278645.2VI2HTiyL8@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Thu, 12 Dec 2019 14:39:11 +0900
Message-ID: <CAD90VcbnUtJ5sG4R6P9iPOE7QWXbBsRYHrR80+XJcN+_O3nghQ@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Enrico Granata <egranata@google.com>,
        Changyeon Jo <changyeon@google.com>,
        virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 10, 2019 at 10:16 PM Dmitry Sepp
<dmitry.sepp@opensynergy.com> wrote:
>
> Hi,
>
> Just to start, let's consider this v4l2 control:
> V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE.
> As I can see, this control is referenced as a mandatory one in the Chromium
> sources [1].
>
> So could someone from the Chromium team please explain why it is mandatory?
> (YouTube?) In fact, almost no encoders implement this control. Do we need it
> in virtio-video?

That control is used to encode videos in constant bitrate (CBR) mode,
which is critical for
real-time use case like video conferencing.

However, that Chromium source code just requires *host-side* drivers
to have the v4l2
control. Also, I guess it's rare that a guest app wants to use CQP
instead of CBR from our
experience.
So, I suppose we can omit this control in virtio spec for now by
assuming that guests
always use CBR mode.

Best regards,
Keiichi

>
> [1] https://chromium.googlesource.com/chromium/src/media/+/refs/heads/master/
> gpu/v4l2/v4l2_video_encode_accelerator.cc#1500
>
> Regards,
> Dmitry.
>
> On Montag, 9. Dezember 2019 22:12:28 CET Enrico Granata wrote:
> > +Changyeon Jo <changyeon@google.com> for his awareness
> >
> > Thanks,
> > - Enrico
> >
> >
> > On Mon, Dec 9, 2019 at 6:20 AM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> >
> > wrote:
> > > Hello,
> > >
> > > I'd like to invite everyone to share ideas regarding required encoder
> > > features
> > > in this separate sub-tree.
> > >
> > > In general, encoder devices are more complex compared to decoders. So the
> > > question I'd like to rise is in what way we define the minimal subset of
> > > features to be implemented by the virtio-video.
> > >
> > > We may look at the following to define the set of features:
> > > 1. USB video, 2.3.6 Encoding Unit [1].
> > > 2. Android 10 Compatibility Definition [2].
> > >
> > > Would be nice to hear about any specific requirements from the Chromium
> > > team as
> > > well.
> > >
> > > [1] https://www.usb.org/sites/default/files/USB_Video_Class_1_5.zip
> > > [2]
> > > https://source.android.com/compatibility/android-cdd#5_2_video_encoding
> > >
> > > Thank you.
> > >
> > > Best regards,
> > > Dmitry.
> > >
> > > On Mittwoch, 4. Dezember 2019 10:16:20 CET Gerd Hoffmann wrote:
> > > >   Hi,
> > > >
> > > > > 1. Focus on only decoder/encoder functionalities first.
> > > > >
> > > > > As Tomasz said earlier in this thread, it'd be too complicated to
> > >
> > > support
> > >
> > > > > camera usage at the same time. So, I'd suggest to make it just a
> > >
> > > generic
> > >
> > > > > mem-to-mem video processing device protocol for now.
> > > > > If we finally decide to support camera in this protocol, we can add it
> > > > > later.
> > > >
> > > > Agree.
> > > >
> > > > > 2. Only one feature bit can be specified for one device.
> > > > >
> > > > > I'd like to have a decoder device and encoder device separately.
> > > > > It'd be natural to assume it because a decoder and an encoder are
> > >
> > > provided
> > >
> > > > > as different hardware.
> > > >
> > > > Hmm, modern GPUs support both encoding and decoding ...
> > > >
> > > > I don't think we should bake that restriction into the specification.
> > > > It probably makes sense to use one virtqueue per function though, that
> > > > will simplify dispatching in both host and guest.
> > > >
> > > > > 3. Separate buffer allocation functionalities from virtio-video
> > >
> > > protocol.
> > >
> > > > > To support various ways of guest/host buffer sharing, we might want to
> > > > > have a dedicated buffer sharing device as we're discussing in another
> > > > > thread. Until we reach consensus there, it'd be good not to have
> > > > > buffer
> > > > > allocation
> > > > > functionalities in virtio-video.
> > > >
> > > > I think virtio-video should be able to work as stand-alone device,
> > > > so we need some way to allocate buffers ...
> > > >
> > > > Buffer sharing with other devices can be added later.
> > > >
> > > > > > +The virtio video device is a virtual video streaming device that
> > > > > > supports the +following functions: encoder, decoder, capture,
> > > > > > output.
> > > > > > +
> > > > > > +\subsection{Device ID}\label{sec:Device Types / Video Device /
> > >
> > > Device
> > >
> > > > > > ID}
> > > > > > +
> > > > > > +TBD.
> > > > >
> > > > > I'm wondering how and when we can determine and reserve this ID?
> > > >
> > > > Grab the next free, update the spec accordingly, submit the one-line
> > > > patch.
> > > >
> > > > > > +\begin{lstlisting}
> > > > > > +enum virtio_video_pixel_format {
> > > > > > +       VIRTIO_VIDEO_PIX_FMT_UNDEFINED = 0,
> > > > > > +
> > > > > > +       VIRTIO_VIDEO_PIX_FMT_H264 = 0x0100,
> > > > > > +       VIRTIO_VIDEO_PIX_FMT_NV12,
> > > > > > +       VIRTIO_VIDEO_PIX_FMT_NV21,
> > > > > > +       VIRTIO_VIDEO_PIX_FMT_I420,
> > > > > > +       VIRTIO_VIDEO_PIX_FMT_I422,
> > > > > > +       VIRTIO_VIDEO_PIX_FMT_XBGR,
> > > > > > +};
> > > > >
> > > > > I'm wondering if we can use FOURCC instead. So, we can avoid
> > >
> > > reinventing a
> > >
> > > > > mapping from formats to integers.
> > > > > Also, I suppose the word "pixel formats" means only raw (decoded)
> > >
> > > formats.
> > >
> > > > > But, it can be encoded format like H.264. So, I guess "image format"
> > > > > or
> > > > > "fourcc" is a better word choice.
> > > >
> > > > Use separate pixel_format (fourcc) and stream_format (H.264 etc.) enums?
> > > >
> > > > > > +\begin{lstlisting}
> > > > > > +struct virtio_video_function {
> > > > > > +       struct virtio_video_desc desc;
> > > > > > +       __le32 function_type; /* One of VIRTIO_VIDEO_FUNC_* types */
> > > > > > +       __le32 function_id;
> > > > > > +       struct virtio_video_params in_params;
> > > > > > +       struct virtio_video_params out_params;
> > > > > > +       __le32 num_caps;
> > > > > > +       __u8 padding[4];
> > > > > > +       /* Followed by struct virtio_video_capability video_caps[];
> > >
> > > */
> > >
> > > > > > +};
> > > > > > +\end{lstlisting}
> > > > >
> > > > > If one device only has one functionality, virtio_video_function's
> > >
> > > fields
> > >
> > > > > will be no longer needed except in_params and out_params. So, we'd be
> > > > > able to remove virtio_video_function and have in_params and out_params
> > >
> > > in
> > >
> > > > > virtio_video_capability instead.
> > > >
> > > > Same goes for per-function virtqueues (used virtqueue implies function).
> > > >
> > > > > > +\begin{lstlisting}
> > > > > > +struct virtio_video_resource_detach_backing {
> > > > > > +       struct virtio_video_ctrl_hdr hdr;
> > > > > > +       __le32 resource_id;
> > > > > > +       __u8 padding[4];
> > > > > > +};
> > > > > > +\end{lstlisting}
> > > > > > +
> > > > > > +\begin{description}
> > > > > > +\item[\field{resource_id}] internal id of the resource.
> > > > > > +\end{description}
> > > > >
> > > > > I suppose that it'd be better not to have the above series of
> > >
> > > T_RESOURCE
> > >
> > > > > controls at least until we reach a conclusion in the thread of
> > > > > buffer-sharing device. If we end up concluding this type of controls
> > > > > is
> > > > > the best way, we'll be able to revisit here.
> > > >
> > > > Well.  For buffer management there are a bunch of options.
> > > >
> > > >  (1) Simply stick the buffers (well, pointers to the buffer pages) into
> > > >
> > > >      the virtqueue.  This is the standard virtio way.
> > > >
> > > >  (2) Create resources, then put the resource ids into the virtqueue.
> > > >
> > > >      virtio-gpu uses that model.  First, because virtio-gpu needs an id
> > > >      to reference resources in the rendering command stream
> > > >      (virtio-video doesn't need this).  Also because (some kinds of)
> > > >      resources are around for a long time and the guest-physical ->
> > > >      host-virtual mapping needs to be done only once that way (which
> > > >      I think would be the case for virtio-video too because v4l2
> > > >      re-uses buffers in robin-round fashion).  Drawback is this
> > > >      assumes shared memory between host and guest (which is the case
> > > >      in typical use cases but it is not mandated by the virtio spec).
> > > >
> > > >  (3) Import external resources (from virtio-gpu for example).
> > > >
> > > >      Out of scope for now, will probably added as optional feature
> > > >      later.
> > > >
> > > > I guess long-term we want support either (1)+(3) or (2)+(3).
> > > >
> > > > cheers,
> > > >
> > > >   Gerd
> > >
> > > ---------------------------------------------------------------------
> > > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
>
