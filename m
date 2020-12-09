Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AD42D443B
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 15:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732960AbgLIO02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 09:26:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:39542 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732623AbgLIO0M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 09:26:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C8C76AD57;
        Wed,  9 Dec 2020 14:25:30 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
        sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/8] drm: Support short-term vmap via vmap_local
Date:   Wed,  9 Dec 2020 15:25:19 +0100
Message-Id: <20201209142527.26415-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(was: drm/vram-helper: Lock GEM BOs while they are mapped)

GEM VRAM helpers used to pin the BO in their implementation of vmap, so
that they could not be relocated. In recent discussions, [1][2] it became
clear that this is incorrect for in-kernel use cases, such as fbdev
emulation; which should rather depend on the reservation lock to prevent
relocation.

This patchset addresses the issue by introducing the new interfaces
vmap_local and vunmap_local throughout dma-buf and GEM. It further adds
support to DRM's CMA, SHMEM and VRAM helpers and finally converts fbdev
emulation to the new interface.

Patches 1 and 2 prepare the ast cursor code for the later changes.

Patches 3 and 4 add the vmap_local infrastructure throughout dma-buf,
GEM and PRIME.

Patches 5 to 7 add implementations of vmap_local to DRM's various GEM
helper libraries. Due to the simple nature of these libraries, existing
vmap code can be reused easily. Several drivers are updateed as well to
use the new interfaces.

Patch 8 converts generic fbdev emulation to use vmap_local. Only DRM
drivers that use GEM helpers currently use fbdev emulation, so patches
5 to 7 covered all necessary instances.

I smoke-tested the patchset with ast (VRAM helpers), mgag200 (SHMEM) and
vc4 (CMA). I also tested with a version of radeon (raw TTM) that has been
converted to generic fbdev emulation.

v3:
	* rewrite patchset around vmap_local
v2:
	* make importers acquire resv locks by themselves
	* document dma-buf vamp/vunmap ops

[1] https://patchwork.freedesktop.org/patch/400054/?series=83765&rev=1
[2] https://patchwork.freedesktop.org/patch/405407/?series=84401&rev=2

Thomas Zimmermann (8):
  drm/ast: Don't pin cursor source BO explicitly during update
  drm/ast: Only map cursor BOs during updates
  dma-buf: Add vmap_local and vnumap_local operations
  drm/gem: Create infrastructure for GEM vmap_local
  drm/cma-helper: Provide a vmap function for short-term mappings
  drm/shmem-helper: Provide a vmap function for short-term mappings
  drm/vram-helper: Provide a vmap function for short-term mappings
  drm/fb-helper: Move BO locking from DRM client to fbdev damage worker

 drivers/dma-buf/dma-buf.c              |  80 ++++++++++++++
 drivers/gpu/drm/ast/ast_cursor.c       |  70 +++++++-----
 drivers/gpu/drm/ast/ast_drv.h          |   2 -
 drivers/gpu/drm/drm_client.c           |  91 ++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c        |  41 +++----
 drivers/gpu/drm/drm_gem.c              |  28 +++++
 drivers/gpu/drm/drm_gem_cma_helper.c   |  35 ++++++
 drivers/gpu/drm/drm_gem_shmem_helper.c |  71 ++++++++++++-
 drivers/gpu/drm/drm_gem_vram_helper.c  | 142 ++++++++++++++++---------
 drivers/gpu/drm/drm_internal.h         |   2 +
 drivers/gpu/drm/drm_prime.c            |  39 +++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c |  16 ++-
 drivers/gpu/drm/tiny/cirrus.c          |  10 +-
 drivers/gpu/drm/tiny/gm12u320.c        |  14 ++-
 drivers/gpu/drm/udl/udl_modeset.c      |  18 ++--
 drivers/gpu/drm/vboxvideo/vbox_mode.c  |  15 +--
 drivers/gpu/drm/vc4/vc4_bo.c           |  13 +++
 drivers/gpu/drm/vc4/vc4_drv.h          |   1 +
 drivers/gpu/drm/virtio/virtgpu_prime.c |   2 +
 include/drm/drm_client.h               |   4 +
 include/drm/drm_gem.h                  |  20 ++++
 include/drm/drm_gem_cma_helper.h       |   1 +
 include/drm/drm_gem_shmem_helper.h     |   2 +
 include/drm/drm_gem_vram_helper.h      |   2 +
 include/drm/drm_prime.h                |   2 +
 include/linux/dma-buf.h                |  34 ++++++
 26 files changed, 635 insertions(+), 120 deletions(-)

--
2.29.2

