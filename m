Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6562B956B
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 15:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbgKSOou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 09:44:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbgKSOlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 09:41:55 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED25CC0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:41:53 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so6656366wrb.9
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 06:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+QV0eroCOghP6iF2qF6VQojb/qmwXTdLdxbXgSm38Q=;
        b=QsUGwdzetI9prZKoeP2iAhcymfOD+I5vw5uQlsYPHXPJ6OfnoBMufDTFzZUJjNMLZ9
         Yxrnkb3r0QOgb8tbJN+frKR3E7076su7FmADL1RedADyOMYsxHMJ1LuezxqfJ+4zvmNr
         w6i7QaH+qoovsm/gkgX6mzTZtHLEyBkDPfyDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+QV0eroCOghP6iF2qF6VQojb/qmwXTdLdxbXgSm38Q=;
        b=tyji0FP86+cIYfl+S1DmJzrjFeN7Z51d7b3C+V8b+QA9jLEWgdiDEv2EMWFf26rV5R
         Gzl5WhmIAmeD1NvMUZU6O9CSXaIE9r1hBmO6cpN+OMnvB5nhtWooP5D1/s+QSy5UenRC
         SXGDiQwuE68/RTEeakiMiuzazzUtmFiqPIQk00WDBLYqqadLCew5Bs8rstPf8CE1W3QZ
         gXEjkN7O1LZdbaKKGMvoljj62xX6P7ZTNPKhcvIshat1j6omC3ZT12Pu+TUeg3BY4KBb
         EtbJnhvQnXrWwQYEWvB3rRP1utYFIejMa2WEjUx+g7BJDcWlN6FC/kdtF7ygvRDp5TFo
         cW3g==
X-Gm-Message-State: AOAM5311YMfLBVJaaoBzACLQAdSVkR5bq+DrOCUXw4bXtCKaVthWxtIJ
        vqDgH99hkrhXJ+BV858SHYQH3Q==
X-Google-Smtp-Source: ABdhPJwEr0+MWxW25HcjQdBlrf+fNcxCL3BoIHGbwL4k+zwCdrQxRdMboyjz6DNXtMlDrKrjaCEFzw==
X-Received: by 2002:a5d:4947:: with SMTP id r7mr9987226wrs.50.1605796912703;
        Thu, 19 Nov 2020 06:41:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:41:51 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v6 00/17] follow_pfn and other iomap races
Date:   Thu, 19 Nov 2020 15:41:29 +0100
Message-Id: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

Another update of my patch series to clamp down a bunch of races and gaps
around follow_pfn and other access to iomem mmaps. Previous version:

v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
v2: https://lore.kernel.org/dri-devel/20201009075934.3509076-1-daniel.vetter@ffwll.ch
v3: https://lore.kernel.org/dri-devel/20201021085655.1192025-1-daniel.vetter@ffwll.ch/
v4: https://lore.kernel.org/dri-devel/20201026105818.2585306-1-daniel.vetter@ffwll.ch/
v5: https://lore.kernel.org/dri-devel/20201030100815.2269-1-daniel.vetter@ffwll.ch/

And the discussion that sparked this journey:

https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

Unfortunately took way longer to update than I hoped, I got sidetracked
with a few things.

Changes in v6:
- Tested v4l userptr as Tomasz suggested. No boom observed
- Added RFC for locking down follow_pfn, per discussion with Christoph and
  Jason.
- Explain why pup_fast is safe in relevant patches, there was a bit a
  confusion when discussing v5.
- Fix up the resource patch, with CONFIG_IO_STRICT_DEVMEM it crashed on
  boot due to an unintended change (reported by John)

Changes in v5:
- Tomasz found some issues in the media patches
- Polish suggested by Christoph for the unsafe_follow_pfn patch

Changes in v4:
- Drop the s390 patch, that was very stand-alone and now queued up to land
  through s390 trees.
- Comment polish per Dan's review.

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

I feel like this is ready for some wider soaking. Since the remaining bits
are all kinda connnected probably simplest if it all goes through -mm.

Cheers, Daniel

Daniel Vetter (17):
  drm/exynos: Stop using frame_vector helpers
  drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
  misc/habana: Stop using frame_vector helpers
  misc/habana: Use FOLL_LONGTERM for userptr
  mm/frame-vector: Use FOLL_LONGTERM
  media: videobuf2: Move frame_vector into media subsystem
  mm: Close race in generic_access_phys
  mm: Add unsafe_follow_pfn
  media/videbuf1|2: Mark follow_pfn usage as unsafe
  vfio/type1: Mark follow_pfn as unsafe
  PCI: Obey iomem restrictions for procfs mmap
  /dev/mem: Only set filp->f_mapping
  resource: Move devmem revoke code to resource framework
  sysfs: Support zapping of binary attr mmaps
  PCI: Revoke mappings like devmem
  RFC: kvm: pass kvm argument to follow_pfn callsites
  RFC: mm: add mmu_notifier argument to follow_pfn

 arch/powerpc/kvm/book3s_64_mmu_hv.c           |   2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |   2 +-
 arch/powerpc/kvm/e500_mmu_host.c              |   2 +-
 arch/x86/kvm/mmu/mmu.c                        |   8 +-
 drivers/char/mem.c                            |  86 +------------
 drivers/gpu/drm/exynos/Kconfig                |   1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  48 ++++----
 drivers/media/common/videobuf2/Kconfig        |   1 -
 drivers/media/common/videobuf2/Makefile       |   1 +
 .../media/common/videobuf2}/frame_vector.c    |  57 +++------
 .../media/common/videobuf2/videobuf2-memops.c |   3 +-
 drivers/media/platform/omap/Kconfig           |   1 -
 drivers/media/v4l2-core/videobuf-dma-contig.c |   2 +-
 drivers/misc/habanalabs/Kconfig               |   1 -
 drivers/misc/habanalabs/common/habanalabs.h   |   6 +-
 drivers/misc/habanalabs/common/memory.c       |  50 +++-----
 drivers/pci/pci-sysfs.c                       |   4 +
 drivers/pci/proc.c                            |   6 +
 drivers/vfio/vfio_iommu_type1.c               |   4 +-
 fs/sysfs/file.c                               |  11 ++
 include/linux/ioport.h                        |   6 +-
 include/linux/kvm_host.h                      |   9 +-
 include/linux/mm.h                            |  50 +-------
 include/linux/sysfs.h                         |   2 +
 include/media/frame_vector.h                  |  47 +++++++
 include/media/videobuf2-core.h                |   1 +
 kernel/resource.c                             |  98 ++++++++++++++-
 mm/Kconfig                                    |   3 -
 mm/Makefile                                   |   1 -
 mm/memory.c                                   | 115 +++++++++++++++---
 mm/nommu.c                                    |  48 +++++++-
 security/Kconfig                              |  13 ++
 virt/kvm/kvm_main.c                           |  56 +++++----
 33 files changed, 447 insertions(+), 298 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (84%)
 create mode 100644 include/media/frame_vector.h

-- 
2.29.2

