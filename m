Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408C49D2C0
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 17:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732326AbfHZP2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 11:28:22 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45437 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731140AbfHZP2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 11:28:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id l1so15465346lji.12;
        Mon, 26 Aug 2019 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NL6fJrZIKeO5LGB29dZn2JLD+LBKfQdeed3wOTeWK7w=;
        b=NvuVyXHSK5exUD1YgfbCAfe8fX7FvWxN50g0xhgm48XRzkkAsV+gCA//2RnpvU5dt+
         VUQmPamsrQunReSVqYmvp2LjcSCffcgzRbEbIjKCzz7DrSLF6ebx196Q8oHuQ9HfKmZL
         8P++PXOWOhT98dGOums7Id+m06nPf5irwX0VvnGRuicr8hMj0HuNwAsH+tVr0qXQm3CM
         1Kyre+jnYiYwD86v+L9BRza8KmAC28aff/lUu90t0+xKq3mXJZrKsTLglEHylSy22Wqa
         YTgk0JWxHTmO8jwrcXUI47gT/ZJP6T8WzOIPPleh+MquZwl4LG7GOStKjolW3TqnTpYF
         bwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NL6fJrZIKeO5LGB29dZn2JLD+LBKfQdeed3wOTeWK7w=;
        b=CQLGQDJqdvTiK1T1zl5UFGHtW7+HMmsMl53eus2A8LVF650na9INTzoCPTTf1+UP++
         pi49clC3xmcJ5G/ZGSjGo7AOKctwjZARZ4+zwXwdy1BanJCd8dxjnfFanHhNnVrss1ma
         l+/U9yVApKAmSZi8Vx8fQ45QpWQfPM+iKFtxE/PAexhQCpmUHLTihGmX7/uUxLkmjydi
         tYvAEegCJy1+6kHwm+BivLTJ5teoriI8Wy6YYC/iep3qt+d6w7mYEMLayf2N7EQY7CA6
         77nQx4JyYQebxxS1uO6XIAHKm5flgzy4I7a9htLCOBxS5pKs/0FcxnZFCQW7vCCMOKU6
         ynWA==
X-Gm-Message-State: APjAAAXpL/J6hfUGKWX+Wa0Cy6seGYoPt1105W8zWmlCCLgJctw8H7eB
        BY3IYT/yUDWp6SR+/iD4fuNXbbgK
X-Google-Smtp-Source: APXvYqyN125me/ufP2gB3KH6hLVYyHqP5k4wmDOSNNvM8HI/uxSSqmN/fKMcvMHs/LE2mut6sluJcg==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr10833631lji.200.1566833300226;
        Mon, 26 Aug 2019 08:28:20 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.218])
        by smtp.googlemail.com with ESMTPSA id r12sm2404801ljg.36.2019.08.26.08.28.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 08:28:19 -0700 (PDT)
Subject: Re: [PATCH] media: staging: tegra-vde: Disable building with
 COMPILE_TEST
From:   Dmitry Osipenko <digetx@gmail.com>
To:     YueHaibing <yuehaibing@huawei.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robin.murphy@arm.com,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
References: <20190826133140.13456-1-yuehaibing@huawei.com>
 <58a8c62c-a45e-77e4-d2cb-99f95b847a73@gmail.com>
Message-ID: <79dacfcc-9407-bac6-8e9b-bb8f890994ee@gmail.com>
Date:   Mon, 26 Aug 2019 18:28:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <58a8c62c-a45e-77e4-d2cb-99f95b847a73@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.08.2019 18:18, Dmitry Osipenko пишет:
> Hello Yue,
> 
> 26.08.2019 16:31, YueHaibing пишет:
>> If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
>> to m will set IOMMU_IOVA to m, this fails the building of
>> TEGRA_HOST1X and DRM_TEGRA which is y like this:
>>
>> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
>> cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
>> cdma.c:(.text+0x698): undefined reference to `__free_iova'
>>
>> drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
>> drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
>> drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
>> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
>> index ba49ea5..a41d30c 100644
>> --- a/drivers/staging/media/tegra-vde/Kconfig
>> +++ b/drivers/staging/media/tegra-vde/Kconfig
>> @@ -1,9 +1,9 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  config TEGRA_VDE
>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>> -	depends on ARCH_TEGRA || COMPILE_TEST
>> +	depends on ARCH_TEGRA
>>  	select DMA_SHARED_BUFFER
>> -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>> +	select IOMMU_IOVA if IOMMU_SUPPORT
>>  	select SRAM
>>  	help
>>  	    Say Y here to enable support for the NVIDIA Tegra video decoder
>>
> 
> What about this variant:
> 
> 	select IOMMU_IOVA if (IOMMU_SUPPORT && !COMPILE_TEST)
> 
> which should fix the building and preserve compile-testing.
> 
> It shouldn't matter at all whether IOVA is enabled or not for
> compile-testing of the driver.
> 

Ah, actually this won't work if TEGRA_VDE=y and IOMMU_IOVA=m. I'm still
not sure that disabling compile-testing is a good solution, maybe
DRM_TEGRA and TEGRA_HOST1X should be fixed instead. Although, I'm fine
with both variants.

Acked-by: Dmitry Osipenko <digetx@gmail.com>
