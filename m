Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93FF959F764
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 12:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236779AbiHXKXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 06:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbiHXKXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 06:23:42 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C90A5C364;
        Wed, 24 Aug 2022 03:23:39 -0700 (PDT)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 518CA6601DAD;
        Wed, 24 Aug 2022 11:23:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661336617;
        bh=CWlyIap4cbi2NpOihsLARmOOwwjeknxOoSCWAV4ajqA=;
        h=From:To:Cc:Subject:Date:From;
        b=b5Nhoxv/POic6NyUcUJ+k8TJIFTWE6IyZKn6URLO//apT9ls1oa4z+UZXjmyEWVC3
         OeTVeyn5O9AEfBMx9lriWH9WPyRBZ0B9zqNw3idljg/60RttMUIFaVA40idf8uYr3A
         Ft+9+RofHKd3c6TtR6WCHH3ChfOh/tn7hqLsuTjPeT2/LWMgDmVOKiZyy1BKEXmxjo
         SwjS5PBNCp1FuKVYj1mF4V4LVCudFj6i8H1NB/DbxwhPUgf0/+DTVhQZSpxv15mZAT
         bqY34qasjmnm6us3j8q+NNQtBJ7I9LP9++0Qr56mLRjlGqqn8RYdr93aaxYrRuZkQQ
         Tk7ORvZan1c5Q==
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
        Qiang Yu <yuq825@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        kernel@collabora.com, virtualization@lists.linux-foundation.org,
        linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        lima@lists.freedesktop.org
Subject: [PATCH v3 0/9] Move all drivers to a common dma-buf locking convention
Date:   Wed, 24 Aug 2022 13:22:39 +0300
Message-Id: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series moves all drivers to a dynamic dma-buf locking specification.
From now on all dma-buf importers are made responsible for holding
dma-buf's reservation lock around all operations performed over dma-bufs
in accordance to the locking specification. This allows us to utilize
reservation lock more broadly around kernel without fearing of a potential
deadlocks.

This patchset passes all i915 selftests. It was also tested using VirtIO,
Panfrost, Lima, Tegra, udmabuf, AMDGPU and Nouveau drivers. I tested cases
of display+GPU, display+V4L and GPU+V4L dma-buf sharing (where appropriate),
which covers majority of kernel drivers since rest of the drivers share
same or similar code paths.

Changelog:

v3: - Factored out dma_buf_mmap_unlocked() and attachment functions
      into aseparate patches, like was suggested by Christian König.

    - Corrected and factored out dma-buf locking documentation into
      a separate patch, like was suggested by Christian König.

    - Intel driver dropped the reservation locking fews days ago from
      its BO-release code path, but we need that locking for the imported
      GEMs because in the end that code path unmaps the imported GEM.
      So I added back the locking needed by the imported GEMs, updating
      the "dma-buf attachment locking specification" patch appropriately.

    - Tested Nouveau+Intel dma-buf import/export combo.

    - Tested udmabuf import to i915/Nouveau/AMDGPU.

    - Fixed few places in Etnaviv, Panfrost and Lima drivers that I missed
      to switch to locked dma-buf vmapping in the drm/gem: Take reservation
      lock for vmap/vunmap operations" patch. In a result invalidated the
      Christian's r-b that he gave to v2.

    - Added locked dma-buf vmap/vunmap functions that are needed for fixing
      vmappping of Etnaviv, Panfrost and Lima drivers mentioned above.
      I actually had this change stashed for the drm-shmem shrinker patchset,
      but then realized that it's already needed by the dma-buf patches.
      Also improved my tests to better cover these code paths.

v2: - Changed locking specification to avoid problems with a cross-driver
      ww locking, like was suggested by Christian König. Now the attach/detach
      callbacks are invoked without the held lock and exporter should take the
      lock.

    - Added "locking convention" documentation that explains which dma-buf
      functions and callbacks are locked/unlocked for importers and exporters,
      which was requested by Christian König.

    - Added ack from Tomasz Figa to the V4L patches that he gave to v1.

Dmitry Osipenko (9):
  dma-buf: Add _unlocked postfix to function names
  dma-buf: Add locked variant of dma_buf_vmap/vunmap()
  drm/gem: Take reservation lock for vmap/vunmap operations
  dma-buf: Move dma_buf_vmap/vunmap_unlocked() to dynamic locking
    specification
  dma-buf: Move dma_buf_mmap_unlocked() to dynamic locking specification
  dma-buf: Move dma-buf attachment to dynamic locking specification
  dma-buf: Document dynamic locking convention
  media: videobuf2: Stop using internal dma-buf lock
  dma-buf: Remove internal lock

 Documentation/driver-api/dma-buf.rst          |   6 +
 drivers/dma-buf/dma-buf.c                     | 276 ++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   4 +-
 drivers/gpu/drm/armada/armada_gem.c           |  14 +-
 drivers/gpu/drm/drm_client.c                  |   4 +-
 drivers/gpu/drm/drm_gem.c                     |  24 ++
 drivers/gpu/drm/drm_gem_dma_helper.c          |   6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c          |   9 +-
 drivers/gpu/drm/drm_prime.c                   |  12 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  12 +
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  20 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   8 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c      |   4 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
 drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
 drivers/gpu/drm/tegra/gem.c                   |  27 +-
 drivers/infiniband/core/umem_dmabuf.c         |  11 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  26 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  23 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  17 +-
 .../platform/nvidia/tegra-vde/dmabuf-cache.c  |  12 +-
 drivers/misc/fastrpc.c                        |  12 +-
 drivers/xen/gntdev-dmabuf.c                   |  14 +-
 include/drm/drm_gem.h                         |   3 +
 include/linux/dma-buf.h                       |  57 ++--
 32 files changed, 410 insertions(+), 242 deletions(-)

-- 
2.37.2

