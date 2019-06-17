Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB17D48457
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfFQNpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:45:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52126 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfFQNpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:45:01 -0400
Received: by mail-wm1-f66.google.com with SMTP id 207so9354866wma.1;
        Mon, 17 Jun 2019 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OQWr/q8FG80RylP2O4RMDll4yVbzxbxdT0J72wII+Wg=;
        b=LwIKOUf/XcyQRDlCLWbs7G0s7dyJ490GnLSVJlYt3gqfnnnDHFvIlSIq5KPkdWbbr0
         EbpWL2q2VgT/ClXJzEhwTixO1Dm9tmmkKJOGlOEY2Ua7i+HUt/tZYwqoVKYwQjUCHtPz
         YNan3jXi2xtT6x8yGJitrLsraYcw8glXH7N90j58Xvd3Gqx6GhdC9wB27qOHX/dFjOvt
         ZClIi38D4eYqSWn57UX1pxcIbbrHiyn7+4My8F56ZHwdilRyjaTFnhtuLnMxl/mmEq2V
         tsWqE3Ob5RyTSyAjDi8dFjLzzR+eEVxdNiWwta4B7/vIV7ZAHcQYhXAsCwfvC4UL5+Hi
         TgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OQWr/q8FG80RylP2O4RMDll4yVbzxbxdT0J72wII+Wg=;
        b=hslDStrtghHLAlWhxDoqq8eUlnFknQMlnrUpaly1vHk0W7VgiNmHEzVuGTVa4RK810
         5Dpvr84MI9xo+4t1AgVdrKZpD7qkVFxyKcPc7Kci7NjA4+kwoBtylvfkJf18W0MT9/S5
         Y6R86H0dwWi9+k1QOdzofmJUaM0UUuaG9W7zKg+oQnIR+AnqbPeIk4UCZvwJDJD1/E8q
         WG7xuAWZ8cxeDna6YWbhoddR0n/HNYLdLDC9zoEcFF0IzN83c7jkvtDhnAy6N++D+RZC
         uWc1BJJ/Znw9ECtlZj7qs2HyZ3gFZNxz5NZKMWLmO5YY4wVDXozB/LrCguxtKHCL0oB9
         BsTQ==
X-Gm-Message-State: APjAAAVJNPF4MoymNZdJAUfYGKT4Tm6qoQ0OrAHxjLvAdrpNoCdCv7Vj
        /nxKVInXeg5eZhskSfDwLesebcU3
X-Google-Smtp-Source: APXvYqxSeM5EsXbMda9TmrGNmeq5fBAHHZM3UH8tyUUCj8zDvtqesxiAf64l7OGeHOh3fwdRHY6sQg==
X-Received: by 2002:a1c:cb4d:: with SMTP id b74mr19769936wmg.43.1560779098118;
        Mon, 17 Jun 2019 06:44:58 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id 18sm9666582wmg.43.2019.06.17.06.44.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 06:44:57 -0700 (PDT)
Subject: Re: [PATCH v1 4/4] staging: media: tegra-vde: Defer dmabuf's
 unmapping
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20190602213712.26857-1-digetx@gmail.com>
 <20190602213712.26857-8-digetx@gmail.com>
 <4c00cfe6-6598-2017-cce5-ce3c30fd14ba@xs4all.nl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9bc14323-6c7e-54ff-50d6-48260ad9ea8c@gmail.com>
Date:   Mon, 17 Jun 2019 16:44:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <4c00cfe6-6598-2017-cce5-ce3c30fd14ba@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

17.06.2019 16:33, Hans Verkuil пишет:
> On 6/2/19 11:37 PM, Dmitry Osipenko wrote:
>> Frequent IOMMU remappings take about 50% of CPU usage because there is
>> quite a lot to remap. Defer dmabuf's unmapping by 5 seconds in order to
>> mitigate the mapping overhead which goes away completely and driver works
>> as fast as in a case of a disabled IOMMU. The case of a disabled IOMMU
>> should also benefit a tad from the caching since CPU cache maintenance
>> that happens on dmabuf's attaching takes some resources.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/staging/media/tegra-vde/Makefile      |   2 +-
>>  .../staging/media/tegra-vde/dmabuf-cache.c    | 223 ++++++++++++++++++
>>  drivers/staging/media/tegra-vde/iommu.c       |   2 -
>>  drivers/staging/media/tegra-vde/vde.c         | 143 +++--------
>>  drivers/staging/media/tegra-vde/vde.h         |  18 +-
>>  5 files changed, 273 insertions(+), 115 deletions(-)
>>  create mode 100644 drivers/staging/media/tegra-vde/dmabuf-cache.c
>>
>> diff --git a/drivers/staging/media/tegra-vde/Makefile b/drivers/staging/media/tegra-vde/Makefile
>> index c11867e28233..2827f7601de8 100644
>> --- a/drivers/staging/media/tegra-vde/Makefile
>> +++ b/drivers/staging/media/tegra-vde/Makefile
>> @@ -1,3 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> -tegra-vde-y := vde.o iommu.o
>> +tegra-vde-y := vde.o iommu.o dmabuf-cache.o
>>  obj-$(CONFIG_TEGRA_VDE)	+= tegra-vde.o
>> diff --git a/drivers/staging/media/tegra-vde/dmabuf-cache.c b/drivers/staging/media/tegra-vde/dmabuf-cache.c
>> new file mode 100644
>> index 000000000000..fcde8d1c37e7
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra-vde/dmabuf-cache.c
>> @@ -0,0 +1,223 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * NVIDIA Tegra Video decoder driver
>> + *
>> + * Copyright (C) 2016-2019 GRATE-DRIVER project
>> + */
>> +
>> +#include <linux/dma-buf.h>
>> +#include <linux/iova.h>
>> +#include <linux/kernel.h>
>> +#include <linux/list.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include "vde.h"
>> +
>> +struct tegra_vde_cache_entry {
>> +	enum dma_data_direction dma_dir;
>> +	struct dma_buf_attachment *a;
>> +	struct delayed_work dwork;
>> +	struct tegra_vde *vde;
>> +	struct list_head list;
>> +	struct sg_table *sgt;
>> +	struct iova *iova;
>> +	unsigned int refcnt;
>> +};
>> +
>> +static void tegra_vde_release_entry(struct tegra_vde_cache_entry *entry)
>> +{
>> +	struct dma_buf *dmabuf = entry->a->dmabuf;
>> +
>> +	WARN_ON_ONCE(entry->refcnt);
>> +
>> +	if (entry->vde->domain)
>> +		tegra_vde_iommu_unmap(entry->vde, entry->iova);
>> +
>> +	dma_buf_unmap_attachment(entry->a, entry->sgt, entry->dma_dir);
>> +	dma_buf_detach(dmabuf, entry->a);
>> +	dma_buf_put(dmabuf);
>> +
>> +	list_del(&entry->list);
>> +	kfree(entry);
>> +}
>> +
>> +static void tegra_vde_delayed_unmap(struct work_struct *work)
>> +{
>> +	struct tegra_vde_cache_entry *entry;
>> +
>> +	entry = container_of(work, struct tegra_vde_cache_entry,
>> +			     dwork.work);
>> +
>> +	mutex_lock(&entry->vde->map_lock);
>> +	tegra_vde_release_entry(entry);
>> +	mutex_unlock(&entry->vde->map_lock);
> 
> From smatch:
> 
> drivers/staging/media/tegra-vde/dmabuf-cache.c:55 tegra_vde_delayed_unmap() error: dereferencing freed memory 'entry'

That's a very good catch, thanks you very much! I'm keep forgetting about smatch, it's
a useful tool. And unfortunately I can't KASAN the driver because ARM32 doesn't
support KASAN in upstream and Xorg hangs with the unofficial patch that adds support
for the KASAN.

[snip]

>> +	entry->dma_dir = dma_dir;
>> +	entry->iova = iova;
> 
> From smatch:
> 
> drivers/staging/media/tegra-vde/dmabuf-cache.c:133 tegra_vde_dmabuf_cache_map() error: uninitialized symbol 'iova'.

This is fine, but indeed won't hurt to explicitly initialize to NULL.

Thanks again!
