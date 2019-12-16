Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 498EB11FF6A
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 09:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfLPIJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 03:09:34 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33006 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbfLPIJe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 03:09:34 -0500
Received: by mail-ed1-f66.google.com with SMTP id r21so4290349edq.0
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 00:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FXBJjgBpQIqOlKcHGWsOidr5Zv5TRZ2+IRButCzdYM8=;
        b=mScIwG6gsx6C4WvdHtw+bjisFPpxtNH0zfst8/CppopdzWfg5RhQ5EvCHrjsXEudnJ
         DsRcDxjya5MaaxiU6zwcfn8zq1vTOYNzhoOWQAODxkdnJxSGafuCYRQDxDq0tj5NZEky
         CSQk1IqrYlHXAwDItgPrZZsxTb15oi4aBdlic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FXBJjgBpQIqOlKcHGWsOidr5Zv5TRZ2+IRButCzdYM8=;
        b=ujEzSB156qEISS9CxRO0pz62yIEa3FzPpeHQewb/O2h9uPto91vdVVic8cmvqmG4Dl
         ZIoRMmVkQQ5J4X4ITU2DznZxB652JmjulfTpnO5oFEyXV53jaMvuPf+RlFJptm+n0Nmt
         Xe8gT+n1GRn/dQhMRWmShPUt/Bp4Yjj1OlJ8e1azarpOhjSB9Eqi2ZsXMVLXv5tfsuC6
         d+eCkFIW24lxpPSoyPPMLf2jYdGOUXtzEddv4h+uFdVoRuHMrYZ6rQLEGtpxZBk4A+b7
         5dYScUjftob7jsU0IFViRyeqIeip0RmV+wDpBzFIgGryCHatfj86vwVEI/X7IqCxgfio
         uEaQ==
X-Gm-Message-State: APjAAAWYXLf0e9ov/rTSHuVyJhEP2UmpfWhaj18U2IoBCyFP7d+wIRqj
        yFCxgJzyPMbUO+cNY7STQzB/WWbHih0kTQ==
X-Google-Smtp-Source: APXvYqykGYAyez/BludVWnlm1gqEEPBsSY5qnjnUPJw8i8cixlveL27f/nneSP0WMkv7ZEnqjUVmxQ==
X-Received: by 2002:a17:906:c441:: with SMTP id ck1mr32523593ejb.60.1576483771567;
        Mon, 16 Dec 2019 00:09:31 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a12sm1087374eje.70.2019.12.16.00.09.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 00:09:31 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id y17so6038816wrh.5
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 00:09:30 -0800 (PST)
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr28508338wrs.113.1576483769453;
 Mon, 16 Dec 2019 00:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org> <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com> <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
In-Reply-To: <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 16 Dec 2019 17:09:17 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bs6NnsoOP1NFLREQSLNJs-K33ZvW5ZcdAZTv95WHmPBA@mail.gmail.com>
Message-ID: <CAAFQd5Bs6NnsoOP1NFLREQSLNJs-K33ZvW5ZcdAZTv95WHmPBA@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
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

On Wed, Dec 4, 2019 at 6:16 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > 1. Focus on only decoder/encoder functionalities first.
> >
> > As Tomasz said earlier in this thread, it'd be too complicated to support camera
> > usage at the same time. So, I'd suggest to make it just a generic mem-to-mem
> > video processing device protocol for now.
> > If we finally decide to support camera in this protocol, we can add it later.
>
> Agree.
>
> > 2. Only one feature bit can be specified for one device.
> >
> > I'd like to have a decoder device and encoder device separately.
> > It'd be natural to assume it because a decoder and an encoder are provided as
> > different hardware.
>
> Hmm, modern GPUs support both encoding and decoding ...
>

Many SoC architectures have completely separate IP blocks for encoding
and decoding. Similarly, in GPUs those are usually completely separate
parts of the pipeline.

> I don't think we should bake that restriction into the specification.
> It probably makes sense to use one virtqueue per function though, that
> will simplify dispatching in both host and guest.
>

Wouldn't it make the handling easier if we had one virtio device per function?

[snip]

> > > +\begin{lstlisting}
> > > +enum virtio_video_pixel_format {
> > > +       VIRTIO_VIDEO_PIX_FMT_UNDEFINED = 0,
> > > +
> > > +       VIRTIO_VIDEO_PIX_FMT_H264 = 0x0100,
> > > +       VIRTIO_VIDEO_PIX_FMT_NV12,
> > > +       VIRTIO_VIDEO_PIX_FMT_NV21,
> > > +       VIRTIO_VIDEO_PIX_FMT_I420,
> > > +       VIRTIO_VIDEO_PIX_FMT_I422,
> > > +       VIRTIO_VIDEO_PIX_FMT_XBGR,
> > > +};
> >
> > I'm wondering if we can use FOURCC instead. So, we can avoid reinventing a
> > mapping from formats to integers.
> > Also, I suppose the word "pixel formats" means only raw (decoded) formats.
> > But, it can be encoded format like H.264. So, I guess "image format" or
> > "fourcc" is a better word choice.
>
> Use separate pixel_format (fourcc) and stream_format (H.264 etc.) enums?
>

I'd specifically avoid FourCC here, as it's very loosely defined and
could introduce confusion. A separate enum for "image formats",
including both  sounds good to me.

> > > +\begin{lstlisting}
> > > +struct virtio_video_function {
> > > +       struct virtio_video_desc desc;
> > > +       __le32 function_type; /* One of VIRTIO_VIDEO_FUNC_* types */
> > > +       __le32 function_id;
> > > +       struct virtio_video_params in_params;
> > > +       struct virtio_video_params out_params;
> > > +       __le32 num_caps;
> > > +       __u8 padding[4];
> > > +       /* Followed by struct virtio_video_capability video_caps[]; */
> > > +};
> > > +\end{lstlisting}
> >
> > If one device only has one functionality, virtio_video_function's fields will be
> > no longer needed except in_params and out_params. So, we'd be able to remove
> > virtio_video_function and have in_params and out_params in
> > virtio_video_capability instead.
>
> Same goes for per-function virtqueues (used virtqueue implies function).
>
> > > +\begin{lstlisting}
> > > +struct virtio_video_resource_detach_backing {
> > > +       struct virtio_video_ctrl_hdr hdr;
> > > +       __le32 resource_id;
> > > +       __u8 padding[4];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +\item[\field{resource_id}] internal id of the resource.
> > > +\end{description}
> >
> > I suppose that it'd be better not to have the above series of T_RESOURCE
> > controls at least until we reach a conclusion in the thread of buffer-sharing
> > device. If we end up concluding this type of controls is the best way, we'll be
> > able to revisit here.
>
> Well.  For buffer management there are a bunch of options.
>
>  (1) Simply stick the buffers (well, pointers to the buffer pages) into
>      the virtqueue.  This is the standard virtio way.
>
>  (2) Create resources, then put the resource ids into the virtqueue.
>      virtio-gpu uses that model.  First, because virtio-gpu needs an id
>      to reference resources in the rendering command stream
>      (virtio-video doesn't need this).  Also because (some kinds of)
>      resources are around for a long time and the guest-physical ->
>      host-virtual mapping needs to be done only once that way (which
>      I think would be the case for virtio-video too because v4l2
>      re-uses buffers in robin-round fashion).  Drawback is this
>      assumes shared memory between host and guest (which is the case
>      in typical use cases but it is not mandated by the virtio spec).
>
>  (3) Import external resources (from virtio-gpu for example).
>      Out of scope for now, will probably added as optional feature
>      later.
>
> I guess long-term we want support either (1)+(3) or (2)+(3).

What this protocol has been proposing is a twist of (1), where there
is a "resource create" call that generates a local "resource ID" for
the given list of guest pages. I think that's a sane approach, given
that the number of pages to describe a buffer worth of 4K video would
be more than 3000. We don't want to send so long lists of pages every
frame, especially since we normally recycle the buffers.

Best regards,
Tomasz
