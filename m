Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66ADC48432
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbfFQNhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:37:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37760 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfFQNhC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:37:02 -0400
Received: by mail-wm1-f66.google.com with SMTP id f17so6639886wme.2;
        Mon, 17 Jun 2019 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pz+MJpArisYQrfWi1l8CgjJCZ0sBnaJmYJFQI+E8ins=;
        b=vPwuP/5DaUP8MHatA256OU+MddlRTG15mE+/aKo0T3mbrwDrrIuLBK8fLPPRGOBX1X
         oaI6M7Op4jX1pLz/bsmk6yo5txOt7BRJVvBG0md2TZQPiR1kUjy3suE/p07QZk4W73jL
         qUJumPYSlCb9/yBkNBNLJFYm7LkFxnPEuVn0wJrOnGLLZfAysnt6/OtJ2Ivw6EMxFfkn
         GILlR+EmSvMh3nh54hdB/f6M3NK636FoL5oGkpKtjsR+wR0HPKazRVHC+0idUyfqT/sI
         +jCtSTZhap8sanpocCwvnbgyHlUE9jFniGLulkJPspMGJ9fE2YJOP7ULXGNepL7XeCiB
         +yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pz+MJpArisYQrfWi1l8CgjJCZ0sBnaJmYJFQI+E8ins=;
        b=QzQOJb29KzMy6rpwW98MQocyM+rMngTQTITLJz04PJWI1fB6mFHrbiPQ/n5WnqBTtm
         TsuxTW7S8DVUvjqI1lC7q+5j8Br9SceY3uhPBIgMRGXiLmvxa2Ga+84+sY0wzZBeSOLP
         WGTVOLtxXhY/XFD33T9JXh13S7qx/7E/V9JyZys33KK4WNSvFycMNlQ61o2jLksbyUH/
         dIWbEww0TwBv4pbqws6E6DmLmTdV/9u1AYTQrw+WlyvpiJiO2Wqleadtc0HAvJcH8QEB
         zRQe6nJT90B9JkxT1vmPx5JZA0skDuNsDrhzZKX3GTsqGURmUvMRAiHs3AV2JhrA8TB6
         36Ww==
X-Gm-Message-State: APjAAAWZn42F7vNwA4BD/6ESPHA4+06hDPteBz3adhP/4bC1nuJ3irg9
        Pt8n3xdCeXCSqQt0iFPrbC+6jd+f
X-Google-Smtp-Source: APXvYqyTub4yFw683PZGg3zLIzHE0p9JVXfc/pFFw7Uvu1JjB4Tf23crEMJMOqRO5zo3L/ty+KbLAA==
X-Received: by 2002:a05:600c:1008:: with SMTP id c8mr19509319wmc.133.1560778619493;
        Mon, 17 Jun 2019 06:36:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id t1sm15671157wra.74.2019.06.17.06.36.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 06:36:58 -0700 (PDT)
Subject: Re: [PATCH v1 3/4] staging: media: tegra-vde: Add IOMMU support
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20190602213712.26857-1-digetx@gmail.com>
 <20190602213712.26857-7-digetx@gmail.com>
 <5c274249-6c88-b4bd-70fe-0751f5bbfdfc@xs4all.nl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <06a73666-8985-68a6-66cf-cf9cc00d6929@gmail.com>
Date:   Mon, 17 Jun 2019 16:36:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5c274249-6c88-b4bd-70fe-0751f5bbfdfc@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

17.06.2019 16:31, Hans Verkuil пишет:
> On 6/2/19 11:37 PM, Dmitry Osipenko wrote:
>> All Tegra's could provide memory isolation for the video decoder
>> hardware using IOMMU, it is also required for Tegra30+ in order
>> to handle sparse dmabuf's which GPU exports in a default kernel
>> configuration.
>>
>> Inspired-by: Thierry Reding <thierry.reding@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/staging/media/tegra-vde/Kconfig       |   1 +
>>  drivers/staging/media/tegra-vde/Makefile      |   1 +
>>  drivers/staging/media/tegra-vde/iommu.c       | 148 ++++++++++++++
>>  drivers/staging/media/tegra-vde/trace.h       |   1 +
>>  .../media/tegra-vde/{tegra-vde.c => vde.c}    | 188 +++++++++---------
>>  drivers/staging/media/tegra-vde/vde.h         |  89 +++++++++
>>  6 files changed, 335 insertions(+), 93 deletions(-)
>>  create mode 100644 drivers/staging/media/tegra-vde/iommu.c
>>  rename drivers/staging/media/tegra-vde/{tegra-vde.c => vde.c} (91%)
>>  create mode 100644 drivers/staging/media/tegra-vde/vde.h
>>
>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
>> index ff8e846cd15d..2e7f644ae591 100644
>> --- a/drivers/staging/media/tegra-vde/Kconfig
>> +++ b/drivers/staging/media/tegra-vde/Kconfig
>> @@ -3,6 +3,7 @@ config TEGRA_VDE
>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>>  	depends on ARCH_TEGRA || COMPILE_TEST
>>  	select DMA_SHARED_BUFFER
>> +	select IOMMU_IOVA if IOMMU_SUPPORT
>>  	select SRAM
>>  	help
>>  	    Say Y here to enable support for the NVIDIA Tegra video decoder
>> diff --git a/drivers/staging/media/tegra-vde/Makefile b/drivers/staging/media/tegra-vde/Makefile
>> index 7f9020e634f3..c11867e28233 100644
>> --- a/drivers/staging/media/tegra-vde/Makefile
>> +++ b/drivers/staging/media/tegra-vde/Makefile
>> @@ -1,2 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> +tegra-vde-y := vde.o iommu.o
>>  obj-$(CONFIG_TEGRA_VDE)	+= tegra-vde.o
>> diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
>> new file mode 100644
>> index 000000000000..295c3d7cccd3
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra-vde/iommu.c
>> @@ -0,0 +1,148 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * NVIDIA Tegra Video decoder driver
>> + *
>> + * Copyright (C) 2016-2019 GRATE-DRIVER project
>> + */
>> +
>> +#include <linux/iommu.h>
>> +#include <linux/iova.h>
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +
>> +#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
>> +#include <asm/dma-iommu.h>
>> +#endif
>> +
>> +#include "vde.h"
>> +
>> +int tegra_vde_iommu_map(struct tegra_vde *vde,
>> +			struct sg_table *sgt,
>> +			struct iova **iovap,
>> +			dma_addr_t *addrp,
>> +			size_t size)
>> +{
>> +	struct iova *iova;
>> +	unsigned long shift;
>> +	unsigned long end;
>> +	dma_addr_t addr;
>> +
>> +	end = vde->domain->geometry.aperture_end;
>> +	size = iova_align(&vde->iova, size);
>> +	shift = iova_shift(&vde->iova);
>> +
>> +	iova = alloc_iova(&vde->iova, size >> shift, end >> shift, true);
>> +	if (!iova)
>> +		return -ENOMEM;
>> +
>> +	addr = iova_dma_addr(&vde->iova, iova);
>> +
>> +	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
>> +			    IOMMU_READ | IOMMU_WRITE);
>> +	if (!size) {
>> +		__free_iova(&vde->iova, iova);
>> +		return -ENXIO;
>> +	}
>> +
>> +	*iovap = iova;
>> +	*addrp = addr;
>> +
>> +	return 0;
>> +}
>> +
>> +void tegra_vde_iommu_unmap(struct tegra_vde *vde, struct iova *iova)
>> +{
>> +	unsigned long shift = iova_shift(&vde->iova);
>> +	unsigned long size = iova_size(iova) << shift;
>> +	dma_addr_t addr = iova_dma_addr(&vde->iova, iova);
>> +
>> +	iommu_unmap(vde->domain, addr, size);
>> +	__free_iova(&vde->iova, iova);
>> +}
>> +
>> +int tegra_vde_iommu_init(struct tegra_vde *vde)
>> +{
>> +	struct iova *iova;
>> +	unsigned long order;
>> +	unsigned long shift;
>> +	int err;
>> +
>> +	vde->group = iommu_group_get(vde->miscdev.parent);
>> +	if (!vde->group)
>> +		return 0;
>> +
>> +#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
>> +	if (dev->archdata.mapping) {
> 
> 'dev' doesn't exist, so this fails to compile!

Oh, indeed! I actually didn't even try to compile with CONFIG_ARM_DMA_USE_IOMMU. Will
fix it in v2, thanks!
