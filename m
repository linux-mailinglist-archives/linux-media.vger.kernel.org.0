Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7948BF40BB
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 07:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfKHGqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 01:46:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34676 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725372AbfKHGqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 01:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573195561;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m/bqLadfwOeTsU/ItI+7qu4upomyLm0ZZcfICGf4qy4=;
        b=ghksLWxLte7NmrUz9Jai9oToHD5T4in+zJK5iHo2N72uyOtyxVpDnF2pMTRXIQEcmgQ0xc
        A8NoHCTxjkEDhz3NNZddbGOi1wdqv8L9JGL7f2/JbkVPg2BW5c53lAtR216IKXqAPodH1l
        k1dI9CLZ8WdcTeQqC3kuzMKHv0z9UJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-vLLi-eBjPey_43z9I0lf6Q-1; Fri, 08 Nov 2019 01:45:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00B388017DD;
        Fri,  8 Nov 2019 06:45:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 265E660BE2;
        Fri,  8 Nov 2019 06:45:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 56AAC11AAA; Fri,  8 Nov 2019 07:45:52 +0100 (CET)
Date:   Fri, 8 Nov 2019 07:45:52 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc:     Stefan Hajnoczi <stefanha@gmail.com>, geoff@hostfission.com,
        virtio-dev@lists.oasis-open.org, Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel@nongnu.org, Tomasz Figa <tfiga@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
Message-ID: <20191108064552.hel54p6vvdpir2dp@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <20191106101057.GC2802@work-vm>
 <20191107111119.qgr2qxgdf64jurin@sirius.home.kraxel.org>
 <20191107111618.GE2816@work-vm>
MIME-Version: 1.0
In-Reply-To: <20191107111618.GE2816@work-vm>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: vLLi-eBjPey_43z9I0lf6Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 07, 2019 at 11:16:18AM +0000, Dr. David Alan Gilbert wrote:
> * Gerd Hoffmann (kraxel@redhat.com) wrote:
> >   Hi,
> >=20
> > > > This is not about host memory, buffers are in guest ram, everything=
 else
> > > > would make sharing those buffers between drivers inside the guest (=
as
> > > > dma-buf) quite difficult.
> > >=20
> > > Given it's just guest memory, can the guest just have a virt queue on
> > > which it places pointers to the memory it wants to share as elements =
in
> > > the queue?
> >=20
> > Well, good question.  I'm actually wondering what the best approach is
> > to handle long-living, large buffers in virtio ...
> >=20
> > virtio-blk (and others) are using the approach you describe.  They put =
a
> > pointer to the io request header, followed by pointer(s) to the io
> > buffers directly into the virtqueue.  That works great with storage for
> > example.  The queue entries are tagged being "in" or "out" (driver to
> > device or visa-versa), so the virtio transport can set up dma mappings
> > accordingly or even transparently copy data if needed.
> >=20
> > For long-living buffers where data can potentially flow both ways this
> > model doesn't fit very well though.  So what virtio-gpu does instead is
> > transferring the scatter list as virtio payload.  Does feel a bit
> > unclean as it doesn't really fit the virtio architecture.  It assumes
> > the host can directly access guest memory for example (which is usually
> > the case but explicitly not required by virtio).  It also requires
> > quirks in virtio-gpu to handle VIRTIO_F_IOMMU_PLATFORM properly, which
> > in theory should be handled fully transparently by the virtio-pci
> > transport.
> >=20
> > We could instead have a "create-buffer" command which adds the buffer
> > pointers as elements to the virtqueue as you describe.  Then simply
> > continue using the buffer even after completing the "create-buffer"
> > command.  Which isn't exactly clean either.  It would likewise assume
> > direct access to guest memory, and it would likewise need quirks for
> > VIRTIO_F_IOMMU_PLATFORM as the virtio-pci transport tears down the dma
> > mappings for the virtqueue entries after command completion.
> >=20
> > Comments, suggestions, ideas?
>=20
> What about not completing the command while the device is using the
> memory?

Thought about that too, but I don't think this is a good idea for
buffers which exist for a long time.

Example #1:  A video decoder would setup a bunch of buffers and use
them robin-round, so they would exist until the video playback is
finished.

Example #2:  virtio-gpu creates a framebuffer for fbcon which exists
forever.  And virtio-gpu potentially needs lots of buffers.  With 3d
active there can be tons of objects.  Although they typically don't
stay around that long we would still need a pretty big virtqueue to
store them all I guess.

And it also doesn't fully match the virtio spirit, it still assumes
direct guest memory access.  Without direct guest memory access
updates to the fbcon object would never reach the host for example.
In case a iommu is present we might need additional dma map flushes
for updates happening after submitting the lingering "create-buffer"
command.

cheers,
  Gerd

