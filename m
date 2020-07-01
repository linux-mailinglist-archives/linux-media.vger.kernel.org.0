Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2326421019E
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 03:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgGABpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 21:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgGABpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 21:45:50 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56126C061755;
        Tue, 30 Jun 2020 18:45:50 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g2so12637137lfb.0;
        Tue, 30 Jun 2020 18:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HczcFWcC6ZdwoUa650Xj9nL47iYNBcU34xhBNmcm5mQ=;
        b=qcXawn2WKloYEsPbetf6aagiDS45tW33ipg0zz3WpddTf5mEfIPl/RMM9F4K1UD0CA
         PyrZx3PgfMl6DntR2pNPLKuFwKF44YW5yhfETcUmTvZtwQys3Sa24F32CSHiXsXi+Zee
         tWrAu2tOdbV5ta2vdNmYg2bItojho4xB1/WO9czIGpsBqf3dPr67OrQwMj2W6NDqaf+T
         OCTVkIifGIabvdY9ZjZ6IRYTqrc9RJyqx1K6E8sxUmppsswEFsVxPJaC/H+INESMKHfC
         DyoaZC3gOoMtsEaGj5hUdAxFWGcDOTyMZJlKw35i76V0XWVl52wdzqVlxci/HIjlLUj1
         kLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HczcFWcC6ZdwoUa650Xj9nL47iYNBcU34xhBNmcm5mQ=;
        b=tCJHthBWYapCJWgbIXTGLHtrZhQHDP71UP95zMjd4R7M+pVbNm0ilTB4/Q92CN3W3X
         OkVQrtXdjg6kwbHayrcGK9Qpit2GPeBoNZqzuazFNv3TREHSR8vmGYqJu7kwuG/AVdUr
         XkrK4SoJGrtiB7+BqukQG/DF0JKYjmh2346VDOUPVVsaZWKB9qOd34OTLT8KwVxRI8XE
         7LWYve7+/x0Kob2k5b+7Rn8/fSe9Wk84OhVjqiQKvQ3uUhVEn/QVXbhY95myNWiErfl8
         pCX+kAXJwPSi77HwhZ+xxB0GmhFrOruZw0RMaW/IIl+nkfWfXBlgzzdLHjf7s6cxHhyN
         uMxA==
X-Gm-Message-State: AOAM530gOnXz0K38YYP1FeMWHza8v0TVjCiFb/uCPopTVs+/h66mtyPX
        UHAiwpCosttXvmuebc86Bd4=
X-Google-Smtp-Source: ABdhPJwbkW9xT3ZwoL2zmgvISkNdI5MF+tmhowtU+Y/M+Llvwp1rA3SMtcAIZ5jfUBSevSSc5oW50A==
X-Received: by 2002:ac2:548a:: with SMTP id t10mr13826582lfk.142.1593567948716;
        Tue, 30 Jun 2020 18:45:48 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id 193sm1594603lfa.90.2020.06.30.18.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 18:45:47 -0700 (PDT)
Subject: Re: [PATCH v7 31/36] staging: tegra-vde: fix common struct sg_table
 related issues
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
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
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa@eucas1p1.samsung.com>
 <20200619103636.11974-32-m.szyprowski@samsung.com>
 <20200621070015.0cf833ab@dimatab>
 <559970b6-e80f-90ec-7fb0-1fab742d99de@samsung.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <60aacf07-e263-85e0-9d45-1edb8ba3b954@gmail.com>
Date:   Wed, 1 Jul 2020 04:45:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <559970b6-e80f-90ec-7fb0-1fab742d99de@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.06.2020 13:07, Marek Szyprowski пишет:
> On 21.06.2020 06:00, Dmitry Osipenko wrote:
>> В Fri, 19 Jun 2020 12:36:31 +0200
>> Marek Szyprowski <m.szyprowski@samsung.com> пишет:
>>
>>> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg()
>>> function returns the number of the created entries in the DMA address
>>> space. However the subsequent calls to the
>>> dma_sync_sg_for_{device,cpu}() and dma_unmap_sg must be called with
>>> the original number of the entries passed to the dma_map_sg().
>>>
>>> struct sg_table is a common structure used for describing a
>>> non-contiguous memory buffer, used commonly in the DRM and graphics
>>> subsystems. It consists of a scatterlist with memory pages and DMA
>>> addresses (sgl entry), as well as the number of scatterlist entries:
>>> CPU pages (orig_nents entry) and DMA mapped pages (nents entry).
>>>
>>> It turned out that it was a common mistake to misuse nents and
>>> orig_nents entries, calling DMA-mapping functions with a wrong number
>>> of entries or ignoring the number of mapped entries returned by the
>>> dma_map_sg() function.
>>>
>>> To avoid such issues, lets use a common dma-mapping wrappers operating
>>> directly on the struct sg_table objects and use scatterlist page
>>> iterators where possible. This, almost always, hides references to the
>>> nents and orig_nents entries, making the code robust, easier to follow
>>> and copy/paste safe.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>   drivers/staging/media/tegra-vde/iommu.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/tegra-vde/iommu.c
>>> b/drivers/staging/media/tegra-vde/iommu.c index
>>> 6af863d92123..adf8dc7ee25c 100644 ---
>>> a/drivers/staging/media/tegra-vde/iommu.c +++
>>> b/drivers/staging/media/tegra-vde/iommu.c @@ -36,8 +36,8 @@ int
>>> tegra_vde_iommu_map(struct tegra_vde *vde,
>>>   	addr = iova_dma_addr(&vde->iova, iova);
>>>   
>>> -	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
>>> -			    IOMMU_READ | IOMMU_WRITE);
>>> +	size = iommu_map_sgtable(vde->domain, addr, sgt,
>>> +				 IOMMU_READ | IOMMU_WRITE);
>>>   	if (!size) {
>>>   		__free_iova(&vde->iova, iova);
>>>   		return -ENXIO;
>> Ahh, I saw the build failure report. You're changing the DMA API in
>> this series, while DMA API isn't used by this driver, it uses IOMMU
>> API. Hence there is no need to touch this code. Similar problem in the
>> host1x driver patch.
> 
> The issue is caused by the lack of iommu_map_sgtable() stub when no 
> IOMMU support is configured. I've posted a patch for this:
> 
> https://lore.kernel.org/lkml/20200630081756.18526-1-m.szyprowski@samsung.com/
> 
> The patch for this driver is fine, we have to wait until the above fix 
> gets merged and then it can be applied during the next release cycle.

Thank you for the clarification!
