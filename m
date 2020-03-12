Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C14F182E22
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgCLKrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:47:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60198 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCLKrc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=UVHnNH3XWYbjZb8nMNymVIJ9pi6e9Dc3rOLERfjpDFo=; b=QKUZg3AGQLjAH14xpMe2/UTccF
        Y8y8S4cqaokwjZAhHEpSgKcyobmBn2jKSRM0nSB83wxCl/tGN3sC303I8LEmW793/UEh+mSUlsE4j
        7aZpIfccDmu/8NuRsVMhhhKH7I6vgQpYeuQu3Z/22sKc4dpVff59glp0nhDLlfPXvG2iA7Ayn92ig
        9eNKbZCIbn8ykxBz1R4R5R/t8FfO8/JVKvWPT/MKE8Z7v6q7mN4P6CpgmxTsIDlUq86z9UJUIMPxs
        Q8/UYY7CjZ4Yk+k0sWEg9z9KBaRZMLDkb7Eqt5lqbalr980jHyRqWXwTjGZP7B36CTIVvTED9vNEF
        dws2omZQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jCLNB-0000ce-O1; Thu, 12 Mar 2020 10:47:29 +0000
Date:   Thu, 12 Mar 2020 03:47:29 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Christoph Hellwig <hch@infradead.org>, David1.Zhou@amd.com,
        jgg@ziepe.ca, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200312104729.GA26031@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 12, 2020 at 11:31:35AM +0100, Christian König wrote:
> But how should we then deal with all the existing interfaces which already
> take a scatterlist/sg_table ?
>
> The whole DMA-buf design and a lot of drivers are build around
> scatterlist/sg_table and to me that actually makes quite a lot of sense.
> 

Replace them with a saner interface that doesn't take a scatterlist.
At very least for new functionality like peer to peer DMA, but
especially this code would also benefit from a general move away
from the scatterlist.

> For TTM I'm also trying for quite a while to just nuke the manual
> dma_address arrays we have and switch over to scatterlist/sg_table.

Which is a move in the wrong direction.

> I mean we could come up with a new structure for this, but to me that just
> looks like reinventing the wheel. Especially since drivers need to be able
> to handle both I/O to system memory and I/O to PCIe BARs.

The structure for holding the struct page side of the scatterlist is
called struct bio_vec, so far mostly used by the block and networking
code.  The structure for holding dma addresses doesn't really exist
in a generic form, but would be an array of these structures:

struct dma_sg {
	dma_addr_t	addr;
	u32		len;
};

Keeping them separate is important as most IOMMU drivers will return
less entries than you can feed them.  E.g. if your input boundaries
are 4k aligned you will usually just get a single IOVA entry back.
I will soon also have a dma mapping interface that will take advantage
of that fact.
