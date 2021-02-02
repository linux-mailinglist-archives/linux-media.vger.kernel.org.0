Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA1030BB6E
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 10:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhBBJw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 04:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhBBJwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 04:52:10 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D1EC061573;
        Tue,  2 Feb 2021 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=QTGwZsHUykjIplzXOpellqEP0wlz0ReWLq9Jccm8VmE=; b=bEaPt84LngP64M0S0FFor0M6mU
        k2kConm0zblT0nwONmZm0KLMNpUz6aR5G4+gxRdbwpI7kjqsNiQL45IRMHIwEy1yoY1wQEjkYmgBH
        NAO9hOgpFGFepC2hcCYmA6F+7xmltXrBFrKe2S+gtu05T8Xa8Rm7sLCyVbeDD5vZLYgb2bzzNTlO/
        StrExNLDIGuo9gtGO1NQa03DsAxK/8m12hwmTS0AM9J7GlEtzUTqwUmkIbkcRQRtsdDZXdxTkzblY
        1kHfg7WZCwVNnLbrhfvHoI7LNQvQOBTZIdTdvk0P9QSD1m3JCFVJ8qcUZJzXa/SAZFEBnwZoOMM5Y
        M6aH9/Dg==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l6sL1-00F0vV-Nz; Tue, 02 Feb 2021 09:51:13 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: add a new dma_alloc_noncontiguous API v2
Date:   Tue,  2 Feb 2021 10:51:03 +0100
Message-Id: <20210202095110.1215346-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

this series adds the new noncontiguous DMA allocation API requested by
various media driver maintainers.

Changes since v1:
 - document that flush_kernel_vmap_range and invalidate_kernel_vmap_range
   must be called once an allocation is mapped into KVA
 - add dma-debug support
 - remove the separate dma_handle argument, and instead create fully formed
   DMA mapped scatterlists
 - use a directional allocation in uvcvideo
 - call invalidate_kernel_vmap_range from uvcvideo
