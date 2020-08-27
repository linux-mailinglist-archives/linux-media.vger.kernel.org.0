Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DB5253E93
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 09:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgH0HF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 03:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0HFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 03:05:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433B1C061264;
        Thu, 27 Aug 2020 00:05:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v12so5194018ljc.10;
        Thu, 27 Aug 2020 00:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=brG5EoXG8FKt7Fq1ykdF4ABCLTAm7xSy7pDQ9zIqBmM=;
        b=D+Qfdi8ojtdlFaIaWaofdcOW2dSpHJq/jTsM6dpwBevrFASrN1edAw8teUWVNerpgu
         63ga9PzLJ1u8xo9GANebl8qwYj4EgB2Lt5+c2FZtDG0o0O+j7oIfdc233tEfNoJKuFe7
         DUxpMDtEWgsp8LTUtik3F1caZRHo486JrXlztWvaxpavYrnD9ARqY6DH44IQECiMjSIF
         cpTJQhP3AoFpI2jsFeq3dPzY4jmtYVXO8Sn8JUBkHLcyef3/N2jsvX1pnc2YLoznUsCF
         HDRVd99ElVGCkW/Ai5VbnxNG4jsJBtsJfFUa7vCIIoL+cOkFeVgwwtrqBHrnRCjQFsrY
         elFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=brG5EoXG8FKt7Fq1ykdF4ABCLTAm7xSy7pDQ9zIqBmM=;
        b=lQKuy1WTIMBCmqUg63ksZAe4FLpxfq6BV0mJVT+My9DmuF+uVbXV5yu69nKtuACdAD
         XAKIl6SPJpVPSaZ7KujG67/lic0wqkRUwjlduKbxAMmpAAO9FFoNfdMTqrwISR+Au2n6
         48eWOoUENmDYqF/mmJpGjYYnVI2htnSeYg3g+ZOovPoycODeg8is55y/A9yFWJL3qQp0
         XVr95gKWl/7XXZYeLaD5ZstW/4mRUaAq+bnzZmvRKKzY2RqqCDGLWlsi6SyQf6pz2Y56
         wT4HN+Ujz4w2W+O9NTSYM6cRHKJmQPLwRO2FNcLr+cnoMFnM3S1fhYGvU5VMO0C/To0w
         N0Zg==
X-Gm-Message-State: AOAM5326EnNJ6pXRIYgcahR1QEbSrCQUTvyXH0EiPpXDurdYwH75rAkz
        YP3biWrL7acvswuzUGUsF55EIFDkh5I=
X-Google-Smtp-Source: ABdhPJydX9Y9oDAFN3zznJgsiPNaCKcyWdKxS8pHyPJWykfpSUQ7Hoqsd5NtTOYp9/AGdUkscMfEjA==
X-Received: by 2002:a05:651c:106a:: with SMTP id y10mr9032794ljm.296.1598511951247;
        Thu, 27 Aug 2020 00:05:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id i131sm294684lfd.27.2020.08.27.00.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 00:05:50 -0700 (PDT)
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
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
 <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
 <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
 <affe2cfb-19e8-8e55-acd0-7170e274ab34@arm.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f1923a53-e799-e63c-fd22-4a6cca3b8212@gmail.com>
Date:   Thu, 27 Aug 2020 10:05:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <affe2cfb-19e8-8e55-acd0-7170e274ab34@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.08.2020 17:01, Robin Murphy пишет:
...
>> Robin, thank you very much for the clarifications!
>>
>> In accordance to yours comments, this patch can't be applied until Tegra
>> SMMU will support IOMMU_DOMAIN_IDENTITY and implement def_domain_type()
>> callback that returns IOMMU_DOMAIN_IDENTITY for the VDE device.
>>
>> Otherwise you're breaking the VDE driver because
>> dma_buf_map_attachment() [1] returns the IOMMU SGT of the implicit
>> domain which is then mapped into the VDE's explicit domain [2], and this
>> is a nonsense.
> 
> It's true that iommu_dma_ops will do some work in the unattached default
> domain, but non-coherent cache maintenance will still be performed
> correctly on the underlying memory, which is really all that you care
> about for this case. As for tegra_vde_iommu_map(), that seems to do the
> right thing in only referencing the physical side of the scatterlist
> (via iommu_map_sg()) and ignoring the DMA side, so things ought to work
> out OK even if it is a little non-obvious.

I'll need to double-check this, it's indeed not clear to me right now.

I see that if Tegra DRM driver uses implicit IOMMU domain, then when VDE
driver imports DMA-buf from Terga DRM and the imported buffer will be
auto-mapped to the implicit VDE IOVA [1].

[1]
https://elixir.bootlin.com/linux/v5.9-rc2/source/drivers/gpu/drm/tegra/gem.c#L574

>> Hence, either VDE driver should bypass iommu_dma_ops from the start or
>> it needs a way to kick out the ops, like it does this using ARM's
>> arm_iommu_detach_device().
>>
>>
>> The same applies to the Tegra GPU devices, otherwise you're breaking
>> them as well because Tegra DRM is sensible to implicit vs explicit
>> domain.
> 
> Note that Tegra DRM will only be as broken as its current state on
> arm64, and I was under the impression that that was OK now - at least I
> don't recall seeing any complaints since 43c5bf11a610. Although that
> commit and the one before it are resolving the scalability issue that
> they describe, it was very much in my mind at the time that they also
> have the happy side-effect described above - the default domain isn't
> *completely* out of the way, but it's far enough that sensible cases
> should be able to work as expected.

The Tegra DRM has a very special quirk for ARM32 that was added in this
commit [2] and driver relies on checking of whether explicit or implicit
IOMMU is used in order to activate the quirk.

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=273da5a046965ccf0ec79eb63f2d5173467e20fa

Once the implicit IOMMU is used for the DRM driver, the quirk no longer
works (if I'm not missing something). This problem needs to be resolved
before implicit IOMMU could be used by the Tegra DRM on ARM32.

>> BTW, I tried to apply this series and T30 doesn't boot anymore. I don't
>> have more info for now.
> 
> Yeah, I'm still trying to get to the bottom of whether it's actually
> working as intended at all, even on my RK3288. So far my debugging
> instrumentation has been confusingly inconclusive :/

Surely it will take some time to resolve all the problems and it's great
that you're pushing this work!

I'll try to help with fixing the ARM32 Tegra side of the problems. I
added this to my "TODO" list and should be able to take a closer look
during of this/next weeks!
