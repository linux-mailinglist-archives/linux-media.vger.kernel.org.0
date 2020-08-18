Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BE6247FAC
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 09:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgHRHp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 03:45:56 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:58825 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgHRHpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 03:45:55 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200818074552epoutp026c945a0f1a88299ca54c69ff6e46e7a3~sTRxeo6qj2465524655epoutp02z
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 07:45:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200818074552epoutp026c945a0f1a88299ca54c69ff6e46e7a3~sTRxeo6qj2465524655epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597736752;
        bh=dw5oXT9wypsLxfzjFB/LVZWr7Mx69JAVk4Tqy1Lmc7s=;
        h=From:To:Cc:Subject:Date:References:From;
        b=jOzfJefJboLRPUZkvthpwCZYPdn6vhl1ylQEz6YGDCqKxU6+dx5370+02X4yBUNxD
         20ktGChjWLb1nwSGGYrtaajqgwXNXWWvFDWWgMdfO81jOmAreovY9qIzqDXyK9nFsP
         HBkLXhwVANta5GksROanM4wqJNjbVDaeYEY6idN4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20200818074551epcas2p3eafdb6409e1a2636717a4c2f73d76015~sTRwgIcRf2091420914epcas2p3b;
        Tue, 18 Aug 2020 07:45:51 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.181]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4BW2yj0RGSzMqYmC; Tue, 18 Aug
        2020 07:45:49 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        63.BD.19322.C278B3F5; Tue, 18 Aug 2020 16:45:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6~sTRtSO3vb2672326723epcas2p2X;
        Tue, 18 Aug 2020 07:45:47 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200818074547epsmtrp163a93b57be1a23b472e1de5be6cc5044~sTRtRGzpp2704127041epsmtrp1l;
        Tue, 18 Aug 2020 07:45:47 +0000 (GMT)
X-AuditID: b6c32a45-7adff70000004b7a-d2-5f3b872c46b0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        84.78.08303.B278B3F5; Tue, 18 Aug 2020 16:45:47 +0900 (KST)
Received: from Dabang.dsn.sec.samsung.com (unknown [12.36.155.59]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200818074547epsmtip239546245637fb5172bd79a2d66a02ce9~sTRtBSvcm2582525825epsmtip2n;
        Tue, 18 Aug 2020 07:45:47 +0000 (GMT)
From:   Hyesoo Yu <hyesoo.yu@samsung.com>
To:     sumit.semwal@linaro.org
Cc:     minchan@kernel.org, akpm@linux-foundation.org,
        iamjoonsoo.kim@lge.com, joaodias@google.com, linux-mm@kvack.org,
        pullip.cho@samsung.com, surenb@google.com, vbabka@suse.cz,
        afd@ti.com, benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        christian.koenig@amd.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Hyesoo Yu <hyesoo.yu@samsung.com>
Subject: [PATCH 0/3] Chunk Heap Support on DMA-HEAP
Date:   Tue, 18 Aug 2020 17:04:12 +0900
Message-Id: <20200818080415.7531-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTZxjG8522p4Wk21lx46MkwEo2A5NLweKHEzVOt2MgjsCyIMtWKhwp
        obRdD3hpXKYgFxGqgMPRKhRQVhgIloqAiIJkXEQDglgHCkPUyEAQVAgEXGkx47/nfd73l+e7
        5OUweGlsPidOnkip5BKZALdn1t3yCPDakP6l2LdhiIemunLY6Fx1JY6SW7twNNrVA9Dk8DUW
        Kmq7y0L9b6ZwtHSih4XKT6bgaE4/ykDdi16ovGkeQ6/7/8FQX+M5HGXVXGGhx5XvWEjbOYCh
        sjdTbLSc3QJQ6vU2Nup6NMtGeff0ONId04DtjmTqvSWcrCysBGSfJhsj9cYk0lhxAieNM7ls
        MnOyHyOHBppwsuP3RSY5fLIdIweXnzDIqeb7OKkxVQCyW9/GJtvNVzFy1ugSSkTKtkgpSQyl
        cqPk0YqYOHlskCA4XPyVWBTgK/QSBqJNAje5JIEKEuwMCfX6Ok5meQuB2wGJLMlihUpoWuCz
        dYtKkZRIuUkVdGKQgFLGyJRCodKbliTQSfJY72hFwmahr6+fyDIZJZNqiqTKLO6hlgYddhSc
        t88EdhxIbITNczdZmcCewyPqAWzNr2HYihkAl8/kYrZiFsBLExPgPfJ4eQi3NRoBnDdcWOXn
        AHw7PchYmcKJ9bDDVGYl1hHO8KzBYB1iEOVMOJBntjYcCH94YXDeCjCJz2Dm4hmr5hKBsFir
        WY1zhTm6R8DmfwQ7C8aYK5ph8VOu6KyHhUSeHXx+PpNtA3bClo4qpk07wPF206rPhy9Opa3q
        g/DO8VGWDT4OYG/+fdzW8IfaZ+mWNI4lwQNWN/qsSEi4w7a/V3M/gBm3ltg2mwsz0ng20B3e
        KCtcTXWCo1XpLJsm4cU6jVXziB9hTW0K6zRw1a65jXbNbbT/5+oBowJ8QinphFiK9lMK1/6q
        EVgXwnNXPcibnPZuBRgHtALIYQjWcfd1bBLzuDGSw2pKpRCrkmQU3QpElvfNYfA/jlZYNkqe
        KBaK/AICfANFSBTghwSO3IRPe37iEbGSRCqeopSU6j2Hcez4R7GCufmwUsm2cJT67qBh0fkZ
        P/XwUrj62sumyIcjyV1b+w3mhtEs6eZOV8c/f8mO92uujnCumD2S6fG5U99vKT43hbsf7AhR
        /+UcmfGH5zZ1xPOSq/ELt/dyMvLFpgOnPqy6W7D3i6Gj++hLtbXq+tjSKKco1+2F9SPmEsPT
        B+3BdTy5S8TppT3xDuYdv/aE5S4szH1fnHyIcr9hfklfbk4+Mp41ZjLxA3ffYZX6364t6z1L
        Q5WLpHd/3sYNP4QY08Nan+h1/eOXj3VPBbz61in13/aGkTaddqZhoji36O13L5hVF18J1K+f
        RsbkjvlUs4dLgqf2fzM0/vMe74eFWufr61Ox6V0CJi2VCD0ZKlryH4b59EiZBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA03RfUzMcRzA8b6/3+9+9+u2y69T+uZMdliWdUKbr9XIU75DmGbDcI5+qvV0
        7sqz6PKwLi55CL9DV7PknIeuECpcR9cTLTk3JKp5GKmVm0jhNJv/Xvu8t8/njw9DSkqp0Ux8
        ciqnTlYmymgRdbNaFhA8+VCYIqTquz/qrssVorPXzDTSWuto1F7XBFBX210Byrc9FqAWVzeN
        BrOaBOhSdiaNvhnbSdQwEIwuVfQT6GvLWwI9vXOWRoev3xCg1+ZfAsTXOghU5OoWoqEjDwA6
        UGkTorrWPiE63mykkSFDDyL88IHmQRqbz5sBfqo/QmCjJQ1bTFk0tvQeE2JdVwuBXzkqaGw/
        PUDhtuwaAr8c6iBxd9UzGuvLTAA3GG1CXOO8ReA+y9jl7BpReAyXGL+VU0+ZtUEUp8+PUx0W
        b39w20DsA+dEOuDJQDYUvh56ReuAiJGw5QB25emFw8Ef8n21xLBHwrb9NoHbEtYFYJ5jj9s0
        GwjtZUXAbR9WCk8VFwvci0i2moLVV520O4xkp8MLL/tJtyl2ItQNnPhrMTsTFvB6MHwgAOYa
        WsHw3BvWnumk3Cb/zDNvGMijwIv/L/H/JSMgTMCfU2mSYpM0U1XTkrltco0ySZOWHCvflJJk
        AX//GhRUDipMPXIrIBhgBZAhZT7ijfYZCok4RrljJ6dOUajTEjmNFUgZSuYndvEF6yVsrDKV
        S+A4Faf+VwnGc/Q+wlqvXdc4bgzd6FFp73FeWRbcsdmZnjk3RjuPSi9V34kMbJU6zCF+tjC2
        BHyz3rus++DkewLT5ov6iyO2JZhyol0e4VHaSE47GDUrdAuc77jlVPikfPIu7GVUOeX3CwVz
        Hofmh+5UfJZYD+ZGT2rwtO5IwEUrOuOjrzbtD3jHzxtFVr7x25XBGiKffLf/GL/Ie+GYD887
        myetfCT1fRH+UyL1LUZVYWtLd//qW/D20O7bqVl5Hj22givhXgG5MHt9O1orz/CK1xjSHxWW
        rzrpM7NkLy/fLFFOOF0vrmV9yYcj7PX5X3pnr4ZjP0aocpbkeHRkOBYHLi2d20Jd7HgfIqM0
        ccqpQaRao/wNZwBpYkYDAAA=
X-CMS-MailID: 20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6
References: <CGME20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6@epcas2p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patch series to introduce a new dma heap, chunk heap.
That heap is needed for special HW that requires bulk allocation of
fixed high order pages. For example, 64MB dma-buf pages are made up
to fixed order-4 pages * 1024.

The chunk heap uses alloc_pages_bulk to allocate high order page.
https://lore.kernel.org/linux-mm/20200814173131.2803002-1-minchan@kernel.org

The chunk heap is registered by device tree with alignment and memory node
of contiguous memory allocator(CMA). Alignment defines chunk page size.
For example, alignment 0x1_0000 means chunk page size is 64KB.
The phandle to memory node indicates contiguous memory allocator(CMA).
If device node doesn't have cma, the registration of chunk heap fails.

The patchset includes the following:
 - export dma-heap API to register kernel module dma heap.
 - add chunk heap implementation.
 - document of device tree to register chunk heap

Hyesoo Yu (3):
  dma-buf: add missing EXPORT_SYMBOL_GPL() for dma heaps
  dma-buf: heaps: add chunk heap to dmabuf heaps
  dma-heap: Devicetree binding for chunk heap

 .../devicetree/bindings/dma-buf/chunk_heap.yaml    |  46 +++++
 drivers/dma-buf/dma-heap.c                         |   2 +
 drivers/dma-buf/heaps/Kconfig                      |   9 +
 drivers/dma-buf/heaps/Makefile                     |   1 +
 drivers/dma-buf/heaps/chunk_heap.c                 | 222 +++++++++++++++++++++
 drivers/dma-buf/heaps/heap-helpers.c               |   2 +
 6 files changed, 282 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
 create mode 100644 drivers/dma-buf/heaps/chunk_heap.c

-- 
2.7.4

