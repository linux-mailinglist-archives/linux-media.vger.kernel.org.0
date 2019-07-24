Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBC473131
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfGXOJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:09:58 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40441 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfGXOJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:09:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id b17so32087046lff.7;
        Wed, 24 Jul 2019 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5TDhFld/eHS7IYB60yUBetfgICBgTmFxknVZGppAKVY=;
        b=cxpmsx6uLdsw/bi3AUvQq74Ww0ft0zqDkE3E2M0XpOcl4d8LkUCY8osX8eCgUmAuJo
         97osGTWiQotVc/jqUlLU0HkmnJ5tieJdvz396iTeiMa58ryVZVqapLIe0Hav+EgFyMmU
         +9eGt90wvLTF5BvibV1Q21U7szJSArumW31ZMaX/R3yOQhnAAINOGAuXC2OAt6vJOopV
         d38MxAXLa0p/5Jz8uUSvB3RRWjK9PQbhHVqec5YHlbcGcSb98m6CrYlIkhdC0gEIG+mv
         vCbBpGLuo3S2lEI4ud7o0gzMjt9rWzuQG5fT3ZAHKzdluYnmIgvwSdawdsIsE/28pABs
         hmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5TDhFld/eHS7IYB60yUBetfgICBgTmFxknVZGppAKVY=;
        b=OuwrrQtuyuDYvevvsdHd1TjJm8Jyka61nRf5n2u/hx5LycXEIchEWwaJUXsEeaiwRO
         H67HMMqxR98JI+HNESHX+fL0ofpi76XRft2sZH681i0jHZ0gbMk4rmN+3u1BryoVkUMB
         Xb5eAnkjVtc2vpn1W8e7ha9kBzY0UIfu03G57ITpgbyJSfeLhs6ecAst6r4fnLgdDWth
         VxpwaQhFQUPqsY0cjJrGLJ00UcdyT5EGtEEWDPp+yFoRxVx9a712iVw7WwT5RNAUIKHK
         bVH0DHVMgwVcVhhrp0tZuo7DrpCrRFDguMBFQ5UgWvoXEINwook6BSpop13QbAyX+/0M
         RG2A==
X-Gm-Message-State: APjAAAWl/oNs2+3yZHNjMNOZXHpPFQnAEbi6dyI0rW01G7RAJfNyN1Sj
        R4JpqQ2uLPGo0Nj36FHokxU=
X-Google-Smtp-Source: APXvYqxK1fG+r2FGv25yZ1DPzjciv2L5EMqpAScm54D7ySJTLFckDaUho8RmvveLM6wOUsw87x2pvw==
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr27772968lfm.87.1563977396265;
        Wed, 24 Jul 2019 07:09:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id c12sm6989583lfj.58.2019.07.24.07.09.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 07:09:55 -0700 (PDT)
Subject: Re: [PATCH] media: staging: ipu3: Enable IOVA API only when IOMMU
 support is enabled
To:     Yuehaibing <yuehaibing@huawei.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, yong.zhi@intel.com
References: <20190722134749.21580-1-yuehaibing@huawei.com>
 <20190724103027.GD21370@paasikivi.fi.intel.com>
 <e48fc180-06cc-eac7-d8ca-9be1699c8677@arm.com>
 <0c08bdae-facc-0f28-0e58-17a65172587a@huawei.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <491dbca1-8a58-b26e-cf56-a1a419da288f@gmail.com>
Date:   Wed, 24 Jul 2019 17:09:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0c08bdae-facc-0f28-0e58-17a65172587a@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.07.2019 17:03, Yuehaibing пишет:
> On 2019/7/24 21:49, Robin Murphy wrote:
>> On 24/07/2019 11:30, Sakari Ailus wrote:
>>> Hi Yue,
>>>
>>> On Mon, Jul 22, 2019 at 09:47:49PM +0800, YueHaibing wrote:
>>>> If IOMMU_SUPPORT is not set, ipu3 driver may select IOMMU_IOVA to m.
>>>> But for many drivers, they use "select IOMMU_IOVA if IOMMU_SUPPORT"
>>>> in the Kconfig, for example, CONFIG_TEGRA_VDE is set to y but IOMMU_IOVA
>>>> is m, then the building fails like this:
>>>>
>>>> drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
>>>> iommu.c:(.text+0x41): undefined reference to `alloc_iova'
>>>> iommu.c:(.text+0x56): undefined reference to `__free_iova'
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>> ---
>>>>   drivers/staging/media/ipu3/Kconfig | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
>>>> index 4b51c67..b7df18f 100644
>>>> --- a/drivers/staging/media/ipu3/Kconfig
>>>> +++ b/drivers/staging/media/ipu3/Kconfig
>>>> @@ -4,7 +4,7 @@ config VIDEO_IPU3_IMGU
>>>>       depends on PCI && VIDEO_V4L2
>>>>       depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
>>>>       depends on X86
>>>> -    select IOMMU_IOVA
>>>> +    select IOMMU_IOVA if IOMMU_SUPPORT
>>>
>>> This doesn't seem right: the ipu3-cio2 driver needs IOMMU_IOVA
>>> independently of IOMMU_SUPPORT.
>>>
>>> Looking at tegra-vde, it seems to depend on IOMMU_SUPPORT but that's not
>>> declared in its Kconfig entry. I wonder if adding that would be the right
>>> way to fix this.
>>>
>>> Cc'ing the IOMMU list.
IOMMU_SUPPORT is optional for the Tegra-VDE driver.

>> Right, I also had the impression that we'd made the IOVA library completely standalone. And what does the IPU3 driver's Kconfig have to do with some *other* driver failing to link anyway?

I can see it failing if IPU3 is compiled as a loadable module, while
Tegra-VDE is a built-in driver. Hence IOVA lib should be also a kernel
module and thus the IOVA symbols will be missing during of linkage of
the VDE driver.

> Oh, I misunderstand that IOMMU_IOVA is depend on IOMMU_SUPPORT, thank you for clarification.
> 
> I will try to fix this in tegra-vde.

Probably IOVA could be selected independently of IOMMU_SUPPORT, but IOVA
library isn't needed for the VDE driver if IOMMU_SUPPORT is disabled.
