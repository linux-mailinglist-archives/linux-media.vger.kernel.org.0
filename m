Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5471BF2D38
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 12:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388120AbfKGLQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 06:16:35 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47099 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727732AbfKGLQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 06:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573125393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xAjtWTZFGVGmU+z+TlpgDIFQ7RxMzAz9ig4BilDW1QY=;
        b=S2nFFohYpbm1D/8MXQYRR/8wWIA004fuILqkjlXSf9PB+yVhtHrM40WhuyPUTU4TIKZq31
        H8bCRWYeZK7XAKW2y5P/J/pgQ/N6FT/ARcVJbGDSNu1toXI2sHhve6EKz49Y9hfDTyxkRm
        ZIiAKsmIAMLO/UjONMaa+8a75y1eYDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-XQ_TWMOzOcuypzi0dH6vLA-1; Thu, 07 Nov 2019 06:16:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 321D51800D7A;
        Thu,  7 Nov 2019 11:16:28 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.14])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F837600F0;
        Thu,  7 Nov 2019 11:16:21 +0000 (UTC)
Date:   Thu, 7 Nov 2019 11:16:18 +0000
From:   "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Stefan Hajnoczi <stefanha@gmail.com>, geoff@hostfission.com,
        virtio-dev@lists.oasis-open.org, Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel@nongnu.org, Tomasz Figa <tfiga@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
Message-ID: <20191107111618.GE2816@work-vm>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <20191106101057.GC2802@work-vm>
 <20191107111119.qgr2qxgdf64jurin@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20191107111119.qgr2qxgdf64jurin@sirius.home.kraxel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: XQ_TWMOzOcuypzi0dH6vLA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

* Gerd Hoffmann (kraxel@redhat.com) wrote:
>   Hi,
>=20
> > > This is not about host memory, buffers are in guest ram, everything e=
lse
> > > would make sharing those buffers between drivers inside the guest (as
> > > dma-buf) quite difficult.
> >=20
> > Given it's just guest memory, can the guest just have a virt queue on
> > which it places pointers to the memory it wants to share as elements in
> > the queue?
>=20
> Well, good question.  I'm actually wondering what the best approach is
> to handle long-living, large buffers in virtio ...
>=20
> virtio-blk (and others) are using the approach you describe.  They put a
> pointer to the io request header, followed by pointer(s) to the io
> buffers directly into the virtqueue.  That works great with storage for
> example.  The queue entries are tagged being "in" or "out" (driver to
> device or visa-versa), so the virtio transport can set up dma mappings
> accordingly or even transparently copy data if needed.
>=20
> For long-living buffers where data can potentially flow both ways this
> model doesn't fit very well though.  So what virtio-gpu does instead is
> transferring the scatter list as virtio payload.  Does feel a bit
> unclean as it doesn't really fit the virtio architecture.  It assumes
> the host can directly access guest memory for example (which is usually
> the case but explicitly not required by virtio).  It also requires
> quirks in virtio-gpu to handle VIRTIO_F_IOMMU_PLATFORM properly, which
> in theory should be handled fully transparently by the virtio-pci
> transport.
>=20
> We could instead have a "create-buffer" command which adds the buffer
> pointers as elements to the virtqueue as you describe.  Then simply
> continue using the buffer even after completing the "create-buffer"
> command.  Which isn't exactly clean either.  It would likewise assume
> direct access to guest memory, and it would likewise need quirks for
> VIRTIO_F_IOMMU_PLATFORM as the virtio-pci transport tears down the dma
> mappings for the virtqueue entries after command completion.
>=20
> Comments, suggestions, ideas?

What about not completing the command while the device is using the
memory?

Dave

> cheers,
>   Gerd
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

