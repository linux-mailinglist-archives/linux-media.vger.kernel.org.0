Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCA4BB99AA
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 00:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392500AbfITW0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 18:26:33 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33009 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392034AbfITW0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 18:26:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id a22so8559838ljd.0;
        Fri, 20 Sep 2019 15:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NCRwLUskdzV7gHTBmxNv4l39hBOLgSQ0mOSFdrxw3Z4=;
        b=oiX3xeQ0MNmmn5mM3EZkkEJkRlIy3l6sUSK6Bc0T7crcx0ziuZGRkuXypQJh7ZEOrh
         7ZSAWAE6uudRQPD2YI6d2gfbd90BQUiwsd7uBebVi75hQCxyMivAibyE/WPyRAS3Pzap
         +1/MgjgILz5Wvj3+ljs2MLCY1VVW4JTbBlscBmSsoo2tggbLnFAejToXHF6qQYgwBdnt
         HsSOSNQ+sAchY3R2WETinc0jkM0L+x8Ol6V3C4crjqeHX5o1LrZ55KEz7/4AzZu7CpZ9
         95+C7zJOYF6wZBBqmPwuaZcdT5ykBAtX+TjGX+NHq+vj9ioJiLl2qtVxB91+3O5ulNYO
         nzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NCRwLUskdzV7gHTBmxNv4l39hBOLgSQ0mOSFdrxw3Z4=;
        b=t0NIO539kiD6RvyltvjFauIj6ssYJBFYcGJVFv4RifS6Ii77cHgM6hidIGkXIHPbQ0
         i9DcOfHjOGOCCK/zpjuNF9ap9DQzOdfMwhHF6/yFCiSbwAyihz2894pyUIWf7ohryLP5
         r641l4V9LsKSOg+xM7cr++PQhFRdn98boPjBVhKL5RPznXWrxSgLr6Ijr1IrT1BD5orS
         ulfny+PznKFr5PQZj1cDxtDE/UV8tZtzKbb2l3u4+0PzXBm+OuJMb4WWWQVmCKIbWooc
         6Yt1NA/lNp4CrdHCFnk7a8/ZkKzmT3gn4/PvBsKh0rVtPrDPBzM1NL4y4dS0eUyBR7bK
         j+kw==
X-Gm-Message-State: APjAAAU0Hf18QwMa8JQcplcu3ySoyYOPoNN39GqrVgbHe+t6kZqosvrs
        uKZjmno2z9FlutJ0i/stRvo=
X-Google-Smtp-Source: APXvYqwxm/7zrCbHka/7eCQpm/oQUiH78xadO7fAr2TpiKXlOB/a4hiVWmiEHeHIi9DYOPMS0IXkVw==
X-Received: by 2002:a05:651c:110f:: with SMTP id d15mr10653261ljo.43.1569018390799;
        Fri, 20 Sep 2019 15:26:30 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.45.178])
        by smtp.googlemail.com with ESMTPSA id z30sm806218lfj.63.2019.09.20.15.26.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 15:26:29 -0700 (PDT)
Subject: Re: [PATCH] media: staging: tegra-vde: Fix build error
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
References: <dc354ede-5963-cd7f-ee53-f3df3061d39a@gmail.com>
 <20190725024129.22664-1-yuehaibing@huawei.com>
 <dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com>
 <CAK8P3a2Lxv6Wz3jv0eeNc7mfvNzSvh37QEx51W39eUnYPsxaYw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ed818d0c-2d5a-d9a4-e99d-43fe4eba4357@gmail.com>
Date:   Sat, 21 Sep 2019 01:26:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Lxv6Wz3jv0eeNc7mfvNzSvh37QEx51W39eUnYPsxaYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

20.09.2019 22:32, Arnd Bergmann пишет:
> On Thu, Jul 25, 2019 at 2:24 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 25.07.2019 5:41, YueHaibing пишет:
>>> If IOMMU_SUPPORT is not set, and COMPILE_TEST is y,
>>> IOMMU_IOVA may be set to m. So building will fails:
>>>
>>> drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
>>> iommu.c:(.text+0x41): undefined reference to `alloc_iova'
>>> iommu.c:(.text+0x56): undefined reference to `__free_iova'
>>>
>>> Select IOMMU_IOVA while COMPILE_TEST is set to fix this.
> 
>>> @@ -3,7 +3,7 @@ config TEGRA_VDE
>>>       tristate "NVIDIA Tegra Video Decoder Engine driver"
>>>       depends on ARCH_TEGRA || COMPILE_TEST
>>>       select DMA_SHARED_BUFFER
>>> -     select IOMMU_IOVA if IOMMU_SUPPORT
>>> +     select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>>>       select SRAM
>>>       help
>>>           Say Y here to enable support for the NVIDIA Tegra video decoder
>>>
>>
>> This results in missing the case of compile-testing !IOMMU_IOVA for the
>> driver, but probably that's not a big deal.
>>
>> Acked-by: Dmitry Osipenko <digetx@gmail.com>
> 
> I don't know what happened here, but the patch from YueHaibing caused this
> error for me, which is very much like the problem it was meant to fix:
> 
> drivers/gpu/host1x/dev.o: In function `host1x_probe':
> dev.c:(.text+0x1734): undefined reference to `put_iova_domain'
> dev.c:(.text+0x1744): undefined reference to `iova_cache_put'
> drivers/gpu/host1x/dev.o: In function `host1x_remove':
> dev.c:(.text+0x1894): undefined reference to `put_iova_domain'
> dev.c:(.text+0x1898): undefined reference to `iova_cache_put'
> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
> cdma.c:(.text+0x5d0): undefined reference to `alloc_iova'
> cdma.c:(.text+0x61c): undefined reference to `__free_iova'
> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_deinit':
> cdma.c:(.text+0x6c8): undefined reference to `free_iova'
> drivers/gpu/host1x/job.o: In function `host1x_job_pin':
> job.c:(.text+0x514): undefined reference to `alloc_iova'
> job.c:(.text+0x528): undefined reference to `__free_iova'
> drivers/gpu/host1x/job.o: In function `host1x_job_unpin':
> job.c:(.text+0x5bc): undefined reference to `free_iova'
> 
> After reverthing commit 6b2265975239 ("media: staging:
> tegra-vde: Fix build error"), I can no longer reproduce the
> issue.

There is a follow up here: https://patchwork.ozlabs.org/patch/1153176/
