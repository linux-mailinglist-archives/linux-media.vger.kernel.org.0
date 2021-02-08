Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA723312B57
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 08:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhBHH7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 02:59:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34604 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229984AbhBHH7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 02:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612771076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=l3awWSy5e6riy2O68pZN3zZ2GQr/MiEbcpjT4NcEwmQ=;
        b=Vx+sFP5LwVsS+EeLy+XFMpSav652lQqoVE333Yl9JsRM+9As1690zT5W2exmr3CahrPyok
        k2jyGPbmzt/ou35dRVgHIHbYjbDXEc2LiEaHaMeWuY0/3DPhf9IVYsfLogorCR7aTfRVVq
        NAzWjNq9SuvTEZeLlkwdhjYJ1JhblKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-XTrgxfrMO46qeBaXVqHbnw-1; Mon, 08 Feb 2021 02:57:52 -0500
X-MC-Unique: XTrgxfrMO46qeBaXVqHbnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6244B91284;
        Mon,  8 Feb 2021 07:57:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-170.ams2.redhat.com [10.36.112.170])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D36F91A86F;
        Mon,  8 Feb 2021 07:57:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 4195E18000AF; Mon,  8 Feb 2021 08:57:48 +0100 (CET)
Date:   Mon, 8 Feb 2021 08:57:48 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Vivek Kasireddy <vivek.kasireddy@intel.com>,
        virtualization@lists.linux-foundation.org,
        dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
        daniel.vetter@ffwll.ch, dongwon.kim@intel.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-media@vger.kernel.org
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YB1sRx1GrT8rATEg@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > +/* extract pages referenced by sgt */
> > +static struct page **extr_pgs(struct sg_table *sgt, int *nents, int *last_len)
> 
> Nack, this doesn't work on dma-buf. And it'll blow up at runtime when you
> enable the very recently merged CONFIG_DMABUF_DEBUG (would be good to test
> with that, just to make sure).

> Aside from this, for virtio/kvm use-cases we've already merged the udmabuf
> driver. Does this not work for your usecase?

udmabuf can be used on the host side to make a collection of guest pages
available as host dmabuf.  It's part of the puzzle, but not a complete
solution.

As I understand it the intended workflow is this:

  (1) guest gpu driver exports some object as dma-buf
  (2) dma-buf is imported into this new driver.
  (3) driver sends the pages to the host.
  (4) hypervisor uses udmabuf to create a host dma-buf.
  (5) host dma-buf is passed on.

And step (3) is the problematic one as this will not
work in case the dma-buf doesn't live in guest ram but
in -- for example -- gpu device memory.

Reversing the driver roles in the guest (virtio driver
allocates pages and exports the dma-buf to the guest
gpu driver) should work fine.

Which btw is something you can do today with virtio-gpu.
Maybe it makes sense to have the option to run virtio-gpu
in render-only mode for that use case.

take care,
  Gerd

