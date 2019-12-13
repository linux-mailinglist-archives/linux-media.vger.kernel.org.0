Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37AB711E573
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 15:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfLMOU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 09:20:56 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33928 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfLMOU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 09:20:56 -0500
Received: by mail-lj1-f195.google.com with SMTP id m6so2760983ljc.1
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 06:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=74xh0l7LjI/84Db3IbaweOEywr0Jx636lzaOGbfUeuQ=;
        b=SgThjhnqpUe0eYtntrBjhEHdmc1HdjnEjQYg8G9YCVO3f7K+ACFhyJ8GdHR1JxBhi/
         liA6Be6M6CAmQBpApCbs69zIAvkkyptz0HAUe+XUOn4JDMjsf5CH1P/97KfwIFJAjjYt
         8iWbfsxLq2ZxBK21XoQsFqR3DfUd6idYdYrCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=74xh0l7LjI/84Db3IbaweOEywr0Jx636lzaOGbfUeuQ=;
        b=ueuSPwyD145WO4Cg/sA4pYzjPO7sNO1yD4K0656lXDSPQZl3MJrJOMkVzcZ057w14P
         1hhn0PJi49IohzE97eHHT4RTkWsQcrI9R4ELdmxt/BRZZGXHbWHMnXMrG3UGeAskyBKP
         dNGW+/aso+X2zSmtRhvBMK1WiItR9+jC7LuxduYI+6KyVmORqcMIW9OavdCs9klTHQVc
         Qsq/xrn1Jm1epFJl1x8MEZS7PHbHLTgJ0wB0BZ1k49HuQVR+eRPW8OajlPTWH9ChSGoi
         s49y10FvsWl2IXjhjlIYCWN5V6yo23s1KrX6lCns55eNqIAeMskHVqT/EtoEUZ3aebzs
         yjBg==
X-Gm-Message-State: APjAAAXLQzn29/0Of9cZmHCazA8/9scUncjCb3WUB5VraEekPMsVr1y9
        s7n3eLPMjBNuWjKsWfQFQq0I0tPRKKbALlBO3k90cg==
X-Google-Smtp-Source: APXvYqx+5TG8KVzEyWFOo3QHESCsKkhhnEw5jEHFbH0QBF+/apeXqsBe24LLhZvInt+Rj12jaiqxucX5LAhmjnI9oEw=
X-Received: by 2002:a2e:721a:: with SMTP id n26mr10070332ljc.128.1576246853516;
 Fri, 13 Dec 2019 06:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <2278645.2VI2HTiyL8@os-lin-dmo> <CAD90VcbnUtJ5sG4R6P9iPOE7QWXbBsRYHrR80+XJcN+_O3nghQ@mail.gmail.com>
 <1862141.aebO5lr7J1@os-lin-dmo>
In-Reply-To: <1862141.aebO5lr7J1@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Fri, 13 Dec 2019 23:20:41 +0900
Message-ID: <CAD90VcY_CUVNpq6w06HPRknHtT+WhT3gPnaLtMe2yHS1dCHMzQ@mail.gmail.com>
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

On Thu, Dec 12, 2019 at 7:34 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> Thank you for your comment.
> What do you thing about selection/crop rectangles? Should this be defined as a
> must have? Or we just assume the device always sticks to the stream
> resolution.
>

For decoding, the device needs to tell the driver crop rectangle when
a resolution change happens, as virtio-vdec has
virtio_vdec_host_req_stream_crop.
So, we should add a new field in virtio_video_param for it.

For what it's worth, we have C-headers that exposes Chrome's video
codec functionalities. So, our virtio-video device will do
decoding/encoding by calling these functions.
Decoder: https://chromium.git.corp.google.com/chromiumos/platform2/+/00ad71fa640c018c1d014f467c50b9a7dc962a10/arc/vm/libvda/libvda_decode.h
Encoder: https://chromium.git.corp.google.com/chromiumos/platform2/+/00ad71fa640c018c1d014f467c50b9a7dc962a10/arc/vm/libvda/libvda_encode.h

BTW, I'm preparing the next version of virtio-video spec by addressing
points we discussed in this thread. I'll send it here next week,
hopefully.

Best,
Keiichi



> Regards,
> Dmitry.
>
> On Donnerstag, 12. Dezember 2019 06:39:11 CET Keiichi Watanabe wrote:
> > On Tue, Dec 10, 2019 at 10:16 PM Dmitry Sepp
> >
> > <dmitry.sepp@opensynergy.com> wrote:
> > > Hi,
> > >
> > > Just to start, let's consider this v4l2 control:
> > > V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE.
> > > As I can see, this control is referenced as a mandatory one in the
> > > Chromium
> > > sources [1].
> > >
> > > So could someone from the Chromium team please explain why it is
> > > mandatory?
> > > (YouTube?) In fact, almost no encoders implement this control. Do we need
> > > it in virtio-video?
> >
> > That control is used to encode videos in constant bitrate (CBR) mode,
> > which is critical for
> > real-time use case like video conferencing.
> >
> > However, that Chromium source code just requires *host-side* drivers
> > to have the v4l2
> > control. Also, I guess it's rare that a guest app wants to use CQP
> > instead of CBR from our
> > experience.
> > So, I suppose we can omit this control in virtio spec for now by
> > assuming that guests
> > always use CBR mode.
> >
> > Best regards,
> > Keiichi
> >
> > > [1]
> > > https://chromium.googlesource.com/chromium/src/media/+/refs/heads/master/
> > > gpu/v4l2/v4l2_video_encode_accelerator.cc#1500
> > >
> > > Regards,
> > > Dmitry.
> > >
> > > On Montag, 9. Dezember 2019 22:12:28 CET Enrico Granata wrote:
> > > > +Changyeon Jo <changyeon@google.com> for his awareness
> > > >
> > > > Thanks,
> > > > - Enrico
> > > >
> > > >
> > > > On Mon, Dec 9, 2019 at 6:20 AM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> > > >
> > > > wrote:
> > > > > Hello,
> > > > >
> > > > > I'd like to invite everyone to share ideas regarding required encoder
> > > > > features
> > > > > in this separate sub-tree.
> > > > >
> > > > > In general, encoder devices are more complex compared to decoders. So
> > > > > the
> > > > > question I'd like to rise is in what way we define the minimal subset
> > > > > of
> > > > > features to be implemented by the virtio-video.
> > > > >
> > > > > We may look at the following to define the set of features:
> > > > > 1. USB video, 2.3.6 Encoding Unit [1].
> > > > > 2. Android 10 Compatibility Definition [2].
> > > > >
> > > > > Would be nice to hear about any specific requirements from the
> > > > > Chromium
> > > > > team as
> > > > > well.
> > > > >
> > > > > [1] https://www.usb.org/sites/default/files/USB_Video_Class_1_5.zip
> > > > > [2]
> > > > > https://source.android.com/compatibility/android-cdd#5_2_video_encodin
> > > > > g
> > > > >
> > > > > Thank you.
> > > > >
> > > > > Best regards,
> > > > > Dmitry.
> > > > >
> > > > > On Mittwoch, 4. Dezember 2019 10:16:20 CET Gerd Hoffmann wrote:
> > > > > >   Hi,
> > > > > >
> > > > > > > 1. Focus on only decoder/encoder functionalities first.
> > > > > > >
> > > > > > > As Tomasz said earlier in this thread, it'd be too complicated to
> > > > >
> > > > > support
> > > > >
> > > > > > > camera usage at the same time. So, I'd suggest to make it just a
> > > > >
> > > > > generic
> > > > >
> > > > > > > mem-to-mem video processing device protocol for now.
> > > > > > > If we finally decide to support camera in this protocol, we can
> > > > > > > add it
> > > > > > > later.
> > > > > >
> > > > > > Agree.
> > > > > >
> > > > > > > 2. Only one feature bit can be specified for one device.
> > > > > > >
> > > > > > > I'd like to have a decoder device and encoder device separately.
> > > > > > > It'd be natural to assume it because a decoder and an encoder are
> > > > >
> > > > > provided
> > > > >
> > > > > > > as different hardware.
> > > > > >
> > > > > > Hmm, modern GPUs support both encoding and decoding ...
> > > > > >
> > > > > > I don't think we should bake that restriction into the
> > > > > > specification.
> > > > > > It probably makes sense to use one virtqueue per function though,
> > > > > > that
> > > > > > will simplify dispatching in both host and guest.
> > > > > >
> > > > > > > 3. Separate buffer allocation functionalities from virtio-video
> > > > >
> > > > > protocol.
> > > > >
> > > > > > > To support various ways of guest/host buffer sharing, we might
> > > > > > > want to
> > > > > > > have a dedicated buffer sharing device as we're discussing in
> > > > > > > another
> > > > > > > thread. Until we reach consensus there, it'd be good not to have
> > > > > > > buffer
> > > > > > > allocation
> > > > > > > functionalities in virtio-video.
> > > > > >
> > > > > > I think virtio-video should be able to work as stand-alone device,
> > > > > > so we need some way to allocate buffers ...
> > > > > >
> > > > > > Buffer sharing with other devices can be added later.
> > > > > >
> > > > > > > > +The virtio video device is a virtual video streaming device
> > > > > > > > that
> > > > > > > > supports the +following functions: encoder, decoder, capture,
> > > > > > > > output.
> > > > > > > > +
> > > > > > > > +\subsection{Device ID}\label{sec:Device Types / Video Device /
> > > > >
> > > > > Device
> > > > >
> > > > > > > > ID}
> > > > > > > > +
> > > > > > > > +TBD.
> > > > > > >
> > > > > > > I'm wondering how and when we can determine and reserve this ID?
> > > > > >
> > > > > > Grab the next free, update the spec accordingly, submit the one-line
> > > > > > patch.
> > > > > >
> > > > > > > > +\begin{lstlisting}
> > > > > > > > +enum virtio_video_pixel_format {
> > > > > > > > +       VIRTIO_VIDEO_PIX_FMT_UNDEFINED = 0,
> > > > > > > > +
> > > > > > > > +       VIRTIO_VIDEO_PIX_FMT_H264 = 0x0100,
> > > > > > > > +       VIRTIO_VIDEO_PIX_FMT_NV12,
> > > > > > > > +       VIRTIO_VIDEO_PIX_FMT_NV21,
> > > > > > > > +       VIRTIO_VIDEO_PIX_FMT_I420,
> > > > > > > > +       VIRTIO_VIDEO_PIX_FMT_I422,
> > > > > > > > +       VIRTIO_VIDEO_PIX_FMT_XBGR,
> > > > > > > > +};
> > > > > > >
> > > > > > > I'm wondering if we can use FOURCC instead. So, we can avoid
> > > > >
> > > > > reinventing a
> > > > >
> > > > > > > mapping from formats to integers.
> > > > > > > Also, I suppose the word "pixel formats" means only raw (decoded)
> > > > >
> > > > > formats.
> > > > >
> > > > > > > But, it can be encoded format like H.264. So, I guess "image
> > > > > > > format"
> > > > > > > or
> > > > > > > "fourcc" is a better word choice.
> > > > > >
> > > > > > Use separate pixel_format (fourcc) and stream_format (H.264 etc.)
> > > > > > enums?
> > > > > >
> > > > > > > > +\begin{lstlisting}
> > > > > > > > +struct virtio_video_function {
> > > > > > > > +       struct virtio_video_desc desc;
> > > > > > > > +       __le32 function_type; /* One of VIRTIO_VIDEO_FUNC_*
> > > > > > > > types */
> > > > > > > > +       __le32 function_id;
> > > > > > > > +       struct virtio_video_params in_params;
> > > > > > > > +       struct virtio_video_params out_params;
> > > > > > > > +       __le32 num_caps;
> > > > > > > > +       __u8 padding[4];
> > > > > > > > +       /* Followed by struct virtio_video_capability
> > > > > > > > video_caps[];
> > > > >
> > > > > */
> > > > >
> > > > > > > > +};
> > > > > > > > +\end{lstlisting}
> > > > > > >
> > > > > > > If one device only has one functionality, virtio_video_function's
> > > > >
> > > > > fields
> > > > >
> > > > > > > will be no longer needed except in_params and out_params. So, we'd
> > > > > > > be
> > > > > > > able to remove virtio_video_function and have in_params and
> > > > > > > out_params
> > > > >
> > > > > in
> > > > >
> > > > > > > virtio_video_capability instead.
> > > > > >
> > > > > > Same goes for per-function virtqueues (used virtqueue implies
> > > > > > function).
> > > > > >
> > > > > > > > +\begin{lstlisting}
> > > > > > > > +struct virtio_video_resource_detach_backing {
> > > > > > > > +       struct virtio_video_ctrl_hdr hdr;
> > > > > > > > +       __le32 resource_id;
> > > > > > > > +       __u8 padding[4];
> > > > > > > > +};
> > > > > > > > +\end{lstlisting}
> > > > > > > > +
> > > > > > > > +\begin{description}
> > > > > > > > +\item[\field{resource_id}] internal id of the resource.
> > > > > > > > +\end{description}
> > > > > > >
> > > > > > > I suppose that it'd be better not to have the above series of
> > > > >
> > > > > T_RESOURCE
> > > > >
> > > > > > > controls at least until we reach a conclusion in the thread of
> > > > > > > buffer-sharing device. If we end up concluding this type of
> > > > > > > controls
> > > > > > > is
> > > > > > > the best way, we'll be able to revisit here.
> > > > > >
> > > > > > Well.  For buffer management there are a bunch of options.
> > > > > >
> > > > > >  (1) Simply stick the buffers (well, pointers to the buffer pages)
> > > > > >  into
> > > > > >
> > > > > >      the virtqueue.  This is the standard virtio way.
> > > > > >
> > > > > >  (2) Create resources, then put the resource ids into the virtqueue.
> > > > > >
> > > > > >      virtio-gpu uses that model.  First, because virtio-gpu needs an
> > > > > >      id
> > > > > >      to reference resources in the rendering command stream
> > > > > >      (virtio-video doesn't need this).  Also because (some kinds of)
> > > > > >      resources are around for a long time and the guest-physical ->
> > > > > >      host-virtual mapping needs to be done only once that way (which
> > > > > >      I think would be the case for virtio-video too because v4l2
> > > > > >      re-uses buffers in robin-round fashion).  Drawback is this
> > > > > >      assumes shared memory between host and guest (which is the case
> > > > > >      in typical use cases but it is not mandated by the virtio
> > > > > >      spec).
> > > > > >
> > > > > >  (3) Import external resources (from virtio-gpu for example).
> > > > > >
> > > > > >      Out of scope for now, will probably added as optional feature
> > > > > >      later.
> > > > > >
> > > > > > I guess long-term we want support either (1)+(3) or (2)+(3).
> > > > > >
> > > > > > cheers,
> > > > > >
> > > > > >   Gerd
> > > > >
> > > > > ---------------------------------------------------------------------
> > > > > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > > > > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
>
