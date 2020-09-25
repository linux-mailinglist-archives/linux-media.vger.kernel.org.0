Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AE7279135
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbgIYS5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgIYS5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:57:23 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EC7C0613D4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:57:23 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c18so4762302wrm.9
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kt10/F2kcNigvJv3MHb/KIAmOU9k1DQ04CJDICU2o4s=;
        b=QTx6r5IlMJgqdfwJqok4Oloopf1e2dZXk3B0aDmwbL6ioYYkzCGrMSpDnP8j6NNV3l
         yBz4zT5KFJwmp5I9Db949916H/gFIZcgBe/1kzt/5tyHir7LeNSMfejEwXrKPMEOLkyg
         j1kARuv3rn07sUE3TxMaZtRIYj7ioUiQOKjyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kt10/F2kcNigvJv3MHb/KIAmOU9k1DQ04CJDICU2o4s=;
        b=FtpLpyGgFDoMZOUdtBv2e8KELL6ESlKghpNfdL+n83/qHDy8O5Nk5IyGf0YTgDYMk5
         YT6uJJnf7j8OxknR/KMluJiE3uj9TFXykJN+R1wvtrcoBL8cZh/LkH5nZTS50Rm3UocN
         b+7Zfd7Vtv8BKcP+m9J+ep+XSb4YUS3oA07rxDtYMpKV4jouEZjUNsq/8wR6eYVt5oOk
         H3u9ITFofEPzt0czcDuDPyN9ZEAX5a2r9GW2qV3115hNPpsO4Dps9vruunhTRdYG2Sxf
         BbR8XeXIz7aK3nBHD7DIfITIgIxCQeAUSyeRIwbz7zR0QAHKliW04JP4W1gaMlXOvfde
         T7sw==
X-Gm-Message-State: AOAM532jb/WIb6TGh1vIFkTzyzkSR+w66X+wqa87iPJfeHtFJGytFZ0A
        rikk1xjfd7AVvTCm11uDTf6zRA==
X-Google-Smtp-Source: ABdhPJwlnbyLQnA0JGmqU4U9R8tlABeEj0Cg/d1CLNatanhXkzrWE7eBAspLFZGWY/+anA8OvMidfQ==
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr6445083wrp.271.1601060242019;
        Fri, 25 Sep 2020 11:57:22 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p1sm25001wma.0.2020.09.25.11.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 11:57:21 -0700 (PDT)
Date:   Fri, 25 Sep 2020 18:57:19 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com, afd@ti.com,
        corbet@lwn.net, benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, mchehab@kernel.org,
        matthew.auld@intel.com, robin.murphy@arm.com,
        thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
Message-ID: <20200925185719.GD3607091@chromium.org>
References: <20200925115601.23955-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925115601.23955-1-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thomas,

On Fri, Sep 25, 2020 at 01:55:57PM +0200, Thomas Zimmermann wrote:
> Dma-buf provides vmap() and vunmap() for retriving and releasing mappings
> of dma-buf memory in kernel address space. The functions operate with plain
> addresses and the assumption is that the memory can be accessed with load
> and store operations. This is not the case on some architectures (e.g.,
> sparc64) where I/O memory can only be accessed with dedicated instructions.
> 
> This patchset introduces struct dma_buf_map, which contains the address of
> a buffer and a flag that tells whether system- or I/O-memory instructions
> are required.
> 
> Some background: updating the DRM framebuffer console on sparc64 makes the
> kernel panic. This is because the framebuffer memory cannot be accessed with
> system-memory instructions. We currently employ a workaround in DRM to
> address this specific problem. [1]
> 
> To resolve the problem, we'd like to address it at the most common point,
> which is the dma-buf framework. The dma-buf mapping ideally knows if I/O
> instructions are required and exports this information to it's users. The
> new structure struct dma_buf_map stores the buffer address and a flag that
> signals I/O memory. Affected users of the buffer (e.g., drivers, frameworks)
> can then access the memory accordingly.
> 
> This patchset only introduces struct dma_buf_map, and updates struct dma_buf
> and it's interfaces. Further patches can update dma-buf users. For example,
> there's a prototype patchset for DRM that fixes the framebuffer problem. [2]
> 
> Further work: TTM, one of DRM's memory managers, already exports an
> is_iomem flag of its own. It could later be switched over to exporting struct
> dma_buf_map, thus simplifying some code. Several DRM drivers expect their
> fbdev console to operate on I/O memory. These could possibly be switched over
> to the generic fbdev emulation, as soon as the generic code uses struct
> dma_buf_map.
> 
> v3:
> 	* update fastrpc driver (kernel test robot)
> 	* expand documentation (Daniel)
> 	* move documentation into separate patch
> v2:
> 	* always clear map parameter in dma_buf_vmap() (Daniel)
> 	* include dma-buf-heaps and i915 selftests (kernel test robot)
> 	* initialize cma_obj before using it in drm_gem_cma_free_object()
> 	  (kernel test robot)
> 
> [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/
> [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmermann@suse.de/
> 
> Thomas Zimmermann (4):
>   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
>   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
>   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
>   dma-buf: Document struct dma_buf_map
> 
>  Documentation/driver-api/dma-buf.rst          |   9 +
>  drivers/dma-buf/dma-buf.c                     |  42 ++--
>  drivers/dma-buf/heaps/heap-helpers.c          |  10 +-
>  drivers/gpu/drm/drm_gem_cma_helper.c          |  20 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 +-
>  drivers/gpu/drm/drm_prime.c                   |  15 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 +-
>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |  14 +-
>  drivers/gpu/drm/tegra/gem.c                   |  23 ++-
>  .../common/videobuf2/videobuf2-dma-contig.c   |  17 +-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 +-
>  .../common/videobuf2/videobuf2-vmalloc.c      |  21 +-
>  drivers/misc/fastrpc.c                        |   6 +-
>  include/drm/drm_prime.h                       |   5 +-
>  include/linux/dma-buf-map.h                   | 193 ++++++++++++++++++
>  include/linux/dma-buf.h                       |  11 +-
>  18 files changed, 372 insertions(+), 94 deletions(-)
>  create mode 100644 include/linux/dma-buf-map.h

For drivers/media/common/videobuf2 changes:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
