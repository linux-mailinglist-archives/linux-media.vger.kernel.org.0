Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682182F4122
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 02:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbhAMBWe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 20:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbhAMBWe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 20:22:34 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65C9C061575;
        Tue, 12 Jan 2021 17:21:53 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id q20so204713pfu.8;
        Tue, 12 Jan 2021 17:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OF1vzKHCoB9FbkveX0jDIMlRTwuLz60PQrD10fcsFvo=;
        b=UH6sv5ytYE04PK0iHS7mRqn5lcCiexxf2Xe/PoK4fkM38pimasFBp9BCAd/TmTSoS9
         Y4fVpf/+DWDnHW5kmP6xjFsK6xAfA0q5HreB3l3g4q9VKhRRf+pccwYFmP56UvofNi1G
         3b0+4KQFMRB32GMMzMyUlx8kc30ezji0D8deRhI+tWRphT+7hx4Sj9EUc0E5GcaekxJw
         td6bgRnXqduBYHBGBdHIdCtFeAnohT6yU4EvXnGXShnNj53hjVxDAfoO8lMKPjL3wTnT
         4iQecTf1TQq/T/ElIygy0BI8zamN3WGw9kxQuoUjcQB8/HMNai/6Gc6O9tzrT38Eq2EY
         cq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=OF1vzKHCoB9FbkveX0jDIMlRTwuLz60PQrD10fcsFvo=;
        b=GamozwIPHzR9QeXtKsvW6bJpe2axLB3nXX+ehJYidKJGoi1CDKzS8876VJu2yzA7XE
         H436BLm047xnbJTr0FlduRZmShcZedegoOlvkgn7sn+3Pazb0z54imlxrwu8KtJbPB+J
         r5GMHXDdS0ucC1zCb2UCBmV4SMfF2bIVS3g++4HhAnFqrjvPBVUO1j1O/cF5PrBcKAE9
         t0vuCAcETPuK0IrqdlO90Jgu9Gd2vaITXg5KmDMtXX6ntZCb2yKmCPTidfsNJhLBF2BW
         AzE8coVws5JJ5NdzZ8Wxu4qtKuHzVbrp3EWs/U06R17XqQRZLL5+kRJukR1QcINeZjMb
         dovA==
X-Gm-Message-State: AOAM530wNIiCb646Kj680tE/3HL7ZSvVeDcg5ZiY5Fde0VC+KIFkOw05
        1RHZi66uMGDJ/Th09dLO03vc8rSxX6g=
X-Google-Smtp-Source: ABdhPJzYrt3TdM44/itCkvsZ36dDJ69idE7ohZq5unbjsjwFA2k+bmee0Jqg9Tmdb+3ZMwABk51ytA==
X-Received: by 2002:aa7:95aa:0:b029:1ad:d810:42be with SMTP id a10-20020aa795aa0000b02901add81042bemr2009988pfk.51.1610500913498;
        Tue, 12 Jan 2021 17:21:53 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id b2sm355197pff.79.2021.01.12.17.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 17:21:52 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v3 0/4] Chunk Heap Support on DMA-HEAP
Date:   Tue, 12 Jan 2021 17:21:39 -0800
Message-Id: <20210113012143.1201105-1-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset introduces a new dma heap, "chunk-heap" that makes it
easy to perform the bulk allocation of high order pages.
It has been created to help optimize the 4K/8K HDR video playback
with secure DRM HW to protect contents on memory. The HW needs
physically contiguous memory chunks(e.g, 64K) up to several hundred
MB memory.

To make such high-order big bulk allocations work, chunk-heap uses
CMA area. To avoid CMA allocation long stall on blocking pages(e.g.,
page writeback and/or page locking), it uses failfast mode of the
CMA API(i.e., __GFP_NORETRY) so it will continue to find easy
migratable pages in different pageblocks without stalling. At last
resort, it will allow the blocking only if it couldn't find the
available memory in the end.

First two patches introduces the failfast mode as __GFP_NORETRY
in alloc_contig_range and the allow to use it from the CMA API.
Third patch introduces device tree syntax for chunk-heap to bind
the specific CMA area with chunk-heap.
Finally, last patch implements chunk-heap as dma-buf heap.

* since v2 -
  * introduce gfp_mask with __GFP_NORETRY on cma_alloc - mhocko
  * do not expoert CMA APIs - Christoph
  * use compatible string for DT instead of dma-heap specific property - Hridya

* Since v1 - https://lore.kernel.org/linux-mm/20201117181935.3613581-1-minchan@kernel.org/
  * introduce alloc_contig_mode - David
  * use default CMA instead of device tree - John

Hyesoo Yu (2):
  dt-bindings: reserved-memory: Make DMA-BUF CMA heap DT-configurable
  dma-buf: heaps: add chunk heap to dmabuf heaps

Minchan Kim (2):
  mm: cma: introduce gfp flag in cma_alloc instead of no_warn
  mm: failfast mode with __GFP_NORETRY in alloc_contig_range

 .../reserved-memory/dma_heap_chunk.yaml       |  58 +++
 drivers/dma-buf/heaps/Kconfig                 |   8 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/chunk_heap.c            | 477 ++++++++++++++++++
 drivers/dma-buf/heaps/cma_heap.c              |   2 +-
 drivers/s390/char/vmcp.c                      |   2 +-
 include/linux/cma.h                           |   2 +-
 kernel/dma/contiguous.c                       |   3 +-
 mm/cma.c                                      |  12 +-
 mm/cma_debug.c                                |   2 +-
 mm/hugetlb.c                                  |   6 +-
 mm/page_alloc.c                               |   8 +-
 mm/secretmem.c                                |   3 +-
 13 files changed, 568 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
 create mode 100644 drivers/dma-buf/heaps/chunk_heap.c

-- 
2.30.0.284.gd98b1dd5eaa7-goog

