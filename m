Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A1424C6B3
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 22:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgHTUQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 16:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgHTUQH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 16:16:07 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17780C061385;
        Thu, 20 Aug 2020 13:16:07 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c15so1591559lfi.3;
        Thu, 20 Aug 2020 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z4/wj3Fu4Eph1sTO7GVhSlXHwAR3nCexyHHqjazhrhI=;
        b=eH0fXemGHyYrqVaXCSwoyiADThja4royuk8E2W7qgm+q+qNvxSE7WFI1GWAcUNWol5
         TkSlaIwWXfpGCu1rdKd4xbo6v5YOfOA1VqIE+e7I3KOFxP8uY8gZHQ5hEn18nNUkQltB
         61cD6GShkUj7anmSjHmNJJyQtWOSzcA/6WiCmvyl1yqsI+3JLWIFkxCEfZSA0Tkc4rwt
         Al0YwbiQoEnH/bE6QfOQS6mPRhuh/7eJUl9miYuu6EqyUaDTzmIFC9UVy73ZFdaDHzDh
         OoBwM1FfdFr2C2ppdWQEZQUf+F4zaBl1T3JBG+3PU5tvXyUEefM3HxjeLEu6sI20OYUe
         7V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z4/wj3Fu4Eph1sTO7GVhSlXHwAR3nCexyHHqjazhrhI=;
        b=TWuDxjjFwRXcadLlVK32S4+MO8nzNERN61fDk4dMutwF2kLuFoiBeVAILAobSKoFe7
         T5fYNH5dDGfVkx8ck4ZIXxnc0CHTOYBQ0SU7PEj2eo8UDglG5IsX1W5T5KS+nHtsl0Sw
         NAv3jdIY2SGwf9g5550gz5PZqGubX4ArtxlYgRLqgFbb3M32Zs/H3G/vWNeyVo67dK3C
         VvPvpmXbzqLw/OzIPz5H0xGTWTCpgvcneCD0yJ1NB97PsGcPYyM8WSoHnOQVBMDX9u5K
         FRtCnCNUbo9M26IjdKLm60Vsq3BEefRIaIEXzjaiRylMGE7BzuQD0816J1RAgjQ+wRD+
         59hQ==
X-Gm-Message-State: AOAM530S9Z9R5++BhFdVyJkwmHPBvw7Zp8J/vQ6+X22uW1efLnNyGRZA
        iELyDsTt65rpkzuT9g3msVUPiSJ4r3k=
X-Google-Smtp-Source: ABdhPJwrxwMvfMIi1WMXou3rl8xDa6keRlOnRHgj5dYDGe39qslojpYQkA223xf57H7QsDS0Qr4vug==
X-Received: by 2002:a19:8a57:: with SMTP id m84mr30938lfd.159.1597954564373;
        Thu, 20 Aug 2020 13:16:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id b15sm638637lji.140.2020.08.20.13.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 13:16:03 -0700 (PDT)
Subject: Re: [PATCH 12/18] iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
To:     Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
        linux@armlinux.org.uk
Cc:     will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
        matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1597931875.git.robin.murphy@arm.com>
 <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <081f7532-9ca0-0af3-35a1-cbaba0782237@gmail.com>
Date:   Thu, 20 Aug 2020 23:16:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

20.08.2020 18:08, Robin Murphy пишет:
> Now that arch/arm is wired up for default domains and iommu-dma,
> implement the corresponding driver-side support for DMA domains.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/tegra-gart.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index fac720273889..e081387080f6 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -9,6 +9,7 @@
>  
>  #define dev_fmt(fmt)	"gart: " fmt
>  
> +#include <linux/dma-iommu.h>
>  #include <linux/io.h>
>  #include <linux/iommu.h>
>  #include <linux/moduleparam.h>
> @@ -145,16 +146,22 @@ static struct iommu_domain *gart_iommu_domain_alloc(unsigned type)
>  {
>  	struct iommu_domain *domain;

Hello, Robin!

Tegra20 GART isn't a real IOMMU, but a small relocation aperture. We
would only want to use it for a temporal mappings (managed by GPU
driver) for the time while GPU hardware is busy and working with a
sparse DMA buffers, the driver will take care of unmapping the sparse
buffers once GPU work is finished [1]. In a case of contiguous DMA
buffers, we want to bypass the IOMMU and use buffer's phys address
because GART aperture is small and all buffers simply can't fit into
GART for a complex GPU operations that involve multiple buffers [2][3].
The upstream GPU driver still doesn't support GART, but eventually it
needs to be changed.

[1]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/gart.c#L489

[2]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/gart.c#L542

[3]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/patching.c#L90

> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> +	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>  		return NULL;

Will a returned NULL tell to IOMMU core that implicit domain shouldn't
be used? Is it possible to leave this driver as-is?
