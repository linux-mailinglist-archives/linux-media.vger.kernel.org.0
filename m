Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65DC279108
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbgIYSq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729726AbgIYSq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:46:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33493C0613D8
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:46:26 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g4so4752372wrs.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AlDiV2I2Pb3l4Sw1FS8MXXmwraDk5F1rgxliXh5N5CM=;
        b=hNVaqgoiF4i4BUKziRlpXfyKzDqaE2Y0RasEA7QnYZaUqmrhYmxmR65VR3QsZGT0/N
         elfdI2ZtE21gOt8NsKBS76ANRONmfTntZIUBb37OAepaErQ4mHfX26H/avNX5Om2F5Th
         iF/y4L9RdXJwUeLTzBdv6H/xNDzBbfk+2GMdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AlDiV2I2Pb3l4Sw1FS8MXXmwraDk5F1rgxliXh5N5CM=;
        b=Sem1yZTzmaIjnJByyacvWSFf+8xtB7Xxa2II086Bb2cWin9mPHs59kleg954c4+yco
         S6UKV4kkeZG0ivVkbJUvVXpj8AQfv4Y3p6+PCrt2ZmwamLZFMoes4/ss8+n5Vgj1W3Sv
         AKxZ83EIGfFKpFWO1eN3XmQ99g8pAilg3SBnZCmkEBxHfv1/T+iEZjPGWcY6zdjoQWnr
         ytg7X1cpwJD5TQfvOFYTNlzjA6SFxij8iCqZRLleIaozxyidYk3F/JDMCDBwfFPvvrqb
         Narwc8zGFWLA/5SFTfylPjAQ/RxIkoOPcBVdL3N3O8qK5366Vq7vTlBqds7IMI11H/Oh
         aPyA==
X-Gm-Message-State: AOAM532vGr12K0HzNo+GXO5o7J9Z9M2nMlJsUgXi6uj29NQgBdFo10my
        QfLA8CtJYIggviubD9bUmzs4lQ==
X-Google-Smtp-Source: ABdhPJywG75RJx/fVTLzqgivIcRb/Gp708YyNw5VwVyHEf689ET8en+rXMvfgfeOwhu5XQytInH4aQ==
X-Received: by 2002:a5d:56cd:: with SMTP id m13mr5730549wrw.261.1601059584552;
        Fri, 25 Sep 2020 11:46:24 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id z8sm3728264wrl.11.2020.09.25.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 11:46:23 -0700 (PDT)
Date:   Fri, 25 Sep 2020 18:46:22 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        iommu@lists.linux-foundation.org,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        linux1394-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        nouveau@lists.freedesktop.org, netdev@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 17/18] dma-iommu: implement ->alloc_noncoherent
Message-ID: <20200925184622.GB3607091@chromium.org>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-18-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-18-hch@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph,

On Tue, Sep 15, 2020 at 05:51:21PM +0200, Christoph Hellwig wrote:
> Implement the alloc_noncoherent method to provide memory that is neither
> coherent not contiguous.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/dma-iommu.c | 41 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 

Sorry for being late to the party and thanks a lot for the patch. Please see my
comments inline.

[snip]
> @@ -1052,6 +1055,34 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
>  	return cpu_addr;
>  }
>  
> +#ifdef CONFIG_DMA_REMAP
> +static void *iommu_dma_alloc_noncoherent(struct device *dev, size_t size,
> +		dma_addr_t *handle, enum dma_data_direction dir, gfp_t gfp)
> +{
> +	if (!gfpflags_allow_blocking(gfp)) {
> +		struct page *page;
> +
> +		page = dma_common_alloc_pages(dev, size, handle, dir, gfp);
> +		if (!page)
> +			return NULL;
> +		return page_address(page);
> +	}
> +
> +	return iommu_dma_alloc_remap(dev, size, handle, gfp | __GFP_ZERO,
> +				     PAGE_KERNEL, 0);

iommu_dma_alloc_remap() makes use of the DMA_ATTR_ALLOC_SINGLE_PAGES attribute
to optimize the allocations for devices which don't care about how contiguous
the backing memory is. Do you think we could add an attrs argument to this
function and pass it there?

As ARM is being moved to the common iommu-dma layer as well, we'll probably
make use of the argument to support the DMA_ATTR_NO_KERNEL_MAPPING attribute to
conserve the vmalloc area.

Best regards,
Tomasz
