Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBACA9D28D
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 17:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732954AbfHZPSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 11:18:51 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35648 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbfHZPSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 11:18:51 -0400
Received: by mail-lf1-f66.google.com with SMTP id h27so6687299lfp.2;
        Mon, 26 Aug 2019 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=50mv38tNDYl/ZA4wnFVjnzU9tnzotrbGWCLUfU9Ss9U=;
        b=DD954qxFZhSRbJXXAWT8UGI78Qw8ddSTsJ57rK3XJ2/Wkv3WEez0EMD7YmJN/2ZyOa
         lHwom4XrlZmbf1KZeQLf7asnloWFOOVQf5xcoWVTpcs1szbaGxrmsAO0GkI3d+aVs+tS
         45DW701tM8vydRxSmqzFNoVGNFbONfoNF0eFihwp/hHhOgmbmtHCvxq0ShKSH9bK4uVZ
         lWRizjWpZp076tU3UDHdesfEOgSmRxcFr2Q3vf20XLtbKjWauLGo6ia5FwENMqkF2Pnt
         2si39G/XXBu4K0XjMggmMk0bTE/w5zakucAW0rL5geUPbRtC+zO8WmLsph6xVKz/nJqS
         Q4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=50mv38tNDYl/ZA4wnFVjnzU9tnzotrbGWCLUfU9Ss9U=;
        b=BNGYeCYJITVD83+jG7mSd3INW6ztUPxQJ51tC1NLJWGBQWqUEak0FktvO9aScctb2J
         U5lqvw8LlHafV/v9TtTUEu2qzwpndmnV0VusBLvGaBZnE63p1nHPztoLyiR+hZqdjgDz
         Pr40QLj1jrQFLw1PVgHU6bImp1jR+z/8RfOnU8IRbHjkMWwv1xCn6qrdV6rgVUqwU11p
         0/gX40Xk4+5NaZ7K5voDoKvJ8894PkR/ewIJD27XuzwSG0ht6uAIBcSMTBDnPV/sVFwQ
         mMG5yROMOFdLFDC5vcB49CdW8xi9mPs+1xjsmNc+xO4aA/FlMZKGcpOY3NqFdoa6pIoQ
         4UzA==
X-Gm-Message-State: APjAAAX+/eJ0SHRPRGFqd4aDuS6fpBwDQt0pyhlVJ0txL2n3PxK3Gcxc
        zCT10huGW0ylvuuEhobbxU4=
X-Google-Smtp-Source: APXvYqxwBaKVRDZOzhOVbJvIe3ncrV9/xEPeURbvLz9/UhsnEu7vyFngUol6rQSCZMHo+7dD8ZFuQg==
X-Received: by 2002:a19:674d:: with SMTP id e13mr11176375lfj.176.1566832729324;
        Mon, 26 Aug 2019 08:18:49 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.218])
        by smtp.googlemail.com with ESMTPSA id m74sm2356165lje.72.2019.08.26.08.18.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 08:18:48 -0700 (PDT)
Subject: Re: [PATCH] media: staging: tegra-vde: Disable building with
 COMPILE_TEST
To:     YueHaibing <yuehaibing@huawei.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robin.murphy@arm.com,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
References: <20190826133140.13456-1-yuehaibing@huawei.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <58a8c62c-a45e-77e4-d2cb-99f95b847a73@gmail.com>
Date:   Mon, 26 Aug 2019 18:18:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826133140.13456-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Yue,

26.08.2019 16:31, YueHaibing пишет:
> If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
> to m will set IOMMU_IOVA to m, this fails the building of
> TEGRA_HOST1X and DRM_TEGRA which is y like this:
> 
> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
> cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
> cdma.c:(.text+0x698): undefined reference to `__free_iova'
> 
> drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
> drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
> drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
> index ba49ea5..a41d30c 100644
> --- a/drivers/staging/media/tegra-vde/Kconfig
> +++ b/drivers/staging/media/tegra-vde/Kconfig
> @@ -1,9 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config TEGRA_VDE
>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
> -	depends on ARCH_TEGRA || COMPILE_TEST
> +	depends on ARCH_TEGRA
>  	select DMA_SHARED_BUFFER
> -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
> +	select IOMMU_IOVA if IOMMU_SUPPORT
>  	select SRAM
>  	help
>  	    Say Y here to enable support for the NVIDIA Tegra video decoder
> 

What about this variant:

	select IOMMU_IOVA if (IOMMU_SUPPORT && !COMPILE_TEST)

which should fix the building and preserve compile-testing.

It shouldn't matter at all whether IOVA is enabled or not for
compile-testing of the driver.
