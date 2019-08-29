Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0EEA1C21
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 15:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbfH2N61 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 09:58:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39657 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfH2N61 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 09:58:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id x4so3140296ljj.6;
        Thu, 29 Aug 2019 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pXpfC9fVJDCmYksnQ+VHfuPY/W7iUuvQ53sueGC6Na4=;
        b=LCM6HoSz2hrMB3LeCxNEXp1AY1mamuUn8RLdXvD9Tr/2qrjnokLAwAp6SwvrZDEKk1
         hffIKGm3aRPmo8FKD8oqHrASYqAUZtDS1TJNkXDWDemv5AF63k77eEqmTncFz7FG5DDB
         JDKmF7rjguaZJT2u/8c3CxZWft2Qu8PpT0JtmSEkHJHpGP3mDY1G/ILZI/C9z9vFYWjx
         4Ivfdep4607Dqq1DtA6Ngfhrew6BuUWc+9GVu1o8KSOObbwkbZhliu5OMmDF/UpXvLG6
         npfBbuRWhm/u3me8aMkXSqsIUrp3NLX6CcWpe3ZM7UrBga1EGCSZc1O7/ZDQKWI76SRO
         WHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pXpfC9fVJDCmYksnQ+VHfuPY/W7iUuvQ53sueGC6Na4=;
        b=Xe/rK0nolWrlLpfCMvNakfC0og6IWy8aDXPsaJ9uXddXHPp+1AehuZOm7a7/PjiNox
         C/DEcWVxBguw/iybPNWsqsGuCVjyAwH7VabheLjcPDGg9aUaOqFHqtfesQ+TMJSvXVSf
         d8qz/mcj4y5RbLj+lgJwnpMrCqIqJWM64/Ab47NGvwCj+iiHJHx2I8ckzTGEkLfLylAk
         TMMtuaB5orVKMe55kREgj8SiUSQR3tNiSgkAC12IQWBTOb/byyplOBvYv2RW22veeoY5
         Pj8beUJyJkM6/P+wNXy3lW+YgswxWSDAwW/u5RagCbtfgxWjZjAwxIj3CsU+LUBAn5yc
         rhaQ==
X-Gm-Message-State: APjAAAUqXm71YmqXzFD3MC/kggAHfNNhyfBAaQ599L4uxmq1kCbTx8LZ
        sOs7WmV8P6pJ9jX5rc5wUPI=
X-Google-Smtp-Source: APXvYqyhU2nYYcl/nKHC9106K7uLheLIAY7mR95TcX2AamAh/vQGuUAipL2F1k86FVP0yJcYYa/PAw==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr5500259lji.223.1567087104736;
        Thu, 29 Aug 2019 06:58:24 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.218])
        by smtp.googlemail.com with ESMTPSA id z3sm365177lji.4.2019.08.29.06.58.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 06:58:23 -0700 (PDT)
Subject: Re: [PATCH] media: staging: tegra-vde: Disable building with
 COMPILE_TEST
To:     Thierry Reding <thierry.reding@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        YueHaibing <yuehaibing@huawei.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, robin.murphy@arm.com,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
References: <20190826133140.13456-1-yuehaibing@huawei.com>
 <7f73bcac-f52d-f1b3-324c-e9b551c5378b@xs4all.nl>
 <20190829124034.GA19842@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b048b460-9d58-8e38-e335-f9a3fface559@gmail.com>
Date:   Thu, 29 Aug 2019 16:58:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829124034.GA19842@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

29.08.2019 15:40, Thierry Reding пишет:
> On Thu, Aug 29, 2019 at 01:39:32PM +0200, Hans Verkuil wrote:
>> On 8/26/19 3:31 PM, YueHaibing wrote:
>>> If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
>>> to m will set IOMMU_IOVA to m, this fails the building of
>>> TEGRA_HOST1X and DRM_TEGRA which is y like this:
>>>
>>> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
>>> cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
>>> cdma.c:(.text+0x698): undefined reference to `__free_iova'
>>>
>>> drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
>>> drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
>>> drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
>>> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
>>> index ba49ea5..a41d30c 100644
>>> --- a/drivers/staging/media/tegra-vde/Kconfig
>>> +++ b/drivers/staging/media/tegra-vde/Kconfig
>>> @@ -1,9 +1,9 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>>  config TEGRA_VDE
>>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>>> -	depends on ARCH_TEGRA || COMPILE_TEST
>>> +	depends on ARCH_TEGRA
>>
>> What happens if you drop this change,
>>
>>>  	select DMA_SHARED_BUFFER
>>> -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>>> +	select IOMMU_IOVA if IOMMU_SUPPORT
>>
>> but keep this change?
>>
>> iova.h has stubs that are used if IOMMU_IOVA is not set, so it should
>> work when compile testing this tegra-vde driver.
>>
>> Haven't tried it, but making sure that compile testing keep working is
>> really important.

The driver's code compilation works okay, it's the linkage stage which
fails during compile-testing.

> Yeah, that variant seems to work for me. I think it's also more correct
> because the IOMMU_IOVA if IOMMU_SUPPORT dependency really says that the
> IOVA usage is bound to IOMMU support. If IOMMU support is not enabled,
> then IOVA is not needed either, so the dummies will do just fine.

Am I understanding correctly that you're suggesting to revert [1][2] and
get back to the other problem?

[1]
https://lore.kernel.org/linux-media/dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com/T/
[2] https://patchwork.ozlabs.org/patch/1136619/

If we want to keep compile testing, I guess the only reasonable variant
right now is to select IOMMU_IOVA unconditionally in all of the drivers
(vde, host1x, drm and etc) and then just ignore that IOVA will be
compiled-and-unused if IOMMU_SUPPORT=n (note that IOMMU_SUPPORT=y in all
of default kernel configurations).
