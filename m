Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966942CD86E
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 15:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgLCODr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 09:03:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:34634 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbgLCODr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 09:03:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 00A33AC6A;
        Thu,  3 Dec 2020 14:03:06 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@redhat.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        hdegoede@redhat.com, christian.koenig@amd.com,
        sumit.semwal@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/7] drm/vram-helper: Lock GEM BOs while they are mapped
Date:   Thu,  3 Dec 2020 15:02:52 +0100
Message-Id: <20201203140259.26580-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GEM VRAM helpers used to pin the BO in their implementation of vmap, so
that they could not be relocated. In a recent discussion, [1] it became
clear that this is incorrect and that vmap should rather repend on the
reservation lock to prevent relocation. This patchset addresses the issue.

Version 2 of the patchset is a significant rework. In particular, the
helper function drm_gem_vram_vmap_unlocked() is gone and importers now
acquire the reservation locks by themselves. I took Christian's A-bs only
for patches that were not affected.

Patches 1 and 2 prepare the ast cursor code for the later changes.

Patch 3 pushes the BO locking into callers of vmap and vunmap. Besides
the VRAM helpers, this affects ast, vboxvideo and the generic fbdev
emulation.

Patches 4 to 6 clean up afterwards. BO pinning is not required any longer
and the VRAM-internal helpers are not needed.

Patch 7 adds documentation to vmap and vunmap in struct dma_buf_ops. It
hopefully reflects the discussion on the patchset's version 1.

Tested on ast with GEM VRAM and also on mgag200 to verify that the fbdev
change does not interfere with GEM SHMEM.

v2:
	* make importers acquire resv locks by themselves
	* document dma-buf vamp/vunmap ops

Thomas Zimmermann (7):
  drm/ast: Don't pin cursor source BO explicitly during update
  drm/ast: Only map cursor BOs during updates
  drm/vram-helper: Move BO locking from vmap code into callers
  drm/vram-helper: Remove pinning from drm_gem_vram_{vmap,vunmap}()
  drm/vram-helper: Remove vmap reference counting
  drm/vram-helper: Simplify vmap implementation
  dma-buf: Write down some rules for vmap usage

 Documentation/gpu/todo.rst            | 15 +++++
 drivers/gpu/drm/ast/ast_cursor.c      | 70 +++++++++++++---------
 drivers/gpu/drm/ast/ast_drv.h         |  2 -
 drivers/gpu/drm/drm_client.c          | 31 ++++++++++
 drivers/gpu/drm/drm_fb_helper.c       | 10 +++-
 drivers/gpu/drm/drm_gem_vram_helper.c | 85 ++++++---------------------
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 11 ++--
 include/drm/drm_client.h              |  2 +
 include/drm/drm_gem.h                 |  4 ++
 include/drm/drm_gem_vram_helper.h     | 17 +-----
 include/linux/dma-buf.h               | 45 ++++++++++++++
 11 files changed, 175 insertions(+), 117 deletions(-)

--
2.29.2

