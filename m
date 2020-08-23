Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29AB724EFE1
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 23:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHWVeT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 17:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgHWVeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 17:34:16 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D740C061573;
        Sun, 23 Aug 2020 14:34:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i10so7441382ljn.2;
        Sun, 23 Aug 2020 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n2F2FGRAOF++9VTPEPAqlvQHDhX4O80c4ILV6HoVEkg=;
        b=nBGUO2+CzS+eIedJYh0adgzGTCDK+DiYn+T1RWXwfVtA2TPyYsqs5oPkwJ5G6odtcA
         5+zRzZJcb6dh2zSNNYBhTZxQ2YWy8Qb/LmpKPWnd8BRTPrxglvI0lrfrLeUqAMQnF4Lv
         jUc3pDjYPCyq6k5mHgnYpKhff2MyMHxmWsvf6cLws+OTw+1JIA2CMEHDk2b29JjHp8ek
         dOriBvpV8Rr0Q71D4TeYyrYtbb0BGJKZ0rLDya+EH5FPsx6rOHVCB3m5SXVxFxIfqDoo
         A+3QOEhgqi7Gox6wqxUqQ/PGrXaMSN82Z4X89LoCSBJNkOtDhqjPg95Csr2lyf66RTAC
         xMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n2F2FGRAOF++9VTPEPAqlvQHDhX4O80c4ILV6HoVEkg=;
        b=b6x/YT7njZ9ruqmsIF19K4G5QPjXy0d+fTjt7e8phRp+dPm31by6KVusLQJeXwl8jW
         vS0QpXjVz/EGqdkFKDHcxu1Exu3aZjrkcmimix62GRLHFf9HHqgTVSxCDbfTwQeElXNl
         Iab9vO0IZPAGMosJakrim6BvkWra+OOjwa2C4lr4sru5XfkQUIitatgxXqc8hsTMKXkz
         Deo8HhXWo63/p6LYftXEOqlVir/Z+qV9n1YhxhlRy7gjXmyAbFxM79laabtXy4KDQf7K
         3AWlSvlyzG1Ddj42bvDCHdVsc5TZVqdUfXzQyA1KKlidS2+uZT8//ITTLM9Y3GM+O5+4
         Ckhg==
X-Gm-Message-State: AOAM5339A6LoeHpgPQpLH8w0S+3H4f8oMsDxomXbdLYIgBNz+kUirIAC
        GmzvLLMsSM6ZoKPC91qbDkqgbmJLmGs=
X-Google-Smtp-Source: ABdhPJyGaoIhdc9oGCyfDdmoZ4N9IK/jexb/zrdCS7oGtDaEk9ZhXkPkOIEioXN5U2D5nTEitFcv4A==
X-Received: by 2002:a05:651c:8f:: with SMTP id 15mr1122855ljq.53.1598218454018;
        Sun, 23 Aug 2020 14:34:14 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id f18sm395343lfa.54.2020.08.23.14.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2020 14:34:13 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
Date:   Mon, 24 Aug 2020 00:34:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

21.08.2020 03:11, Robin Murphy пишет:
...
>> Hello, Robin! Thank you for yours work!
>>
>> Some drivers, like this Tegra VDE (Video Decoder Engine) driver for
>> example, do not want to use implicit IOMMU domain.
> 
> That isn't (intentionally) changing here - the only difference should be
> that instead of having the ARM-special implicit domain, which you have
> to kick out of the way with the ARM-specific API before you're able to
> attach your own domain, the implicit domain is now a proper IOMMU API
> default domain, which automatically gets bumped by your attach. The
> default domains should still only be created in the same cases that the
> ARM dma_iommu_mappings were.
> 
>> Tegra VDE driver
>> relies on explicit IOMMU domain in a case of Tegra SMMU because VDE
>> hardware can't access last page of the AS and because driver wants to
>> reserve some fixed addresses [1].
>>
>> [1]
>> https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/staging/media/tegra-vde/iommu.c#L100
>>
>>
>> Tegra30 SoC supports up to 4 domains, hence it's not possible to afford
>> wasting unused implicit domains. I think this needs to be addressed
>> before this patch could be applied.
> 
> Yeah, there is one subtle change in behaviour from removing the ARM
> layer on top of the core API, in that the IOMMU driver will no longer
> see an explicit detach call. Thus it does stand to benefit from being a
> bit cleverer about noticing devices being moved from one domain to
> another by an attach call, either by releasing the hardware context for
> the inactive domain once the device(s) are moved across to the new one,
> or by simply reprogramming the hardware context in-place for the new
> domain's address space without allocating a new one at all (most of the
> drivers that don't have multiple contexts already handle the latter
> approach quite well).
> 
>> Would it be possible for IOMMU drivers to gain support for filtering out
>> devices in iommu_domain_alloc(dev, type)? Then perhaps Tegra SMMU driver
>> could simply return NULL in a case of type=IOMMU_DOMAIN_DMA and
>> dev=tegra-vde.
> 
> If you can implement IOMMU_DOMAIN_IDENTITY by allowing the relevant
> devices to bypass translation entirely without needing a hardware
> context (or at worst, can spare one context which all identity-mapped
> logical domains can share), then you could certainly do that kind of
> filtering with the .def_domain_type callback if you really wanted to. As
> above, the intent is that that shouldn't be necessary for this
> particular case, since only one of a group's default domain and
> explicitly attached domain can be live at any given time, so the driver
> should be able to take advantage of that.
> 
> If you simply have more active devices (groups) than available contexts
> then yes, you probably would want to do some filtering to decide who
> deserves a translation domain and who doesn't, but in that case you
> should already have had a long-standing problem with the ARM implicit
> domains.
> 
>> Alternatively, the Tegra SMMU could be changed such that the devices
>> will be attached to a domain at the time of a first IOMMU mapping
>> invocation instead of attaching at the time of attach_dev() callback
>> invocation.
>>
>> Or maybe even IOMMU core could be changed to attach devices at the time
>> of the first IOMMU mapping invocation? This could be a universal
>> solution for all drivers.
> 
> I suppose technically you could do that within an IOMMU driver already
> (similar to how some defer most of setup that logically belongs to
> ->domain_alloc until the first ->attach_dev). It's a bit grim from the
> caller's PoV though, in terms of the failure mode being non-obvious and
> having no real way to recover. Again, you'd be better off simply making
> decisions up-front at domain_alloc or attach time based on the domain type.

Robin, thank you very much for the clarifications!

In accordance to yours comments, this patch can't be applied until Tegra
SMMU will support IOMMU_DOMAIN_IDENTITY and implement def_domain_type()
callback that returns IOMMU_DOMAIN_IDENTITY for the VDE device.

Otherwise you're breaking the VDE driver because
dma_buf_map_attachment() [1] returns the IOMMU SGT of the implicit
domain which is then mapped into the VDE's explicit domain [2], and this
is a nonsense.

[1]
https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/staging/media/tegra-vde/dmabuf-cache.c#L102

[2]
https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/staging/media/tegra-vde/dmabuf-cache.c#L122

Hence, either VDE driver should bypass iommu_dma_ops from the start or
it needs a way to kick out the ops, like it does this using ARM's
arm_iommu_detach_device().


The same applies to the Tegra GPU devices, otherwise you're breaking
them as well because Tegra DRM is sensible to implicit vs explicit domain.


BTW, I tried to apply this series and T30 doesn't boot anymore. I don't
have more info for now.
