Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAAE1126D5
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 10:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfLDJQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 04:16:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21057 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725922AbfLDJQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 04:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575450987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QBccjNSCLnwd3fflDzCoIAWbAHnsdDf9AN1n8XBjZg8=;
        b=LWDkkULgwU7LFpm++BDhMUAluUifDMcTu05EkOdCElWnqIFODXVr91EHrYVjDLoMPN4FMw
        yPd1tQddOWFFtG2e2MwH8cWmGI3tyhyJrivmxDsIEwAS7J7HYrP2yhP/7zELut9TZJTA6v
        9MIuQRVkeCY4VjWCrZyzg+4wY+pDYRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-wLus0kgCN-yHJ8HKrffCiQ-1; Wed, 04 Dec 2019 04:16:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EAEC18A6EC0;
        Wed,  4 Dec 2019 09:16:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com [10.36.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AFD435DA60;
        Wed,  4 Dec 2019 09:16:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id D3DD116E05; Wed,  4 Dec 2019 10:16:20 +0100 (CET)
Date:   Wed, 4 Dec 2019 10:16:20 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org, Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device
 specification
Message-ID: <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org>
 <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: wLus0kgCN-yHJ8HKrffCiQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> 1. Focus on only decoder/encoder functionalities first.
>=20
> As Tomasz said earlier in this thread, it'd be too complicated to support=
 camera
> usage at the same time. So, I'd suggest to make it just a generic mem-to-=
mem
> video processing device protocol for now.
> If we finally decide to support camera in this protocol, we can add it la=
ter.

Agree.

> 2. Only one feature bit can be specified for one device.
>=20
> I'd like to have a decoder device and encoder device separately.
> It'd be natural to assume it because a decoder and an encoder are provide=
d as
> different hardware.

Hmm, modern GPUs support both encoding and decoding ...

I don't think we should bake that restriction into the specification.
It probably makes sense to use one virtqueue per function though, that
will simplify dispatching in both host and guest.

> 3. Separate buffer allocation functionalities from virtio-video protocol.
>=20
> To support various ways of guest/host buffer sharing, we might want to ha=
ve a
> dedicated buffer sharing device as we're discussing in another thread. Un=
til we
> reach consensus there, it'd be good not to have buffer allocation
> functionalities in virtio-video.

I think virtio-video should be able to work as stand-alone device,
so we need some way to allocate buffers ...

Buffer sharing with other devices can be added later.

> > +The virtio video device is a virtual video streaming device that suppo=
rts the
> > +following functions: encoder, decoder, capture, output.
> > +
> > +\subsection{Device ID}\label{sec:Device Types / Video Device / Device =
ID}
> > +
> > +TBD.
>=20
> I'm wondering how and when we can determine and reserve this ID?

Grab the next free, update the spec accordingly, submit the one-line
patch.

> > +\begin{lstlisting}
> > +enum virtio_video_pixel_format {
> > +       VIRTIO_VIDEO_PIX_FMT_UNDEFINED =3D 0,
> > +
> > +       VIRTIO_VIDEO_PIX_FMT_H264 =3D 0x0100,
> > +       VIRTIO_VIDEO_PIX_FMT_NV12,
> > +       VIRTIO_VIDEO_PIX_FMT_NV21,
> > +       VIRTIO_VIDEO_PIX_FMT_I420,
> > +       VIRTIO_VIDEO_PIX_FMT_I422,
> > +       VIRTIO_VIDEO_PIX_FMT_XBGR,
> > +};
>=20
> I'm wondering if we can use FOURCC instead. So, we can avoid reinventing =
a
> mapping from formats to integers.
> Also, I suppose the word "pixel formats" means only raw (decoded) formats=
.
> But, it can be encoded format like H.264. So, I guess "image format" or
> "fourcc" is a better word choice.

Use separate pixel_format (fourcc) and stream_format (H.264 etc.) enums?

> > +\begin{lstlisting}
> > +struct virtio_video_function {
> > +       struct virtio_video_desc desc;
> > +       __le32 function_type; /* One of VIRTIO_VIDEO_FUNC_* types */
> > +       __le32 function_id;
> > +       struct virtio_video_params in_params;
> > +       struct virtio_video_params out_params;
> > +       __le32 num_caps;
> > +       __u8 padding[4];
> > +       /* Followed by struct virtio_video_capability video_caps[]; */
> > +};
> > +\end{lstlisting}
>=20
> If one device only has one functionality, virtio_video_function's fields =
will be
> no longer needed except in_params and out_params. So, we'd be able to rem=
ove
> virtio_video_function and have in_params and out_params in
> virtio_video_capability instead.

Same goes for per-function virtqueues (used virtqueue implies function).

> > +\begin{lstlisting}
> > +struct virtio_video_resource_detach_backing {
> > +       struct virtio_video_ctrl_hdr hdr;
> > +       __le32 resource_id;
> > +       __u8 padding[4];
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +\item[\field{resource_id}] internal id of the resource.
> > +\end{description}
>=20
> I suppose that it'd be better not to have the above series of T_RESOURCE
> controls at least until we reach a conclusion in the thread of buffer-sha=
ring
> device. If we end up concluding this type of controls is the best way, we=
'll be
> able to revisit here.

Well.  For buffer management there are a bunch of options.

 (1) Simply stick the buffers (well, pointers to the buffer pages) into
     the virtqueue.  This is the standard virtio way.

 (2) Create resources, then put the resource ids into the virtqueue.
     virtio-gpu uses that model.  First, because virtio-gpu needs an id
     to reference resources in the rendering command stream
     (virtio-video doesn't need this).  Also because (some kinds of)
     resources are around for a long time and the guest-physical ->
     host-virtual mapping needs to be done only once that way (which
     I think would be the case for virtio-video too because v4l2
     re-uses buffers in robin-round fashion).  Drawback is this
     assumes shared memory between host and guest (which is the case
     in typical use cases but it is not mandated by the virtio spec).

 (3) Import external resources (from virtio-gpu for example).
     Out of scope for now, will probably added as optional feature
     later.

I guess long-term we want support either (1)+(3) or (2)+(3).

cheers,
  Gerd

