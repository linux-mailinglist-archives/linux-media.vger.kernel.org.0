Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FCE27EE90
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 18:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgI3QJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 12:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI3QJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 12:09:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CC7C061755;
        Wed, 30 Sep 2020 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=Bg6UAf5GmAebEK7LE0iET3qIkeB8RGO2JOGQCLfw5AE=; b=Lz8YfiSsW36fA+/kt+aQbTMK4P
        K6o/6VxFcPIVfzsF7/V5PFlSQAKkt6d4r+ZOirMOoIRjFKB9lqo8WhU0Hng+I8LDD973uUBpOMAGx
        aQMwUwC3BRYimqDyMZM2dY6a4XbNBQdmmocZs4mVYjF2+pbn6XFHehXz/ZnTPH3K8iP34Z0nfywAt
        da+F4VpYkHW+B5fhZq6JvsQfEtHhrJ2CvaupP0jjgjLWxXMKo9+TGT6tRu2GfP8v6RZew9VPaEwJ1
        j5smZJMasHuQ4SPX2i8LZyAYwhy8CDbLI54uncAOeXzaWjMPyILN2qmiwmq12V7bm5fj2KLNxLCs4
        iB8QVggg==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNefP-0003CH-NZ; Wed, 30 Sep 2020 16:09:21 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: dma_alloc_pages / dma_alloc_noncoherent fixups
Date:   Wed, 30 Sep 2020 18:09:09 +0200
Message-Id: <20200930160917.1234225-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

this series has a bunch of fixups for the noncoherent DMA allocator
rework that recently landed in linux-next.

I think the most important part is that the idea of vmap()ing
non-contiguous allocations in dma_alloc_noncoherent doesn't work very
well after all.  It means we can't just rely on virt_to_page to get
the page and just use remap_pfn_range or stuff it into other APIs,
but on the other hand it also isn't really generic enought for what
the media APIs seems to want.

So the first patch reverts that change, and the last patch suggests
a different lower level API which should allow the media code to do
all it wants.

I'd suggest all but the last patch for the current merge window, and
we should have a discussion on how well the last one suits the media
subsystem, and probably merge it together with any media changes to
use the required API.
