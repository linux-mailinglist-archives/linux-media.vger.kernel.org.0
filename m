Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21C8314ABC
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 09:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhBIIsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 03:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27617 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229991AbhBIIq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 03:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612860301;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EV1+m5DoEAyc5L/tDny8qGFku+twc3qNo0KqVy7dbZ4=;
        b=ds49Yn5U8XWAemWVJGiU27+4gibeU6kRvCc4HysYUWqDfcaGwctyRsU0G/DLq+zxHBt1Lt
        u3mzs+mR0vXGJ8Vl4xaJmbNRaeOVw2CndJ4C2/5zHpNOYuQqs+UGz3z+272PzNThsTyeSN
        b/x8YsA08s3TiIP/yYdYQp49h54hAnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-igZyy2_6Ncy8a--aTqtbwg-1; Tue, 09 Feb 2021 03:44:57 -0500
X-MC-Unique: igZyy2_6Ncy8a--aTqtbwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 686C91020C27;
        Tue,  9 Feb 2021 08:44:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-170.ams2.redhat.com [10.36.112.170])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2D019CA8;
        Tue,  9 Feb 2021 08:44:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 4665118003B6; Tue,  9 Feb 2021 09:44:53 +0100 (CET)
Date:   Tue, 9 Feb 2021 09:44:53 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Vetter, Daniel" <daniel.vetter@intel.com>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "Kim, Dongwon" <dongwon.kim@intel.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> > > > Nack, this doesn't work on dma-buf. And it'll blow up at runtime
> > > > when you enable the very recently merged CONFIG_DMABUF_DEBUG (would
> > > > be good to test with that, just to make sure).
> [Kasireddy, Vivek] Although, I have not tested it yet but it looks like this will
> throw a wrench in our solution as we use sg_next to iterate over all the struct page *
> and get their PFNs. I wonder if there is any other clean way to get the PFNs of all 
> the pages associated with a dmabuf.

Well, there is no guarantee that dma-buf backing storage actually has
struct page ...

> [Kasireddy, Vivek] To exclude such cases, would it not be OK to limit the scope 
> of this solution (Vdmabuf) to make it clear that the dma-buf has to live in Guest RAM?
> Or, are there any ways to pin the dma-buf pages in Guest RAM to make this
> solution work?

At that point it becomes (i915) driver-specific.  If you go that route
it doesn't look that useful to use dma-bufs in the first place ...

> IIUC, Virtio GPU is used to present a virtual GPU to the Guest and all the rendering 
> commands are captured and forwarded to the Host GPU via Virtio.

You don't have to use the rendering pipeline.  You can let the i915 gpu
render into a dma-buf shared with virtio-gpu, then use virtio-gpu only for
buffer sharing with the host.

take care,
  Gerd

