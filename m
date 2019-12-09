Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D8D116ED9
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 15:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbfLIOTM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 09:19:12 -0500
Received: from plasma6.jpberlin.de ([80.241.56.68]:59695 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727200AbfLIOTM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 09:19:12 -0500
Received: from spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125])
        by plasma.jpberlin.de (Postfix) with ESMTP id 1968DA06C6;
        Mon,  9 Dec 2019 15:19:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id uum_XB-Uj68o; Mon,  9 Dec 2019 15:19:03 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 66F40A0905;
        Mon,  9 Dec 2019 15:19:02 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 9 Dec 2019
 15:19:01 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <virtio-dev@lists.oasis-open.org>
CC:     Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
Date:   Mon, 9 Dec 2019 15:19:01 +0100
Message-ID: <9280087.Px4QY1m31c@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com> <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com> <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'd like to invite everyone to share ideas regarding required encoder features 
in this separate sub-tree.

In general, encoder devices are more complex compared to decoders. So the 
question I'd like to rise is in what way we define the minimal subset of 
features to be implemented by the virtio-video.

We may look at the following to define the set of features:
1. USB video, 2.3.6 Encoding Unit [1].
2. Android 10 Compatibility Definition [2].

Would be nice to hear about any specific requirements from the Chromium team as 
well.

[1] https://www.usb.org/sites/default/files/USB_Video_Class_1_5.zip
[2] https://source.android.com/compatibility/android-cdd#5_2_video_encoding

Thank you.

Best regards,
Dmitry.

On Mittwoch, 4. Dezember 2019 10:16:20 CET Gerd Hoffmann wrote:
>   Hi,
> 
> > 1. Focus on only decoder/encoder functionalities first.
> > 
> > As Tomasz said earlier in this thread, it'd be too complicated to support
> > camera usage at the same time. So, I'd suggest to make it just a generic
> > mem-to-mem video processing device protocol for now.
> > If we finally decide to support camera in this protocol, we can add it
> > later.
> Agree.
> 
> > 2. Only one feature bit can be specified for one device.
> > 
> > I'd like to have a decoder device and encoder device separately.
> > It'd be natural to assume it because a decoder and an encoder are provided
> > as different hardware.
> 
> Hmm, modern GPUs support both encoding and decoding ...
> 
> I don't think we should bake that restriction into the specification.
> It probably makes sense to use one virtqueue per function though, that
> will simplify dispatching in both host and guest.
> 
> > 3. Separate buffer allocation functionalities from virtio-video protocol.
> > 
> > To support various ways of guest/host buffer sharing, we might want to
> > have a dedicated buffer sharing device as we're discussing in another
> > thread. Until we reach consensus there, it'd be good not to have buffer
> > allocation
> > functionalities in virtio-video.
> 
> I think virtio-video should be able to work as stand-alone device,
> so we need some way to allocate buffers ...
> 
> Buffer sharing with other devices can be added later.
> 
> > > +The virtio video device is a virtual video streaming device that
> > > supports the +following functions: encoder, decoder, capture, output.
> > > +
> > > +\subsection{Device ID}\label{sec:Device Types / Video Device / Device
> > > ID}
> > > +
> > > +TBD.
> > 
> > I'm wondering how and when we can determine and reserve this ID?
> 
> Grab the next free, update the spec accordingly, submit the one-line
> patch.
> 
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
> > If one device only has one functionality, virtio_video_function's fields
> > will be no longer needed except in_params and out_params. So, we'd be
> > able to remove virtio_video_function and have in_params and out_params in
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
> > controls at least until we reach a conclusion in the thread of
> > buffer-sharing device. If we end up concluding this type of controls is
> > the best way, we'll be able to revisit here.
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
> 
> cheers,
>   Gerd


