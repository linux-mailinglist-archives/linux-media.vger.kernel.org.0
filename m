Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94280294998
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 10:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441159AbgJUI5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 04:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441037AbgJUI5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 04:57:03 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C2FC0613D5
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:03 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q5so894758wmq.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2020 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gont0CCKnHMdGa6wrKlYRfieb2OHeQGvhAdNIYmokXs=;
        b=VVnDgmxWGYk+ZwdNbZx6Qfo0t6kaRkEL0VNWUHATbLIt3jMjgaYOfdtnMpPlXBmHJZ
         gFnQDrMYEk/gKZHAwJOELTKxwsgwZW/CWn+u6zaKjIMCN9lm18HqsVeG9jRC0MGVpVvf
         8q8WCf23NrfOC9Q0xk18B4qoZ/OnP3rTMfyrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gont0CCKnHMdGa6wrKlYRfieb2OHeQGvhAdNIYmokXs=;
        b=PaPTXfDP6jwdIp6UArIHT6U4pvxwwwyiPNFclplJ15GiLmLjDzPHGqQhfJyO4hkNzh
         ixwDNEu8DtOpsscAe5py9v/blH8J+vBBg3zQ996knMRvYR6m0FFDbXF9rh+68nFHiPMu
         Bwh9Sa1W8tyVZgHPrTgLFr5T3gUkCg9IuZEI8/h2UGxEco/Bo63QbdYaXhjHMq+X5OJt
         YTKU57/YLkFBGKoaGCZrLDkLEMIyhBWz4H2d8tCi4RQWzgP6NksfUFnVpGN2EWcLba7p
         zsStmuYYfsJJmwjlOk/DL6ARGOHJp3AHsKi8nDXFc++XU0WM/F9Lp47skQhwcIaISKFT
         z4IQ==
X-Gm-Message-State: AOAM533J2EoIFib/04eTsBVEAGJ5ms/vsfMy2EJ/Vc2Rxn3k5jdz/If3
        mErg4PYBYnoHWSJmZwddPo36DA==
X-Google-Smtp-Source: ABdhPJyYzWpMyeyH5q5wodO7eI820GbpOZirLgvPnOfJ1Y9pegsPCbV57mxWuzvlDgRCukgCBprgLQ==
X-Received: by 2002:a1c:dc8b:: with SMTP id t133mr2490486wmg.151.1603270621770;
        Wed, 21 Oct 2020 01:57:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:57:00 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 00/16] follow_pfn and other iomap races
Date:   Wed, 21 Oct 2020 10:56:39 +0200
Message-Id: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Round 3 of my patch series to clamp down a bunch of races and gaps
around follow_pfn and other access to iomem mmaps. Previous version:

v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
v2: https://lore.kernel.org/dri-devel/20201009075934.3509076-1-daniel.vetter@ffwll.ch

And the discussion that sparked this journey:

https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

I was waiting for the testing result for habanalabs from Oded, but I guess
Oded was waiting for my v3.

Changes in v3:
- Bunch of polish all over, no functional changes aside from one barrier
  in the resource code, for consistency.
- A few more r-b tags.

Changes in v2:
- tons of small polish&fixes all over, thanks to all the reviewers who
  spotted issues
- I managed to test at least the generic_access_phys and pci mmap revoke
  stuff with a few gdb sessions using our i915 debug tools (hence now also
  the drm/i915 patch to properly request all the pci bar regions)
- reworked approach for the pci mmap revoke: Infrastructure moved into
  kernel/resource.c, address_space mapping is now set up at open time for
  everyone (which required some sysfs changes). Does indeed look a lot
  cleaner and a lot less invasive than I feared at first.

The big thing I can't test are all the frame_vector changes in habanalbas,
exynos and media. Gerald has given the s390 patch a spin already.

Review, testing, feedback all very much welcome.

Cheers, Daniel
Daniel Vetter (16):
  drm/exynos: Stop using frame_vector helpers
  drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
  misc/habana: Stop using frame_vector helpers
  misc/habana: Use FOLL_LONGTERM for userptr
  mm/frame-vector: Use FOLL_LONGTERM
  media: videobuf2: Move frame_vector into media subsystem
  mm: Close race in generic_access_phys
  s390/pci: Remove races against pte updates
  mm: Add unsafe_follow_pfn
  media/videbuf1|2: Mark follow_pfn usage as unsafe
  vfio/type1: Mark follow_pfn as unsafe
  PCI: Obey iomem restrictions for procfs mmap
  /dev/mem: Only set filp->f_mapping
  resource: Move devmem revoke code to resource framework
  sysfs: Support zapping of binary attr mmaps
  PCI: Revoke mappings like devmem

 arch/s390/pci/pci_mmio.c                      |  98 ++++++++++-------
 drivers/char/mem.c                            |  86 +--------------
 drivers/gpu/drm/exynos/Kconfig                |   1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  48 ++++-----
 drivers/media/common/videobuf2/Kconfig        |   1 -
 drivers/media/common/videobuf2/Makefile       |   1 +
 .../media/common/videobuf2}/frame_vector.c    |  54 ++++------
 drivers/media/platform/omap/Kconfig           |   1 -
 drivers/media/v4l2-core/videobuf-dma-contig.c |   2 +-
 drivers/misc/habanalabs/Kconfig               |   1 -
 drivers/misc/habanalabs/common/habanalabs.h   |   6 +-
 drivers/misc/habanalabs/common/memory.c       |  50 ++++-----
 drivers/pci/pci-sysfs.c                       |   4 +
 drivers/pci/proc.c                            |   6 ++
 drivers/vfio/vfio_iommu_type1.c               |   4 +-
 fs/sysfs/file.c                               |  11 ++
 include/linux/ioport.h                        |   6 +-
 include/linux/mm.h                            |  47 +-------
 include/linux/sysfs.h                         |   2 +
 include/media/frame_vector.h                  |  47 ++++++++
 include/media/videobuf2-core.h                |   1 +
 kernel/resource.c                             | 101 +++++++++++++++++-
 mm/Kconfig                                    |   3 -
 mm/Makefile                                   |   1 -
 mm/memory.c                                   |  76 ++++++++++++-
 mm/nommu.c                                    |  17 +++
 security/Kconfig                              |  13 +++
 27 files changed, 403 insertions(+), 285 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (85%)
 create mode 100644 include/media/frame_vector.h

-- 
2.28.0

