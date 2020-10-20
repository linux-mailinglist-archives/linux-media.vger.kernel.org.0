Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85B82864CF
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgJGQog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgJGQof (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 12:44:35 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C216C0613D4
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 09:44:34 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so2972762wrp.8
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ioe0Byeg/DIJ2PK+KoHAeY/RgUBhGUsvQd2LPXMyjpk=;
        b=LKBDOiNhqwNLkwa9WP1zzXHrjwlM9UxdR+2aww5WQtbHhuceIwa/VXYYnC9UZ6hdtp
         mvYMFJ7UpZJyZnXE8eOz53fPGIesR/n7+X+8Z0F7CtzFKuDxeUJ2E389J/P0gE5voMHe
         oEJ9yMHSIcqvjSDbm4eT0/N3ZkXflXq1Fg4A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ioe0Byeg/DIJ2PK+KoHAeY/RgUBhGUsvQd2LPXMyjpk=;
        b=RUC5yWXmyF3VyRPxn04f6JdOpkTPa/3tJUti6PrCwZwRCx8rUSfzxB5DiPXAJS/pU2
         VESlLUrJx2JsJjR2aQ/Cl4OcQm9hvLHtKGMDHqQOKCjVaDvEozUSB6cuk6qTV4Nvgi0c
         ApCdBTVmyvsPLLZYxJhNGJ0q3DX3JuGszZEKM205XnQ6VPw81RoL8Rlu1ZaPNkGRdbpS
         RAuqgtVzP5/Ya0B+WS7ADfbe6R08df5Emmwd+6QIxBGgJRABCgObji6rBr9ag8Z4V45L
         j6a3goKYX1P9vRKkO14J6s+MC4ez7FtCNAaj13GmsUkqXkEKh/tN4bIq3mGJ6LKSjD6i
         om1g==
X-Gm-Message-State: AOAM533ZNlXPp6BfS5Be/aKj9EfoUU+dkQweYLeGqLYTBJCqFe02PozL
        gTmeHPF56Qv1JwKgFn7jYKPLzw==
X-Google-Smtp-Source: ABdhPJzRELPHTJISw4N/fSU+gR/P4h8ZIocAzvLavw2ceiWiegfiQvvhsxcd+sZUYD7qwXN8jRsOdg==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr4372958wrn.45.1602089072696;
        Wed, 07 Oct 2020 09:44:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:44:32 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 00/13] follow_pfn and other iomap races
Date:   Wed,  7 Oct 2020 18:44:13 +0200
Message-Id: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This developed from a discussion with Jason, starting with some patches
touching get_vaddr_frame that I typed up.

The problem is that way back VM_IO | VM_PFNMAP mappings were pretty
static, and so just following the ptes to derive a pfn and then use that
somewhere else was ok.

But we're no longer in such a world, there's tons of little races and some
fundamental problems.

This series here is an attempt to at least scope the problem, it's all the
issues I've found with quite some code reading all over the tree:
- first part tries to move mm/frame-vector.c away, it's fundamentally an
  unsafe thing
- two patches to close follow_pfn races by holding pt locks
- two pci patches where I spotted inconsinstencies between the 3 different
  ways userspace can map pci bars
- and finally some patches to mark up the remaining issue

No testing beyond "it compiles", this is very much an rfc to figure out
whether this makes sense, whether it's a real thing, and how to fix this
up properly.

Cheers, Daniel

Daniel Vetter (13):
  drm/exynos: Stop using frame_vector helpers
  drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
  misc/habana: Stop using frame_vector helpers
  misc/habana: Use FOLL_LONGTERM for userptr
  mm/frame-vector: Use FOLL_LONGTERM
  media: videobuf2: Move frame_vector into media subsystem
  mm: close race in generic_access_phys
  s390/pci: Remove races against pte updates
  PCI: obey iomem restrictions for procfs mmap
  PCI: revoke mappings like devmem
  mm: add unsafe_follow_pfn
  media/videbuf1|2: Mark follow_pfn usage as unsafe
  vfio/type1: Mark follow_pfn as unsafe

 arch/s390/pci/pci_mmio.c                      | 98 +++++++++++--------
 drivers/char/mem.c                            | 16 ++-
 drivers/gpu/drm/exynos/Kconfig                |  1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 49 +++++-----
 drivers/media/common/videobuf2/Kconfig        |  1 -
 drivers/media/common/videobuf2/Makefile       |  1 +
 .../media/common/videobuf2}/frame_vector.c    | 40 +++-----
 drivers/media/platform/omap/Kconfig           |  1 -
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 drivers/misc/habanalabs/Kconfig               |  1 -
 drivers/misc/habanalabs/common/habanalabs.h   |  3 +-
 drivers/misc/habanalabs/common/memory.c       | 52 +++++-----
 drivers/pci/mmap.c                            |  3 +
 drivers/pci/proc.c                            |  5 +
 drivers/vfio/vfio_iommu_type1.c               |  4 +-
 include/linux/ioport.h                        |  2 +
 include/linux/mm.h                            | 47 +--------
 include/media/videobuf2-core.h                | 42 ++++++++
 mm/Kconfig                                    |  3 -
 mm/Makefile                                   |  1 -
 mm/memory.c                                   | 76 +++++++++++++-
 mm/nommu.c                                    | 17 ++++
 security/Kconfig                              | 13 +++
 23 files changed, 296 insertions(+), 182 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (90%)

-- 
2.28.0

