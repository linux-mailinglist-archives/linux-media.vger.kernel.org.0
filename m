Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B51298AD9
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 11:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771774AbgJZK62 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 06:58:28 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36858 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1771833AbgJZK61 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 06:58:27 -0400
Received: by mail-wm1-f66.google.com with SMTP id e2so11984893wme.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2020 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLkPK/wakWgPcP2XtBGkyHk3/K5f5jOPCyDZpBtuyVA=;
        b=UWVGBGjyj6MIRYbUDiITJq5L6QqEg6/q2/NHckpyd8RPSBh26b0bPaluvTWItOuYKc
         uaoPMBpxALWoXXsF90NCYVWJoITCFikSp8O7FpqdOPDdJXFgIlHFG/TgfvpItfUwxafp
         6wW5he4gsgXTW7dkqWJgYLc8PHDC8/A2/zOmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLkPK/wakWgPcP2XtBGkyHk3/K5f5jOPCyDZpBtuyVA=;
        b=pvUWE67V37bL/odKkf/K895cdLCN/fTfhmMLHZVqCmXfOqj2UDbA74J84dICRzXotm
         gjnU7VmzOUlWkCauQYUP3F7MPy7GEao5KWpZgW+LZWOY6vb11j7wgg6NOoNxQrxg8VsI
         9oLeRmpVJerpxh7f58zyiZzk9KIwBeXGKZBKsTA98J2CX9hhMdv3WPOLfBNgKdFAyR+0
         PBYB1S8Wmg3DS7FXKQnNUulsEo1isDY0GNaQNF42F9JGgaf+AM0vFYMpsHBhRJ/KAvNJ
         t0ZTYIiS9uMVRqTNmwmH2gyaTNgvrSv0j8e/glIlej+P/UjvtujOVMj5ltYlrYv6sIDf
         xsqA==
X-Gm-Message-State: AOAM533kqo0oGGfH/CUYQxsoi3vOjnEEhoTbgel9GQpXxCP9Y28Lx01S
        tx4EeKUtbgV8k952yzuEIv9YIg==
X-Google-Smtp-Source: ABdhPJxesVax0WQRMCyO4OuQvYno6G/x4zHb3UoXArN6uKT0KIo/6VWoGjLr6p0ejXLAy+E8fDIECg==
X-Received: by 2002:a1c:3243:: with SMTP id y64mr15267147wmy.175.1603709905111;
        Mon, 26 Oct 2020 03:58:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w83sm21165156wmg.48.2020.10.26.03.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 03:58:24 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v4 00/15] follow_pfn and other iomap races
Date:   Mon, 26 Oct 2020 11:58:03 +0100
Message-Id: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

Round 3 of my patch series to clamp down a bunch of races and gaps
around follow_pfn and other access to iomem mmaps. Previous version:

v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
v2: https://lore.kernel.org/dri-devel/20201009075934.3509076-1-daniel.vetter@ffwll.ch
v3: https://lore.kernel.org/dri-devel/20201021085655.1192025-1-daniel.vetter@ffwll.ch/

And the discussion that sparked this journey:

https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/

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

Daniel Vetter (15):
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
 mm/memory.c                                   |  78 +++++++++++++-
 mm/nommu.c                                    |  17 +++
 security/Kconfig                              |  13 +++
 26 files changed, 347 insertions(+), 245 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (85%)
 create mode 100644 include/media/frame_vector.h

-- 
2.28.0

