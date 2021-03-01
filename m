Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8A4327A1A
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 09:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbhCAIz1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 03:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbhCAIyN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 03:54:13 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2018C061788;
        Mon,  1 Mar 2021 00:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=/y/IlBQLfgNT2S5nwStuxp6zBAlsDLYSfzk0/A7qRR4=; b=Crdvh+f2fbEBfXNlDsCHXyvPlT
        ZJcLBYUP+YsUw5+jCgIBYF6lr4RM4lJM81MK9aO/Gol4awhfP1xAFbDp6BRnKeTy4IvssYipAfBfC
        XO4SuKTVOuh4YcPbZMtdlHZdQ3pfPctiEBcvi8DpX0q4CAuTxl1F9pmZ576OR0uGXZ3te2UV8EwBg
        xhy5wrLGTyBla/QqmY1OuFbiH7iSNTzg41D5bk2t/TuwzDHwMofcPhuuw9AUm0LQSxNSjugMo8oTk
        heHmY957JH5sFQD3eYzBlIYiBzmqEuTySCwmRkDhWM1YzdzFIcgMGSDP9mZldpull582kMY1ZVF0D
        /+TREJqg==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lGeI9-00FVFN-3I; Mon, 01 Mar 2021 08:52:41 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: add a new dma_alloc_noncontiguous API v3
Date:   Mon,  1 Mar 2021 09:52:30 +0100
Message-Id: <20210301085236.947011-1-hch@lst.de>
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

Changes since v2:
 - rebased to Linux 5.12-rc1
 - dropped one already merged patch
 - pass an attrs argument to dma_alloc_noncontigous
 - clarify the dma_vmap_noncontiguous documentation a bit
 - fix double assignments in uvcvideo

Changes since v1:
 - document that flush_kernel_vmap_range and invalidate_kernel_vmap_range
   must be called once an allocation is mapped into KVA
 - add dma-debug support
 - remove the separate dma_handle argument, and instead create fully formed
   DMA mapped scatterlists
 - use a directional allocation in uvcvideo
 - call invalidate_kernel_vmap_range from uvcvideo
