Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B149B114CA9
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 08:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfLFHcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 02:32:12 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49873 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726184AbfLFHcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Dec 2019 02:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575617531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fgvU3ge84yD+8UbbqgUeqbPHxhOgQkWyMPmSswsCZwM=;
        b=dKSp3r50KzJXtG7Tb2NVAkMYDsIfQleOPp0WmcJlp5w4w48C5HAgJLZsArRbGVTMACQT0B
        ZchvCMnj1ksp/hjC0hKBrmcezT0vGUkq5aMAsLmfJj6sRGQyWi8trdNhxHez0rJnSgjlyn
        IUzd/0h+V7F4ODOYqtVV1H9WGK5f31I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-6T_FzXo6MVmIfpIHiXrnvw-1; Fri, 06 Dec 2019 02:32:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F250DBE5;
        Fri,  6 Dec 2019 07:32:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com [10.36.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 83C22608E5;
        Fri,  6 Dec 2019 07:32:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 573AB16E18; Fri,  6 Dec 2019 08:32:05 +0100 (CET)
Date:   Fri, 6 Dec 2019 08:32:05 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Enrico Granata <egranata@google.com>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
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
Message-ID: <20191206073205.4f3bbqbyeyxeipsx@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org>
 <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
 <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org>
 <CAPR809uYEjSGqPA57HiDgTf7MESrXnsCKwvSEQQ8LfMvCJwaaQ@mail.gmail.com>
 <CAD90VcaTWvos-PPrniZn_AfFQrCEkMHNXvhR56ApD8kfdTSG9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD90VcaTWvos-PPrniZn_AfFQrCEkMHNXvhR56ApD8kfdTSG9g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 6T_FzXo6MVmIfpIHiXrnvw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > > > > +\subsection{Device ID}\label{sec:Device Types / Video Device / D=
evice ID}
> > > > > +
> > > > > +TBD.
> > > >
> > > > I'm wondering how and when we can determine and reserve this ID?
> > >
> > > Grab the next free, update the spec accordingly, submit the one-line
> > > patch.
>=20
> Thanks. I will do so at the next version of the patch.

No.  Submit as separate one-liner patch which does nothing but grabbing
an ID.

> > > > I'm wondering if we can use FOURCC instead. So, we can avoid reinve=
nting a
> > > > mapping from formats to integers.
> > > > Also, I suppose the word "pixel formats" means only raw (decoded) f=
ormats.
> > > > But, it can be encoded format like H.264. So, I guess "image format=
" or
> > > > "fourcc" is a better word choice.
> > >
> > > Use separate pixel_format (fourcc) and stream_format (H.264 etc.) enu=
ms?
> > >
>=20
> Fourcc is used for both raw and coded formats.
> I'm not sure if it makes much sense to define different enums for raw
> and coded formats, as
> we reuse any other structs for both types of formats.
>=20
> What I'd suggest is like this:
>=20
> #define FOURCC(a,b,c,d) (a | (b << 8) | (c << 16) | (d << 24))
>=20
> enum virtio_video_fourcc {
>     VIRTIO_VIDEO_FOURCC_UNDEFINED =3D 0,
>=20
>     /* Coded formats */
>     VIRTIO_VIDEO_FOURCC_H264 =3D FOURCC('H', '2', '6', '4'),
>     ...
>=20
>     /* Raw formats */
>     VIRTIO_VIDEO_FOURCC_NV12 =3D FOURCC('N', 'V', '1', '2'),
>     ...
> }

Ok, that'll work.

I've linked fourcc to drm fourcc codes in my head, and drm hasn't codes
for the compressed formats.

When defining things this way we should of course make sure that the raw
format codes are identical to the ones drm uses.

Is there a formal standard for these codes btw?

> > As an interim solution, this form of "manual resource backing-store
> > management" could be specified as a feature flag.
> > Once there is an established solution for buffer sharing, we would
> > then go ahead and introduce a new feature flag for "works with the
> > buffer sharing mechanism", as an alternative to this manual mechanism.
> >
> > wdyt?
>=20
> It'd be a good idea to change buffer management method by a feature flag.

I don't think so.  A device might want support multiple kinds of buffer
management, most notably both their own buffers and imported buffers.
Indicating which methods are available can be done with feature flags,
but actually picking one not.

> > > Well.  For buffer management there are a bunch of options.
> > >
> > >  (1) Simply stick the buffers (well, pointers to the buffer pages) in=
to
> > >      the virtqueue.  This is the standard virtio way.
> > >
> > >  (2) Create resources, then put the resource ids into the virtqueue.
> > >      virtio-gpu uses that model.  First, because virtio-gpu needs an =
id
> > >      to reference resources in the rendering command stream
> > >      (virtio-video doesn't need this).  Also because (some kinds of)
> > >      resources are around for a long time and the guest-physical ->
> > >      host-virtual mapping needs to be done only once that way (which
> > >      I think would be the case for virtio-video too because v4l2
> > >      re-uses buffers in robin-round fashion).  Drawback is this
> > >      assumes shared memory between host and guest (which is the case
> > >      in typical use cases but it is not mandated by the virtio spec).
> > >
> > >  (3) Import external resources (from virtio-gpu for example).
> > >      Out of scope for now, will probably added as optional feature
> > >      later.
> > >
> > > I guess long-term we want support either (1)+(3) or (2)+(3).
> > >
>=20
> In the first version of spec, we might want to support the minimal workab=
le set
> of controls. Then, we'll be able to add additional controls with a new fe=
ature
> flag as Enrico suggested.
>=20
> So, the problem is what's the simplest scenario and which types of contro=
ls are
> required there. I guess it's enough for (1) and (2) if we have T_RESOURCE=
_CREATE
> and T_RESOURCE_DESTROY.

For (1) you'll simply do a QUEUE_BUFFER.  The command carries references
to the buffer pages.  No resource management needed.

For (2) you'll have RESOURCE_CREATE + RESOURCE_DESTROY + QUEUE_RESOURCE,
where RESOURCE_CREATE passes the scatter list of buffer pages to the
host and QUEUE_RESOURCE will carry just the resource id.

For (3) you'll have RESOURCE_IMPORT + RESOURCE_DESTROY + QUEUE_RESOURCE.

cheers,
  Gerd

