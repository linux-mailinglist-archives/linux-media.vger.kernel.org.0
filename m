Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD3624C665
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 21:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgHTTvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 15:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgHTTvH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 15:51:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA02AC061385;
        Thu, 20 Aug 2020 12:51:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y2so3465806ljc.1;
        Thu, 20 Aug 2020 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OniJLvMGszqKdZPfnGGPRm6yrJhAzhpZMeh8ipXlA60=;
        b=kVInyANVqA86ZsupZ+Pb7ttjo0P8NA3R0p3DEzLgJRsTMKMITZei2G3WfZlSDDDOVo
         Brozzas6ZvHEMSO6RQ7WwIfPzyZXzZCTaGO6sIRzul2WnVUcIu4qdNYnU6EQ9GWkivhM
         QTGkeebRJE/pgeW85V9eAFS/VGArzEWQd7WIUDnvijv+JOo1PxZqZIJ3N/OfFTlCMK6Q
         5lFS3LvaE9s+NfL7N0AZ0y0gja4R9roVmkZSMm/4V7djiYtKW0fMsvRVrfErEqK7D0IF
         jvYrsgGLLa5tUOsuvyse6KRWT+USoZzaP/vuWqauOYwXsCSrWIwjCcleXTCwmdlO3FOW
         8Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OniJLvMGszqKdZPfnGGPRm6yrJhAzhpZMeh8ipXlA60=;
        b=CbaGztTd0mL/71vTIHnYxHeUrp2W+gK9NjdnrvC+3sk2WzXbMzoxN6SeCR9bP45lvm
         qA9O4tvzQ8DRmebxLfVKHIac6H3dmo5hHqoO+2EPoC+yRHyw1y8M2N5P9WGs+24ljc+N
         uvd3QmR1tHUx8z2jsh/0IaRmMuZc/DrO2NRKTK9Fc+cXm0GU3rZ/1j3pgDCJDuRbVaA0
         75MdVNzb4rLIW4fj3bXAm4R7WUIG+w5qo2HMEg4aBZitFyZm5w/ckctix+Bb9JJBh78R
         bgzyvhVjBqH0a01PNxMG03celZNnG2RzzAJOKh2HXDcLdxTSB29aSYxi36ekjo22Lrea
         yOyw==
X-Gm-Message-State: AOAM532yd8Z8mVd9I7uYypIyeWe4mMqUnnSIlXys3M0BF2izexaEzp6d
        tZIbVPoBBKFLW+EbAGsnZDC1BYBUmD4=
X-Google-Smtp-Source: ABdhPJyvIy9bEn51zd/IbZfZTQR3N2YYlmALsIktwWFi5DNbYZ8x8ytUZs/6wT5ORieeLAv6LpyrBA==
X-Received: by 2002:a05:651c:231:: with SMTP id z17mr2146637ljn.109.1597953064841;
        Thu, 20 Aug 2020 12:51:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l26sm690804lfj.22.2020.08.20.12.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 12:51:03 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
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
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Date:   Thu, 20 Aug 2020 22:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

20.08.2020 18:08, Robin Murphy пишет:
> Now that arch/arm is wired up for default domains and iommu-dma, we no
> longer need to work around the arch-private mapping.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/staging/media/tegra-vde/iommu.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
> index 6af863d92123..4f770189ed34 100644
> --- a/drivers/staging/media/tegra-vde/iommu.c
> +++ b/drivers/staging/media/tegra-vde/iommu.c
> @@ -10,10 +10,6 @@
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
>  
> -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> -#include <asm/dma-iommu.h>
> -#endif
> -
>  #include "vde.h"
>  
>  int tegra_vde_iommu_map(struct tegra_vde *vde,
> @@ -70,14 +66,6 @@ int tegra_vde_iommu_init(struct tegra_vde *vde)
>  	if (!vde->group)
>  		return 0;
>  
> -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> -	if (dev->archdata.mapping) {
> -		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
> -
> -		arm_iommu_detach_device(dev);
> -		arm_iommu_release_mapping(mapping);
> -	}
> -#endif
>  	vde->domain = iommu_domain_alloc(&platform_bus_type);
>  	if (!vde->domain) {
>  		err = -ENOMEM;
> 

Hello, Robin! Thank you for yours work!

Some drivers, like this Tegra VDE (Video Decoder Engine) driver for
example, do not want to use implicit IOMMU domain. Tegra VDE driver
relies on explicit IOMMU domain in a case of Tegra SMMU because VDE
hardware can't access last page of the AS and because driver wants to
reserve some fixed addresses [1].

[1]
https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/staging/media/tegra-vde/iommu.c#L100

Tegra30 SoC supports up to 4 domains, hence it's not possible to afford
wasting unused implicit domains. I think this needs to be addressed
before this patch could be applied.

Would it be possible for IOMMU drivers to gain support for filtering out
devices in iommu_domain_alloc(dev, type)? Then perhaps Tegra SMMU driver
could simply return NULL in a case of type=IOMMU_DOMAIN_DMA and
dev=tegra-vde.

Alternatively, the Tegra SMMU could be changed such that the devices
will be attached to a domain at the time of a first IOMMU mapping
invocation instead of attaching at the time of attach_dev() callback
invocation.

Or maybe even IOMMU core could be changed to attach devices at the time
of the first IOMMU mapping invocation? This could be a universal
solution for all drivers.

