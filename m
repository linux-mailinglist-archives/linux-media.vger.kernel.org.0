Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9C36F0ED7
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 07:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfKFGYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 01:24:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39322 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725948AbfKFGYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 01:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573021475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EVHuDeKp/JxkWn+leUSttm6AS7WtVdk/IpNuvOqG84Y=;
        b=VVAM2QUm+o5rN1jdMi3mu6WMo9rdMZpqt34o7fxFxgGKV3zXos0Ndg2ypixK3eYCZOy4rh
        Os+7my5S8cTnF8GH22U+WH1t4fupPmRqnNXx1hwpVpQcRif+rjoUPCTAcMfnuJ0u71J+mj
        0VJqsa92v8RzKWVRSpMsBTDea7hN5pA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-G0Ceot-oMl2pUt67I-20Dw-1; Wed, 06 Nov 2019 01:24:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09F028017DE;
        Wed,  6 Nov 2019 06:24:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 125F11001B00;
        Wed,  6 Nov 2019 06:24:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 4021611AAA; Wed,  6 Nov 2019 07:24:28 +0100 (CET)
Date:   Wed, 6 Nov 2019 07:24:28 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Geoffrey McRae <geoff@hostfission.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Subject: Re: guest / host buffer sharing ...
Message-ID: <20191106062428.4ammt22igf5d6zve@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <7255d3ca5f10bbf14b1a3fcb6ac34a19@hostfission.com>
MIME-Version: 1.0
In-Reply-To: <7255d3ca5f10bbf14b1a3fcb6ac34a19@hostfission.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: G0Ceot-oMl2pUt67I-20Dw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > (1) The virtio device
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Has a single virtio queue, so the guest can send commands to register
> > and unregister buffers.  Buffers are allocated in guest ram.  Each
> > buffer
> > has a list of memory ranges for the data.  Each buffer also has some
> > properties to carry metadata, some fixed (id, size, application), but
> > also allow free form (name =3D value, framebuffers would have
> > width/height/stride/format for example).
> >=20
>=20
> Perfect, however since it's to be a generic device there also needs to be=
 a
> method in the guest to identify which device is the one the application i=
s
> interested in without opening the device.

This is what the application buffer property is supposed to handle, i.e.
you'll have a single device, all applications share it and the property
tells which buffer belongs to which application.

> The device should also support a reset feature allowing the guest to
> notify the host application that all buffers have become invalid such as
> on abnormal termination of the guest application that is using the device=
.

The guest driver should cleanup properly (i.e. unregister all buffers)
when an application terminates of course, no matter what the reason is
(crash, exit without unregistering buffers, ...).  Doable without a full
device reset.

Independent from that a full reset will be supported of course, it is a
standard virtio feature.

> Conversely, qemu on unix socket disconnect should notify the guest of thi=
s
> event also, allowing each end to properly syncronize.

I was thinking more about a simple guest-side publishing of buffers,
without a backchannel.  If more coordination is needed you can use
vsocks for that for example.

> > (3) The qemu host implementation
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > qemu (likewise other vmms) can use the udmabuf driver to create
> > host-side dma-bufs for the buffers.  The dma-bufs can be passed to
> > anyone interested, inside and outside qemu.  We'll need some protocol
> > for communication between qemu and external users interested in those
> > buffers, to receive dma-bufs (via unix file descriptor passing) and
> > update notifications.

Using vhost for the host-side implementation should be possible too.

> > Dispatching updates could be done based on the
> > application property, which could be "virtio-vdec" or "wayland-proxy"
> > for example.
>=20
> I don't know enough about udmabuf to really comment on this except to ask
> a question. Would this make guest to guest transfers without an
> intermediate buffer possible?

Yes.

cheers,
  Gerd

