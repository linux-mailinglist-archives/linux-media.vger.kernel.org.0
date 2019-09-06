Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0193AB96B
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 15:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393334AbfIFNii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 09:38:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33534 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391634AbfIFNii (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 09:38:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so6072369ljd.0;
        Fri, 06 Sep 2019 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qvGBDr79mgdpu98SIY4ZRDe69WVCw7anA4ywGgxGxNc=;
        b=XTgbUDPnpkktFUYLZrNeBOZF8yeu/7KkLGkmTy3Ax3LuBiDZpaEVxOAMKc29VJhyz3
         PHsF7FUsBleItoHedA9S7/QIrIa2zG5n4X5le+RQtbOje8mBcWfj0AWElX9SFpeInu5I
         bcqe5decbtTPXhvIxpeC2AUDZCRlf4YET+3YYGbBq14PgG1q+uOWnZKrGkkXnUQtz/6a
         i0Y00Gg51B+iiPkQo7TpQGlIOWjhyHjfp7F5lL9ktkGlYsIXAYjGqFuimtaGeDHIPyoB
         J+D9QYlVGuO9craTnFk61EYAb8KlhbZ6RVuF01lAizTzFmPAYPr+OVSXBFh7gBf5M2Bb
         WqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qvGBDr79mgdpu98SIY4ZRDe69WVCw7anA4ywGgxGxNc=;
        b=FiLQfedkq8tu3QAb1ZszqHaM3dwtY/qfbt7WgX0LqtNvEBRD7u7cb1EWy2X4lYVdG9
         ZYcEXD0kA1G6JfTRiDZlyp4+PtImZgPIo/JpDbxygAMlG8aCYpCbZkZtnRS5D94W9h+h
         emcG6QXeMVN/DPXr53SjLiMfULW3es4gyaNc5gPu+2QOKj6/chOuhSZuUvQw5I0Pytsd
         E65/AhPidZLbIkAPwcs8W59mZGhRpsyLXAbS1T0VCxv0GEBtaajxYCAatAkM1sJ70ifN
         PwPmdocrNscf9hKncoG8PEUBnW7OnSR8K9ekX5A+KW+c8yD37kZ1mH3FXB3gd40rFzoi
         gsZg==
X-Gm-Message-State: APjAAAVZwhoPqBLL8tF3Qit0Dt+FWHCc4QINBJE3vo54E2bfHcf01CZg
        EotzdtHQ2m7BHQV2ejFL+lE=
X-Google-Smtp-Source: APXvYqx1cXjuxoE/j7ZDk4fdPT/zgtXus0TzRg2oupqeb/ZUe7h3+EQ8H6YWNCXrqmguRlk7kTaB2w==
X-Received: by 2002:a2e:6596:: with SMTP id e22mr5564848ljf.87.1567777115141;
        Fri, 06 Sep 2019 06:38:35 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.218])
        by smtp.googlemail.com with ESMTPSA id q13sm1136466lfk.51.2019.09.06.06.38.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 06:38:34 -0700 (PDT)
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
 <b048b460-9d58-8e38-e335-f9a3fface559@gmail.com>
 <20190829154902.GC19842@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4014675-8fc6-e947-7ac5-68795fd80bc0@gmail.com>
Date:   Fri, 6 Sep 2019 16:38:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829154902.GC19842@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

29.08.2019 18:49, Thierry Reding пишет:
> On Thu, Aug 29, 2019 at 04:58:22PM +0300, Dmitry Osipenko wrote:
>> 29.08.2019 15:40, Thierry Reding пишет:
>>> On Thu, Aug 29, 2019 at 01:39:32PM +0200, Hans Verkuil wrote:
>>>> On 8/26/19 3:31 PM, YueHaibing wrote:
>>>>> If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
>>>>> to m will set IOMMU_IOVA to m, this fails the building of
>>>>> TEGRA_HOST1X and DRM_TEGRA which is y like this:
>>>>>
>>>>> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
>>>>> cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
>>>>> cdma.c:(.text+0x698): undefined reference to `__free_iova'
>>>>>
>>>>> drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
>>>>> drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
>>>>> drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
>>>>>
>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>>> Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
>>>>> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
>>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>>> ---
>>>>>  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
>>>>> index ba49ea5..a41d30c 100644
>>>>> --- a/drivers/staging/media/tegra-vde/Kconfig
>>>>> +++ b/drivers/staging/media/tegra-vde/Kconfig
>>>>> @@ -1,9 +1,9 @@
>>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>>  config TEGRA_VDE
>>>>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>>>>> -	depends on ARCH_TEGRA || COMPILE_TEST
>>>>> +	depends on ARCH_TEGRA
>>>>
>>>> What happens if you drop this change,
>>>>
>>>>>  	select DMA_SHARED_BUFFER
>>>>> -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>>>>> +	select IOMMU_IOVA if IOMMU_SUPPORT
>>>>
>>>> but keep this change?
>>>>
>>>> iova.h has stubs that are used if IOMMU_IOVA is not set, so it should
>>>> work when compile testing this tegra-vde driver.
>>>>
>>>> Haven't tried it, but making sure that compile testing keep working is
>>>> really important.
>>
>> The driver's code compilation works okay, it's the linkage stage which
>> fails during compile-testing.
>>
>>> Yeah, that variant seems to work for me. I think it's also more correct
>>> because the IOMMU_IOVA if IOMMU_SUPPORT dependency really says that the
>>> IOVA usage is bound to IOMMU support. If IOMMU support is not enabled,
>>> then IOVA is not needed either, so the dummies will do just fine.
>>
>> Am I understanding correctly that you're suggesting to revert [1][2] and
>> get back to the other problem?
>>
>> [1]
>> https://lore.kernel.org/linux-media/dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com/T/
>> [2] https://patchwork.ozlabs.org/patch/1136619/
>>
>> If we want to keep compile testing, I guess the only reasonable variant
>> right now is to select IOMMU_IOVA unconditionally in all of the drivers
>> (vde, host1x, drm and etc) and then just ignore that IOVA will be
>> compiled-and-unused if IOMMU_SUPPORT=n (note that IOMMU_SUPPORT=y in all
>> of default kernel configurations).
> 
> Agreed. I think we should just select IOMMU_IOVA unconditionally. We
> really do want IOMMU_SUPPORT always as well, but it might be nice to be
> able to switch it off for testing or so. In the cases that really matter
> we will be enabling both IOMMU_SUPPORT and IOMMU_IOVA anyway, so might
> as well select IOMMU_IOVA always. It's not terribly big and I can't
> imagine anyone wanting to run a kernel without IOMMU_SUPPORT for
> anything other than testing.

Hello Yue,

Could you please make an updated version of the fix in accordance to the above comments?

Alternatively, we can go with the current patch and temporarily remove the compile-testing. I'll make
patches to properly re-add compile-testing sometime later then.
