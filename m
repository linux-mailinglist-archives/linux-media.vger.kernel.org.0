Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A4D2B6D19
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 19:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730780AbgKQSTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 13:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728598AbgKQSTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 13:19:45 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD385C0613CF;
        Tue, 17 Nov 2020 10:19:44 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id x15so10697911pll.2;
        Tue, 17 Nov 2020 10:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4I19oM9+fyOJfOvcvDY/AN8UbFYUGaHDs6FnXuBEh4=;
        b=Sm8gsGQ6sXByMdxzxKKwQ5tNLq0ka4tzSJISjO0jblHbyKIUxo102IB7T0ECEZdpMV
         mBfiSnf6KZ03+xSBxN4iW7u4+xT5z3hHdW5m2+J0IC71ME+4BbjDlLh4JUowu7HMsWSu
         fedZdo5y5aO+75GsLQgY00nkMk1W8B1rC9NUistS4OYcywhRtamPafloZbBZScOm4ZG7
         zvMWFru8RK8WXo4xN6uPN9yHtn5YZfQih+FB+SAFp4M7ZFUV3hDruP47j05MC/hqY2K/
         KjHDZT1sRS+fm+P/XVpurDyy2mbDIo0jy6nXVwVQl5JJr91ti8uOK3sPl4BwGkfzMama
         UiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=W4I19oM9+fyOJfOvcvDY/AN8UbFYUGaHDs6FnXuBEh4=;
        b=QFecvz+xk5KYuDeBAgRsJI8G5O5CB7SuiRs/mZUztK6j1RxIHskva/NFnMi56ij/hk
         2i2pR+iXxyZqI6D0pXzxNaa6gTaRhhpSRRBH9PpLEzgvUY9FL2cYb0ZjR1TU2vLP7RHn
         POoeNTkez4+7ypjpoekfDdwwKYde6/CnJiSICQfJR5vJLt79Ws7VWkoteQtWfPEip50Z
         z2m4T6E/jwqKdNSav9roN/nNd2K6iWArnFDnLZEFm0BtKq+RCxHqV5vR/zNwKNOvLpfJ
         NlTbbB9x2GtA4Do/83qfsyaShUflkz7EYh3/wj0GObqy3CelxbejK2ZGd9SrP9PrMqSl
         3v3g==
X-Gm-Message-State: AOAM531s1EaxnPTsnkYFsrMHjk4NwVohnkTLZYRn7HTBF4O/vnMXrg4m
        r0x5rFthnR4htHY74vnenKk=
X-Google-Smtp-Source: ABdhPJxWMVJ5fUs0GD9esnodGnS80SKZIX7p7AYpiidE9Zy2i3xr/EAZJDacnYgj2ta4ILI72Jy82A==
X-Received: by 2002:a17:90a:d486:: with SMTP id s6mr312042pju.115.1605637184416;
        Tue, 17 Nov 2020 10:19:44 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id h8sm4302639pjc.54.2020.11.17.10.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 10:19:43 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Minchan Kim <minchan@kernel.org>
Subject: [PATCH 0/4] Chunk Heap Support on DMA-HEAP
Date:   Tue, 17 Nov 2020 10:19:31 -0800
Message-Id: <20201117181935.3613581-1-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset introduces a new dma heap, chunk heap that makes it
easy to perform the bulk allocation of high order pages.
It has been created to help optimize the 4K/8K HDR video playback
with secure DRM HW to protect contents on memory. The HW needs
physically contiguous memory chunks up to several hundred MB memory.

The chunk heap is registered by device tree with alignment and memory
node of Contiguous Memory Allocator(CMA). Alignment defines chunk page size.
For example, alignment 0x1_0000 means chunk page size is 64KB.
The phandle to memory node indicates contiguous memory allocator(CMA).
If device node doesn't have cma, the registration of chunk heap fails.

This patchset is against on next-20201110.

The patchset includes the following:
 - cma_alloc_bulk API
 - export dma-heap API to register kernel module dma heap.
 - add chunk heap implementation.
 - devicetree

Hyesoo Yu (3):
  dma-buf: add export symbol for dma-heap
  dma-buf: heaps: add chunk heap to dmabuf heaps
  dma-heap: Devicetree binding for chunk heap

Minchan Kim (1):
  mm: introduce cma_alloc_bulk API

 .../bindings/dma-buf/chunk_heap.yaml          |  52 ++
 drivers/dma-buf/dma-heap.c                    |   2 +
 drivers/dma-buf/heaps/Kconfig                 |   9 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/chunk_heap.c            | 458 ++++++++++++++++++
 include/linux/cma.h                           |   5 +
 include/linux/page-isolation.h                |   1 +
 mm/cma.c                                      | 129 ++++-
 mm/page_alloc.c                               |  19 +-
 mm/page_isolation.c                           |   3 +-
 10 files changed, 666 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
 create mode 100644 drivers/dma-buf/heaps/chunk_heap.c

-- 
2.29.2.299.gdc1121823c-goog

