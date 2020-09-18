Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EEF26F863
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 10:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgIRIc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 04:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIRIc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 04:32:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133F1C061756
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2020 01:32:26 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so4372261ljg.9
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2020 01:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w66Tq3M5Jv+dNDw02sW2Tkz4nD4jpprbI+woSmcafcU=;
        b=JTjYIxSWD1+WCEkFoVdIJYTdxgpTUDEhCbSHp9PCxP1BP5+i31lH1smhIsHl6yADs2
         qsP0TQtfuxOhldW92XNclrotrrFV4fR5LWrQHolT6lCm2SYDScFnCGbuQUVndsotr6wU
         j3OToQ1v5J7c/6DYlyYMpNx+dIW4kvcSPvAuKoEKWesQnb70EqS4z8KSxEu3k2jIUMzD
         wg2eOQHxyoJQTopZpHDRXhEvxZH+i1EcNrIwrRbizdDKi52Czwh0jk6X0E4ySwApHUm1
         PLKSOHyX8n/v4JxF9x7LfThGIZlmfkHCyCg/NMWoIjk+j/YSW37M3weKLkp7xnTLvNtO
         CstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w66Tq3M5Jv+dNDw02sW2Tkz4nD4jpprbI+woSmcafcU=;
        b=swJ6aybCtlaXTrg9wMB+azZ4tUkVWOJ78iOoxJ+8RCs2KXB8Kc2m+a1yMEpm5Uo6Zp
         qaC1kWcEDCtLN3iwhJXi6GEM4oNUntjX2U+vVcD1nNWSjC9pXEhCNzJyzbvwWrzDfGK2
         r6stq98EZTVYb65c94oph963VC/9vkjv0qa80HMaFq8G5sgMsIWrfSeSEwqLU+Ly4VYP
         myfJycQpRprcJzoLtO+WCaBR+cou0/3nSHkJaGCwyYQ0I328nHLQvCUVtxwcIFZuah6J
         nAgKvjrWS9XHOOFPTYJTOdimJo+GeNlYh7/C5JdLmNBAry5+bo4xi3ZqcSHiNXfnuD6I
         qozQ==
X-Gm-Message-State: AOAM530Bw+HBgxvU/LRP1kZfheTQWgfIGzGPu7gMWyh4viJPIcMNQMeO
        LH4EklUcRsUehvllSfMUp5c16b6lEqHuaEljbdOv+Q==
X-Google-Smtp-Source: ABdhPJyQMlwb2QvzUphB9dKx4ikJo1Xr5baZSctpwqcXUKodxQKjBvpLueugGJmTcc5HR/Bao0+/pa1BGErKqWf9wxw=
X-Received: by 2002:a2e:9496:: with SMTP id c22mr10460561ljh.249.1600417944360;
 Fri, 18 Sep 2020 01:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200914112521.1327-1-tzimmermann@suse.de> <CAO_48GGUiVbWBWdzDYWAH2N9Lp2AU+-78BcYyi-3+LXHM74JQA@mail.gmail.com>
In-Reply-To: <CAO_48GGUiVbWBWdzDYWAH2N9Lp2AU+-78BcYyi-3+LXHM74JQA@mail.gmail.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Fri, 18 Sep 2020 14:02:13 +0530
Message-ID: <CAO_48GFU0w-rOG1cwpdoK5mEJeUe=uH6FFzYV_5xEcpjjq11NA@mail.gmail.com>
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>, mark.cave-ayland@ilande.co.uk,
        Gerd Hoffmann <kraxel@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        rodrigo.vivi@intel.com, Thierry Reding <thierry.reding@gmail.com>,
        jonathanh@nvidia.com, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        matthew.auld@intel.com, thomas.hellstrom@intel.com,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        etnaviv@lists.freedesktop.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-tegra@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thomas,

On Fri, 18 Sep 2020 at 11:36, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hello Thomas,
>
> On Mon, 14 Sep 2020 at 16:55, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Dma-buf provides vmap() and vunmap() for retrieving and releasing mappings
> > of dma-buf memory in kernel address space. The functions operate with plain
> > addresses and the assumption is that the memory can be accessed with load
> > and store operations. This is not the case on some architectures (e.g.,
> > sparc64) where I/O memory can only be accessed with dedicated instructions.
> >
> > This patchset introduces struct dma_buf_map, which contains the address of
> > a buffer and a flag that tells whether system- or I/O-memory instructions
> > are required.
>
> Thank you for the patchset - it is a really nice, clean bit to add!
> >
> > Some background: updating the DRM framebuffer console on sparc64 makes the
> > kernel panic. This is because the framebuffer memory cannot be accessed with
> > system-memory instructions. We currently employ a workaround in DRM to
> > address this specific problem. [1]
> >
> > To resolve the problem, we'd like to address it at the most common point,
> > which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
> > instructions are required and exports this information to it's users. The
> > new structure struct dma_buf_map stores the buffer address and a flag that
> > signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
> > can then access the memory accordingly.
> >
> > This patchset only introduces struct dma_buf_map, and updates struct dma_buf
> > and it's interfaces. Further patches can update dma-buf users. For example,
> > there's a prototype patchset for DRM that fixes the framebuffer problem. [2]
> >
> > Further work: TTM, one of DRM's memory managers, already exports an
> > is_iomem flag of its own. It could later be switched over to exporting struct
> > dma_buf_map, thus simplifying some code. Several DRM drivers expect their
> > fbdev console to operate on I/O memory. These could possibly be switched over
> > to the generic fbdev emulation, as soon as the generic code uses struct
> > dma_buf_map.
> >
> > [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
> > [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/
> >
> > Thomas Zimmermann (3):
> >   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
> >   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
> >   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
>
> FWIW, for the series, please feel free to add my
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Of course, once the errors found by kernel test robot are fixed :).
>
> >
> >  Documentation/driver-api/dma-buf.rst          |   3 +
> >  drivers/dma-buf/dma-buf.c                     |  40 +++---
> >  drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
> >  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
> >  drivers/gpu/drm/drm_prime.c                   |  14 +-
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
> >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
> >  drivers/gpu/drm/tegra/gem.c                   |  23 ++--
> >  .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
> >  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
> >  .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
> >  include/drm/drm_prime.h                       |   5 +-
> >  include/linux/dma-buf-map.h                   | 126 ++++++++++++++++++
> >  include/linux/dma-buf.h                       |  11 +-
> >  15 files changed, 274 insertions(+), 82 deletions(-)
> >  create mode 100644 include/linux/dma-buf-map.h
> >
> > --
> > 2.28.0
> >
>
> Best,
> Sumit.

Best,
Sumit.
