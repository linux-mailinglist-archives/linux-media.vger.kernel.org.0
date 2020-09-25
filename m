Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2455278E34
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 18:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgIYQUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 12:20:12 -0400
Received: from verein.lst.de ([213.95.11.211]:56745 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729567AbgIYQUM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 12:20:12 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id B124368BEB; Fri, 25 Sep 2020 18:20:04 +0200 (CEST)
Date:   Fri, 25 Sep 2020 18:20:03 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Christoph Hellwig <hch@lst.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dma-mapping: add DMA_ATTR_LOW_ADDRESS attribute
Message-ID: <20200925162003.GA18879@lst.de>
References: <20200925141218.13550-1-m.szyprowski@samsung.com> <CGME20200925141231eucas1p223c342cc989df23e4fc28d97fe3010c5@eucas1p2.samsung.com> <20200925141218.13550-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925141218.13550-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>  #define DMA_ATTR_PRIVILEGED		(1UL << 9)
> +/*
> + * DMA_ATTR_LOW_ADDRESS: used to indicate that the buffer should be allocated
> + * at the lowest possible DMA address, usually just at the beginning of the
> + * DMA/IOVA address space ('first-fit' allocation algorithm).
> + */
> +#define DMA_ATTR_LOW_ADDRESS		(1UL << 10)

I think we need better comments explaining that this is best effort
and only applies to DMA API implementations that actually have an
allocatable IOVA space.
