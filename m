Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CBA181B50
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbgCKOdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:33:39 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46058 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729057AbgCKOdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:33:39 -0400
Received: by mail-qt1-f194.google.com with SMTP id a4so1666376qto.12
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QjyTvSQWp7wXiW80SCmTpIkz991znEvPrY90Z8F0Ea0=;
        b=ki4OrgHa3iak9x3AxiHwBw6mOcMdV5ahUWAgccTnc+6NpxvuosfWOQ3Bil0UZ2amhE
         6JeQ6nQPILtRijYiU649UBGUpIMrrdU7D7+URkO1PECphlvH63o7OZZpMrwor+1VjmWR
         5gaNL/RN2Z8+mVD+Uyq4rmz9fhTKqAw/zrO7GLDIhGd2t4Oj0AyYm912bxbJ7DR5DWkz
         /B7zSanHP00JYww6FUc/oe3zgyZyWTRU2DUqWoqxjfNeIXijsyIf4Ox9xhbmuBTGoT0/
         /nsT2Qc//E4XQQCxQ0DYeAUvv/i0is72h8cG0YDoq5F6PRmh0O7qH39V4euIp73sYF5e
         s/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QjyTvSQWp7wXiW80SCmTpIkz991znEvPrY90Z8F0Ea0=;
        b=q+96otFnh2QKSAk0cybwklfFCKEi5xJdH5Dq2K/7GxWdatAlE8UzxRxhiLsc4bJ+TZ
         9uG5VE4yx86hUPCob2uGkTjbjBX6dTud8vdtGTsTXLscSoKDLaDXl+K6cK8NMCL81wnA
         nzB7vg6GzrdiKIunMt9Z+o92rA7xlI+uUNX8DISE5TDbh+BkPL3cGZzdsR7j3T8QQmG6
         RxrNWibSc+iRfkKUPOoelmElaXubzK0hctwdp+411gbSilao5d7n0tCfjgfLZnwAyii6
         cuKPjQj6qH8BNbI2ivDy/FM5ixfUTulpGdE9X5F4OZRwoUz0IqLudczaLOC+21fsD56I
         koRQ==
X-Gm-Message-State: ANhLgQ18hipeeEY2Uvbn9uOi9+bQcYy0rXVgyFlsMcyS78MH12rWfC8x
        bFywwP/RZCyt8CGjiHq3/jXDYw==
X-Google-Smtp-Source: ADFU+vvsFXYUPWQs9C+FVbXmgb2w7g5wN/7MMuSOPzzEOQXBV2I3NnHDKstzxAptvMbJXD0UU2fglg==
X-Received: by 2002:ac8:776c:: with SMTP id h12mr2992096qtu.38.1583937216490;
        Wed, 11 Mar 2020 07:33:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id n46sm10364367qtb.48.2020.03.11.07.33.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 07:33:35 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jC2QR-0004oM-D0; Wed, 11 Mar 2020 11:33:35 -0300
Date:   Wed, 11 Mar 2020 11:33:35 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     David1.Zhou@amd.com, hch@infradead.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/amdgpu: add support for exporting VRAM using
 DMA-buf v2
Message-ID: <20200311143335.GC31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200311135158.3310-6-christian.koenig@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 02:51:57PM +0100, Christian König wrote:
> +/**
> + * amdgpu_vram_mgr_alloc_sgt - allocate and fill a sg table
> + *
> + * @adev: amdgpu device pointer
> + * @mem: TTM memory object
> + * @dev: the other device
> + * @dir: dma direction
> + * @sgt: resulting sg table
> + *
> + * Allocate and fill a sg table from a VRAM allocation.
> + */
> +int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
> +			      struct ttm_mem_reg *mem,
> +			      struct device *dev,
> +			      enum dma_data_direction dir,
> +			      struct sg_table **sgt)

single ** pointer with an int return is odd, use ERR_PTR?

> +{
> +	struct drm_mm_node *node;
> +	struct scatterlist *sg;
> +	int num_entries = 0;
> +	unsigned int pages;
> +	int i, r;
> +
> +	*sgt = kmalloc(sizeof(*sg), GFP_KERNEL);
> +	if (!*sgt)
> +		return -ENOMEM;
> +
> +	for (pages = mem->num_pages, node = mem->mm_node;
> +	     pages; pages -= node->size, ++node)
> +		++num_entries;
> +
> +	r = sg_alloc_table(*sgt, num_entries, GFP_KERNEL);
> +	if (r)
> +		goto error_free;
> +
> +	for_each_sg((*sgt)->sgl, sg, num_entries, i)
> +		sg->length = 0;
> +
> +	node = mem->mm_node;
> +	for_each_sg((*sgt)->sgl, sg, num_entries, i) {
> +		phys_addr_t phys = (node->start << PAGE_SHIFT) +
> +			adev->gmc.aper_base;
> +		size_t size = node->size << PAGE_SHIFT;
> +		dma_addr_t addr;
> +
> +		++node;
> +		addr = dma_map_resource(dev, phys, size, dir,
> +					DMA_ATTR_SKIP_CPU_SYNC);
> +		r = dma_mapping_error(dev, addr);
> +		if (r)
> +			goto error_unmap;
> +
> +		sg_set_dma_addr(sg, addr, size, 0);

Is it possible that phys will need to have contiguous pages joined
here, or has 'node' already ensured contiguous pages?

Jason
