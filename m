Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3EC181AB5
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgCKOET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:04:19 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41003 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729552AbgCKOES (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:04:18 -0400
Received: by mail-qt1-f193.google.com with SMTP id l21so1597658qtr.8
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Cqo7VQlzq/TPqJ6TonOp7as4n99bgQmDcdcZv6gO2F8=;
        b=TLSRpSEmfq9xFyRZcgDxGh5Lb3hW5CBEQSLBNpDGJMrD7LL5VqTgyTK0D0IkvCWszV
         PPn0UMKyCql6oHnq2pUDsMtfTl3IBd5oU9i5HK9C25J1tKKKJuSzJLrwEN+uYxyA+1bN
         S0jJ2jpKh2dB++96q4I7n7U/se7wzWOUKQu+Vz7acBANJaJTZK+GtD7boM68YeLR9nmd
         OGAJPNo8yw06zxYfHoXgmEqiaxlqcjT9cHwgr54Kj034/ot73B3bB1GsgYMbdoZxcHyd
         ds8dwdCrLusTWusZOWN/lHOxgZZB3HGA0w85dW20UDr31WyAoS01r4fKcGft5XWC4qYQ
         18mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Cqo7VQlzq/TPqJ6TonOp7as4n99bgQmDcdcZv6gO2F8=;
        b=ID9FrRJ7pGvqgfwgXJDRsm7ob0bE0QpESWUavu1Ci3fUkrMy/kE6Od//pIAgVrlVbf
         gacje3/40Yr5HKzdvogNksbwYEf+6+Bb1RFoGSKLu1b091RgeZIG6xn5Evcpz5dQ3Y44
         cNfh3COtKbvypP1CDMNpFfEZzQqQ1E9lgxjS5Os4TD/JTvESR5M7JW4Faf+KNBx+2GnT
         95BFrwhULsCo/qjgm6LfAMqBvj24ux4WfZKyCkD/wuHx86/Jp2O4fwCrvrc9M4ZCpsQQ
         BTrr74TYs4Nkqu05MfwxeMGdG2+bTVBksmP1E8AApH0P08qhQf7nAUkIUNysaCXd5eaX
         sQZw==
X-Gm-Message-State: ANhLgQ2Gp5FGoXJagcmXc4dl+5OawwHT+F1UPbJZElfV+SZ5ezmcQ2Mp
        RPqmNCrmsa2Vw/5U+5jMtOx+sQ==
X-Google-Smtp-Source: ADFU+vviajzmBXQ916Uf4yRSfIBDqtB11ZLiBbI5MR+xNrH29WCHdAQ3/YUVflC76y1uWsFSv4av7Q==
X-Received: by 2002:aed:218f:: with SMTP id l15mr2730531qtc.247.1583935457502;
        Wed, 11 Mar 2020 07:04:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id m17sm19286741qke.24.2020.03.11.07.04.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 07:04:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jC1y4-00044U-03; Wed, 11 Mar 2020 11:04:16 -0300
Date:   Wed, 11 Mar 2020 11:04:15 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     David1.Zhou@amd.com, hch@infradead.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
Message-ID: <20200311140415.GB31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200311135158.3310-5-christian.koenig@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 02:51:56PM +0100, Christian König wrote:
> Check if we can do peer2peer on the PCIe bus.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index aef12ee2f1e3..bbf67800c8a6 100644
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -38,6 +38,7 @@
>  #include <drm/amdgpu_drm.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-fence-array.h>
> +#include <linux/pci-p2pdma.h>
>  
>  /**
>   * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
> @@ -179,6 +180,9 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	int r;
>  
> +	if (pci_p2pdma_distance_many(adev->pdev, &attach->dev, 1, true) < 0)
> +		attach->peer2peer = false;
> +

Are there other related patches than this series?

p2p dma mapping needs to be done in common code, in p2pdma.c - ie this
open coding is missing the bus_offset stuff, at least. 

I really do not want to see drivers open code this stuff.

We already have a p2pdma API for handling the struct page case, so I
suggest adding some new p2pdma API to handle this for non-struct page
cases.

ie some thing like:

int 'p2pdma map bar'(
   struct pci_device *source,
   unsigned int source_bar_number, 
   struct pci_device *dest, 
   physaddr&len *array_of_offsets & length pairs into source bar,
   struct scatterlist *output_sgl)

Jason
