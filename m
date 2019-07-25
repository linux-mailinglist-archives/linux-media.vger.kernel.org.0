Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77C0747FF
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 09:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387882AbfGYHTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 03:19:18 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36052 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387562AbfGYHTS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 03:19:18 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so47002768ljj.3;
        Thu, 25 Jul 2019 00:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DwIfRA6fcW2oe7CbnwGUIqq7af18U05Jyy+yWqYqM5c=;
        b=fDS+98o9oalApKwxVG4RF/dDFVdI9yPmoz5I/YflcP8OTzLCsqj2s/Lw7gaK0ZlgzE
         YT2QDp+xw78giiso+t9s9p/uQmOwlXpwbJXXZdLif3T0KVGo86suj2LbKnKzfPaDOnKZ
         OxiBxBkuwoibEeO9CMWm6usPAJ4t9/BC1/jq/JAZq9T3AzogJ0dOl6vL7rspjXuFKNuP
         YujnoqZsKobRZkeGBKUM81yZF/AMDtbkJ94t1+xOlJvYaRKaCwD1wYYu8GdfJbXBy0iK
         Mr/SfnBladD45nbmVG2ov2H0mNdGpkR6IxIyJog58mRHdV5B4VB/xaIiaU/trnnzsOmy
         2ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DwIfRA6fcW2oe7CbnwGUIqq7af18U05Jyy+yWqYqM5c=;
        b=Zv9PqyWe613yEDs+19B+B8yJSau/XQNG8e4SZZTbtUmG1rpF+k6t6jUYb8PKRBtU9o
         pejCDbAhYp2DQF0v+iVnNpoyxG1Pak61fI5aInUB4ms0K2yc+9HEV8IuqeflRYV/olJo
         gr9G3/+tcmR14Ne1xF08acB2G14e2eHnDzxO/7fiHT8i6V66wPXszysVqRZDekBXfErW
         IH/l+kQjZ0GXag184Pt545WkYnZJLJRDFdiRfmJiwZfZ8wrAjy0fgX6COhNWiVFZT9qg
         WRwJbyaUeOtvNcp7vUN9PphiqIhfLBCeNFuP2nTSAkkVi7YNQkkvox+B5u2WuEVYWU35
         uUCQ==
X-Gm-Message-State: APjAAAXs2Dr63XKOoN2KT/4dkAfTpFTPPhmnx/Wu5JJ2mHCKOXkfUfup
        rO1I3fGZ62V1jhoBA4dPYko=
X-Google-Smtp-Source: APXvYqxprjXpA4VtptPUsVGzv6lssMvOez7iIOSBw530C47pRhsph33mQPMj4q73tDMwTwnr11zYqQ==
X-Received: by 2002:a2e:63cd:: with SMTP id s74mr44547114lje.164.1564039155632;
        Thu, 25 Jul 2019 00:19:15 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id q21sm7370835lfc.96.2019.07.25.00.19.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 00:19:14 -0700 (PDT)
Subject: Re: [PATCH] media: staging: tegra-vde: Fix build error
To:     YueHaibing <yuehaibing@huawei.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robin.murphy@arm.com,
        sakari.ailus@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org
References: <dc354ede-5963-cd7f-ee53-f3df3061d39a@gmail.com>
 <20190725024129.22664-1-yuehaibing@huawei.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com>
Date:   Thu, 25 Jul 2019 10:19:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190725024129.22664-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

25.07.2019 5:41, YueHaibing пишет:
> If IOMMU_SUPPORT is not set, and COMPILE_TEST is y,
> IOMMU_IOVA may be set to m. So building will fails:
> 
> drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
> iommu.c:(.text+0x41): undefined reference to `alloc_iova'
> iommu.c:(.text+0x56): undefined reference to `__free_iova'
> 
> Select IOMMU_IOVA while COMPILE_TEST is set to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/staging/media/tegra-vde/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
> index 2e7f644..ba49ea5 100644
> --- a/drivers/staging/media/tegra-vde/Kconfig
> +++ b/drivers/staging/media/tegra-vde/Kconfig
> @@ -3,7 +3,7 @@ config TEGRA_VDE
>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>  	depends on ARCH_TEGRA || COMPILE_TEST
>  	select DMA_SHARED_BUFFER
> -	select IOMMU_IOVA if IOMMU_SUPPORT
> +	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>  	select SRAM
>  	help
>  	    Say Y here to enable support for the NVIDIA Tegra video decoder
> 

This results in missing the case of compile-testing !IOMMU_IOVA for the
driver, but probably that's not a big deal.

Acked-by: Dmitry Osipenko <digetx@gmail.com>
