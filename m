Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A21EA113CF6
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 09:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfLEIVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 03:21:39 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41965 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfLEIVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 03:21:39 -0500
Received: by mail-lf1-f67.google.com with SMTP id m30so1771680lfp.8
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 00:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MHYE3fECGhdtSM+D4xtS+joeT+ZdT5McaZlELUxNN3w=;
        b=eYXF60MR24RC2zgOPn9uXt/VISErfVSRcyNlI7D6EeTQq1iaH1ZGzzU+uC+h/lWo3I
         ppEn/IuGBu3GBRO4EEnH2VAUcsIrE9Jtk++hQ0UlnDK54Ww6nG0CjN5x0WyX4UzcZBmI
         0d7REFKOe2p+el6/2+YC8c4UhjqITrkLEgCzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MHYE3fECGhdtSM+D4xtS+joeT+ZdT5McaZlELUxNN3w=;
        b=gzpLZ8qchZiaJWioq0TjmxxL2eangbYu8G+UPTl7oplvmB3w2T/bY+RkPr3VTogaaz
         lEHcU7XfI4zvF29gxRIEw3CIPAX+mTJRcRy6Re66ZpY8bVGtxSt538XD0zJ0y32e8P10
         oL/KlquR8+47aoDV1mNwKzz0/yO0C9S48aPLxunt1CfNVLWAxPUZjhUCFcR3i+ORmXL0
         4LsgPzh30M0wvftp2ri68B8zPdZuvNew3Xw2UViyV14y7GOvf24dZRmrKdZBb6mREwf6
         kscH+zdg/t3AVSDmNP9yMagiVES87h5OoLVijHe3zYbyZWpuMHqoQ1L38jDNF83hmmEj
         6Rhg==
X-Gm-Message-State: APjAAAUH4sGjJQTD2CN0ap+chgVy2xBVpnZnohTzUQeScl1fCSj3XfM/
        6aZjmXFGY9H51A5c/567CvVt4hSAzQEQL7V3NYwF1g==
X-Google-Smtp-Source: APXvYqx+6KnCuIhRK0mABOu8dGzFFZVfLQVsJjs3lgkaYAFz5j7bpVbKvVH2zl0fULZSWunhLqRMHMZH8hBo8KOGN5o=
X-Received: by 2002:a19:7502:: with SMTP id y2mr3815391lfe.55.1575534096946;
 Thu, 05 Dec 2019 00:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org> <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
 <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org> <CAPR809uYEjSGqPA57HiDgTf7MESrXnsCKwvSEQQ8LfMvCJwaaQ@mail.gmail.com>
In-Reply-To: <CAPR809uYEjSGqPA57HiDgTf7MESrXnsCKwvSEQQ8LfMvCJwaaQ@mail.gmail.com>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Thu, 5 Dec 2019 17:21:25 +0900
Message-ID: <CAD90VcaTWvos-PPrniZn_AfFQrCEkMHNXvhR56ApD8kfdTSG9g@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
To:     Enrico Granata <egranata@google.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org, Tomasz Figa <tfiga@chromium.org>,
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

Hi,

On Thu, Dec 5, 2019 at 4:12 AM Enrico Granata <egranata@google.com> wrote:
>
> On Wed, Dec 4, 2019 at 1:16 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > 1. Focus on only decoder/encoder functionalities first.
> > >
> > > As Tomasz said earlier in this thread, it'd be too complicated to support camera
> > > usage at the same time. So, I'd suggest to make it just a generic mem-to-mem
> > > video processing device protocol for now.
> > > If we finally decide to support camera in this protocol, we can add it later.
> >
> > Agree.
> >
> > > 2. Only one feature bit can be specified for one device.
> > >
> > > I'd like to have a decoder device and encoder device separately.
> > > It'd be natural to assume it because a decoder and an encoder are provided as
> > > different hardware.
> >
> > Hmm, modern GPUs support both encoding and decoding ...
> >
> > I don't think we should bake that restriction into the specification.
> > It probably makes sense to use one virtqueue per function though, that
> > will simplify dispatching in both host and guest.
> >

It'd be a better idea to have a set of virtqueues for each function.
So, we will have 2 * (# of features provided) virtqueues, as one
function requires controlq
and eventq.

> > > 3. Separate buffer allocation functionalities from virtio-video protocol.
> > >
> > > To support various ways of guest/host buffer sharing, we might want to have a
> > > dedicated buffer sharing device as we're discussing in another thread. Until we
> > > reach consensus there, it'd be good not to have buffer allocation
> > > functionalities in virtio-video.
> >
> > I think virtio-video should be able to work as stand-alone device,
> > so we need some way to allocate buffers ...
> >
> > Buffer sharing with other devices can be added later.

Good point. Then, we should have T_RESOURCE_CREATE and T_RESOURCE_DESTROY
at least.

> >
> > > > +The virtio video device is a virtual video streaming device that supports the
> > > > +following functions: encoder, decoder, capture, output.
> > > > +
> > > > +\subsection{Device ID}\label{sec:Device Types / Video Device / Device ID}
> > > > +
> > > > +TBD.
> > >
> > > I'm wondering how and when we can determine and reserve this ID?
> >
> > Grab the next free, update the spec accordingly, submit the one-line
> > patch.

Thanks. I will do so at the next version of the patch.

> >
> > > > +\begin{lstlisting}
> > > > +enum virtio_video_pixel_format {
> > > > +       VIRTIO_VIDEO_PIX_FMT_UNDEFINED = 0,
> > > > +
> > > > +       VIRTIO_VIDEO_PIX_FMT_H264 = 0x0100,
> > > > +       VIRTIO_VIDEO_PIX_FMT_NV12,
> > > > +       VIRTIO_VIDEO_PIX_FMT_NV21,
> > > > +       VIRTIO_VIDEO_PIX_FMT_I420,
> > > > +       VIRTIO_VIDEO_PIX_FMT_I422,
> > > > +       VIRTIO_VIDEO_PIX_FMT_XBGR,
> > > > +};
> > >
> > > I'm wondering if we can use FOURCC instead. So, we can avoid reinventing a
> > > mapping from formats to integers.
> > > Also, I suppose the word "pixel formats" means only raw (decoded) formats.
> > > But, it can be encoded format like H.264. So, I guess "image format" or
> > > "fourcc" is a better word choice.
> >
> > Use separate pixel_format (fourcc) and stream_format (H.264 etc.) enums?
> >

Fourcc is used for both raw and coded formats.
I'm not sure if it makes much sense to define different enums for raw
and coded formats, as
we reuse any other structs for both types of formats.

What I'd suggest is like this:

#define FOURCC(a,b,c,d) (a | (b << 8) | (c << 16) | (d << 24))

enum virtio_video_fourcc {
    VIRTIO_VIDEO_FOURCC_UNDEFINED = 0,

    /* Coded formats */
    VIRTIO_VIDEO_FOURCC_H264 = FOURCC('H', '2', '6', '4'),
    ...

    /* Raw formats */
    VIRTIO_VIDEO_FOURCC_NV12 = FOURCC('N', 'V', '1', '2'),
    ...
}

> > > > +\begin{lstlisting}
> > > > +struct virtio_video_function {
> > > > +       struct virtio_video_desc desc;
> > > > +       __le32 function_type; /* One of VIRTIO_VIDEO_FUNC_* types */
> > > > +       __le32 function_id;
> > > > +       struct virtio_video_params in_params;
> > > > +       struct virtio_video_params out_params;
> > > > +       __le32 num_caps;
> > > > +       __u8 padding[4];
> > > > +       /* Followed by struct virtio_video_capability video_caps[]; */
> > > > +};
> > > > +\end{lstlisting}
> > >
> > > If one device only has one functionality, virtio_video_function's fields will be
> > > no longer needed except in_params and out_params. So, we'd be able to remove
> > > virtio_video_function and have in_params and out_params in
> > > virtio_video_capability instead.
> >
> > Same goes for per-function virtqueues (used virtqueue implies function).
> >
> > > > +\begin{lstlisting}
> > > > +struct virtio_video_resource_detach_backing {
> > > > +       struct virtio_video_ctrl_hdr hdr;
> > > > +       __le32 resource_id;
> > > > +       __u8 padding[4];
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +\begin{description}
> > > > +\item[\field{resource_id}] internal id of the resource.
> > > > +\end{description}
> > >
> > > I suppose that it'd be better not to have the above series of T_RESOURCE
> > > controls at least until we reach a conclusion in the thread of buffer-sharing
> > > device. If we end up concluding this type of controls is the best way, we'll be
> > > able to revisit here.
> >
>
> As an interim solution, this form of "manual resource backing-store
> management" could be specified as a feature flag.
> Once there is an established solution for buffer sharing, we would
> then go ahead and introduce a new feature flag for "works with the
> buffer sharing mechanism", as an alternative to this manual mechanism.
>
> wdyt?

It'd be a good idea to change buffer management method by a feature flag.

>
> > Well.  For buffer management there are a bunch of options.
> >
> >  (1) Simply stick the buffers (well, pointers to the buffer pages) into
> >      the virtqueue.  This is the standard virtio way.
> >
> >  (2) Create resources, then put the resource ids into the virtqueue.
> >      virtio-gpu uses that model.  First, because virtio-gpu needs an id
> >      to reference resources in the rendering command stream
> >      (virtio-video doesn't need this).  Also because (some kinds of)
> >      resources are around for a long time and the guest-physical ->
> >      host-virtual mapping needs to be done only once that way (which
> >      I think would be the case for virtio-video too because v4l2
> >      re-uses buffers in robin-round fashion).  Drawback is this
> >      assumes shared memory between host and guest (which is the case
> >      in typical use cases but it is not mandated by the virtio spec).
> >
> >  (3) Import external resources (from virtio-gpu for example).
> >      Out of scope for now, will probably added as optional feature
> >      later.
> >
> > I guess long-term we want support either (1)+(3) or (2)+(3).
> >

In the first version of spec, we might want to support the minimal workable set
of controls. Then, we'll be able to add additional controls with a new feature
flag as Enrico suggested.

So, the problem is what's the simplest scenario and which types of controls are
required there. I guess it's enough for (1) and (2) if we have T_RESOURCE_CREATE
and T_RESOURCE_DESTROY. We might need to add some fields in the structs, though.
If so, we should add only these two controls first.

Best regards,
Keiichi

> > cheers,
> >   Gerd
> >
> >
> > ---------------------------------------------------------------------
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> >
