Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B699279780
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 09:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgIZHS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 03:18:57 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:50996 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIZHS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 03:18:57 -0400
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Sep 2020 03:18:55 EDT
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 25FB6200E6;
        Sat, 26 Sep 2020 09:13:35 +0200 (CEST)
Date:   Sat, 26 Sep 2020 09:13:34 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
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
        kyungmin.park@samsung.com, tfiga@chromium.org, mchehab@kernel.org,
        matthew.auld@intel.com, robin.murphy@arm.com,
        thomas.hellstrom@intel.com, kraxel@redhat.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org, etnaviv@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
Message-ID: <20200926071334.GA42915@ravnborg.org>
References: <20200925115601.23955-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925115601.23955-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
        a=VHCyA-Zl7a4LrUxzt10A:9 a=MWUCcgKsKLDUXRMs:21 a=VnMhorO1uwyDQjeY:21
        a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thomas.

Sorry for chiming in late here, have been offline for a while.

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

The whole idea with a struct that can represent both a pointer to system
memory and io memory is very nice.
dma-buf is one user of this but we may/will see other users. So the
naming seems of as this should be a concept independent of dma-buf.

And then the struct definition and all the helpers should be moved away
from dma-buf.

Maybe something like this:

struct simap {
       union {
               void __iomem *vaddr_iomem;
               void *vaddr;
       };
       bool is_iomem;
};

Where simap is a shorthand for system_iomem_map
And it could al be stuffed into a include/linux/simap.h file.

Not totally sold on the simap name - but wanted to come up with
something.

With this approach users do not have to pull in dma-buf to use it and
users will not confuse that this is only for dma-buf usage.

I am sorry for being late with the feedback.

	Sam


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
> 
> --
> 2.28.0
