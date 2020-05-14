Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A86B1D3E77
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 22:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgENUHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 16:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726035AbgENUHO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 16:07:14 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C1CC061A0C;
        Thu, 14 May 2020 13:07:14 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c21so3736325lfb.3;
        Thu, 14 May 2020 13:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WOuH1XOmPM4H+myJnWGIPlv/GSLKGvRLHlRm+1oHjes=;
        b=OVYKlyo5tYXCFqG9R7Ge9W7iXoaap3TbWVuCOzDYbfkzO4yLw2nn4s/mPYZX39Ux8P
         lFNGzLPtGV36ZU/XRsJ/b8wLh89m89ZNxrbWAfw7dhCB5DYaX437icl0syKPyPU9y6cv
         GOf4OqlcxzxK2qxduTZnPEGkJ5gudwR+BI+K1XOIjCSsVc7zFtsRw42RJv+A0VxmVprF
         Z/oR4RSUAo5dcE19PFCNWSPkwwFFSAckWWBLXv7yJ6KBOnbI5nIyFa0N2Dg1RhKKg6Km
         HV3XTRJC/mYTvuXUcWKv37AvIXqwUY0V5fVE7ciEbqB1wBc6ySSDl+xWctJrTYCOgk/M
         cdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WOuH1XOmPM4H+myJnWGIPlv/GSLKGvRLHlRm+1oHjes=;
        b=ZGG/COsS50qXn8AOdHrYa2DZcjZqDiJ/9kgLKaEbtK128WnRfWwjAzD1bsTR0F5PSb
         /tmB0PuYWz8We0dT2Ie5BvnpixYBxXAw2sfpAJn1wGM5KUdQv9JBKejtge4GZflENPvC
         MKRdrzbnogyPe7cYoZ/a+LydUN4nhvX86AoVtqS13xWuUnqR3+u+RaQ1Vu73uwYJSEQA
         qMEaOhSoVb9gWR7V6tzmtu+ETWHQCtMXpwQQjjVUKIJf30aZDiobotRAVqp7rExgG+eI
         C0WnCIW7iA3sx22ELnVSc69qB7G5+HXpgcAEwRByrBAQ0D4rhSFKO9g1mLWDLz8bTVtN
         W4vw==
X-Gm-Message-State: AOAM530tJguHR1pRedUj54yHTJHVa+6fR6D2prZWgBiOyFQRON4ndzAY
        S8t3ETKum8XbCMFECjQTdaM=
X-Google-Smtp-Source: ABdhPJwTHexR/oCXDgBD97x5phSocPsVO5cLCrpN3UyXH7i+q+PwOPK8LeMXp5gf2iMucRKwwCs9rg==
X-Received: by 2002:a19:4f1b:: with SMTP id d27mr4462819lfb.81.1589486832616;
        Thu, 14 May 2020 13:07:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v16sm2428150lfi.49.2020.05.14.13.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 13:07:11 -0700 (PDT)
Subject: Re: [PATCH v5 33/38] staging: tegra-vde: fix common struct sg_table
 related issues
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133321eucas1p13acea3aa6219ce5f7076c7677ef9eae3@eucas1p1.samsung.com>
 <20200513133245.6408-33-m.szyprowski@samsung.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <43f9f3cc-2afa-cec3-0dd4-335746ec886e@gmail.com>
Date:   Thu, 14 May 2020 23:07:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513133245.6408-33-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

13.05.2020 16:32, Marek Szyprowski пишет:
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
> 
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
> 
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
> 
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
> vs. orig_nents misuse' thread:
> https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
> ---
>  drivers/staging/media/tegra-vde/iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
> index 6af863d..adf8dc7 100644
> --- a/drivers/staging/media/tegra-vde/iommu.c
> +++ b/drivers/staging/media/tegra-vde/iommu.c
> @@ -36,8 +36,8 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
>  
>  	addr = iova_dma_addr(&vde->iova, iova);
>  
> -	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
> -			    IOMMU_READ | IOMMU_WRITE);
> +	size = iommu_map_sgtable(vde->domain, addr, sgt,
> +				 IOMMU_READ | IOMMU_WRITE);
>  	if (!size) {
>  		__free_iova(&vde->iova, iova);
>  		return -ENXIO;
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
