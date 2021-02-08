Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CD1312D8A
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 10:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhBHJlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 04:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbhBHJjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 04:39:39 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70B3C06174A
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 01:38:58 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id i5so3909285wmq.2
        for <linux-media@vger.kernel.org>; Mon, 08 Feb 2021 01:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4DGQGSkzgcC/dD62BvVBWWA5K9GNya/Azc5NShmkw9c=;
        b=BrF/s6CFFF8+P8/zewQpBGItF+0CBq4qQd9jwH9BX0gBhEOrrAE2Y9DeVv1Cqe+PG8
         6swWNn4rPizD3NE4gk7zMHMrff4n8Jw6MeEUPj/T7JVyk0TWvzClJxyWB7BHRmbp0HZ3
         hmE8E4eLRrUsCuFl148JcoJmWT9mJ8KGdVsi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4DGQGSkzgcC/dD62BvVBWWA5K9GNya/Azc5NShmkw9c=;
        b=BQHL59eccLSPDtTrYkmE6KR7Q0WQlMtfFPb4Nyoh4X96aJr+qx7/MJxQqrDKCveqvz
         kFuwmGlRdLBCXUoMufgi23cyWz8WafmpGsyV9Ka6UHtBvVyBcKbGpPpx5nCuFLfmB6ZM
         Yoh9Ej4UAZWTXLhJq4ZZvHYomtmKAMivoXpM6QdeWDzKj37oY6C5/HnpuIKHfAfb1S9t
         hVzYoo1+rFNu2KF6TpdKqfnGF01qgwRKIITqMBE/UjGuyh8yP25hpzWkrIu0vXKa/Z4R
         UZZvShCDYWCJk5FCO4qc2Vz8AajAWX4p9I6PO8y5GhXlGVLsVQo4UG6ku3UHGhX6rYgF
         dXTA==
X-Gm-Message-State: AOAM533qRbp/YiOTkGIwyJ2uEeC5DLQzgYcm3mMK97yFW566z2dj/xoi
        vB6+dTygPrmqpoZwmJYMjHK333TNVD+mMvyp
X-Google-Smtp-Source: ABdhPJzGAETbO5Jt6ZRC/GR0bn81heDLrjvHU05CkeKS+oGw67H4ItRzjTTOIwnpoRRmCRR+dmsFNw==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr13723288wme.146.1612777137507;
        Mon, 08 Feb 2021 01:38:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v15sm1548194wra.61.2021.02.08.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 01:38:56 -0800 (PST)
Date:   Mon, 8 Feb 2021 10:38:54 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        virtualization@lists.linux-foundation.org,
        dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
        daniel.vetter@ffwll.ch, dongwon.kim@intel.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-media@vger.kernel.org
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 08, 2021 at 08:57:48AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > > +/* extract pages referenced by sgt */
> > > +static struct page **extr_pgs(struct sg_table *sgt, int *nents, int *last_len)
> > 
> > Nack, this doesn't work on dma-buf. And it'll blow up at runtime when you
> > enable the very recently merged CONFIG_DMABUF_DEBUG (would be good to test
> > with that, just to make sure).
> 
> > Aside from this, for virtio/kvm use-cases we've already merged the udmabuf
> > driver. Does this not work for your usecase?
> 
> udmabuf can be used on the host side to make a collection of guest pages
> available as host dmabuf.  It's part of the puzzle, but not a complete
> solution.
> 
> As I understand it the intended workflow is this:
> 
>   (1) guest gpu driver exports some object as dma-buf
>   (2) dma-buf is imported into this new driver.
>   (3) driver sends the pages to the host.
>   (4) hypervisor uses udmabuf to create a host dma-buf.
>   (5) host dma-buf is passed on.
> 
> And step (3) is the problematic one as this will not
> work in case the dma-buf doesn't live in guest ram but
> in -- for example -- gpu device memory.

Yup, vram or similar special ram is the reason why an importer can't look
at the pages behind a dma-buf sg table.

> Reversing the driver roles in the guest (virtio driver
> allocates pages and exports the dma-buf to the guest
> gpu driver) should work fine.

Yup, this needs to flow the other way round than in these patches.

> Which btw is something you can do today with virtio-gpu.
> Maybe it makes sense to have the option to run virtio-gpu
> in render-only mode for that use case.

Yeah that sounds like a useful addition.

Also, the same flow should work for real gpus passed through as pci
devices. What we need is some way to surface the dma-buf on the guest
side, which I think doesn't exist yet stand-alone. But this role could be
fulfilled by virtio-gpu in render-only mode I think. And (assuming I've
understood the recent discussions around virtio dma-buf sharing using
virtio ids) this would give you some neat zero-copy tricks for free if you
share multiple devices.

Also if you really want seamless buffer sharing between devices that are
passed to the guest and devices on the host side (like displays I guess?
or maybe video encode if this is for cloug gaming?), then using virtio-gpu
in render mode should also allow you to pass the dma_fence back&forth.
Which we'll need too, not just the dma-buf.

So at a first guess I'd say "render-only virtio-gpu mode" sounds like
something rather useful. But I might be totally off here.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
