Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBC6F2D20
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 12:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388241AbfKGLLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 06:11:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56269 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387846AbfKGLL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 06:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573125088;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0aGeSVzgwKjsrXKMdq8Ivn9Y5aaE1IhMsIqpWtxZrHI=;
        b=aNn30DyYyeQFo2vUQ7xgtMwLcPHU0ZjSzriJ2GEkggsL87moBc8bQp2SpSLiBgijHofozX
        zsPTtZbATnrzgyapwJX4tv5s/Fx1PT4J6lBV9DxSsKBRmmRFB9FSpt0kQwueHE3feHzxEa
        ythXiQZqlOk7nBQgFwlsZ3Ta23ZRaUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-im4jj4FlO2-FPvAmStvLNQ-1; Thu, 07 Nov 2019 06:11:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C0951005500;
        Thu,  7 Nov 2019 11:11:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com [10.36.116.69])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C25941001B09;
        Thu,  7 Nov 2019 11:11:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id F3CEA17535; Thu,  7 Nov 2019 12:11:19 +0100 (CET)
Date:   Thu, 7 Nov 2019 12:11:19 +0100
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
Message-ID: <20191107111119.qgr2qxgdf64jurin@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <20191106101057.GC2802@work-vm>
MIME-Version: 1.0
In-Reply-To: <20191106101057.GC2802@work-vm>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: im4jj4FlO2-FPvAmStvLNQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > This is not about host memory, buffers are in guest ram, everything els=
e
> > would make sharing those buffers between drivers inside the guest (as
> > dma-buf) quite difficult.
>=20
> Given it's just guest memory, can the guest just have a virt queue on
> which it places pointers to the memory it wants to share as elements in
> the queue?

Well, good question.  I'm actually wondering what the best approach is
to handle long-living, large buffers in virtio ...

virtio-blk (and others) are using the approach you describe.  They put a
pointer to the io request header, followed by pointer(s) to the io
buffers directly into the virtqueue.  That works great with storage for
example.  The queue entries are tagged being "in" or "out" (driver to
device or visa-versa), so the virtio transport can set up dma mappings
accordingly or even transparently copy data if needed.

For long-living buffers where data can potentially flow both ways this
model doesn't fit very well though.  So what virtio-gpu does instead is
transferring the scatter list as virtio payload.  Does feel a bit
unclean as it doesn't really fit the virtio architecture.  It assumes
the host can directly access guest memory for example (which is usually
the case but explicitly not required by virtio).  It also requires
quirks in virtio-gpu to handle VIRTIO_F_IOMMU_PLATFORM properly, which
in theory should be handled fully transparently by the virtio-pci
transport.

We could instead have a "create-buffer" command which adds the buffer
pointers as elements to the virtqueue as you describe.  Then simply
continue using the buffer even after completing the "create-buffer"
command.  Which isn't exactly clean either.  It would likewise assume
direct access to guest memory, and it would likewise need quirks for
VIRTIO_F_IOMMU_PLATFORM as the virtio-pci transport tears down the dma
mappings for the virtqueue entries after command completion.

Comments, suggestions, ideas?

cheers,
  Gerd

